const Model = require('../models/model1');

exports.getHome = (request, response, next) => {
	response.render('view1_1', {
		title = 'Home Page'
	});
}


exports.getController1 = (request, response, next) => {
	const modelObjs = Model.fetchAll();
	response.render('view1_2', {
		isLoggedIn: request.session.isLoggedIn === true ? true : false,
		data: modelObjs,
		title: 'GET all data'
	});
};


exports.postController1 = (request, response, next) => {
	const newModelObject = new Model(request.body.name);
	newModelObject.save();
	response.setHeader('Set-Cookie', [`last_model = ${newModelObject.type}; HttpOnly`]);
	response.render('view1_3', {
		message: 'Post commited succesfully',
		title: 'POST data'
	});
};
