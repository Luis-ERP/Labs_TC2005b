const express = require("express");
const router = express.Router();
const bodyParser = require('body-parser');
const controller2 = require('../controllers/controller2');

router.use(bodyParser.urlencoded({ extended: false }));

router.use('/path2', (controller2.get));

module.exports = router;