const { Client } = require('../models');

class clientsController {
  async getAll(req, res, next) {
    try {
      let { limit, page } = req.query;
      page = page || 1;
      limit = limit || 100;
      let offset = page * limit - limit;
      const clients = await Client.findAndCountAll({ limit, offset });
      return res.json(clients);
    } catch (e) {
      console.error('error has apire in roomsController', e);
    }
  }
  async create(req, res, next) {
    try {
      const { name } = req.body;
      const client = await Client.create({
        name: name,
      });
      res.status(201);
      return res.json(client);
    } catch (e) {}
  }
}

module.exports = new clientsController();
