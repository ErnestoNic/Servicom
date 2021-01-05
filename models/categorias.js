const pool = require ("./../utils/bd");// referencia que permite conectar donde estan las claves y base de datos

const T_CATEGORIAS = "categorias";

const get =(conditions =true) =>
pool
.query("SELECT * FROM ?? WHERE ? and habilitado = true", [T_CATEGORIAS, conditions])
.then ((result)=> result)
.catch ((e)=> e);


const insert = (obj)=> 
   pool   
   .query ("INSERT INTO ?? SET ?", [T_CATEGORIAS, obj])
    .then((results)=> results)
    .catch((e)=>e); 

module.exports = {get, insert};