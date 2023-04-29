/*
  Nombre: Jefrey Eduardo López Ampérez
  Carnet: 2018-422
  Curso: Taller
  Código Técnico: IN5AM
  Fecha de Creación: 01-02-2022
  Fecha de Modificaión: 03-02-2022
 
*/

DROP DATABASE IF EXISTS DBSportStores20184222;
CREATE DATABASE DBSportStores20184222;

USE DBSportStores20184222;

CREATE TABLE Categorias(
   CodigoCategoria INT NOT NULL AUTO_INCREMENT,
   Descripcion VARCHAR(150) NOT NULL,
   PRIMARY KEY PK_CodigoCategoria (CodigoCategoria)
);

CREATE TABLE Marcas(
   CodigoMarca INT NOT NULL AUTO_INCREMENT,
   Descripcion VARCHAR(150) NOT NULL,
   PRIMARY KEY PK_CodigoMarca (CodigoMarca)
);

CREATE TABLE Tallas(
   CodigoTalla INT NOT NULL AUTO_INCREMENT,
   Descripcion VARCHAR(150) NOT NULL,
   PRIMARY KEY PK_CodigoTalla (CodigoTalla)
);

CREATE TABLE Productos(
   CodigoProducto INT NOT NULL AUTO_INCREMENT,
   Descripcion VARCHAR(150) NOT NULL,
   Existencia INT NOT NULL,
   PrecioUnitario DECIMAL (10,2) NOT NULL DEFAULT 0.00, -- 40
   PrecioPorDocena DECIMAL (10,2) NOT NULL DEFAULT 0.00,  -- 35
   PrecioPorMayor DECIMAL (10,2) NOT NULL DEFAULT 0.00,  --  25
   CodigoCategoria INT NOT NULL,
   CodigoMarca INT NOT NULL,
   CodigoTalla INT NOT NULL,
   PRIMARY KEY PK_CodigoProducto (CodigoProducto),
   CONSTRAINT FK_Productos_Categorias FOREIGN KEY (CodigoCategoria)
        REFERENCES Categorias(CodigoCategoria),
   CONSTRAINT FK_Producto_Marcas FOREIGN KEY (CodigoMarca)
        REFERENCES Marcas(CodigoMarca),
   CONSTRAINT FK_Productos_Tallas FOREIGN KEY (CodigoTalla)
        REFERENCES Tallas(CodigoTalla)
);

/*-------------------------------------- Procedimientos de Categorias--------------------------------------------------------*/
/*--------Agregar---------------*/
DELIMITER $$
    CREATE PROCEDURE SP_AgregarCategoria(IN Descripcion VARCHAR(150))
     BEGIN
         INSERT INTO Categorias (descripcion) VALUES (descripcion);
     END$$
DELIMITER ;

CALL SP_AgregarCategoria('Ropa de Caballero');
CALL SP_AgregarCategoria('Ropa de mujer');
CALL SP_AgregarCategoria('Accesorios');
CALL SP_AgregarCategoria('Ropa de Niños');
CALL SP_AgregarCategoria('Calzado');

/*-------Listar---------------*/
DELIMITER $$
    CREATE PROCEDURE SP_ListarCategoria()
     BEGIN
         SELECT
         C.CodigoCategoria,
         C.Descripcion
         FROM Categorias C;
	END$$
DELIMITER ;

CALL SP_ListarCategoria();

/*-------Buscar---------------*/
DELIMITER $$
    CREATE PROCEDURE SP_BuscarCategoria(IN CodCat INT)
    BEGIN 
       SELECT 
           C.CodigoCategoria,
           C.Descripcion
           FROM Categorias C WHERE CodigoCategoria = CodCat;
	END$$
DELIMITER ;

CALL SP_BuscarCategoria(5);

/*-------Eliminar---------------*/
DELIMITER $$
    CREATE PROCEDURE SP_EliminarCategoria(IN CodCat INT)
      BEGIN 
         DELETE FROM Categorias 
			WHERE CodigoCategoria = CodCat;
	 End $$
DELIMITER ;

CALL SP_EliminarCategoria(1);
CALL SP_ListarCategoria();

/*-------update---------------*/
DELIMITER $$
    CREATE PROCEDURE SP_EditarCategoria(IN CodCat INT, IN Descr VARCHAR(150))
        BEGIN 
            UPDATE Categorias C 
               SET Descripcion = Descr
                   WHERE CodigoCategoria = CodCat;
		END$$
DELIMITER ;

CALL SP_EditarCategoria( 2,'Ropa de dama');
CaLL SP_ListarCategoria();

/*---------------------------------------Procedimientos de Marcas -------------------------------------------------------*/
/*--------Agregar---------------*/
DELIMITER $$
   CREATE PROCEDURE SP_AgregarMarca(IN Descripcion VARCHAR(150))
       BEGIN 
           INSERT INTO Marcas (Descripcion) VALUES (Descripcion);
           End $$
DELIMITER ;
		
CALL SP_AgregarMarca ('Nike');
CALL SP_AgregarMarca ('Adidas');
CALL SP_AgregarMarca ('Jordan');
CALL SP_AgregarMarca ('Under Aurmor');
CALL SP_AgregarMarca ('Reebok');

/*-------Listar---------------*/
DELIMITER $$
    CREATE PROCEDURE SP_ListarMarca()
     BEGIN
         SELECT
         M.CodigoMarca,
         M.Descripcion
         FROM Marcas M;
	END$$
DELIMITER ;

CALL SP_ListarMarca();

/*-------Buscar---------------*/
DELIMITER $$
    CREATE PROCEDURE SP_BuscarMarca(IN CodMar INT)
    BEGIN 
       SELECT 
           M.CodigoMarca,
           M.Descripcion
           FROM Marcas M WHERE CodigoMarca = CodMar;
	END$$
DELIMITER ;

CALL SP_BuscarMarca(3);

/*-------Eliminar---------------*/
DELIMITER $$
    CREATE PROCEDURE SP_EliminarMarca(IN CodMar INT)
      BEGIN 
         DELETE FROM Marcas
			WHERE CodigoMarca = CodMar;
	 End $$
DELIMITER ;

CALL SP_EliminarMarca(1);
CALL SP_ListarMarca();

/*-------update---------------*/
DELIMITER $$
    CREATE PROCEDURE SP_EditarMarca (IN CodMar INT, IN Descr VARCHAR(150))
        BEGIN 
            UPDATE Marcas M
               SET Descripcion = Descr
                   WHERE CodigoMarca = CodMar;
		END$$
DELIMITER ;

CALL SP_EditarMarca( 2,'Adidas Original');
CaLL SP_ListarMarca();

/*---------------------------------------Procedimientos de Tallas -------------------------------------------------------*/
/*--------Agregar---------------*/
DELIMITER $$
     CREATE PROCEDURE SP_AgregarTalla(IN Descripcion VARCHAR(150))
        BEGIN 
            INSERT INTO Tallas(Descripcion) VALUES (Descripcion);
            END$$
DELIMITER ;

CALL SP_AgregarTalla('XS');
CALL SP_AgregarTalla('S');
CALL SP_AgregarTalla('M');
CALL SP_AgregarTalla('L');
CALL SP_AgregarTalla('XL');
CALL SP_AgregarTalla('37 Talla de zapato')

/*-------Listar---------------*/
DELIMITER $$
    CREATE PROCEDURE SP_ListarTalla()
     BEGIN
         SELECT
         T.CodigoTalla,
         T.Descripcion
         FROM Tallas T;
	END$$
DELIMITER ;

CALL SP_ListarTalla();

/*-------Buscar---------------*/
DELIMITER $$
    CREATE PROCEDURE SP_BuscarTalla(IN CodTal INT)
    BEGIN 
       SELECT 
           T.CodigoTalla,
           T.Descripcion
           FROM Tallas T WHERE CodigoTalla = CodTal;
	END$$
DELIMITER ;

CALL SP_BuscarTalla('1');

/*-------Eliminar---------------*/
DELIMITER $$
    CREATE PROCEDURE SP_EliminarTalla(IN CodTal INT)
      BEGIN 
         DELETE FROM Tallas
			WHERE CodigoTal = CodTal;
	 End $$
DELIMITER ;

CALL SP_EliminarTalla('');
CALL SP_ListarTalla();

/*-------Editar---------------*/
DELIMITER $$
    CREATE PROCEDURE SP_EditarTalla (IN CodTal INT, IN Descr VARCHAR(150))
        BEGIN 
            UPDATE Tallas
               SET Descripcion = Descr
                   WHERE CodigoTalla = CodTal;
		END$$
DELIMITER ;

CALL SP_EditarTalla( '5','XXL');
CaLL SP_ListarTalla();

/*---------------------------------------Procedimientos de Productos -------------------------------------------------------*/

/*--------Agregar---------------*/
DELIMITER $$
    CREATE PROCEDURE SP_AgregarProducto(IN Descripcion VARCHAR(150), IN Existencia INT,
    IN CodigoCategoria INT, IN CodigoMarca INT, IN CodigoTalla INT)
     BEGIN
         INSERT INTO Productos (Descripcion, Existencia, CodigoCategoria, CodigoMarca, CodigoTalla)
           VALUES (Descripcion, Existencia, CodigoCategoria, CodigoMarca, CodigoTalla);
     END$$
DELIMITER ;

CALL SP_AgregarProducto('Jogger para Hombre',10,1,2,4);
CALL SP_AgregarProducto('Gorra Nike',8,3,1,3);
CALL SP_AgregarProducto('Licra para mujer',20,2,4,1);
CALL SP_AgregarProducto('Sudadera para niño',15,4,3,2);
CALL SP_AgregarProducto('Zapatilla ',5,5,5,6);

CALL SP_ListarProductos();

/*-------Listar---------------*/
DELIMITER $$
   CREATE PROCEDURE SP_ListarProductos()
      BEGIN 
         SELECT
            P.CodigoProducto,
            P.Descripcion,
            P.Existencia,
            P.PrecioUnitario,
            P.PrecioPorDocena,
            P.PrecioPorMayor,
            P.CodigoCategoria,
            P.CodigoMarca,
            P.CodigoTalla
            FROM Productos P;
	 END$$
DELIMITER ; 

CALL SP_ListarProductos();

/*-------Buscar---------------*/
DELIMITER $$
  CREATE PROCEDURE SP_BuscarProductos (IN CodPro INT)
     BEGIN 
        SELECT 
		    P.CodigoProducto,
            P.Descripcion,
            P.Existencia,
            P.PrecioUnitario,
            P.PrecioPorDocena,
            P.PrecioPorMayor,
            P.CodigoCategoria,
            P.CodigoMarca,
            P.CodigoTalla
            FROM Productos P WHERE CodigoProducto = CodPro;
	 END $$
DELIMITER ;
	  
CALL SP_BuscarProductos('');
   
/*-------Eliminar-------------*/
DELIMITER $$
CREATE PROCEDURE SP_EliminarProductos (IN CodPro INT)
    BEGIN 
       DELETE FROM Productos 
         WHERE CodigoProducto = CodPro;
    END $$
DELIMITER ;

CALL SP_EliminarProductos ('');
CALL SP_ListarProductos();
drop procedure SP_EliminarProductos;
/*-------Editar---------------*/
DELIMITER $$
CREATE PROCEDURE SP_EditarProductos (IN CodPro INT, IN Descr VARCHAR(150), IN Exis INT,
       IN CodCat INT, IN CodMar INT, IN CodTal INT)
        BEGIN 
           UPDATE Productos 
              SET Descripcion = Descr, Existencia = Exis, CodigoCategoria = CodCat, CodigoMarca = CodMar, CodigoTalla = CodTal 
              WHERE CodigoProducto = CodPro;
		END $$
DELIMITER ;   

CALL SP_EditarProductos (5,'Zapatilla Running',5,5,5,6);
CALL SP_ListarProductos ();

/*---------------------------------------Procedimientos de Precio Unitario-------------------------------------------------------*/
DELIMITER $$
CREATE PROCEDURE SP_Precio_Unitario (IN CodPro INT, IN PreUni DECIMAL)
      BEGIN 
        UPDATE Productos P
           SET P.PrecioUnitario =  PreUni * 0.4 + PreUni
           WHERE CodigoProducto = CodPro;
	END $$
DELIMITER ;

CALL SP_Precio_Unitario (1, 400);
CALL SP_Precio_Unitario (2, 125);
CALL SP_Precio_Unitario (3, 250);
CALL SP_Precio_Unitario (4, 350);
CALL SP_Precio_Unitario (5, 550);

CALL SP_ListarProductos ();

/*---------------------------------------Procedimientos de Precio por Docena-------------------------------------------------------*/

DELIMITER $$
CREATE PROCEDURE SP_Precio_por_Docena (IN CodPro INT, IN PreDoce DECIMAL)
      BEGIN 
        UPDATE Productos P
           SET P.PrecioporDocena =  (PreDoce * 0.35 + PreDoce) 
           WHERE CodigoProducto = CodPro;
	END $$
DELIMITER ;

CALL SP_Precio_por_Docena (1, 400);
CALL SP_Precio_por_Docena (2, 125);
CALL SP_Precio_por_Docena (3, 250);
CALL SP_Precio_por_Docena (4, 350);
CALL SP_Precio_por_Docena (5, 550);

CALL SP_ListarProductos ();

/*---------------------------------------Procedimientos de Precio por Mayor-------------------------------------------------------*/

DELIMITER $$
CREATE PROCEDURE SP_PrecioporMayor (IN CodPro INT, IN PreMayor DECIMAL)
      BEGIN 
        UPDATE Productos P
           SET P.PrecioPorMayor =  (PreMayor * 0.25 + PreMayor) 
           WHERE CodigoProducto = CodPro;
	END $$
DELIMITER ;

CALL SP_PrecioporMayor (1, 400);
CALL SP_PrecioporMayor (2, 125);
CALL SP_PrecioporMayor (3, 250);
CALL SP_PrecioporMayor (4, 350);
CALL SP_PrecioporMayor (5, 550);

CALL SP_ListarProductos ();
