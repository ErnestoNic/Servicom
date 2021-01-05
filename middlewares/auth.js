//funcion que comprueba la existencia de un usuario creado, y en ese caso mediante next autoriza los roles de admin

const authAdmin = (req, res, next) => {
    req.session.idUser ? ((req.id = req.session.idUser), next()) : res.redirect ("/login");
    //res.status(401).json(message:"Unauthorized"); para manejar luego el ingreso no autorizado en angular u otro en vez de devolver el redirect
    /*
    llama a req.id porque no es facil acordarse donde esta el id session y de esta manera lo llama para reutilizarlo en todo el codigo, puede construirse  objetos y propiedades para evitar memorizar y hacer mas escalable el proyecto*/

};
module.exports = { authAdmin};
