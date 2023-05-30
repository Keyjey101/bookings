const Router = require('express');
const roomsController = require('../controllers/roomsController');

const router = new Router();

router.get('/', roomsController.getAll);
router.get('/free', roomsController.getFreeByDates);
router.post(
  '/',
  //
  //,
  roomsController.create
);

module.exports = router;
