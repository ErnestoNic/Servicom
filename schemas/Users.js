

const Joi = require("@hapi/joi");

const schemas = {
  auth: Joi.object().keys({
    usuario: Joi.string().required(),
    password: Joi.string().min(2).max(20).required(),
    //usuario paswor coincide con el nombre del body y las tablas para luego pasar el body con seguiridad
  }),
};


module.exports = { schemas };