// require express
var express		= require('express');
var path		= require('path');
var bodyParser 	= require('body-parser');

// create our router object
var router = express.Router();

// export our router
module.exports = router;

// route for our homepage
router.get('/', function(req, res) {
	res.render('pages/index');
});

// rout for our homepage POST
router.post('/',function(req,res){
    res.render('pages/index');
})

// route for our register page
router.get('/register', function(req, res) {
	res.render('pages/register');
});

// route for our about page
router.get('/about', function(req, res) {
	var users = [
		{name : 'Tomas', email: 'tomas.gomez.13@sansano.usm.cl', avatar:'../img/tomas.jpg'},
		{name : 'Sebastian', email: 'sebastian.angla@sansano.usm.cl', avatar:'../img/sebastian.jpg'},
		{name : 'Gonzalo', email: 'gonzalo.pontigo@sansano.usm.cl', avatar:'../img/gonzalo.jpg'},
	];

	res.render('pages/about', { users: users});
});

// route for our about page
router.get('/contact', function(req, res) {
	res.render('pages/contact');
});

router.post('/contact', function(req, res) {
	res.send('Gracias por Contactarnos, '+ req.body.name + '! Pronto te contactaremos.');
	console.log(req.body.message);
});

// route for our register page
router.get('/forgot', function(req, res) {
	res.render('pages/forgot');
});


/////////////////////////////////////////////////
/////////// CONNECT TO MYSQL DB ////////////////
////////////////////////////////////////////////
var mysql 	= require('mysql');

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'hola',
  database : 'SEGAP-USM'
});

connection.connect(function(err){
if(!err) {
    console.log("Conectado a SEGAP ... ");    
} else {
    console.log("Error conectandose con base de datos ... ");    
}
});


// Login function , (user) (logged)

var user 	= "";
var logged 	= false;

router.post('/profile', function (req, res) {

   response = {
       first_name:req.body.user,
       last_name:req.body.password
   };

	connection.query('SELECT COUNT(*) AS count FROM Alumno WHERE mail_al= ? and clave_al = ? ;', 
		[req.body.user,req.body.password], 
			function(err, result) {
				console.log(result[0].count);
				if (err) throw err
				
				if(result[0].count == 1) {
					user = result.nom_al;
					logged = true;
					console.log(result);
					res.render('pages/profile',{layour: 'layout_profile'});
				}
				else {
					console.log("No existe la cuenta");
				}
	});
});


