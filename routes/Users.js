const express = require('express')
const users = express.Router()
const cors = require('cors')
const jwt = require('jsonwebtoken')
const bcrypt = require('bcrypt');
const Sequelize = require('sequelize')
const db = require('../database/db.js')
const _ = require('lodash')
const User = require('../models/User');

users.use(cors())

process.env.SECRET_KEY = 'secret'

const Op = Sequelize.Op

users.post('/register', (req, res, next) => {
  bcrypt.hash(req.body.password, 10, (err, hash) => {
    if (err) {
      return res.status(500).json({
        error: err
      });
    } else {
      const today = new Date()
      const user = new User({
        name: req.body.name,
        username: req.body.username,
        email: req.body.email,
        password: hash,
        created_at: today,
        updated_at: today,
        client_id: req.body.client_id,
        created_by: req.body.user_id,
        updated_by: req.body.user_id,
      });
      user
        .save()
        .then(result => {
          console.log(result);
          res.status(201).json({
            message: "user created",
            success: true,
            data: result
          });
        })
        .catch(err => {
          console.log(err);
          res.status(500).json({
            error: err,
            success: false
          })
        })
    }
  });
});

users.delete('/:userId', (req, res, next) => {
  if (req.params.userId !== '00000000-0000-00') {
    User.destroy({
      where: {
        id: req.params.userId
      }
    })
      .then(result => {
        res.send({ success: true, message: 'user has deleted', data: result })
      })
      .catch(err => {
        res.send({ success: false, message: 'user has not deleted', data: result })
      })

  } else {
    res.send({ success: false, message: 'Super Admin Can not be deleted' })
  }
})
users.post('/login', (req, res) => {
  User.findOne({
    attributes: ['name', 'username', 'email', 'password', 'created_at', 'updated_at', [db.sequelize.fn('CONVERT', db.sequelize.literal('`id` USING utf8')), 'id'], [db.sequelize.fn('CONVERT', db.sequelize.literal('`client_id` USING utf8')), 'client_id'], [db.sequelize.fn('CONVERT', db.sequelize.literal('`created_by` USING utf8')), 'created_by'], [db.sequelize.fn('CONVERT', db.sequelize.literal('`updated_by` USING utf8')), 'updated_by']],
    charset: 'utf8',
    where: {
      username: req.body.username
    }
  })
    .then(user => {
      if (user) {
        if (bcrypt.compareSync(req.body.password, user.password)
        ) {
          let token = jwt.sign(user.dataValues, process.env.SECRET_KEY, {
            expiresIn: 1440,

          })
          res.json({ token: token, success: true })
        } else {
          res.send({ message: 'PASS INCORRECT', success: false })
        }
      } else {
        res.send({ message: 'User does not exist', success: false })
      }
    })
    .catch(err => {
      res.send({ message: 'User credentials are incorrect', success: true })
    })
})

users.get('/', (req, res, next) => {
  User.findAll({
    attributes: ['name', 'username', 'email', 'password', 'created_at', 'updated_at', [db.sequelize.fn('CONVERT', db.sequelize.literal('`id` USING utf8')), 'id'], [db.sequelize.fn('CONVERT', db.sequelize.literal('`client_id` USING utf8')), 'client_id'], [db.sequelize.fn('CONVERT', db.sequelize.literal('`created_by` USING utf8')), 'created_by'], [db.sequelize.fn('CONVERT', db.sequelize.literal('`updated_by` USING utf8')), 'updated_by']],
    charset: 'utf8',
  })
    .then(users => {
      res.json({ data: users, success: true })
    }).catch(err => {
      res.json({ error: err, success: false })
    })
});
users.get('/:userId', (req, res, next) => {
  User.findOne({
    attributes: ['name', 'username', 'email', 'password', 'created_at', 'updated_at', [db.sequelize.fn('CONVERT', db.sequelize.literal('`id` USING utf8')), 'id'], [db.sequelize.fn('CONVERT', db.sequelize.literal('`client_id` USING utf8')), 'client_id'], [db.sequelize.fn('CONVERT', db.sequelize.literal('`created_by` USING utf8')), 'created_by'], [db.sequelize.fn('CONVERT', db.sequelize.literal('`updated_by` USING utf8')), 'updated_by']],
    where: {
      id: req.params.userId
    }
  })
    .then(result => {
      res.send(result)
    })
    .catch(err => {
      console.log(err);
      res.status(500).json({
        error: err
      });
    })
})

users.put('/:userId', function (req, res, next) {
  let today = new Date()
  const id = req.params.userId;

  const { name, username, email } = req.body;
  User.update({
    name: name,
    username: username,
    email: email,
    updated_at: today,
    updated_by: name
  }, {
      where: {
        id: id
      }
    })
    .then(result =>
      res.json({
        success: true,
        message: 'User Updated',
        data: result
      }))
    .catch(error => res.json({
      success: false,
      error: error
    }));
});

users.post('/getScreens_by_user', (req, res) => {
  var id = req.body.id
  var sqlquery;
  if (id == '00000000-0000-00') {
    sqlquery = `SELECT  CAST(client_id AS CHAR(10000) CHARACTER SET utf8) as client_id,CAST(id AS CHAR(10000) CHARACTER SET utf8) as id , name, name_ar, url FROM screens`
  } else {
    sqlquery = `SELECT CAST(t4.client_id AS CHAR(10000) CHARACTER SET utf8) as client_id , CAST(t4.id AS CHAR(10000) CHARACTER SET utf8) as id , t4.name, t4.name_ar, t4.url FROM role_screens t2 INNER JOIN user_roles t1 ON t1.role_id = t2.ROLE_ID INNER JOIN users t3 ON t1.USER_ID = t3.ID INNER JOIN screens t4 ON t2.SCREEN_ID = t4.ID where t3.id  = '${id}'`
  }
  db.sequelize.query(sqlquery)
    .spread((results, metadata) => {
      console.log('ressss', results)
      db.sequelize.query(`SELECT CAST(t1.client_id AS CHAR(10000) CHARACTER SET utf8) as client_id, 
    CAST(t1.module_id AS CHAR(10000) CHARACTER SET utf8) as module_id,
    CAST(t1.screen_id AS CHAR(10000) CHARACTER SET utf8) as screen_id, t2.name as module_name, t2.name_ar as module_name_ar FROM module_screens t1 
    INNER JOIN modules t2 ON t1.module_id = t2.id`)
        .spread((resu, met) => {
          console.log('ressss', resu)
          let array2 = []
          for (let i = 0; i <= results.length - 1; i++) {
            for (let j = 0; j <= resu.length - 1; j++) {
              if (results[i].id == resu[j].screen_id) {
                let a = Object.assign(resu[j])
                let b = Object.assign(results[i])
                let c = { ...a, ...b }
                delete c.id;
                array2.push(c)
              }
            }
          }
          var grouped = ''
          if (req.body.lang === 'en') {
            grouped = _.mapValues(_.groupBy(array2, 'module_name'),
              clist => clist.map(array => _.omit(array, 'module_name')),
            );
          } else {
            grouped = _.mapValues(_.groupBy(array2, 'module_name_ar'),
              clist => clist.map(array => _.omit(array, 'module_name_ar')),
            );
          }
          res.send({ data: grouped })
        })
    })
})

users.get('/by_clients/table', (req, res, next) => {
  req.query.searchValues = JSON.parse(req.query.searchValues);
  let startIndex = 0, endIndex = 0, page = req.query.page, size = req.query.size, searchValues = req.query.searchValues;
  if (page < 1)
    endIndex = 0;
  else if (page == 1)
    endIndex = page * size;
  else {
    startIndex = (page - 1) * size;
    endIndex = page * size;
  }

  User.findAll({
    attributes: ['name', 'username', 'email', 'password', 'created_at', 'updated_at', [db.sequelize.fn('CONVERT', db.sequelize.literal('`id` USING utf8')), 'id'], [db.sequelize.fn('CONVERT', db.sequelize.literal('`client_id` USING utf8')), 'client_id'], [db.sequelize.fn('CONVERT', db.sequelize.literal('`created_by` USING utf8')), 'created_by'], [db.sequelize.fn('CONVERT', db.sequelize.literal('`updated_by` USING utf8')), 'updated_by']],
    where: {
      client_id: req.query.id,
      name: {
        [Op.like]: `%${searchValues.name}%`
      },
      username: {
        [Op.like]: `%${searchValues.userName}%`
      },
      email: {
        [Op.like]: `%${searchValues.email}%`
      },
    }
  })
    .then(function (doc) {
      let totalElements = doc.length;
      let totalPages = Math.ceil(totalElements / size);
      let selectedElements = doc.slice(startIndex, endIndex);
      let last = false;
      if (page == totalPages) {
        last = true;
      }

      res.status(200).json({
        page: page,
        size: size,
        totalElements: totalElements,
        totalPages: totalPages,
        selectedElements: selectedElements,
        last: last
      });
    })
    .catch(function (err) {
      console.log(err);
      res.status(500).json({
        error: err
      });
    });
})
users.post('/by_clients', (req, res) => {
  User.findAll({
    attributes: ['name', 'username', 'email', 'password', 'created_at', 'updated_at', [db.sequelize.fn('CONVERT', db.sequelize.literal('`id` USING utf8')), 'id'], [db.sequelize.fn('CONVERT', db.sequelize.literal('`client_id` USING utf8')), 'client_id'], [db.sequelize.fn('CONVERT', db.sequelize.literal('`created_by` USING utf8')), 'created_by'], [db.sequelize.fn('CONVERT', db.sequelize.literal('`updated_by` USING utf8')), 'updated_by']],

    where: ({
      client_id: req.body.id
    })

  }).then(function (results) {
    res.send({ results });
  }).catch(function (err) {
    res.send('Something went wrong', err);
  });
})

//Mobile App User Registratin 
users.post('/mobile_app_register', (req, res, next) => {
  bcrypt.hash(req.body.password, 10, (err, hash) => {
    if (err) {
      return res.status(500).json({
        error: err
      });
    } else {
      const today = new Date()
      const user = new User({
        name: req.body.name,
        username: req.body.username,
        email: req.body.email,
        password: hash,
        created_at: today,
        updated_at: today,
        client_id: '11111111-1111-11',
        // created_by: req.body.user_id,
        // updated_by: req.body.user_id,
      });
      user
        .save()
        .then(result => {
          console.log(result);
          res.status(201).json({
            message: "user created",
            success: true,
            data: result
          });
        })
        .catch(err => {
          console.log(err);
          res.status(500).json({
            error: err,
            success: false
          })
        })
    }
  });
});
module.exports = users