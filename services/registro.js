//ESTE SERVICIO MEZCLA LOS DATOS DE UN FORM PARA CREAR USUARIOS A A PARTIR DE PERSONAS para no menter tantas cosas en el router y QUE LA LOGICA COMPARTIDA ESTE COMO SERVICIO

const {create: createPersona }= require("./../models/personas");
const {create: createUser }= require("./../models/usuarios");
const { send } = require('./../services/mail'); 
const sha1= require ("sha1"); 
const {v4: uid}= require ("uuid"); 

const register = async ({nombre, apellido, cuit, domicilio, altura, email, telefono, usuario, password,}={}) => {
    
    try {
       
        const clave = uid();
        const { insertId : idPersona} = await createPersona({
            nombre, 
            apellido, 
            cuit,
            domicilio,
            altura,
            email, 
            telefono,
        });
            
        const { insertId : idUsuario} = await createUser({
            usuario, 
            password: sha1(password),
            idPersona,
            confirmacionCorreo : clave,
        });
       
        const mailObject = {
        
            email,
            message: 
            `
            <h2>Gracias por Registrarte ${nombre} ${apellido}</h2>
            <h3>No olvides hacer <a href=${process.env.URL_SERVER}:${process.env.PORT}/registro/verify?uid=${clave}> click aqui para continuar</a></h3>`,

          

        };
        await send(mailObject); 
        


    }catch (e){
        console.log(e)
    }


};

module.exports = {register};