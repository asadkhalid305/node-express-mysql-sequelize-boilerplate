const Sequelize = require('sequelize')
const db = require('../database/db.js')

module.exports = db.sequelize.define(
  'user',
  {
    id: {
      primaryKey: true,
      type:  Sequelize.UUID,
      defaultValue: Sequelize.UUIDV4
  },
    name: {
      type: Sequelize.STRING
    },
    name_ar: {
      type: Sequelize.STRING
    },
    username: {
      type: Sequelize.STRING
    },
    email: {
      type: Sequelize.STRING
    },
    password: {
      type: Sequelize.STRING
    },
    client_id: {
      type: Sequelize.BLOB
    },
    created_at: {
      type: Sequelize.DATE,
      defaultValue: Sequelize.NOW
    },
    updated_at: {
      type: Sequelize.DATE,
      defaultValue: Sequelize.NOW
    },
    created_by: {
      type: Sequelize.BLOB
    },
    updated_by: {
      type: Sequelize.BLOB
    }
  },
  {
    timestamps: false
  }
)