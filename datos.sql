
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

INSERT INTO  empleado(legajo, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, cargo, password,
nro_suc)
VALUES
(4200, 'Kent', 'Clark', 'DNI',22222222, 'Metropolis', '201 001783', 'Guardia Seguridad', md5('password123'), 100)
;

INSERT INTO cliente (nombre, apellido, tipo_doc, nro_cliente, direccion, telefono, nro_doc, fecha_nac)
VALUES
('Arthur', 'Morgan', 'DNI', 1001, 'Calle del Oeste, 123', '555-123-4567', 12345678, '1980-03-29'),
('Trevor', 'Phillips', 'DNI', 1002, 'Sandy Shores, 456', '555-987-6543', 87654321, '1970-11-18'),
('Solid', 'Snake', 'DNI', 1003, 'Shadow Moses Island, 789', '555-555-5555', 13579246, '1974-07-07'),
('John', 'Marston', 'DNI', 1004, 'Rancho Beecher, 789', '555-111-2222', 98765432, '1873-09-05'),
('Michael', 'De Santa', 'DNI', 1005, 'Rockford Hills, 456', '555-333-4444', 65432109, '1965-02-17'),
('Revolver', 'Ocelot', 'DNI', 1006, 'Целиноярск, 123', '555-777-8888', 24681357, '1971-06-06'),
('Dutch', 'van der Linde', 'DNI', 1007, 'Horseshoe Overlook, 789', '555-999-0000', 31415926, '1858-11-15'),
('Franklin', 'Clinton', 'DNI', 1008, 'Strawberry, 456', '555-222-3333', 27182818, '1988-04-23'),
('Sniper', 'Wolf', 'DNI', 1009, 'Shadow Moses Island, 789', '555-444-5555', 88888888, '1970-12-24'),
('William Joseph', 'Blazkowicz', 'DNI', 1010, 'Mesquite, 255', '555-555-6666', 77777777, '1885-03-12'),
('Lester','Crest','DNI',1011,'Murrieta Heights, 2167','324-789-2266',23412909,'1960-02-12'),
('Cloude','Strife','DNI',1012,'Nibelheim village, 147','345-999-2218',34829219,'1986-08-11'),
('Leon','Kennedy','DNI',2101,'Raccoon City, 1998','4-960-000',21011998,'1977-09-09')
;

INSERT INTO  plazo_fijo(nro_plazo, capital, fecha_inicio, fecha_fin, tasa_interes, interes, nro_suc)
VALUES
(01293843,32000.23,'2000-01-01','2001-07-12',1.53,1200.78,100)

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
(12032769, '2020-03-09', 36, 100000.3,4.05,400001.2,20000.23, 4200,1005 )

;
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago)
VALUES
(12032769, 5, '2021-02-03','2021-01-29')

;
INSERT INTO tasa_prestamo(periodo, monto_inf, monto_sup, tasa)
VALUES
(105,15000, 85000, 0.74)
;
INSERT INTO caja_ahorro(nro_ca, CBU, saldo)
VALUES
(19873344, 843923098452304583, 20),
(13462985, 843923098452304545, 30),
(40445062, 843923098452304544, 6900),
(58561924, 733440471188263234, 2000)
;
INSERT INTO cliente_ca(nro_cliente, nro_ca)
VALUES
(1001,19873344),
(1001,58561924),
(1002,13462985),
(1008,40445062)

;
INSERT INTO tarjeta(nro_tarjeta, PIN, CVT, fecha_venc, nro_cliente, nro_ca)
VALUES
(4536423649388734,md5('2345'), md5('AZUFRE'), '2000-12-29',1001, 19873344 ),
(4536423649388735,md5('2345'), md5('NIQUEL'), '2001-11-29',1001, 58561924 ),
(4536423649388736,md5('2345'), md5('HIERRO'), '2002-10-29',1002, 13462985 ),
(4536423649388737,md5('2345'), md5('CADMIO'), '2002-09-29',1008, 40445062 )

;
INSERT INTO caja(cod_caja)
VALUES
(53787),
(43289)

;
INSERT INTO ventanilla(cod_caja, nro_suc)
VALUES
(43289,100)

;
INSERT INTO atm(cod_caja, cod_postal, direccion)
VALUES
(53787, 1000, 'Maze Bank Tower,100')

;
INSERT INTO transaccion(fecha, hora, monto, nro_trans)
VALUES
( '2025-01-01' , '12:01:07', 100.23, 9438769386 ),
( '2025-02-01' , '12:01:07', 100.23, 9438769383 ),
( '2025-03-01' , '13:01:07', 90.23, 2655643905 ),
( '2025-01-11' , '11:01:07', 900.23, 1307279270 ),
( '2025-11-01' , '12:30:07', 120.23, 5085328189 )

;
INSERT INTO debito(descripcion, nro_trans, nro_cliente, nro_ca)
VALUES
('queso', 9438769386, 1008, 40445062)

;
INSERT INTO transaccion_por_caja(nro_trans, cod_caja)
VALUES
(9438769383,43289 ),
(1307279270,53787),
(5085328189,53787)

;
INSERT INTO deposito(nro_trans, nro_ca)
VALUES
(9438769383,19873344)

;
INSERT INTO extraccion(nro_trans, nro_cliente, nro_ca)
VALUES
(1307279270,1001,58561924)

;
INSERT INTO transferencia(nro_trans, nro_cliente, origen, destino)
VALUES
(5085328189,1002,13462985,58561924)

;




