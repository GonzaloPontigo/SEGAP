
//require our dependencies
var express 		= require('express');
var expressLayouts 	= require('express-ejs-layouts');
var session  		= require('express-session');
var bodyParser 		= require('body-parser');
var cookieParser 	= require('cookie-parser');
var app 			= express();
var morgan 			= require('morgan');
var port    		= process.env.PORT || 8080;
var passport 		= require('passport');
var flash    		= require('connect-flash');
var connection 		= require('./app/db');


// configuration ===============================================================
// connect to our database

require('./app/passport')(passport); // pass passport for configuration

// use ejs and express Layouts
app.set('view engine', 'ejs');
app.use(expressLayouts);

// set up our express application
app.use(morgan('dev')); // log every request to the console
app.use(cookieParser()); // read cookies (needed for auth)
app.use(bodyParser.urlencoded({
	extended: true
}));
app.use(bodyParser.json());
// use body parser
app.use(bodyParser.urlencoded({ extended: true }));


// set static files (css and images, etc) location
app.use(express.static(__dirname+'/public'));

// start server
app.listen(port,function() {
	console.log('Servidor arriba :)');
});

// required for passport
app.use(session({
	secret: 'vidyapathaisalwaysrunning',
	resave: true,
	saveUninitialized: true
 } )); // session secret
app.use(passport.initialize());
app.use(passport.session()); // persistent login sessions
app.use(flash()); // use connect-flash for flash messages stored in session

//route our app
var router = require('./app/routes')(app, passport);


