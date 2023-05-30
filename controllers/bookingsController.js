const { Booking, Client } = require('../models');
const { Op } = require('sequelize');
const axios = require('axios');

class bookingsContoller {
  async getAll(req, res, next) {
    try {
      let { limit, page } = req.query;
      page = page || 1;
      limit = limit || 100;
      let offset = page * limit - limit;
      const bookings = await Booking.findAndCountAll({ limit, offset });
      return res.json(bookings);
    } catch (e) {
      console.error('error has apire in roomsController', e);
    }
  }
  async create(req, res, next) {
    try {
      const { clientId, dateAt, dateTo, roomId } = req.body;
      if (!dateAt || !dateTo || !clientId || !roomId) {
        res.status(402);
        res.json({
          message: 'provide data such as clientId, dateAt, dateTo, roomId',
        });
        return next();
      }

      // check room availible
      const bookings = await Booking.findAll({
        where: {
          roomId: roomId,
          isActive: true,
          [Op.or]: [
            {
              dateAt: { [Op.between]: [dateAt, dateTo] },
            },
            {
              dateTo: { [Op.between]: [dateAt, dateTo] },
            },
            {
              [Op.and]: [
                { dateAt: { [Op.lte]: dateAt } },
                { dateTo: { [Op.gte]: dateTo } },
              ],
            },
          ],
        },
      });

      if (bookings.length > 0) {
        res.status(409);
        res.json({
          message: `roomId ${roomId} is not availibe for this dates by next bookingId: ${bookings.map(
            (x) => x.id
          )}`,
        });
        return next();
      }
      // find client for additional fields like passport, cards, or something
      // we need to proceed in remote API
      const client = await Client.findOne({ where: { id: clientId } });

      const { data } = await axios.get(
        'http://random-data-api.com/api/users/random_user'
      );
      const isVip = data.id % 2 === 0;

      const booking = await Booking.create({
        clientId: clientId,
        roomId: roomId,
        dateAt: dateAt,
        dateTo: dateTo,
        isVip: isVip,
      });
      res.status(201);
      return res.json(booking);
    } catch (e) {}
  }
  async abort(req, res, next) {
    const { clientId, bookingId, roomId } = req.body;
    if (!bookingId) {
      res.status(402);
      res.json({
        message: 'provide data such as bookingId',
      });
      return next();
    }
    // if bookingId not provided by some reason use clientId+roomId instead
    // check existing booking and so one
    try {
      await Booking.update(
        {
          isActive: false,
        },
        { where: { id: bookingId } }
      );
      return res.json({ message: 'success' });
    } catch (e) {}
  }
}

module.exports = new bookingsContoller();
