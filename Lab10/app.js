
'use strict';
const http = require('http');


const server = http.createServer(function(request, response){

	if(request.url === "/"){
		response.setHeader("Content-Type", "text/html");
		response.write("<html>");
		response.write("<head><title>URL1</title></head>");
		response.write("<body>");	
		response.write("<h1>Esta es la URL numero 1 y home page</h1>");
		response.write("</body>")
		response.write("</html>");
	}

	else if(request.url === "/url2"){
		response.setHeader("Content-Type", "text/html");
		response.write("<html>");
		response.write("<head><title>URL2</title></head>");
		response.write("<body>");
		response.write("<h1>Esta es la URL numero 2</h1>");
		response.write("</body>")
		response.write("</html>");
	}

	else if(request.url === "/url3"){
		if (request.method == "POST"){
			response.setHeader("Content-Type", "text/html");
			response.write("<html>");
			response.write("<head><title>URL3</title></head>");
			response.write("<body>");
			response.write("<h1>Esta es la URL numero 3 desde el método POST</h1>");
			response.write("</body>")
			response.write("</html>");
		}

		else {
			response.setHeader("Content-Type", "text/html");
			response.write("<html>");
			response.write("<head><title>URL3</title></head>");
			response.write("<body>");
			response.write("<h1>Esta es la URL numero 3 desde el método GET (o otro que no sea POST)</h1>");
			response.write('<form action="http://localhost:3000/url3" method="POST">')
			response.write('<input type="submit" value="POST method btn">')
			response.write('</form>')
			response.write("</body>")
			response.write("</html>");
		}
	}

	else{
		response.statusCode = 404;
		response.setHeader("Content-Type", "text/html");
		response.write("<html>");
		response.write("<head><title>Not found</title></head>");
		response.write("<body><h1>Page not found</h1></body>");
		response.write("</html>");
	}

});

server.listen(3000);