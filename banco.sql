CREATE DATABASE banco;

USE banco;


CREATE TABLE ciudad(
    cod_postal SMALLINT(4) UNSIGNED NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    CONSTRAINT pk_ciudad
    PRIMARY KEY (cod_postal)
)ENGINE=InnoDB;

CREATE TABLE sucursal(
    nro_suc SMALLINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(100) NOT NULL,
    horario VARCHAR(100) NOT NULL,
    cod_postal SMALLINT(4) UNSIGNED NOT NULL,

    CONSTRAINT pk_sucursal
    PRIMARY KEY (nro_suc),
    CONSTRAINT FK_ciudad_sucursal
    FOREIGN KEY (cod_postal) REFERENCES ciudad (cod_postal)

)ENGINE=InnoDB;

CREATE TABLE empleado(
    legajo SMALLINT(4) UNSIGNED NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    tipo_doc VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(100) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    password CHAR(32) NOT NULL,
    nro_doc INT(8) UNSIGNED NOT NULL,
    nro_suc SMALLINT(3) UNSIGNED NOT NULL ,

    CONSTRAINT pk_empleado
    PRIMARY KEY (legajo),
    CONSTRAINT FK_empleado_sucursal
    FOREIGN KEY (nro_suc) REFERENCES sucursal (nro_suc)


)ENGINE=InnoDB;

CREATE TABLE cliente(
    nro_cliente INT(5) UNSIGNED NOT NULL,
    nro_doc INT(8) NOT NULL, /*Puede ser negativo xd la consigna no especifica que sea positivo*/
    apellido VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    tipo_doc VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(14) NOT NULL,
    fecha_nac DATE ,

    CONSTRAINT pk_cliente
    PRIMARY KEY (nro_cliente)
)ENGINE=InnoDB;

CREATE TABLE plazo_fijo(
    nro_plazo INT(8) UNSIGNED NOT NULL,
    nro_suc SMALLINT(3) UNSIGNED NOT NULL,
    capital DECIMAL(12,2) NOT NULL,
    tasa_interes DECIMAL(12,2) NULL,
    interes DECIMAL(12,2) NOT NULL,

    CONSTRAINT pk_plazo_fijo
    PRIMARY KEY (nro_plazo),
    CONSTRAINT FK_plazo_fijo_sucursal
    FOREIGN KEY (nro_suc) REFERENCES sucursal (nro_suc)
)ENGINE=InnoDB;

CREATE TABLE tasa_plazo_fijo(
    periodo SMALLINT(3) NOT NULL,
    monto_inf DECIMAL(12,2) NOT NULL,
    monto_sup DECIMAL(12,2) NOT NULL,
    tasa DECIMAL(12,2) NOT NULL,

CONSTRAINT pk_tabla_plazo_fijo
PRIMARY KEY(periodo, monto_inf, monto_sup)
)ENGINE=InnoDB;

CREATE TABLE plazo_cliente(
    nro_plazo   INT(8) UNSIGNED,
    nro_cliente INT(5) UNSIGNED NOT NULL,

INDEX (nro_plazo),
CONSTRAINT FK_plazo_cliente_plazo_fijo
FOREIGN KEY (nro_plazo) REFERENCES plazo_fijo (nro_plazo),

INDEX (nro_cliente),
CONSTRAINT FK_plazo_cliente_cliente
FOREIGN KEY (nro_cliente) REFERENCES cliente (nro_cliente)


)ENGINE=InnoDB;

CREATE TABLE prestamo(
nro_prestamo INT(8),
fecha DATE,
cant_meses SMALLINT(2),
monto DECIMAL(12,2),
tasa_interes DECIMAL(12,2),
interes DECIMAL(12,2),
valor_cuota DECIMAL(12,2),
legajo SMALLINT(4) UNSIGNED NOT NULL,
nro_cliente INT(5) UNSIGNED NOT NULL,

CONSTRAINT pk_prestamo
PRIMARY KEY(nro_prestamo),
CONSTRAINT FK_prestamo_cliente
FOREIGN KEY (nro_cliente) REFERENCES cliente(nro_cliente),
CONSTRAINT FK_prestamo_empleado
FOREIGN KEY (legajo) REFERENCES empleado(legajo)
)ENGINE=InnoDB;

CREATE TABLE pago(
nro_prestamo INT(8),
nro_pago TINYINT(2) UNSIGNED,
fecha_venc DATE,
fecha_pago DATE,

/*
Deberia hacer del nro pago un index?
*/

INDEX (nro_prestamo),
CONSTRAINT FK_pago_prestamo
FOREIGN KEY (nro_prestamo) REFERENCES prestamo(nro_prestamo) ON DELETE CASCADE,

INDEX(nro_pago)

)ENGINE=InnoDB;

CREATE TABLE tasa_prestamo(
periodo SMALLINT(3) UNSIGNED,
monto_inf DECIMAL(12,2),
monto_sup DECIMAL(12,2),
tasa DECIMAL(12,2),


INDEX (periodo, monto_inf, monto_sup)
)ENGINE=InnoDB;

CREATE TABLE caja_ahorro(
nro_ca INT(8) UNSIGNED,
CBU BIGINT(18) UNSIGNED,
saldo DECIMAL(12,2),

CONSTRAINT pk_caja_ahorro
PRIMARY KEY(nro_ca)
)ENGINE=InnoDB;

CREATE TABLE cliente_CA(
nro_cliente INT(5) UNSIGNED NOT NULL,
nro_ca INT(8) UNSIGNED NOT NULL,

CONSTRAINT pk_cliente_CA
PRIMARY KEY(nro_cliente,nro_ca),

INDEX(nro_ca),
CONSTRAINT FK_cliente_CA_caja_ahorro
FOREIGN KEY (nro_ca) REFERENCES caja_ahorro(nro_ca),


INDEX(nro_cliente),
CONSTRAINT FK_cliente_CA_cliente
FOREIGN KEY (nro_cliente) REFERENCES cliente(nro_cliente)


)ENGINE=InnoDB;

CREATE TABLE tarjeta(
nro_tarjeta BIGINT(16) UNSIGNED,
PIN CHAR(32),
CVT CHAR(32),
fecha_venc DATE,
nro_cliente INT(5) UNSIGNED NOT NULL,
nro_ca INT(8) UNSIGNED NOT NULL,

CONSTRAINT pk_tarjeta
PRIMARY KEY(nro_tarjeta),

INDEX(nro_cliente),
CONSTRAINT FK_tarjeta_cliente
FOREIGN KEY (nro_cliente) REFERENCES cliente(nro_cliente),

INDEX(nro_ca),
CONSTRAINT FK_tarjeta_caja_ahorro
FOREIGN KEY (nro_ca) REFERENCES caja_ahorro(nro_ca)
)ENGINE=InnoDB;

CREATE TABLE caja(
cod_caja INT(5) UNSIGNED,
CONSTRAINT pk_caja
PRIMARY KEY(cod_caja)
)ENGINE=InnoDB;

CREATE TABLE ventanilla(
cod_caja INT(5) UNSIGNED,
nro_suc SMALLINT(3) UNSIGNED NOT NULL,

CONSTRAINT pk_ventanilla
PRIMARY KEY (cod_caja),
CONSTRAINT FK_ventanilla_caja
FOREIGN KEY (cod_caja) REFERENCES caja(cod_caja),

INDEX (nro_suc),
CONSTRAINT FK_ventanilla_sucursal
FOREIGN KEY (nro_suc) REFERENCES sucursal(nro_suc)

)ENGINE=InnoDB;

CREATE TABLE ATM(
cod_caja INT(5) UNSIGNED,
cod_postal SMALLINT(4) UNSIGNED NOT NULL,
direccion VARCHAR(100),

CONSTRAINT pk_ATM
PRIMARY KEY (cod_caja),
CONSTRAINT FK_ATM_caja
FOREIGN KEY (cod_caja) REFERENCES caja(cod_caja),

INDEX(cod_postal),
CONSTRAINT FK_ATM_ciudad
FOREIGN KEY (cod_postal) REFERENCES ciudad(cod_postal)


)ENGINE=InnoDB;

CREATE TABLE transaccion(
    fecha DATE,
    hora TIME ,
    monto DECIMAL(12,2),
    nro_trans BIGINT(10) UNSIGNED,

    CONSTRAINT pk_transaccion
    PRIMARY KEY (nro_trans)
)ENGINE=InnoDB;

CREATE TABLE debito(
    descripcion VARCHAR(100),
    nro_trans BIGINT(10) UNSIGNED,
    nro_cliente INT(5) UNSIGNED,
    nro_ca INT(8) UNSIGNED,

    CONSTRAINT pk_debito
    PRIMARY KEY (nro_trans),
    CONSTRAINT FK_debito_transaccion
    FOREIGN KEY(nro_trans) REFERENCES transaccion(nro_trans),

    INDEX (nro_cliente,nro_ca),
    CONSTRAINT FK_debito_cliente_CA
    FOREIGN KEY(nro_cliente,nro_ca) REFERENCES cliente_CA(nro_cliente,nro_ca)
)ENGINE=InnoDB;


CREATE TABLE transaccion_por_caja(
nro_trans BIGINT(10) UNSIGNED,
cod_caja  INT(5) UNSIGNED,

INDEX (cod_caja),
CONSTRAINT FK_transaccion_por_caja_caja
FOREIGN KEY (cod_caja) REFERENCES caja(cod_caja),

CONSTRAINT pk_transaccion_por_caja
PRIMARY KEY(nro_trans),
CONSTRAINT FK_transaccion_por_caja_transaccion
FOREIGN KEY(nro_trans) REFERENCES transaccion(nro_trans)

)ENGINE=InnoDB;

CREATE TABLE extraccion(
nro_trans BIGINT(10) UNSIGNED,
nro_cliente INT(5) UNSIGNED,
nro_ca INT(8) UNSIGNED,

    CONSTRAINT pk_extraccion
    PRIMARY KEY (nro_trans),
    CONSTRAINT FK_extraccion_transaccion
    FOREIGN KEY(nro_trans) REFERENCES transaccion(nro_trans),

    INDEX (nro_cliente,nro_ca),
    CONSTRAINT FK_extraccion_cliente_CA
    FOREIGN KEY(nro_cliente,nro_ca) REFERENCES cliente_CA(nro_cliente,nro_ca)
)ENGINE=InnoDB;

CREATE TABLE transferencia(
    nro_trans BIGINT(10) UNSIGNED,
    nro_cliente INT(5) UNSIGNED,
    origen INT(8) UNSIGNED,
    destino INT(8) UNSIGNED,

CONSTRAINT pk_transferencia
PRIMARY KEY (nro_trans),
CONSTRAINT FK_transferencia_transaccion
FOREIGN KEY(nro_trans) REFERENCES transaccion(nro_trans),

INDEX (nro_cliente,origen),
CONSTRAINT FK_transferencia_cliente_CA
FOREIGN KEY(nro_cliente,origen) REFERENCES cliente_CA(nro_cliente,nro_ca),

INDEX(destino),
CONSTRAINT FK_transferencia_caja_ahorro
FOREIGN KEY(destino) REFERENCES caja_ahorro(nro_ca)

)ENGINE=InnoDB;


CREATE TABLE deposito(
    nro_trans BIGINT(10) UNSIGNED,
    nro_ca INT(5) UNSIGNED,

    CONSTRAINT pk_deposito
    PRIMARY KEY (nro_trans),
    CONSTRAINT FK_deposito_transaccion
    FOREIGN KEY(nro_trans) REFERENCES transaccion(nro_trans),

    INDEX(nro_ca),
    CONSTRAINT FK_deposito_caja_ahorro
    FOREIGN KEY(nro_ca) REFERENCES caja_ahorro(nro_ca)
)ENGINE=InnoDB;


CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON banco.* TO 'admin'@'localhost' WITH GRANT OPTION;

CREATE USER 'empleado'@ IDENTIFIED BY 'empleado';
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

CREATE VIEW Trans_debito AS
SELECT T.nro_trans, fecha,hora,monto, 'debito' as tipo ,descripcion,nro_cliente,nro_ca, NULL as origen , NULL as destino, NULL as cod_caja
FROM transaccion T JOIN debito D ;

CREATE VIEW Trans_extraccion AS
SELECT T.nro_trans,fecha,hora,monto, "extraccion" as tipo ,NULL as descripcion,nro_cliente,nro_ca ,NULL as origen , NULL as destino, cod_caja
FROM extraccion E JOIN transaccion T JOIN transaccion_por_caja TP;

CREATE VIEW Trans_transferencia AS
SELECT T.nro_trans,fecha,hora,monto, "transferencia" as tipo ,NULL as descripcion,nro_cliente,NULL as nro_ca, origen , destino, cod_caja
FROM transferencia TR JOIN transaccion T JOIN transaccion_por_caja TP;

CREATE VIEW Trans_deposito AS
SELECT T.nro_trans,fecha,hora,monto, "deposito" as tipo ,NULL as descripcion, NULL as nro_cliente,nro_ca, NULL as origen , NULL as destino, cod_caja
FROM deposito D JOIN transaccion T JOIN transaccion_por_caja TP;

CREATE VIEW trans_tipo AS
SELECT * FROM ( SELECT * FROM Trans_debito TD
                UNION ALL
                SELECT * FROM Trans_extraccion TE
                UNION ALL
                SELECT * FROM Trans_transferencia TT
                UNION ALL
                SELECT * FROM Trans_deposito TDP ) AS sanchez;

CREATE VIEW Trans_cajas_ahorro AS
SELECT  CA.nro_ca,saldo,nro_trans,fecha,hora,tipo,monto,cod_caja,C.nro_cliente,tipo_doc,nro_doc, nombre,apellido,destino
FROM trans_tipo TT JOIN  caja_ahorro CA JOIN cliente C;

CREATE USER 'atm'@ IDENTIFIED BY 'atm';
GRANT SELECT ON trans_cajas_ahorro TO 'atm'@;
GRANT SELECT, UPDATE (pin) ON tarjeta TO 'atm'@;
GRANT SELECT (nro_tarjeta) ON tarjeta TO 'atm'@;

drop user if exists ''@localhost;

