
INSERT INTO ciudad(cod_postal,nombre)
VALUES
(1000,'Los Santos'),
(1002,'Racoon City'),
(1003,'Midgar'),
(1004,'Sandy Shores'),
(1005,'Hyrule'),
(1006,'Gotham')

;
INSERT INTO sucursal(nro_suc, nombre, direccion, telefono, horario, cod_postal)
VALUES
(100,'Sucursal Generica 1', 'Wind Temple,10', '12300000','8:00 - 22:00', 1005)
;

INSERT INTO  empleado(legajo, apellido, nombre, tipo doc, nro_doc, direccion, telefono, cargo, password,
nro_suc)
VALUES
(4200, 'Kent', 'Clark', 'DNI',22222222, 'Metropolis', '201 001783', 'Guardia Seguridad', md5('password123'), 100)
;

INSERT INTO cliente (nombre, apellido, tipo_doc, nro_cliente, direccion, telefono, nro_doc, fecha_nac)
VALUES
('Arthur', 'Morgan', 'DNI', 1001, 'Calle del Oeste, 123', '555-123-4567', 12345678, '1980-29-03'),
('Trevor', 'Phillips', 'DNI', 1002, 'Sandy Shores, 456', '555-987-6543', 87654321, '1970-18-11'),
('Solid', 'Snake', 'DNI', 1003, 'Shadow Moses Island, 789', '555-555-5555', 13579246, '1974-07-07'),
('John', 'Marston', 'DNI', 1004, 'Rancho Beecher, 789', '555-111-2222', 98765432, '1873-05-09'),
('Michael', 'De Santa', 'DNI', 1005, 'Rockford Hills, 456', '555-333-4444', 65432109, '1965-17-02'),
('Revolver', 'Ocelot', 'DNI', 1006, 'Целиноярск, 123', '555-777-8888', 24681357, '1971-06-06'),
('Dutch', 'van der Linde', 'DNI', 1007, 'Horseshoe Overlook, 789', '555-999-0000', 31415926, '1858-15-11'),
('Franklin', 'Clinton', 'DNI', 1008, 'Strawberry, 456', '555-222-3333', 27182818, '1988-23-04'),
('Sniper', 'Wolf', 'DNI', 1009, 'Shadow Moses Island, 789', '555-444-5555', 88888888, '1970-24-12'),
('William Joseph', 'Blazkowicz', 'DNI', 1010, 'Mesquite, 255', '555-555-6666', 77777777, '1885-12-03'),
('Lester','Crest','DNI',1011,'Murrieta Heights, 2167','324-789-2266',23412909,'1960-12-02'),
('Cloude','Strife','DNI',1012,'Nibelheim village, 147','345-999-2218',34829219,'1986-11-08'),
('Leon','Kennedy','DNI',2101,'Raccoon City, 1998','4-960-000',21011998,'1977-09-9')
;

INSERT INTO  plazo_fijo(nro_plazo, capital, fecha_inicio, fecha_fin, tasa_interes, interes, nro_suc)
VALUES
(01293843,32000.23,'2000-01-01','2001-12-07',1.53,1200.78,100)

;
INSERT INTO  tasa_plazo_fijo(periodo, monto_inf, monto_sup, tasa)
VALUES
(128,10000.20,15000.55,2.5)

;
INSERT INTO  plazo_cliente(nro_plazo, nro_cliente)
VALUES
 (01293843,1001)
;
INSERT INTO prestamo(nro_prestamo, fecha, cant_meses, monto, tasa_interes, interes, valor_cuota, legajo,
nro_cliente)
VALUES
(12032769, '2020-09-03', 36, 100000.3,4.05,400001.2,20000.23, 4200,1005 )

;
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago)
VALUES
(12032769, 5, '2021-03-02','2021-29-01')

;
INSERT INTO tasa_prestamo(periodo, monto_inf, monto_sup, tasa)
VALUES
(105,15000, 85000, 0.74)
;
INSERT INTO caja_ahorro(nro_ca, CBU, saldo)
VALUES
(13462986, 843923098452304583, 20)
(58561924, 733440471188263234, 2000)
;
INSERT INTO cliente_ca(nro_cliente, nro_ca)
VALUES
(1012,13462986)

;
INSERT INTO tarjeta(nro_tarjeta, PIN, CVT, fecha_venc, nro_cliente, nro_ca)
VALUES
(4536423649388734,md5('2345'), md5('AZUFRE'), '20/29',1012, 13462986 )

;
INSERT INTO caja(cod_caja)
VALUES
(53787)

;
INSERT INTO ventanilla(cod_caja, nro_suc)
VALUES
(43289,100)

;
INSERT INTO atm(cod_caja, cod_postal, direccion)
VALUES
(12998, 1000, 'Maze Bank Tower,100')

;
INSERT INTO transaccion(nro_trans, fecha, hora, monto)
VALUES
(9438769384, '2025-01-01' , '12:01:07', 100.23 )

;
INSERT INTO debito(nro_trans, descripcion, nro_cliente, nro_ca)
VALUES
(3274632987, 'queso', 1012, 13462986)

;
INSERT INTO transaccion_por_caja(nro_trans, cod_caja)
VALUES
(737688163,43289 )

;
INSERT INTO deposito(nro_trans, nro_ca)
VALUES
(2655643905,12998 )

;
INSERT INTO extraccion(nro_trans, nro_cliente, nro_ca)
VALUES
(1307279270, 1012,13462986)

;
INSERT INTO transferencia(nro_trans, nro_cliente, origen, destino)
VALUES
(5085328189,1012,13462986,58561924)

;




