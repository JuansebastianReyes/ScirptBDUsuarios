-- Crear la base de datos
CREATE DATABASE MiBaseDeDatos;

-- Usar la base de datos recién creada
USE MiBaseDeDatos;

-- Crear la tabla Personas
CREATE TABLE Personas (
    Identificador INT PRIMARY KEY IDENTITY(1,1),
    Nombres NVARCHAR(50),
    Apellidos NVARCHAR(50),
    NumeroIdentificacion NVARCHAR(20),
    Email NVARCHAR(100),
    TipoIdentificacion NVARCHAR(20),
    FechaCreacion DATETIME,
    IdentificacionConcatenada AS TipoIdentificacion + NumeroIdentificacion,
    NombresApellidosConcatenados AS Nombres + ' ' + Apellidos
);

-- Crear la tabla Usuario
CREATE TABLE Usuario (
    Identificador INT PRIMARY KEY,
    Usuario VARCHAR(50),
    Pass VARCHAR(255),
    FechaCreacion DATETIME
);

-- Agregamos una columna para el identificador de persona en la tabla Usuarios
ALTER TABLE Usuarios
ADD PersonaId INT;

-- Agregamos una restricción de clave foránea que hace referencia al Identificador en la tabla Personas
ALTER TABLE Usuarios
ADD CONSTRAINT FK_Usuarios_Personas
FOREIGN KEY (PersonaId) REFERENCES Personas(Identificador);


-- Crear el procedimiento almacenado para consultar personas
CREATE PROCEDURE ConsultarPersonas
AS
BEGIN
    SELECT * FROM Personas;
END;
