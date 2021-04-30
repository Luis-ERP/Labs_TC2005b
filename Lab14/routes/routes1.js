const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const controller1 = require('../controllers/controller1');

router.use(bodyParser.urlencoded({extended: false}));

router.get('/', controller1.getHome);
router.get('/loggedin', controller1.getController1)
router.post('/new-model', controller1.postController1);

module.exports = router;