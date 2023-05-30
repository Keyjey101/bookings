const Router = require('express');
const clientController = require('../controllers/clientsController');

const router = new Router();

router.get(
  '/',
  //
  //,
  clientController.getAll
);
router.post(
  '/',
  //
  //,
  clientController.create
);

module.exports = router;
