/////////// CONNECT TO MYSQL DB ////////////////

var mysql 	= require('mysql');
var bcrypt = require('bcrypt-nodejs');

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

connection.query("SELECT * FROM Usuario WHERE mail = ?","admin", function(err, rows) {
                if (err)
                    throw err;
                if(!rows.length) {
                    // if there is no user with that username
                    // create the user
                    var newUserMysql = {
                        username: "admin",
                        password: bcrypt.hashSync('1234', null, null),
                        name: "admin",
                        lastname: "admin",
                        type: 'Ad' // use the generateHash function in our user model
                    };

                    var insertQuery = "INSERT INTO Usuario ( mail, clave , nom, apell , tipo) values (?,?,?,?,?)";

                    connection.query(insertQuery,[newUserMysql.username, newUserMysql.password, newUserMysql.name, 
                        newUserMysql.lastname, newUserMysql.type] ,
                        function(err, rows) {
                        if (err) throw err;
                    });
                };
            });

var register = function(req,username,password,next) {
            // find a user whose email is the same as the forms email
            // we are checking to see if the user trying to login already exists
            connection.query("SELECT * FROM Usuario WHERE mail = ?",[username], function(err, rows) {
                if (err)
                    throw err;
                if (!rows.length) {
                    // if there is no user with that username
                    // create the user
                    var type = "Al"
                    if(req.body.type) type = req.body.type

                    var newUserMysql = {
                        username: username,
                        password: bcrypt.hashSync(password, null, null),
                        name: req.body.name,
                        lastname: req.body.lastname,
                        type: type // use the generateHash function in our user model
                    };

                    var insertQuery = "INSERT INTO Usuario (mail, clave , nom, apell, tipo) values (?,?,?,?,?)";

                    connection.query(insertQuery,[newUserMysql.username, newUserMysql.password, newUserMysql.name, 
                        newUserMysql.lastname, newUserMysql.type] ,
                        function(err, rows) {
                        if (err) throw err;
                    });
                }
            });
        };
/*
var deleteUser = function(username,next) {
            // find a user whose email is the same as the forms email
            // we are checking to see if the user trying to login already exists
            connection.query("SELECT * FROM Usuario WHERE mail = ?",[username], function(err, rows) {
                if (err)
                    throw err;
                if (rows.length) {
                    // if there is no user with that username
                    // create the user

                    var newUserMysql = {
                        username: username,
                    };
                    var insertQuery = "DELETE FROM Usuario WHERE mail = ?";

                    connection.query(insertQuery,[newUserMysql.username] ,
                        function(err, rows) {
                        if (err) throw err;
                    });
                }
            });
        };*/

var createClass = function(req,sigla,next) {
            // find a user whose email is the same as the forms email
            // we are checking to see if the user trying to login already exists
            connection.query("SELECT * FROM Asignatura WHERE idAsignatura = ?",[sigla], function(err, rows) {
                if (err)
                    throw err;
                if (!rows.length) {
                    // if there is no user with that username
                    // create the user
                    var newClass = {
                        id: sigla,
                        name: req.body.name,
                    };

                    var insertQuery = "INSERT INTO Asignatura (idAsignatura , nom_as) values (?,?)";

                    connection.query(insertQuery,[newClass.id, newClass.name] ,
                        function(err, rows) {
                        if (err) throw err;
                    });
                }
            });
        };

exports.connection = connection;
exports.register = register;
exports.createClass = createClass;
exports.deleteUser = createClass;


