const express = require('express');
const router = express.Router();
const controller2 = require('../controllers/controller2');

router.get('/login', controller2.getLogin);
router.post('/login', controller2.postLogin)
router.post('/logout', controller2.postLogout);

module.exports = router;