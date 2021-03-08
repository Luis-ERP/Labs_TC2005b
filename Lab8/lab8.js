function promedio(list){
    let sum = 0;
    for(let i of list){
        sum += i;
    }
    return sum/list.length;
}

function text(str){
    const filesystem = require('fs');
    filesystem.writeFileSync('text.txt', str);
    return true;
}

function max(list){
    let m = list[0];
    for(let i of list){
        if(i > m){
            m = i;
        }
    }
    return m;
}

const arreglo = [46, 75, 98, 23, 28, 74, 7, 79, 35, 39, 48, 62];

console.log(promedio(arreglo));
console.log(text("Hola Mundo"));
console.log(max(arreglo));

// server .js

let file;
const fs = require("fs");

'use strict';
const http = require('http');

const server = http.createServer(function(req, res){
    fs.readFile('../Lab 5/store.html', function(error, data){ 
        res.write(data);
        return res.end();
     });
});

server.listen(8000);