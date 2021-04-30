const express = require('express');
const app = express();
const path = require('path');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const session = require('express-session');

const rutas1 = require('./routes/router1');
const rutas2 = require('./routes/router2');

app.set('view engine', 'ejs');
app.set('views', 'views');

app.use(bodyParser.urlencoded({extended: false}));
app.use(cookieParser());

app.use(session({
    secret: 'secretkey-thisgoesinenvvariables', 
    resave: false, 
    saveUninitialized: false,
}));

app.use(express.static(path.join(__dirname, 'public')));

app.use('/rutas1', rutas1);
app.use('/rutas2', rutas2);

app.use( (request, response, next) => {
    response.status(404);
    response.send('Error 404: Page not found');
});

app.listen(3000);