const express = require ("express");
const router = express.Router();
const model = require ("../../models/oficios"); //reciclando modelo ya usados :)
const {get: getCategorias} = require ("../../models/categorias");


const all = async (req,res)=> {
    try{
        
        const oficios = await model.get();
        const categorias = await getCategorias();
        res.render ("adminoficios", {oficios: oficios, categorias: categorias});

    }catch (e) {
        //res.sendStatus(500)
        console.log (e);
        //res.render ('error')
    }
};
const create = async(req,res)=> {
    //console.log (req.body);
    const {insertId} = await model.insert(req.body);
    res.redirect("/admin/oficios/all");//recarga la pagina no es lo ideal porque requiere mas peticiones al servidor provocando gastos innecesarios de dinero. SE SOLUCIONA CON AJAX
    //.catch((e)=>res.render("error"));
};
const edite = async(req,res)=> {
    try {
        const id = req.params.id;
        const categorias = await getCategorias();
        const [oficio]= await model.single(id);
        const nombreOficio = oficio;
        res.render ("actualizar", {id, categorias, nombreOficio});
        //const {insertId} = await model.modify(req.body);
         
     
        //res.redirect("/admin/oficios/all");
    
} catch (e) {
    console.log(e);
}};

const actualizar = async(req, res)=> {
    try{
    const {nombreOficio, idCategoria} = req.body;
    const body = {idCategoria, nombreOficio};
    const act= await model.actualizar(body, req.body.idOficio);
    res.redirect("/admin/oficios/all");

    } catch (e) {
        console.log(e)
    }
   
};


/*const borrar = async(req,res)=> {
    //console.log (req.body);
    const {insertId} = await model.borrar(req.body);
    res.redirect("/admin/oficios/all");//recarga la pagina no es lo ideal porque requiere mas peticiones al servidor provocando gastos innecesarios de dinero. SE SOLUCIONA CON AJAX
    //.catch((e)=>res.render("error"));
};*/

//localhost:3000/admin/cursos/all
router.get("/all", all);
router.post("/create", create);
router.get("/editar/:id", edite);
router.post("/actualizar", actualizar);
//router.delete("/delete", borrar);
module.exports = router;