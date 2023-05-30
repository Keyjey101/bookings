const Router = require('express');
const roomRouter = require('./rooms');
const clientRouter = require('./clients');
const bookingRouter = require('./bookings');

const router = new Router();

router.use('/rooms', roomRouter);
router.use('/bookings', bookingRouter);
router.use('/clients', clientRouter);

module.exports = router;
