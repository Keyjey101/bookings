require('dotenv').config();
const express = require('express');
const sequelize = require('./db/index');
const router = require('./routes/index');
const PORT = process.env.PORT || 3020;

const app = express();
app.use(express.json());
app.use('/api', router);

const start = async () => {
  try {
    await sequelize.authenticate();
    await sequelize.sync();

    app.listen(PORT, () =>
      console.log(`---------server started at ${PORT} ---- `)
    );
  } catch (e) {
    console.log(e);
    res.status(500).json({ message: 'something wrong on serever side' });
  }
};

start();
