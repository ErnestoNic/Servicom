
const express = require("express");
const router = express.Router();
const multer = require ("multer"); //funcion que se ejecuta como middleware y que descifra los datos en archivos multimedia
const config = { dest: "./public/tmp" };//mi carpeta temporal para subir imagen
const upload = multer (config);//instancia de configuracion de multer
const service = require ("../../services/prestadores");
const model = require ("../../models/personas");
const {baja} = require ("../../models/prestadores");
const modeloficio = require ("../../models/oficios"); //reciclando modelo ya usados :)
const {get: getCategorias} = require ("../../models/categorias");
       
const all = async (req,res)=> {
    try{
        
        const personas = await model.get();
        res.render ("adminprestadores",{personas});

    }catch (e) {
        //res.sendStatus(500)
        console.log (e);
        //res.render ('error')
    }
};



const create = async(req,res) => {
    try{
    const id = req.body;
    const [prestador]= await model.get(id);
    console.log(prestador);
    console.log(req.file);//atencion .files si es array .file si es single dependiendo el router.post (upload creado)
    
    const idFile = await service.createPrestador(req.body, req.file);
    
   // res.redirect("/admin/prestadores/create");//no es lo optimo recarga la pagina 
    }catch (e){
        console.log(e);
    }
    
};
const editarPrestador = async(req,res)=>{
    try {
        const id = req.params.id;
        const oficios = await modeloficio.get();
        const categorias = await getCategorias();
        
    res.render("adminprestadoresalta", {id, oficios: oficios, categorias: categorias})
    }catch (e){
        console.log(e);
    } 
    
};
const Supr= async (req, res) => {
    try {
      const { id } = req.params;
      const result = await baja.bajaPrestador({ habiitado: 0 , eliminado: 1}, id);
      res.redirect("/admin/prestadores/all");
    } catch (error) {
      console.log(error);
    }
   
  };



//.single o .array
router.get("/all", all);
router.get("/create/:id", editarPrestador);
router.get("baja/:id", Supr)
router.post("/create", upload.single('imagen'), create);
module.exports = router;
