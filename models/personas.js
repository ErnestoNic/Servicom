const pool = require ('./../utils/bd');
const T_PERSONAS = "personas";



const get = async () => {  
    const query = 
                
     "SELECT id, nombre, apellido, cuit, domicilio, altura, email, telefono FROM ?? WHERE habilitado = 1";
     const params =[T_PERSONAS, true];
    return await pool.query(query, params);
};



const create = (obj)=> 
    pool
    .query("INSERT INTO ?? SET ?", [T_PERSONAS, obj])
    .then((response)=> response) 
    .catch((e)=> e);


module.exports = {get, create};

