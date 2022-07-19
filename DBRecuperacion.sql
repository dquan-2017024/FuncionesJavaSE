-- Nombre del Estudiante: Daniel Enrique Quán Cruz
-- Código Técnico: IN5AM
-- Fecha de Evaluación: 28/01/2022

Drop database if exists  DBFuncionesJavaSE;
Create database DBFuncionesJavaSE;

Use DBFuncionesJavaSE;

Create table Empresas(
	codigoEmpresa int not null,
    nombreEmpresa varchar(150) not null,
    direccion varchar(150) not null,
    telefono varchar(10) not null,
    primary key PK_codigoEmpresa (codigoEmpresa)
);


-- --------- Procedimientos almacenados Entidad Empresas ---------------------

-- Agregar Empresas----
  
DELIMITER $$
	CREATE PROCEDURE sp_AgregarEmpresas(in codigoEmpresa int, in nombreEmpresa VARCHAR(150), in direccion varchar(150), in telefono varchar(150))
		BEGIN
			INSERT INTO Empresas (codigoEmpresa, nombreEmpresa, direccion, telefono)
				VALUES (codigoEmpresa, nombreEmpresa, direccion, telefono);
        END$$
DELIMITER ;

-- Listar Empresas----

Delimiter $$
	Create procedure sp_ListarEmpresas()
		Begin
			select 
				Empresas.codigoEmpresa,
				Empresas.nombreEmpresa, 
                Empresas.direccion, 
                Empresas.telefono
                from Empresas;
        End$$
Delimiter ;


-- Editar Empresas----

DELIMITER $$
	CREATE PROCEDURE sp_EditarEmpresas(in codigoEmpresa int, in nombreEmpresa VARCHAR(150), in direccion varchar(150), in telefono varchar(150))
		BEGIN
			UPDATE Empresas 
				SET nombreEmpresa = nombreEmp, direccion = dir, telefono = tel
				WHERE codigoEmpresa = codigoEmp;
        END$$
DELIMITER ;


-- Eliminar Empresas----

Delimiter $$
	Create procedure sp_EliminarEmpresa(in codEmp int)
		Begin
			delete
				from Empresas
                    where codigoEmpresa = codEmp;
        End$$
Delimiter ;



-- Buscar Empresas----
-- drop procedure sp_BuscarEmpresa;
Delimiter $$
	Create procedure sp_BuscarEmpresa(in codEmp int)
		Begin
			select 
				Empresas.codigoEmpresa,
				Empresas.nombreEmpresa, 
                Empresas.direccion, 
                Empresas.telefono
                from Empresas 
					where codigoEmpresa = codEmp;
        End$$
Delimiter ;


call sp_AgregarEmpresas (1, "Apple", "50 Avenida 20-50 Zona 10", 89462515);
call sp_AgregarEmpresas (2, "Samsung", "24 calle 12-24 Zona 5", 98752525);
call sp_AgregarEmpresas (3, "Motorola", "20 calle 10-20 Zona 6", 65982145);
call sp_AgregarEmpresas (4, "Huawei", "11 calle 8-11 Zona 1", 65329847);
call sp_AgregarEmpresas (5, "Xiaomi", "12 avenida 9-12 Zona 13", 14475696);

call sp_ListarEmpresas;
