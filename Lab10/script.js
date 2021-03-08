
'use strict';
let file;
const fs = require("fs");
const http = require('http');

const peliculas = ['Slumdog millionaire', 'How to lose a guy in 10 days', 'Cementerio de elefantes'];

const server = http.createServer(function(req, res){
     if(req.url === "/"){
        fs.readFile('../Lab10/index.html', function(error, data){ 
        res.write(data);
        return res.end();
     });
     }
     else if(req.url === "/peliculas" || req.url === "/Peliculas"){
        res.setHeader("Content-Type", "text/html");
        res.write("<html>");
        res.write("<head><title>Peliculas</title></head>");
        res.write("<body>");
        res.write("<h1>Peliculas</h1>");
        res.write("<ul>");
        peliculas.forEach(pelicula => {
            res.write("<li>");
            res.write(pelicula);
            res.write("</li>");
        });
        res.write("</ul></body>")
        res.write("</html>");
    }
    else if (req.url == "/AgregarPelicula" && req.method == "GET") {
        res.setHeader("Content-Type", "text/html");
        res.write("<body><h1>Agregar pelicula</h1></body>");
        res.write('<form action="AgregarPelicula" method="POST"><input type="text" name="nombre"><br><br><input type="submit" value="Agregar pelicula a la lista"></form>');
        res.write("</html>");
    }
    else if(req.url == "/AgregarPelicula" && req.method == "POST"){
        const datos = [];
        req.on('data', (dato) => {
            datos.push(dato);
        });
        return req.on('end', () => {
            const datoFinal = Buffer.concat(datos).toString();
            const nuevaPelicula = datoFinal.split('=')[1];
            peliculas.push(nuevaPelicula);
            res.writeHead(301,{Location:'/peliculas'});
            return res.end();
        });    
            res.setHeader('Content-Type', 'text/html');
            res.write("<html>");
            res.write("<head><meta charset='UTF-8'><title>Agregar Pelicula</title></head>");
    }
    else if(req.url === "/series" || req.url === "/Series"){
        res.setHeader("Content-Type", "text/html");
        res.write("<html>");
        res.write("<head><title>Series</title></head>");
        res.write("<body><h1>Series</h1><ul><li>You Me Her</li><li>Avatar</li><li>How I Met Your Mother</li></ul></body>");
        res.write("</html>");
    }
    else if(req.url === "/musica" || req.url === "/Musica"){
        res.setHeader("Content-Type", "text/html");
        res.write("<html>");
        res.write("<head><title>Musica</title></head>");
        res.write("<body><h1>Musica</h1><ul><li>Yegua - Los Babasonicos</li><li>Scrawny - Wallows</li><li>Odiame - Efecto Mandarina</li></ul></body>");
        res.write("</html>");
    }
    else{
        res.statusCode = 404;
        res.setHeader("Content-Type", "text/html");
        res.write("<html>");
        res.write("<head><title>Not found</title></head>");
        res.write("<body><h1>Page not found</h1></body>");
        res.write("</html>");
    }

});

server.listen(3000);