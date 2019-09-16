/**
* npm package and custom file import
*/
const UserModel = require('../models/user');

/**
 * helping functions
 */
const isUserExistInDb = (req) => {
    return new Promise((resolve, reject) => {
        UserModel.findAll({
            where: {
                email: req.body.EMAIL
            }
        })
            .then(result => resolve(result[0]))
            .catch(err => reject(err))
    });
}

const createNewUser = (req) => {
    return new Promise((resolve, reject) => {
        UserModel.create({
            NAME: req.body.NAME,
            EMAIL: req.body.EMAIL,
            PASSWORD: req.body.PASSWORD
        })
            .then(result => { resolve(result) })
            .catch(err => reject(err))
    })
}


/**
 * all logic goes here
 */
const User = {
    signup: (req, res) => {
        if (req.body.EMAIL && req.body.PASSWORD) {
            isUserExistInDb(req).then((user) => {
                if (user) {
                    res.status(406).send({
                        message: 'failed',
                        details: `user already exists for following address: ${user.email}`
                    })
                } else {
                    createNewUser(req).then((user) => {
                        if (user) {
                            res.status(201).send({
                                message: 'success',
                                details: `account created for following address: ${user.email}`
                            })
                        } else {
                            res.status(400).send({
                                message: 'failed',
                                details: `account has not created`
                            });
                        }
                    }).catch((err) => {
                        res.status(400).send({
                            message: 'failed',
                            details: err
                        })
                    })
                }
            }).catch((err) => {
                if (err) {
                    res.status(400).send({
                        message: 'failed',
                        details: err

                    })
                }
            })
        } else {
            res.status(406).send({
                message: 'failed',
                details: `email or password not found`

            })
        }
    },

    login: (req, res) => {
        if (req.body.PASSWORD && req.body.EMAIL) {
            isUserExistInDb(req).then((user) => {
                if (user) {
                    if (req.body.PASSWORD === user.PASSWORD) {
                        res.status(201).send({
                            message: 'success',
                            details: `you have logged in from following address: ${user.EMAIL}`
                        })
                    } else {
                        res.status(401).send({
                            message: 'failed',
                            details: 'invalid email or password'
                        })
                    }
                } else {
                    res.status(400).send({
                        message: 'user does not exists'
                    })
                }
            }).catch((err) => {
                res.status(400).send({
                    message: 'failed',
                    details: err
                })
            })
        } else {
            res.status(406).send({
                message: 'failed',
                details: `email or password not found`
            })
        }
    }
}

module.exports = User;