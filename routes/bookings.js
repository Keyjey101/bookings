const Router = require('express');
const bookingsController = require('../controllers/bookingsController');

const router = new Router();
router.get(
  '/',
  //
  //,
  bookingsController.getAll
);
router.post(
  '/',
  //
  //,
  bookingsController.create
);
router.put(
  '/abort',
  //
  //,
  bookingsController.abort
);

module.exports = router;
