const express = require("express");
const router = express.Router();
const {register} = require ("./../services/registro");//consumo las funciones del service para mandar los mails y registrar usuarios y personas
const showView = (req, res) => res.render("registro");
const model = require ("./../models/usuarios");
const create = async(req, res) => {
    try {
        const { body: usuario } = req;
        await register (usuario);
        

        res.render("registro", {
        message: "Usuario registrado, se envió un mail a tu casilla",
        }); //renderiza la misma vista del submit donde se registro enviandole un mensaje de aviso que se le envio un mail
        
    } catch (e) {
        console.log(e);
    }
};
const verifyEmail = async (req, res)=> {

    try {
        //PUEDE TAMBIEN VALIDAR POR FECHA
        //JSON WEB TOKEN QUE EXPIRA EN X HORAS EL ENLACE MAGICO
    const {uid: clave} = req.query;
        //VERIFICAR TOKEN ->
    await model.update ({clave, obj : {habilitado:1}});
    //recibimos el uid de la query string cuando el usuario ingreso al url del mail
    //busca el uid si existe habilita si no ->404
    res.redirect("/login");

    } catch (e){
        console.error(e)
    }
    

};



router.get("/", showView);
router.post("/create", create); //aca puede insertarse midleware para validar usuarios y/o perfiles y luego asignar diversos accesos creando alguna funcion COMPROBACION que se inserta luego de la coma
router.get("/verify", verifyEmail);
module.exports = router;