CREATE DATABASE banco;

USE banco;

CREATE TABLE ciudad(
    cod_postal SMALLINT(4) NOT NULL,
    nombre VARCHAR NOT NULL

    PRIMARY KEY (cod_postal)
)

CREATE TABLE sucursal(
    nro_suc SMALLINT(3) NOT NULL,
    nombre VARCHAR NOT NULL,
    direccion VARCHAR NOT NULL,
    telefono VARCHAR NOT NULL,
    horario VARCHAR NOT NULL,
    cod_postal SMALLINT(4) NOT NULL

    PRIMARY KEY (nro_suc)
)

CREATE TABLE empleado(
    legajo SMALLINT(4) NOT NULL,
    apellido VARCHAR NOT NULL,
    nombre VARCHAR NOT NULL,
    tipo_doc VARCHAR NOT NULL,
    direccion VARCHAR NOT NULL,
    telefono VARCHAR NOT NULL,
    cargo VARCHAR NOT NULL,
    password (32) NOT NULL,
    nro_doc SMALLINT(8) NOT NULL,
    nro_suc SMALLINT(3) NOT NULL

    PRIMARY KEY (legajo)
)

CREATE TABLE cliente(
    nro_cliente SMALLINT(5) NOT NULL,
    nro_doc SMALLINT(8) NOT NULL,
    apellido VARCHAR NOT NULL,
    nombre VARCHAR NOT NULL,
    tipo_doc VARCHAR NOT NULL,
    direccion VARCHAR NOT NULL,
    telefono VARCHAR NOT NULL,


    PRIMARY KEY (nro_cliente)
)

CREATE TABLE plazo_fijo(
    nro_plazo SMALLINT(8) NOT NULL,
    nro_suc SMALLINT(3) NOT NULL,
    capital DECIMAL(12,2) NOT NULL,
    tasa_interes DECIMAL(12,2) NOT NULL,
    interes DECIMAL(12,2) NOT NULL,

    PRIMARY KEY (nro_plazo)
)

CREATE TABLE tasa_plazo_fijo(
    periodo SMALLINT(3) NOT NULL,
    monto_inf DECIMAL(12,2) NOT NULL,
    monto_sup DECIMAL(12,2) NOT NULL,
    tasa DECIMAL(12,2) NOT NULL,

    PRIMARY KEY (periodo, monto_inf, monto_sup)
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

CREATE VIEW Trans_cajas_ahorro AS
SELECT  Caja_ahorro.nro_ca,saldo,
        COALESCE(Dep.nro_trans, E.nro_trans, Transf.nro_trans, D.nro_trans) AS "nro_trans",
        fecha,hora,
        CASE
            WHEN (T.nro_trans IN (SELECT D1.nro_trans FROM Deposito D1))      THEN "Deposito"
            WHEN (T.nro_trans IN (SELECT E1.nro_trans FROM Extraccion E1))    THEN "Extraccion"
            WHEN (T.nro_trans IN (SELECT T1.nro_trans FROM Transferencia T1)) THEN "Transferencia"
            WHEN (T.nro_trans IN (SELECT F1.nro_trans FROM Debito F1))        THEN "Debito"
            ELSE NULL
        END as "tipo",
        monto,cod_caja,
        CCA.nro_cliente,tipo_doc,nro_doc,nombre,apellido,destino
FROM Cliente_CA CCA NATURAL JOIN Caja_ahorro
    LEFT OUTER JOIN Deposito Dep            ON CCA.nro_ca = Dep.nro_ca
    LEFT OUTER JOIN Extraccion E            ON CCA.nro_ca = E.nro_ca
    LEFT OUTER JOIN Transferencia Transf    ON ( (CCA.nro_ca = Transf.origen) OR (CCA.nro_ca = Transf.destino) )
    LEFT OUTER JOIN Transaccion_por_caja TT ON (
        (TT.nro_trans=Dep.nro_trans) OR (TT.nro_trans=E.nro_trans) OR (TT.nro_trans=Transf.nro_trans))
    LEFT OUTER JOIN Debito D                ON CCA.nro_ca = D.nro_ca
    LEFT OUTER JOIN Transaccion T           ON ((T.nro_trans=Dep.nro_trans) OR (T.nro_trans=TT.nro_trans))
    LEFT OUTER JOIN Cliente C            ON CCA.nro_cliente = C.nro_cliente;

CREATE USER 'atm'@'%' IDENTIFIED BY 'atm'
GRANT SELECT ON trans_cajas_ahorro TO 'atm'@'%';
GRANT SELECT, UPDATE (pin) ON banco.tarjeta TO 'atm'@'%'; 
GRANT SELECT (nro_tarjeta) ON banco.tarjeta TO 'atm'@'%';

drop user @localhost;

