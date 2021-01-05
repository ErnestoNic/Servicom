// compara contra el esquema

const { schemas } = require("./../schemas/Users");

const validateLogin = (req, res, next) => {
  const { error, value } = schemas.auth.validate(req.body);//retorna error y value // VALIDACION DE DATOS CONTRA EL BODY PARA ACEPTAR DATOS
  console.log(error);
  error ? res.status(422).json({ error: error.details[0].message }) : next();
};

module.exports = { validateLogin };