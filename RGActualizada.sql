CREATE DATABASE RestauranteGestion;
-- CREATE DATABASE RestauranteGestion;
USE RestauranteGestion;
-- drop database restaurantegestion;

-- Tabla Cargo
CREATE TABLE RG_Cargo (
    idCargo INT PRIMARY KEY AUTO_INCREMENT,
    cargo VARCHAR(50) NOT NULL
);

-- Tabla Empleado
CREATE TABLE RG_Empleado (
    idEmpleado INT PRIMARY KEY AUTO_INCREMENT,
    nombreEmpleado VARCHAR(50) NOT NULL,
    apellidoEmpleado VARCHAR(50) NOT NULL,
    telefonoEmpleado VARCHAR(15),
    direccionEmpleado VARCHAR(100),
    emailEmpleado VARCHAR(50),
    fechaNacimientoEmpleado DATE,
    idCargo INT,
    FOREIGN KEY (idCargo) REFERENCES RG_Cargo(idCargo)
);

-- Tabla Rol
CREATE TABLE RG_Rol (
    idRol INT PRIMARY KEY AUTO_INCREMENT,
    rol VARCHAR(50) NOT NULL
);

-- Tabla Usuario
CREATE TABLE RG_Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(50) NOT NULL,
    contraseniaUsuario VARCHAR(255) NOT NULL,
    idRol INT,
    idEmpleado INT,
    FOREIGN KEY (idRol) REFERENCES RG_Rol(idRol),
    FOREIGN KEY (idEmpleado) REFERENCES RG_Empleado(idEmpleado)
);

-- Tabla Opcion
CREATE TABLE RG_Opcion (
    idOpcion INT PRIMARY KEY AUTO_INCREMENT,
    opcion VARCHAR(50) NOT NULL
);

-- Tabla Permiso
CREATE TABLE RG_Permiso (
    idPermiso INT PRIMARY KEY AUTO_INCREMENT,
    idRol INT,
    idOpcion INT,
    accesoPermiso ENUM  ('lectura', 'escritura', 'modificacion', 'eliminacion'),
    FOREIGN KEY (idRol) REFERENCES RG_Rol(idRol),
    FOREIGN KEY (idOpcion) REFERENCES RG_Opcion(idOpcion)
);

-- Tabla Proveedor
CREATE TABLE RG_Proveedor (
    idProveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombreProveedor VARCHAR(100) NOT NULL,
    telefonoProveedor VARCHAR(15) NOT NULL,
    direccionProveedor VARCHAR(100),
    emailProveedor VARCHAR(50)
);

-- Tabla Categoria
CREATE TABLE RG_Categoria (
    idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(50) NOT NULL
);

-- Tabla Categoria de imagnes para el proposito de encontrar las imagenes de ingredientes, productos y las pupusas 


-- Tabla Producto
CREATE TABLE RG_Producto (
    idProducto INT PRIMARY KEY AUTO_INCREMENT,
    nombreProducto VARCHAR(100) NOT NULL,
    costoUnitarioProducto DECIMAL(10, 2) NOT NULL,
    precioProducto DECIMAL(10, 2) NOT NULL,
    idCategoria INT,
    imagenProducto  varchar(550),
    FOREIGN KEY (idCategoria) REFERENCES RG_Categoria(idCategoria)
     
);

-- Tabla Ingrediente
CREATE TABLE RG_Ingrediente (
    idIngrediente INT PRIMARY KEY AUTO_INCREMENT,
    nombreIngrediente VARCHAR(100) NOT NULL, 
    idCategoria int, 
    precioIngrediente decimal(10,2),
    imagenIngrediente varchar(550),
    FOREIGN KEY (idCategoria) REFERENCES RG_Categoria(idCategoria)
);

-- Tabla Mesa
CREATE TABLE RG_Mesa (
    idMesa INT PRIMARY KEY AUTO_INCREMENT,
    numeroMesa INT NOT NULL
);

-- Tabla Orden
CREATE TABLE RG_Orden (
    idOrden INT PRIMARY KEY AUTO_INCREMENT,
    idMesa INT,
    clienteOrden VARCHAR(100),
    fechaOrden DATE,
    tipoOrden ENUM("Llevar", "Comer en restaurante"),
    estadoOrden ENUM ("Pendiente", "Cancelada", "Pagada"),
    comentarioOrden VARCHAR(200),
    FOREIGN KEY (idMesa) REFERENCES RG_Mesa(idMesa)
);

-- Tabla DetalleVenta
CREATE TABLE RG_DetalleVenta (
    idDetalleVenta INT PRIMARY KEY AUTO_INCREMENT,
    idOrden INT,
    idProducto INT,
    cantidadDetalleVenta  int,
    subTotalDetalleVenta DECIMAL(10, 2),
    FOREIGN KEY (idOrden) REFERENCES RG_Orden(idOrden),
    FOREIGN KEY (idProducto) REFERENCES RG_Producto(idProducto)
);

-- Tabla Venta
CREATE TABLE RG_Venta (
    idVenta INT PRIMARY KEY AUTO_INCREMENT,
    idEmpleado INT,
    idDetalleVenta INT,
    totalVenta DECIMAL(10, 2),
    FOREIGN KEY (idEmpleado) REFERENCES RG_Empleado(idEmpleado),
    FOREIGN KEY (idDetalleVenta) REFERENCES RG_DetalleVenta(idDetalleVenta)
);

-- Tabla PedidoCompra
CREATE TABLE RG_PedidoCompra (
    idPedidoCompra INT PRIMARY KEY AUTO_INCREMENT,
    idProveedor INT,
    fechaPedidoCompra DATE,
    estadoPedidoCompra VARCHAR(50),
    FOREIGN KEY (idProveedor) REFERENCES RG_Proveedor(idProveedor)
);

-- Tabla DetallePedidoCompra
CREATE TABLE RG_DetallePedidoProducto (
    idDetallePedidoProducto INT PRIMARY KEY AUTO_INCREMENT,
    idPedidoCompra INT,
    idProducto INT,
    cantidadDetallePedidoProducto INT NOT NULL,
    precioDetallePedidoProducto DECIMAL(10, 2),
    subtotalDetallePedidoProducto DECIMAL(10, 2) GENERATED ALWAYS AS(cantidadDetallePedidoProducto * precioDetallePedidoProducto),
    FOREIGN KEY (idPedidoCompra) REFERENCES RG_PedidoCompra(idPedidoCompra),
    FOREIGN KEY (idProducto) REFERENCES RG_Producto(idProducto)
);

CREATE TABLE RG_DetallePedidoIngrediente (
    idDetallePedidoIngrediente INT PRIMARY KEY AUTO_INCREMENT,
    idPedidoCompra INT,
    idIngrediente INT,
    cantidadDetallePedidoIngrediente INT NOT NULL,
    precioDetallePedidoIngrediente DECIMAL(10, 2),
    subtotalDetallePedidoIngrediente DECIMAL(10, 2) GENERATED ALWAYS AS (cantidadDetallePedidoIngrediente * precioDetallePedidoIngrediente),
    FOREIGN KEY (idPedidoCompra) REFERENCES RG_PedidoCompra(idPedidoCompra),
    FOREIGN KEY (idIngrediente) REFERENCES RG_Ingrediente(idIngrediente)
);

-- Tabla Compra
CREATE TABLE RG_Compra (
    idCompra INT PRIMARY KEY AUTO_INCREMENT,
    idEmpleado INT,
    idDetallePedidoProducto INT,
    idDetallePedidoIngrediente INT,
    comentarioCompra VARCHAR(200),
    totalCompra DECIMAL(10, 2),
    fechaCompra DATE,
    FOREIGN KEY (idEmpleado) REFERENCES RG_Empleado(idEmpleado),
    FOREIGN KEY (idDetallePedidoProducto) REFERENCES RG_DetallePedidoProducto(idDetallePedidoProducto),
    FOREIGN KEY (idDetallePedidoIngrediente) REFERENCES RG_DetallePedidoIngrediente(idDetallePedidoIngrediente)
);

-- Tabla Entrada
CREATE TABLE RG_Entrada (
    idEntrada INT PRIMARY KEY AUTO_INCREMENT,
    idProducto INT,
    idIngrediente INT,
    idCompra INT,
    fechaEntrada DATE,
    cantidadEntrada INT,
    costoUnitarioEntrada DECIMAL(10, 2),
    costoTotalEntrada DECIMAL(10, 2) GENERATED ALWAYS AS (cantidadEntrada * costoUnitarioEntrada),
    FOREIGN KEY (idProducto) REFERENCES RG_Producto(idProducto),
    FOREIGN KEY (idIngrediente) REFERENCES RG_Ingrediente(idIngrediente),
    FOREIGN KEY (idCompra) REFERENCES RG_Compra(idCompra)
);

-- Tabla Salida
CREATE TABLE RG_Salida (
    idSalida INT PRIMARY KEY AUTO_INCREMENT,
    idProducto INT,
    idIngrediente INT,
    fechaSalida DATE,
    cantidadSalida INT,
    costoUnitarioSalida DECIMAL(10, 2),
    costoTotalSalida DECIMAL(10, 2) GENERATED ALWAYS AS (cantidadSalida * costoUnitarioSalida),
    FOREIGN KEY (idProducto) REFERENCES RG_Producto(idProducto),
    FOREIGN KEY (idIngrediente) REFERENCES RG_Ingrediente(idIngrediente)
);

-- Tabla Kardex 
CREATE TABLE RG_Kardex (
    idKardex INT PRIMARY KEY AUTO_INCREMENT,
    idProducto INT,
    idIngrediente INT,
    fechaMovimientoKardex DATE,
	idSalida int, 
    idEntrada int,
    cantidadKardex INT,
    costoUnitarioKardex DECIMAL(10, 2),
    saldoCantidadKardex INT,
    saldoValorKardex DECIMAL(10, 2),
     FOREIGN KEY (idSalida) REFERENCES RG_Salida(idSalida),
      FOREIGN KEY (idEntrada) REFERENCES RG_Entrada(idEntrada),
    FOREIGN KEY (idProducto) REFERENCES RG_Producto(idProducto),
    FOREIGN KEY (idIngrediente) REFERENCES RG_Ingrediente(idIngrediente)
);
