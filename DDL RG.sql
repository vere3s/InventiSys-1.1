INSERT INTO RG_Cargo (cargo) VALUES ('Gerente');
INSERT INTO RG_Cargo (cargo) VALUES ('Cocinero');
INSERT INTO RG_Cargo (cargo) VALUES ('Mesero');

-- Insert en empleados
INSERT INTO RG_Empleado (nombreEmpleado, apellidoEmpleado, telefonoEmpleado, direccionEmpleado, emailEmpleado, fechaNacimientoEmpleado, idCargo)
VALUES ('Linda', 'Contreras', '78241072', 'Calle Ote', 'marcela@gmail.com', '2000-04-12', 1);

INSERT INTO RG_Empleado (nombreEmpleado, apellidoEmpleado, telefonoEmpleado, direccionEmpleado, emailEmpleado, fechaNacimientoEmpleado, idCargo)
VALUES ('Ana', 'Martínez', '77777777', 'Avenida Morazan', 'ana@gmail.com', '1990-03-25', 2);

INSERT INTO RG_Empleado (nombreEmpleado, apellidoEmpleado, telefonoEmpleado, direccionEmpleado, emailEmpleado, fechaNacimientoEmpleado, idCargo)
VALUES ('Luis', 'González', '78564543', 'Calle Real pasaje 3', 'luis@gmail.com', '1992-06-30', 3);

-- Insert en roles
INSERT INTO RG_Rol (rol) VALUES ('Administrador');
INSERT INTO RG_Rol (rol) VALUES ('Mesero');
INSERT INTO RG_Rol (rol) VALUES ('Invitado');

-- Insert en usuarios
INSERT INTO RG_Usuario (usuario, contraseniaUsuario, idRol, idEmpleado)
VALUES ('admin', 'password123', 1, 1);

INSERT INTO RG_Usuario (usuario, contraseniaUsuario, idRol, idEmpleado)
VALUES ('mesero1', 'password456', 2, 3);

INSERT INTO RG_Usuario (usuario, contraseniaUsuario, idRol, idEmpleado)
VALUES ('cocinero1', 'password789', 2, 2);

 -- Insert en opciones
INSERT INTO RG_Opcion (opcion) VALUES ('Ver Gestion Productos');
INSERT INTO RG_Opcion (opcion) VALUES ('Ver Gestion Personal');
INSERT INTO RG_Opcion (opcion) VALUES ('Ver Gestion Ventas');
INSERT INTO RG_Opcion (opcion) VALUES ('Ver Gestion Compras');
INSERT INTO RG_Opcion (opcion) VALUES ('Ver Gestion Inventario');
INSERT INTO RG_Opcion (opcion) VALUES ('Ver Reportes');
INSERT INTO RG_Opcion (opcion) VALUES ('Ver Gestion Ingredientes');
INSERT INTO RG_Opcion (opcion) VALUES ('Modificar Gestion Compras');

-- Insert en  permisos
INSERT INTO RG_Permiso (idRol, idOpcion, accesoPermiso) 
VALUES (1, 1, 'lectura');
INSERT INTO RG_Permiso (idRol, idOpcion, accesoPermiso) 
VALUES (1, 2, 'lectura');
INSERT INTO RG_Permiso (idRol, idOpcion, accesoPermiso) 
VALUES (1, 3, 'lectura');
INSERT INTO RG_Permiso (idRol, idOpcion, accesoPermiso) 
VALUES (1, 4, 'lectura');
INSERT INTO RG_Permiso (idRol, idOpcion, accesoPermiso) 
VALUES (1, 5, 'lectura');
INSERT INTO RG_Permiso (idRol, idOpcion, accesoPermiso) 
VALUES (1, 6, 'lectura');
INSERT INTO RG_Permiso (idRol, idOpcion, accesoPermiso) 
VALUES (1, 7, 'lectura');
INSERT INTO RG_Permiso (idRol, idOpcion, accesoPermiso) 
VALUES (1, 8, 'eliminacion');

INSERT INTO RG_Permiso (idRol, idOpcion, accesoPermiso) 
VALUES (2, 3, 'lectura');
INSERT INTO RG_Permiso (idRol, idOpcion, accesoPermiso) 
VALUES (2, 4, 'lectura');
INSERT INTO RG_Permiso (idRol, idOpcion, accesoPermiso) 
VALUES (2, 5, 'lectura');

-- Insert en proveedores
INSERT INTO RG_Proveedor (nombreProveedor, telefonoProveedor, direccionProveedor, emailProveedor)
VALUES ('Gabriela', '24107825', 'san salvador', 'proveedorA@gmail.com');

INSERT INTO RG_Proveedor (nombreProveedor, telefonoProveedor, direccionProveedor, emailProveedor)
VALUES ('Constancia', '264875120', 'Sonsonate', 'const@gmail.com');

INSERT INTO RG_Proveedor (nombreProveedor, telefonoProveedor, direccionProveedor, emailProveedor)
VALUES ('Lacteos', '12345678', 'Avenida uno', 'lacteosC@gmaill.com');

-- Insertar tres categorías de productos
INSERT INTO RG_Categoria (categoria) VALUES ('Bebidas');
INSERT INTO RG_Categoria (categoria) VALUES ('Harinas');
INSERT INTO RG_Categoria (categoria) VALUES ('Verdura');
INSERT INTO RG_Categoria (categoria) VALUES ('Lacteos');

-- Lo de insertar imagenes se las debo quería probar la base primero 
-- Insertar tres productos
INSERT INTO RG_Producto (nombreProducto, costoUnitarioProducto, precioProducto, idCategoria)
VALUES ('Coca-Cola', 10.00, 15.00, 1);

INSERT INTO RG_Producto (nombreProducto, costoUnitarioProducto, precioProducto, idCategoria)
VALUES ('Pepsi', 20.00, 30.00, 1);

INSERT INTO RG_Producto (nombreProducto, costoUnitarioProducto, precioProducto, idCategoria)
VALUES ('Fanta', 8.00, 12.00, 1);


-- Insertar tres ingredientes
INSERT INTO RG_Ingrediente (nombreIngrediente, idCategoria, precioIngrediente)
VALUES ('Tomate', 2, 0.50);

INSERT INTO RG_Ingrediente (nombreIngrediente, idCategoria, precioIngrediente)
VALUES ('Harina', 3, 1.20);

INSERT INTO RG_Ingrediente (nombreIngrediente, idCategoria, precioIngrediente)
VALUES ('Queso', 4, 3.45);

-- Insertar tres mesas
INSERT INTO RG_Mesa (numeroMesa) VALUES (1);
INSERT INTO RG_Mesa (numeroMesa) VALUES (2);
INSERT INTO RG_Mesa (numeroMesa) VALUES (3);

-- ----------------------------------------------- HASTA AQUI --------------------------------------------------------------------------------------

-- Insertar órdenes con los nuevos campos
INSERT INTO RG_Orden (idMesa, clienteOrden, fechaOrden, tipoOrden, estadoOrden, comentarioOrden)
VALUES (1, 'Juan Pérez', '2024-11-01', 'Llevar', 'Pendiente', 'Sin comentario');

INSERT INTO RG_Orden (idMesa, clienteOrden, fechaOrden, tipoOrden, estadoOrden, comentarioOrden)
VALUES (2, 'Ana Gómez', '2024-11-02', 'Comer en restaurante', 'Pagada', 'Cliente satisfecho');

INSERT INTO RG_Orden (idMesa, clienteOrden, fechaOrden, tipoOrden, estadoOrden, comentarioOrden)
VALUES (3, 'Luis Martínez', '2024-11-03', 'Llevar', 'Cancelada', 'Canceló la orden');

-- Insertar tres detalles de venta
INSERT INTO RG_DetalleVenta (idOrden, idProducto, cantidadDetalleVenta, precioDetalleVenta)
VALUES (1, 1, 2, 15.00);

INSERT INTO RG_DetalleVenta (idOrden, idProducto, cantidadDetalleVenta, precioDetalleVenta)
VALUES (2, 2, 1, 30.00);

INSERT INTO RG_DetalleVenta (idOrden, idProducto, cantidadDetalleVenta, precioDetalleVenta)
VALUES (3, 3, 3, 12.00);

-- Insertar tres ventas
INSERT INTO RG_Venta (idEmpleado, idDetalleVenta, totalVenta)
VALUES (1, 1, 30.00);

INSERT INTO RG_Venta (idEmpleado, idDetalleVenta, totalVenta)
VALUES (2, 2, 30.00);

INSERT INTO RG_Venta (idEmpleado, idDetalleVenta, totalVenta)
VALUES (3, 3, 36.00);

-- insert en pedido compra
INSERT INTO RG_PedidoCompra (idProveedor, fechaPedidoCompra, estadoPedidoCompra)
VALUES (1, '2024-11-04', 'Pendiente');

INSERT INTO RG_PedidoCompra (idProveedor, fechaPedidoCompra, estadoPedidoCompra)
VALUES (2, '2024-11-05', 'Completado');

INSERT INTO RG_PedidoCompra (idProveedor, fechaPedidoCompra, estadoPedidoCompra)
VALUES (3, '2024-11-06', 'En proceso');

-- Insert den detalles pedido de productos
INSERT INTO RG_DetallePedidoProducto (idPedidoCompra, idProducto, cantidadDetallePedidoProducto, precioDetallePedidoProducto)
VALUES (1, 1, 50, 10.00);  -- 50 Coca-Cola

INSERT INTO RG_DetallePedidoProducto (idPedidoCompra, idProducto, cantidadDetallePedidoProducto, precioDetallePedidoProducto)
VALUES (2, 2, 30, 20.00);  -- 30 Pepsi

INSERT INTO RG_DetallePedidoProducto (idPedidoCompra, idProducto, cantidadDetallePedidoProducto, precioDetallePedidoProducto)
VALUES (3, 3, 40, 8.00);   -- 40 Fanta

-- insert en detalle pedido ingrediente 
INSERT INTO RG_DetallePedidoIngrediente (idPedidoCompra, idIngrediente, cantidadDetallePedidoIngrediente, precioDetallePedidoIngrediente)
VALUES (1, 1, 10, 3.00);  -- 10 Tomates

INSERT INTO RG_DetallePedidoIngrediente (idPedidoCompra, idIngrediente, cantidadDetallePedidoIngrediente, precioDetallePedidoIngrediente)
VALUES (2, 2, 15, 1.50);  -- 15 Harina

INSERT INTO RG_DetallePedidoIngrediente (idPedidoCompra, idIngrediente, cantidadDetallePedidoIngrediente, precioDetallePedidoIngrediente)
VALUES (3, 3, 20, 4.00);  -- 20 Queso

-- Insertar en la tabla RG_Compra para conectar con productos e ingredientes específicos
INSERT INTO RG_Compra (idEmpleado, idDetallePedidoProducto, idDetallePedidoIngrediente, comentarioCompra, totalCompra, fechaCompra)
VALUES (1, 1, NULL, 'Compra de Coca-Cola', 500.00, '2024-11-05');

INSERT INTO RG_Compra (idEmpleado, idDetallePedidoProducto, idDetallePedidoIngrediente, comentarioCompra, totalCompra, fechaCompra)
VALUES (2, NULL, 1, 'Compra de Tomate', 300.00, '2024-11-06');

INSERT INTO RG_Compra (idEmpleado, idDetallePedidoProducto, idDetallePedidoIngrediente, comentarioCompra, totalCompra, fechaCompra)
VALUES (3, 2, NULL, 'Compra de Pepsi', 450.00, '2024-11-07');

-- insert en tabla entrada
INSERT INTO RG_Entrada (idProducto, idIngrediente, idCompra, fechaEntrada, cantidadEntrada, costoUnitarioEntrada)
VALUES (1, NULL, 1, '2024-11-05', 50, 10.00);  -- 50 Coca-Cola


INSERT INTO RG_Entrada (idProducto, idCompra, fechaEntrada, cantidadEntrada, costoUnitarioEntrada)
VALUES (3, 3, '2024-11-07', 40, 8.00);

-- insert en salida 
INSERT INTO RG_Salida (idProducto, idIngrediente, fechaSalida, cantidadSalida, costoUnitarioSalida)
VALUES (1, NULL, '2024-11-07', 10, 10.00);  -- 10 Coca-Cola

-- Si estás registrando una salida de un producto
INSERT INTO RG_Salida (idProducto, fechaSalida, cantidadSalida, costoUnitarioSalida)
VALUES (2, '2024-11-08', 3, 15.00);

-- Si estás registrando una salida de un ingrediente
INSERT INTO RG_Salida (idIngrediente, fechaSalida, cantidadSalida, costoUnitarioSalida)
VALUES (2, '2024-11-08', 3, 15.00);

