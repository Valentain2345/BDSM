CREATE DATABASE banco;

USE banco;

CREATE TABLE clientes(
    cod_postal VARCHAR(4) NOT NULL,
    nombre VARCHAR NOT NULL

    PRIMARY KEY (cod_postal)
)

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON banco.* TO 'admin'@'localhost' WITH GRANT OPTIONS;

CREATE USER 'empleado'@'%' IDENTIFIED BY 'empleado';
GRANT SELECT ON banco.empleado TO 'empleado'@'%';
GRANT SELECT ON banco.sucursal TO 'empleado'@'%';
GRANT SELECT ON banco.tasa_plazo_fijo TO 'empleado'@'%';
GRANT SELECT ON banco.tasa_prestamo TO 'empleado'@'%';
GRANT SELECT, INSERT ON banco.prestamo TO 'empleado'@'%';
GRANT SELECT, INSERT ON banco.plazo_fijo TO 'empleado'@'%';
GRANT SELECT, INSERT ON banco.plazo_cliente TO 'empleado'@'%';
GRANT SELECT, INSERT ON banco.caja_ahorro TO 'empleado'@'%';
GRANT SELECT, INSERT ON banco.tarjeta TO 'empleado'@'%';
GRANT SELECT, INSERT, UPDATE ON banco.cliente_CA TO 'empleado'@'%';
GRANT SELECT, INSERT, UPDATE ON banco.cliente TO 'empleado'@'%';
GRANT SELECT, INSERT, UPDATE ON banco.pago TO 'empleado'@'%';

CREATE VIEW trans_cajas_ahorro AS
SELECT nro_ca, saldo, nro_trans, fecha, hora, tipo, monto, cod_caja,
 nro_cliente, tipo_doc, nro_doc, nombre, apellido, destino
FROM caja_ahorro JOIN cliente, cliente_CA, transaccion, depos_CA, extrac_CI,
transf_CI, debit_CI
WHERE

CREATE USER 'atm'@'%' IDENTIFIED BY 'atm'
GRANT SELECT ON trans_cajas_ahorro TO 'atm'@'%';
GRANT SELECT, UPDATE (pin) ON banco.tarjeta TO 'atm'@'%'; 
GRANT SELECT (nro_tarjeta) ON banco.tarjeta TO 'atm'@'%';

drop user ''@'localhost';

