const { response, request } = require("express");
const express = require("express");
const bodyParser = require('body-parser');
const path = require('path');

const app = express();
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));

app.set('views', 'views');

const ruta1 = require("./routes/ruta1");
const ruta2 = require("./routes/ruta2");

app.use("/ruta1", ruta1);
app.use("/ruta2", ruta2);

app.get('/', (request, response, next) => {
    response.sendFile(path.join(__dirname, 'views', 'index.html'));
});

app.use((request, response, next) => {
    response.status(404);
    response.send("Error 404: Page not found <br> Pagina principal /home");
});


app.listen(5000);