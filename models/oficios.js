

const pool = require ("../utils/bd"); 
const T_OFICIOS = "oficios";
const T_CATEGORIAS = "categorias";


const get = async () => {  
    const query = 
                
     "SELECT nombreOficio, idCategoria, of.id, tiposOficio FROM oficios as of JOIN categorias as cat on of.idCategoria = cat.id WHERE of.habilitado = 1";
     const params =[T_OFICIOS, T_CATEGORIAS, true];
    return await pool.query(query, params);
};

const single = async (id)=> {
            
    const query= 
    "SELECT nombreOficio, idCategoria, of.id, tiposOficio FROM oficios as of JOIN categorias as cat on of.idCategoria = cat.id WHERE of.habilitado = 1 and of.id= ?";
    const params =[T_OFICIOS, T_CATEGORIAS, true, id];
    return await pool.query(query, params); 
            
};

const insert = (obj) =>
pool
.query("INSERT INTO ?? SET ?", [T_OFICIOS, obj])
.then ((result)=> result)
.catch ((e)=>e);


const actualizar = async (obj, id) =>{
try{
const query = "UPDATE ?? SET ? WHERE id = ?"; 
const params = [T_OFICIOS, obj, id];
return await pool.query(query, params)
} catch (e) {
    console.log(e);
}};

const borrar = (obj, id) =>
pool    
.query("UPDATE ?? SET ? WHERE id = ?", [T_OFICIOS, obj, id])
.then ((result)=> result)
.catch((e)=> e);

module.exports = {get, single, insert, actualizar, borrar};
