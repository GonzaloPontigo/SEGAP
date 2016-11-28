// export our router
// app/routes.js

var connection 	= require('./db');

module.exports = function(app, passport) {

	// route for our homepage
	app.get('/', function(req, res) {
		res.render('pages/index');
	});

	// rout for our homepage POST
	app.post('/',function(req,res){
	    res.render('pages/index');
	})

	// route for our about page
	app.get('/about', function(req, res) {
		var users = [
			{name : 'Tomas', email: 'tomas.gomez.13@sansano.usm.cl', avatar:'../img/tomas.jpg'},
			{name : 'Sebastian', email: 'sebastian.angla@sansano.usm.cl', avatar:'../img/sebastian.jpg'},
			{name : 'Gonzalo', email: 'gonzalo.pontigo@sansano.usm.cl', avatar:'../img/gonzalo.jpg'},
		];

		res.render('pages/about', { users: users});
	});

	// route for our contact page
	app.get('/contact', function(req, res) {
		res.render('pages/contact');
	});

	app.post('/contact', function(req, res) {
		res.send('Gracias por Contactarnos, '+ req.body.name + '! Pronto te contactaremos.' + "<a href='/'> Volver </a>");
		console.log(req.body.message);
	});

	app.get('/contact_profile', function(req, res) {
		res.render('pages/contact_profile',{
			layout:'layout_profile_Al'});
	});

	app.post('/contacting_profile', isLoggedIn , function(req, res) {
		res.send('Gracias por Contactarnos, '+ req.body.name + '! Pronto te contactaremos.' + "<a href='/profile'> Volver </a>");
		console.log(req.body.message);
	});
	// route for our forgot page
	app.get('/forgot', function(req, res) {
		res.render('pages/forgot');
	});


	// process the login form
	app.post('/login', function(req, res, next) {
	  passport.authenticate('local-login', function(err, user, info) {
	    if (err) { return next(err); }
	    
	    if (!user) { return res.redirect('/'); }
	    
	    req.logIn(user, function(err) {
	      if (err) { return next(err); }
	      
	      return res.redirect('/profile_'+user.tipo);
	    });

	  })(req, res, next);
	});


	app.get('/fisica', function(req, res) {
		res.render('pages/fisica', {
			layout:'layout_profile_Pr'});
	});

   var multer  =   require('multer');
	var storage =   multer.diskStorage({
 		 destination: function (req, file, callback) {
    callback(null, '../img/tomas.jpg');
  	},
  	filename: function (req, file, callback) {
    callback(null, file.fieldname + '-' + Date.now());
  	}
	});
	var upload = multer({ storage : storage}).single('userPhoto');
	app.post('/api/photo',function(req,res){
    	upload(req,res,function(err) {
        if(err) {
            return res.end("Error uploading file - db connection.");
        }
        res.end("File is uploaded");
    	});
	});


	app.get('/fisica2', function(req, res) {
		res.render('pages/fisica2', {
			layout:'layout_profile_Al'});
	});

	// =====================================
	// SIGNUP ==============================
	// =====================================
	// show the signup form


	app.get('/signup', function(req, res) {
		// render the page and pass in any flash data if it exists
		res.render('./pages/signup', { message: req.flash('signupMessage') });
	});

	// process the signup form
	app.post('/signup', passport.authenticate('local-signup', {
		successRedirect : '/profile_Al', // redirect to the secure profile section
		failureRedirect : './pages/signup', // redirect back to the signup page if there is an error
		failureFlash : true // allow flash messages
	}));

	app.get('/signup_user', isLoggedIn,isAdmin, function(req, res) {
		// render the page and pass in any flash data if it exists
		res.render('./pages/signup_user', {
			layout:'layout_profile_Ad'});
	});

	app.post('/signup_user', function(req, res, next) {
	  connection.register(req,req.body.username,req.body.password,next);
	  res.render('./pages/signup_user', {
			layout:'layout_profile_Ad'});
	}); 

	/*
	app.get('/delete_user', isLoggedIn,isAdmin, function(req, res) {
		// render the page and pass in any flash data if it exists
		res.render('./pages/delete_user', {
			layout:'layout_profile_Ad'});
	});

	app.post('/delete_user', function(req, res, next) {
	  connection.deleteUser(req.body.username,next);
	  res.render('./pages/profile_Ad', {
			layout:'layout_profile_Ad'});
	}); 
    */

	//ASIGNATURAS

	app.get('/create_class', isLoggedIn,isAdmin, function(req, res) {
		// render the page and pass in any flash data if it exists
		res.render('./pages/create_class', {
			layout:'layout_profile_Ad'});
	});

	app.post('/create_class', function(req, res, next) {
	  connection.createClass(req,req.body.id,next);
	  res.render('./pages/profile_Ad', {
			layout:'layout_profile_Ad'});
	}); 
	// =====================================
	// PROFILE SECTION =========================
	// =====================================
	// we will want this protected so you have to be logged in to visit
	// we will use route middleware to verify this (the isLoggedIn function)
	app.get('/profile_Al', isLoggedIn, function(req, res) {
		res.render('./pages/profile_Al.ejs', {
			layout:'layout_profile_Al',
			user : req.user // get the user out of session and pass to template
		});
	});

	app.get('/profile_Pr', isLoggedIn, function(req, res) {
		res.render('./pages/profile_Pr.ejs', {
			layout:'layout_profile_Pr',
			user : req.user // get the user out of session and pass to template
		});
	});

	app.get('/profile_Ad', isLoggedIn, function(req, res) {
		res.render('./pages/profile_Ad.ejs', {
			layout:'layout_profile_Ad',
			user : req.user // get the user out of session and pass to template
		});
	});

	app.get('/profile/classes', isLoggedIn, function(req, res) {
	var queryString1 = 'SELECT * FROM Asignatura'

	connection.connection.query( queryString1, 
			function(err, result) {
				console.log(result);
				if (err) throw err
				
				else {
					res.send(
						'<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>'
						);
				}
			});

	});
		

	// =====================================
	// LOGOUT ==============================
	// =====================================
	app.get('/logout', function(req, res) {
		req.logout();
		res.redirect('/');
	});
};

// route middleware to make sure
function isLoggedIn(req, res, next) {

	// if user is authenticated in the session, carry on
	if (req.isAuthenticated())
		return next();

	// if they aren't redirect them to the home page
	res.redirect('/');
}

function isAdmin(req, res, next) {

	// if user is authenticated in the session, carry on
	if (req.isAuthenticated() && req.user.tipo == "Ad" )
		return next();

	// if they aren't redirect them to the home page
	res.redirect('/');
}


