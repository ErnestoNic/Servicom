const pool = require ('./../utils/bd');
const T_PRESTADORES = "prestadores";
const T_USUARIOS = "usuarios";


const create = (obj) =>
pool
.query ("INSERT INTO ?? SET ?", [T_PRESTADORES, obj])
.then ((result)=> result)
.catch ((e)=>e);

/*const update = (id) =>{
pool 
.query ("UPDATE ?? SET ? WHERE id = ?",[{T_USUARIOS, obj : {role:1}, id }])
.then ((result)=> result)
.catch ((e)=> e);
};*/

const createImages = (uid)=>{
    pool
.query ("INSERT INTO ?? SET ?", [T_PRESTADORES, uid])
.then ((result)=> result)
.catch ((e)=>e);
};


const bajaPrestador = (obj) =>
pool
.query ("UPDATE INTO ?? SET ?", [T_PRESTADORES, obj])
.then ((result)=> result)
.catch ((e)=>e);

module.exports = {create,  createImages, bajaPrestador};