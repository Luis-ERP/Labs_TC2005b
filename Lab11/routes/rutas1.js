const express = require('express');
const router = express.Router();

router.get('/1', (request, response, next) => {
    const html = '<h1>Route 1 page 1</h1>';
    response.send(html);
});

router.use('/2', (request, response, next) => {
    const html = '<h1>Route 1 page 2</h1>';
    response.send(html);
});

router.use('/3', (request, response, next) => {
    const html = '<h1>Route 1 page 3</h1>';
    response.send(html);
});

module.exports = router;