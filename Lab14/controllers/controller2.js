const { request } = require('express');

exports.getLogin = (request, response, next) => {
	response.render('login', {
		title: 'Login GET',

	});
};


exports.postLogin = (request, response, next) => {
	request.session.isLoggedIn = true;
	request.session.usuario = request.body.usuario;
	request.redirect('/loggedin');
};


exports.postLogout = (request, response, next ) => {
	request.session.destroy( () => {
		response.session.destroy( () => {
			response.redirect('/');
		});
	});
};