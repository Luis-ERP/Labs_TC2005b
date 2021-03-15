const path = require('path');
const express = require('express');
const app = express();
const router = express.Router();

app.set('view engine', 'ejs');
app.set('views', 'views');

const datos = [{Titulo: 'adulto', Precio: 1300}, 
               {Titulo: 'cachorro', Precio: 1500},
               {Titulo: 'senior', Precio: 1100},
               {Titulo: 'rc-adulto', Precio: 1450},
               {Titulo: 'rc-cachorro', Precio: 1600},
               {Titulo: 'rc-senior', Precio: 1260}];

router.get('/', (request, response, next) => {
    response.render('store.ejs', {datos:datos});
});

router.get('/nupec', (request, response, next) => {
    response.render('nupec.ejs', {datos:datos});
});

router.get('/royal-canin', (request, response, next) => {
    response.render('royal-canin.ejs', {datos:datos});
});

router.get('/proplan', (request, response, next) => {
    response.render('proplan.ejs', {datos:datos});
});

router.post('/post', (request, response, next) => {
    console.log("hola mundo");
});

router.get( (request, response, next) => {
    response.status(404);
    response.send('Error 404: Page not found');
});

app.use('/', router);
app.use(express.static(path.join(__dirname, 'public')));

module.exports = router;
app.listen(5000);
