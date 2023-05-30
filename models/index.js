const sequelize = require('../db');
const { DataTypes } = require('sequelize');

const Room = sequelize.define('room', {
  id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  description: {
    type: DataTypes.STRING,
    defaultValue: 'Прекрасный номер с шикарным видом на забор',
  },
  level: { type: DataTypes.INTEGER },
});

const Booking = sequelize.define('booking', {
  id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  isVip: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
  },
  isActive: {
    type: DataTypes.BOOLEAN,
    defaultValue: true,
  },
  dateAt: { type: DataTypes.DATE },
  dateTo: { type: DataTypes.DATE },
});

const Client = sequelize.define('client', {
  id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  name: { type: DataTypes.STRING, allowNull: false },
});

Client.hasMany(Booking);
Booking.belongsTo(Client);

Room.hasMany(Booking);
Booking.belongsTo(Room);

module.exports = {
  Room,
  Client,
  Booking,
};
