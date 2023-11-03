-- Tabla cliente
-- Aqui se almacena el nombre, el apellido 
-- y algunas observaciones de los clientes
CREATE TABLE cliente(
  idCliente INT PRIMARY KEY,
  identificacion VARCHAR(100),
  nombre VARCHAR(100),
  apellidos VARCHAR(100),
  observaciones VARCHAR(300)
);

-- Tabla mesero
-- De los meseros se alamacena su nombre y sus dos apellidos
CREATE TABLE mesero(
  idMesero SERIAL PRIMARY KEY,
  nombre VARCHAR(100),
  apellido1 VARCHAR(100),
  apellido2 VARCHAR(100)
);

-- Tabla platillo
CREATE TABLE platillo(
  idPlatillo SERIAL,
  nombre VARCHAR(100),
  costo INT,
  PRIMARY KEY(idPlatillo)
);

-- Tabla bebida
-- De las bebidas se almacena su nombre y el costo que esta tiene
CREATE TABLE bebida(
    idBebida SERIAL,
    nombre VARCHAR(100),
    costo INT,
    PRIMARY KEY(idBebida)
);

-- Tabla mesa
-- De las mesas se almacena la ubicación, su numero y el numero de comensales que permite
CREATE TABLE mesa(
  idMesa SERIAL PRIMARY KEY,
  ubicacion VARCHAR(100),
  numero VARCHAR(10),
  comensales INT
);

-- Tabla factura
-- De la factura se almacena la fecha, el cliente, el mesero, el platillo y la bebida
CREATE TABLE factura(
  idFactura SERIAL PRIMARY KEY,
  fechaFactura DATE,
  numCliente INT,
  idMesero INT,
  idMesa INT,
  idPlatillo INT,
  idBebida INT,
  CONSTRAINT fk_fact_cli 
    FOREIGN KEY(numCliente) 
    REFERENCES cliente(idCliente) ON UPDATE NO ACTION ON DELETE RESTRICT,
  FOREIGN KEY(idMesero) REFERENCES mesero(idMesero) ON UPDATE RESTRICT ON DELETE RESTRICT,
  FOREIGN KEY(idMesa) REFERENCES mesa(idMesa) ON UPDATE NO ACTION ON DELETE CASCADE,
  FOREIGN KEY(idPlatillo) REFERENCES platillo(idPlatillo),
  FOREIGN KEY(idBebida) REFERENCES bebida(idBebida)
);


-- Inserta 6 bebidas
INSERT INTO bebida(nombre,costo) VALUES
('Coca cola', 3200),
('Pepsy', 3100),
('Sprite', 3000),
('Uva', 3000),
('Manzana', 3000);

-- algunos platillos
INSERT INTO platillo(nombre, costo) VALUES
('Arroz con coco', 18000),
('Arroz mixto', 30000),
('Arroz arriero', 25000),
('Arroz con pollo', 25000),
('Arroz atollado', 28000),
('Arroz valluno', 48000),
('Arroz basmatí', 98000);

-- Inserta 8 mesas
INSERT INTO mesa (ubicacion, numero, comensales)
VALUES
  ('Terraza', 'Mesa 1', 4),
  ('Salón Principal', 'Mesa 2', 6);

INSERT INTO mesa (ubicacion, numero, comensales)
VALUES
  ('Salón Principal', 'Mesa 3', 4),
  ('Terraza', 'Mesa 4', 2),
  ('Salón VIP', 'Mesa 5', 8),
  ('Salón Principal', 'Mesa 6', 6),
  ('Terraza', 'Mesa 7', 4),
  ('Salón VIP', 'Mesa 8', 10);

INSERT INTO mesero(nombre, apellido1, apellido2) VALUES ('Carlos', 'Carmona', 'Cardona');
INSERT INTO mesero(nombre, apellido1, apellido2) VALUES ('Daniel', 'Uribe', 'Upegui');

-- Inserta 3 registros
INSERT INTO cliente(idCliente, identificacion, nombre, apellidos, observaciones)
VALUES 
  (1, 'CC114377276','Messi Andres', 'Castro Garcia', 'ninguna'),
  (2, 'CC114326269','Dugleydis Daniela', 'Perez Sosa', 'ninguna'),
  (3, 'TI894326269','Antonio', 'Grueso Delgado', 'ninguna');

-- Inserta 1 registros más
INSERT INTO cliente(idCliente, identificacion, nombre, apellidos, observaciones)
VALUES (4, 'PS89-XX34-269','Marcela', 'Rodriguez Rodriguez', 'Problematica');

-- inserte 2 facturas
INSERT INTO factura (fechaFactura, numCliente, idMesero, idMesa, idPlatillo, idBebida)
VALUES
  ('2023-11-03', 1, 2, 3, 2, 3),
  ('2023-11-04', 6, 3, 8, 2, 1);
