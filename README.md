
GRUPO SEGAP

Integrantes:

- Tomás Gómez M.
- Sebastián Angla
- Gonzalo Pontigo

-------------------------------------------------

Se adjuntan los archivos:

SEGAP_USM.sql 		: Correspondiente a la Base de datos, trabajado en ambiente OSx
					  con programa Workbench Mysql.

Directorio Servidor	: Correspondiente a la carpeta con el servidor del programa
					  y todos los archivos requeridos para la conexión del servidor.

Informe 			: Informe con los diagramas y todo lo requerido para el entregable 3.


--------------------------------------------------

Para subir el servidor se debe correr la base de datos y luego situarse con terminal
en la carpeta Servidor y luego ejecutar:
		
		$ npm install

		$ node server.js

Luego abrir en el navegador 
	
		$ http://localhost:8080/

---------------------------------------------------

Por defecto viene un usuario administrador creado

		$ user = admin
		$ pass = 1234

---------------------------------------------------
Aclaraciones:

-Cuando un profesor sube un archivo, hay un error que no fue arreglado, se dejó como error
de bd mostrado por pantalla.

-Para distinguir entre perfiles de cada alumno se presenta una imagen de diferente color
para cada perfil

rojo = adaptador

azul = asimilador

amarillo = convergente

verde = divergente

