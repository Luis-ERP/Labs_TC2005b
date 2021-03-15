const { response, request } = require('express');
const express = require('express');
const app = express();
const rutas1 = require('./routes/rutas1');
const rutas2 = require('./routes/rutas2');

app.use('/rutas1', rutas1);
app.use('/rutas2', rutas2);

app.use( '/', (request, response, next) => {
    let html = '<h1>Pagina de prueba rutas en express</h1>';
    html = '<h3>Las rutas son:</h3> \
    		<ul> \
    		<li> / </li> \
    		<li> /rutas1/1 </li> \
    		<li> /rutas1/2 </li> \
    		<li> /rutas1/3 </li> \
    		<li> /rutas2/1 </li> \
    		<li> /rutas2/2 </li> \
    		<li> /rutas2/3 </li> \
    		</ul> \
    ';
    
    response.send(html);
});


app.use( (request, response, next) => {
    response.status(404);
    response.send('Error 404: Page not found');
});

app.listen(3000);