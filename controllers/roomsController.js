const { Room, Booking } = require('../models');
const { Op } = require('sequelize');

class roomsController {
  async getAll(req, res, next) {
    try {
      let { limit, page } = req.query;
      page = page || 1;
      limit = limit || 100;
      let offset = page * limit - limit;
      const rooms = await Room.findAndCountAll({ limit, offset });
      return res.json(rooms);
    } catch (e) {
      console.error('error has apire in roomsController', e);
    }
  }
  async getFreeByDates(req, res, next) {
    try {
      let { dateAt, dateTo } = req.query;
      const rooms = await Room.findAll({
        include: [
          {
            model: Booking,
            where: {
              isActive: true,
              [Op.or]: [
                {
                  dateAt: {
                    [Op.lt]: dateAt,
                  },
                  dateTo: {
                    [Op.gt]: dateTo,
                  },
                },
                {
                  dateAt: {
                    [Op.between]: [dateTo, dateAt],
                  },
                },
                {
                  dateTo: {
                    [Op.between]: [dateTo, dateAt],
                  },
                },
              ],
            },
            required: false,
          },
        ],
        where: {
          '$bookings.id$': null,
        },
      });
      return res.json(rooms);
    } catch (e) {
      console.error('error has apire in roomsController', e);
    }
  }
  async create(req, res, next) {
    try {
      const { level, description } = req.body;
      const room = await Room.create({
        level: level,
        description: description,
      });
      res.status(201);
      return res.json(room);
    } catch (e) {}
  }
}

module.exports = new roomsController();
