
const {create, createImages} = require("../models/prestadores");
const {imgFile} = require("../utils/fileHandler");
const createPrestador = async (body, file) => {
  
    try {
        //const presta = await update(body.id)
        const {insertId: idPersona} = await create(body)//retorna inserId
        //const obj = {idPersona, idOficio, uid, matriculas}
       // console.log(obj);
        
        const uid= imgFile(file);//retorna el name de la imagen
        
        const {insertId: idFile} = await createImages();
        return idFile;
    
    } catch (e) {
        console.error(e)
        
    }
};
module.exports={createPrestador};