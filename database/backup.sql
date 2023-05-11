/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.27-MariaDB : Database - senatilib
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`senatilib` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `senatilib`;

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) NOT NULL,
  `imgdefault` varchar(100) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idcategoria`),
  UNIQUE KEY `uk_categoria_cat` (`categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `categorias` */

insert  into `categorias`(`idcategoria`,`categoria`,`imgdefault`,`estado`,`create_at`,`update_at`) values 
(1,'Informática','informatica.jpg','1','2023-05-09 21:34:07',NULL),
(2,'Matemáticas','matematica.jpg','1','2023-05-09 21:34:07',NULL),
(3,'Comunicación','comunicacion.jpg','1','2023-05-09 21:34:07',NULL);

/*Table structure for table `editoriales` */

DROP TABLE IF EXISTS `editoriales`;

CREATE TABLE `editoriales` (
  `ideditorial` int(11) NOT NULL AUTO_INCREMENT,
  `editorial` varchar(150) NOT NULL,
  `pais` char(2) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ideditorial`),
  UNIQUE KEY `uk_editorial_ed` (`editorial`,`pais`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `editoriales` */

insert  into `editoriales`(`ideditorial`,`editorial`,`pais`,`email`,`telefono`,`estado`,`create_at`,`update_at`) values 
(1,'Apress','US',NULL,NULL,'1','2023-05-09 21:34:10',NULL),
(2,'Pragmatic','ES',NULL,NULL,'1','2023-05-09 21:34:10',NULL),
(3,'Macro','PE',NULL,NULL,'1','2023-05-09 21:34:10',NULL);

/*Table structure for table `materiales` */

DROP TABLE IF EXISTS `materiales`;

CREATE TABLE `materiales` (
  `idmaterial` int(11) NOT NULL AUTO_INCREMENT,
  `idsubcategoria` int(11) NOT NULL,
  `ideditorial` int(11) DEFAULT NULL,
  `titulo` varchar(200) NOT NULL,
  `sinopsis` varchar(300) NOT NULL,
  `versionmat` tinyint(4) NOT NULL DEFAULT 1,
  `autor` varchar(100) NOT NULL,
  `cantpaginas` smallint(6) NOT NULL,
  `apublicacion` char(4) NOT NULL,
  `caratula` varchar(100) DEFAULT NULL,
  `materialpdf` varchar(100) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idmaterial`),
  KEY `fk_idsubcategoria_mat` (`idsubcategoria`),
  KEY `fk_ideditorial_mat` (`ideditorial`),
  CONSTRAINT `fk_ideditorial_mat` FOREIGN KEY (`ideditorial`) REFERENCES `editoriales` (`ideditorial`),
  CONSTRAINT `fk_idsubcategoria_mat` FOREIGN KEY (`idsubcategoria`) REFERENCES `subcategorias` (`idsubcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `materiales` */

insert  into `materiales`(`idmaterial`,`idsubcategoria`,`ideditorial`,`titulo`,`sinopsis`,`versionmat`,`autor`,`cantpaginas`,`apublicacion`,`caratula`,`materialpdf`,`estado`,`create_at`,`update_at`) values 
(1,1,3,'Aprende Excel fácil','MS Excel 365 integración con PowerBI',1,'Carlos Padra Perez',300,'2022',NULL,'ruta','1','2023-05-09 21:34:18',NULL),
(2,4,1,'JS como debe ser','Aprende JS desde cero con este libro fácil de leer',1,'Miguel Munayco Gonzales',280,'2023',NULL,'ruta','1','2023-05-09 21:34:18',NULL),
(3,4,1,'PHP 8 y MYSQL: El Curso Completo, Práctico y Desde Cero !','El curso que te enseña a crear aplicaciones y sitios web desde cero con PHP y MYSQL',1,'Carlos Arturo Perez',150,'2022','479b4a380d27ecf08ffbf4f8bce7dc9eb6aa1613.jpg','479b4a380d27ecf08ffbf4f8bce7dc9eb6aa1613.pdf','1','2023-05-09 21:38:40',NULL),
(4,4,NULL,'Aprende SQL desde cero: ¡Curso con mas de 50 ejercicios! 2','Un curso integral donde aprenderás como hacer consultas SQL complejas.',1,'Numpi Cursos',500,'2023','92b3acf31fd50da712ee4aa41933f5b4ee12b6fa.jpg','92b3acf31fd50da712ee4aa41933f5b4ee12b6fa.pdf','1','2023-05-09 21:40:25',NULL),
(5,4,2,'Máster Completo en Java de cero a experto 2023 (+127 hrs)','Aprende con el mejor curso Java de cero con las mejores prácticas POO, Java EE 9, CDI, JPA, EJB, JSF, Web Services, JAAS',1,'Andrés José Guzman',500,'2023','f3bb2ce49c9c2ae26fca87aa92aaea008cade099.jpg','f3bb2ce49c9c2ae26fca87aa92aaea008cade099.pdf','1','2023-05-09 22:01:13',NULL),
(6,4,3,'Desarrollo Web Completo con HTML5, CSS3, JS AJAX PHP y MySQL','Aprende Desarrollo Web con este curso 100% práctico, paso a paso y sin conocimientos previo INCLUYE 4 PROYECTOS FINALES',1,'Juan Pablo de la Torre Valdez',450,'2023','27af22e01d9eecf6a8eab07e4eef179e6f6af82a.jpg','27af22e01d9eecf6a8eab07e4eef179e6f6af82a.pdf','1','2023-05-09 22:05:42',NULL);

/*Table structure for table `subcategorias` */

DROP TABLE IF EXISTS `subcategorias`;

CREATE TABLE `subcategorias` (
  `idsubcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `subcategoria` varchar(70) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idsubcategoria`),
  UNIQUE KEY `uk_subcategoria_sub` (`subcategoria`),
  KEY `fk_idcategoria_sub` (`idcategoria`),
  CONSTRAINT `fk_idcategoria_sub` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `subcategorias` */

insert  into `subcategorias`(`idsubcategoria`,`idcategoria`,`subcategoria`,`estado`,`create_at`,`update_at`) values 
(1,1,'Microsoft Office','1','2023-05-09 21:34:09',NULL),
(2,1,'Base de datos','1','2023-05-09 21:34:09',NULL),
(3,1,'Seguridad informática','1','2023-05-09 21:34:09',NULL),
(4,1,'Programación','1','2023-05-09 21:34:09',NULL),
(5,1,'Diseño gráfico','1','2023-05-09 21:34:09',NULL);

/* Procedure structure for procedure `spu_categorias_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_categorias_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_categorias_listar`()
BEGIN
	SELECT idcategoria, categoria, imgdefault 
		FROM categorias
		WHERE estado = 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_editoriales_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_editoriales_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_editoriales_listar`()
BEGIN
	SELECT ideditorial, editorial, pais, email, telefono
		FROM editoriales
		WHERE estado = 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_materiales_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_materiales_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_materiales_listar`()
BEGIN
	SELECT	MAT.idmaterial, SUB.subcategoria, EDI.editorial,
				MAT.titulo, MAT.sinopsis, MAT.versionmat,
				MAT.autor, MAT.cantpaginas, MAT.apublicacion, 
				MAT.caratula, MAT.materialpdf
		FROM materiales MAT
		INNER JOIN subcategorias SUB ON MAT.idsubcategoria = SUB.idsubcategoria
		LEFT JOIN editoriales EDI ON MAT.ideditorial = EDI.ideditorial
		WHERE MAT.estado = '1'
		ORDER BY 1 DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_materiales_registrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_materiales_registrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_materiales_registrar`(
	IN _idsubcategoria	INT,
	IN _ideditorial		INT, 
	IN _titulo				VARCHAR(200),
	IN _sinopsis			VARCHAR(300),
	IN _versionmat			TINYINT,
	IN _autor				VARCHAR(100),
	IN _cantpaginas		SMALLINT,
	IN _apublicacion		CHAR(4),
	IN _caratula			VARCHAR(100),
	IN _materialpdf		VARCHAR(100)
)
BEGIN
	IF _ideditorial = 0 THEN SET _ideditorial = NULL; END IF;
	IF _caratula = '' THEN SET _caratula = NULL; END IF;
		
	INSERT INTO materiales 
	(idsubcategoria, ideditorial, titulo, sinopsis, versionmat, autor, cantpaginas, apublicacion, caratula, materialpdf) 
	VALUES
	(_idsubcategoria, _ideditorial, _titulo, _sinopsis, _versionmat, _autor, _cantpaginas, _apublicacion, _caratula, _materialpdf);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_subcategorias_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_subcategorias_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_subcategorias_listar`()
BEGIN
	SELECT idsubcategoria, idcategoria, subcategoria
		FROM subcategorias
		WHERE estado = 1;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
