const express = require("express");
const router = express.Router();
const model = require("../models/categorias");

const all = async (req, res) => {
    const categorias = await model.get();
    res.json(categorias);
};

const create= async(req, res)=>{
    //console.log(req.body);
    const {insertId} =await model.insert(req.body);
    
    
        /*req.body =>inserta el body del formulario de alta de categorias o de la emulacion de postman no esta bien insertar todo lo que llega, debe validarse lo que llega por si viene con otro nombre la columna. PUEDE PREVENIRSE CON ESTA SINTAX:
            /* const obj = ({nombre}=req.body); =>destructuro solo el nombre de todo lo que llega
            const {insertId}=await model.insert(obj) => se lo paso como objeto
            */


           res.redirect("/admin/oficios/all");
}

router.post("/create", create);//ruta que permite la creacion de nuevas categorias deberia incluirse un MIDELWARE para validar lo que viene del req.body de arriba (que no venga nulo o con otro nombre)
router.get("/all", all);//ruta de todas las categorias que dispara un funcion determinada (all)
module.exports = router;

