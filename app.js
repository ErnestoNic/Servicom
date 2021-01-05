var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const dotenv = require("dotenv"); //permite almacenar globalmente las variables de entorno (user y pass de mails por ejemplo)
const {authAdmin} = require ("./middlewares/auth");// esta disponible globalmente la validadcion del inicio de sesiones
dotenv.config();//esta disponible para todas las rutas
const session = require("express-session");//sesion que permite logueos superglobales

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
const registro = require('./routes/registro');
const oficios = require ('./routes/oficios');
const categorias = require ('./routes/categorias');
const adminOficios = require("./routes/admin/oficios");
const prestadores = require ("./routes/admin/prestadores");
const login = require ("./routes/login");
var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
// idUser : 8 // oamsd9am-sidnaosd12eads_
// crea un objeto session dentro del request
app.use(
  session({//puedo elegir que parametros almacenar de una sesion
    secret: process.env.SECRET_SESSION,//protegue el idUser 8 encriptando oamsd9am-sidnaosd12eads
    cookie: { maxAge: null },//refiere a la expiracion en segundos de la sesion (15*60'' expira en 15min, 3600)
    resave: true,
    saveUninitialized: false,
  })
);

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/registro', registro);
app.use('/oficios', oficios);
app.use('/categorias', categorias);
app.use('/login', login);


//ADMINISTRADOR
app.use("/admin/oficios", authAdmin, adminOficios);// una posibilidad es => app.use (/admin(istrador)?\cursos/, admin); //new Regexp('admin')... incluye un middleware para validar las sesiones de los usuarios
app.use("/admin/prestadores", authAdmin, prestadores);
app.use("/admin/categorias", authAdmin, categorias);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
    next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    // render the error page
    res.status(err.status || 500);
    res.render('error');
});

module.exports = app;