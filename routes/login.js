//SUPER GLOBALES QUE ESTAN DISPONIBLES EN TODO EL PROYECTO 
//(ADMIN LOGUEADO user: ERNEST, pass: 1234, id=8 => tabla usuarios)
//se almacena en app.js

const express = require("express");
const router = express.Router();
const sha1 = require("sha1");
const { validateLogin } = require("../middlewares/users");
const {auth} = require("./../models/usuarios");
//var getIp = require ("ipware")().get_ip;
//Modulo que permite validar por IP similar a Netflix o para determinar si entro de otro dispositivo

const login = async (req, res)=> {
        try{
    req.body.password= sha1(req.body["password"]);
    const result = await auth (req.body);
    result.length === 0
    ? res.render("login", {message: "Usuario o password incorrecto"})
    :null;
            /* si viene null o vacio devuelve el mensaje de error en usuario y clave*/

    //usuario y password correcto
    const [{id}]= result; 
            /*verificado con el if (length) anterior no sea nulo destructuro id del login y lo recupero para dar acceso a las funcionalidades de la página permitiendo el acceso*/

    //GENERÓ LA SUPERGLOBAL LLAMADA IDUSER!!
    req.session.idUser = id; 
            /*nunca poner session.id porque es una palabra reservada del objeto => id=8*/
    res.redirect("/admin/oficios/all");

        } catch (e) {
                //res.sendStatus(500);//API EXTERNA
                //res.render("error")// HANDELBARS

        }

    
};


router.get('/', (req, res) => {
        /* PARA VALIDAR Y AUTORIZAR POR IP LAS SESIONES DE USUARIOS
        const ipInfo = getIP(req);
        console.log(ipInfo);
        */ 
       
    res.render('login', {})
});

router.post('/', validateLogin, login);

module.exports= router;
