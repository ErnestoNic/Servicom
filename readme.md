SERVICOM.

Esta aplicación es un pequeño sistema AUN EN CONSTRUCCION que pretende convertirse en un espacio para que aquellas personas que prestan servicios u oficios calificados puedan reunirse en una app donde usuarios y prestadores interactuen por cercania.

Inicio
Para poder poner en funcionamiento la aplicación, hay que instalar los node_modules, y las tablas que se proveen en una carpeta en la misma app.

datos de la BD => VER ARCHIVO .env (en esta ocasion es publico para facilitar la tarea de correccion)

Creación de nuevo usuario
Se tiene que realizar una petición a través del método POST a http://localhost:3000/registro, y en el body enviar los siguientes campos con sus respectivos valores:

nombre, 
apellido, 
cuit,
domicilio,
altura,
email, 
telefono,

Una vez que la petición es exitosa, el usuario recibirá un correo con una URL dinámica, a la que tendrá que acceder para poder confirmar su registro. Para el envio de mail se provee un correo provisorio con las siguientes caracteristicas:

cuenta emisora del mail => VER ARCHIVO .env (en esta ocasion es una cuenta creada para el envio de los mail a modo de prueba)


Login de un usuario
Una vez que el registro se confirmó, se tiene que realizar una petición a través del método POST a http://localhost:3000/login, y en el body enviar los siguientes campos con sus respectivos valores:

usuario
password

ROL DE LOS USUARIOS
Una vez logueado el usuario ingresará al administrador de oficios donde puede dar de alta categorias y oficios propiamente http://localhost:3000/admin/oficios/all asi como editar el oficio que presta (aun esta en construccion la baja logica del oficio) que en un futuro sera aprobado por un SUPER ADMINISTRADOR

INTERFAZ VISUAL PARA USUARIOS
Se tiene que realizar una petición a través del método GET a http://localhost:3000/oficios/all, desde donde podra consultarse segun el oficio los prestadores disponibles en la zona (en un futuro debera abrir en su zona geografica los que estan disponibles y su contacto)

ROL DE LOS PRESTADORES
Si bien aun esta en construccion esta http://localhost:3000/admin/prestadores/all en esta pantalla puede cargarse hasta el momento la foto de perfil del matriculado prestador, (aun esta en construccion el almacenamiento y borrado en BD "prestadores"), 

ROL PENSADO PARA EL SUPERADMINISTRADOR
Podrá visualizar los domicilios y datos de la totalidad de las personas registradas que sera provista al consumidor cuando solcite un servicio. en construccion deberá adecuar el rol de un usuario en 1 para que este sea a la vez usuario y prestador y permita mostrar todos los datos obtenidos del form de registro.

CREACION DE CATEGORIAS Y OFICIOS 
Se tiene que realizar una petición a través del método POST a http://localhost:3000/admin/oficios/, donde un modal lo guiara (en un futuro deberia ser validado por un SUPER ADMINISTRADOR) 

MODIFICIACIONES DE CATEGORIAS Y OFICIOS
En todos los casos desde http://localhost:3000/admin/oficios/all podrá generarse por metodo GET y luego POST

