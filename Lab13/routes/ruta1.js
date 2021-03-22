const express = require("express");
const router = express.Router();
const bodyParser = require('body-parser');
const controller1 = require('../controllers/controller1');

router.use(bodyParser.urlencoded({ extended: false }));

router.use('/path1', (controller1.get));

module.exports = router;
