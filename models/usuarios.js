const pool = require ('./../utils/bd');
const T_USUARIOS = "usuarios";


const create = (obj) =>
pool
.query ("INSERT INTO ?? SET ?", [T_USUARIOS, obj])
.then ((result)=> result)
.catch ((e)=>e);


const auth = ({usuario, password}) =>
pool
.query("SELECT id FROM ?? WHERE usuario = ? and password = ? and habilitado = 1 and eliminado = 0 and role = 0", [T_USUARIOS, usuario, password])
.then ((result)=> result)
.catch ((e)=> e);

const update = ({clave="", id, obj})=> 
pool
.query ("UPDATE ?? SET ? WHERE confirmacionCorreo = ? OR id = ?", [T_USUARIOS, obj, clave, id]) // la funcion es escalable con el OR permite updates por confirmCorreo o id y puede utilizarce para cualquier update o para dejar de recibir correo o deshabilitar el usuario o cambiar mail
.then ((result)=> result)
.catch ((e)=> e);



module.exports = {create, auth, update};