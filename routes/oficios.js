// rutas para la insercion de los cursos
//ES EL CONTROLADOR QUE PERMITE EL TRANSITO DE ENTRE LA BD Y LAS VISTAS

const express = require("express");
const router = express.Router();
const model = require ("./../models/oficios");//llama al modelo

            // funcion de consulta y acceso a la ruta y a la BD
const all = async (req, res) => {
    try{
            //pedir la informacion del model
            //enviar la info del model a la vista en formato json o hbs
    const resultOficios= await model.get();
            /*await porque la funcion get del model es async y result trae el   array de obejtos de sql para mostrarlo en formanto res.render o res.json*/
    //res.json(resultCursos);
    res.render('oficios', {resultOficios})//enviando array a la vista hbs

    }catch (e){
        res.render("error");
    }
    
}; 



router.get("/all", all);

module.exports = router;