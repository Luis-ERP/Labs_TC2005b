const variables = ['Var1', 'Var2', 'Var3'];

module.exports = class Model {
	constructor(model_type){
		this.type = model_type;
	}

	save(){
		variables.push(this.type);
	}

	static fetchAll(){
		return variables;
	}
};