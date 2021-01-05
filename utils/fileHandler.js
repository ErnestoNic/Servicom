      
const fs = require ('fs'); 
        

const { v4: uuid}= require ("uuid"); 
const allowExtension = ["png", "jpeg"];


//FUNCION QUE BORRA TEMPORALES
const deleteTemp =(file)=> fs.unlink(file, e=> console.log(e));
//FUNCION QUE MODIFICA Y GUARDA IMAGENES
    
const saveFile =({mimetype, size, path}, allowE, destFolder = `./public/images`)=>{
        
    try {
        
            /*split recupera la extension del mime (image/png)=>png y compara con la extension permitida allowE*/
        const [type, extension]= mimetype.split("/");//obtengo el formato
        if (!allowE.includes (extension)) throw "Formato incorrecto"; // comparo extensiones
            
        const uid = uuid(); //llama al modulo para renombrar la imagen con UniqueId
        const fileName = `${uid}.${extension}`;//alamacenará este nombre en BD
        const fileNameOut= `${destFolder}/${uid}.${extension}`;//ej guardado: images/4ss6df46sd4f6sd4f6sdf.png

            /*proceso de lectura y escritura en simultaneo... del path recibido al cargar la imagen para renombrar y guardar luego de las validaciones de extensiones*/
        fs.createReadStream(path).pipe(fs.createWriteStream(fileNameOut));//convierte el temporal en imagen y luego lo borra de temporales para almacenar en imagen con el formato que queremos nosotros(UniqueId)
        deleteTemp(path);
        return fileName;
            
    
    } catch (e) {
        deleteTemp(path);
        console.error(e);
    }
        
};

//FUNCION QUE PERMITE UTILIZAR LA IMAGEN EN TODO EL PROYECTO
const imgFile =(file) => saveFile (file, allowExtension);
module.exports ={imgFile};
