CREATE DATABASE banco;

USE banco;

/*
LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER
LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER
LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER
LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER
LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER
LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER
LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER
LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER

MANU NO LE PONGAS A TODO NOT NULL XD HAY COSAS QUE SI PUEDEN SER NULL ANDA VIENDOLO XD
CHEQUEA QUE LAS COSAS QUE PUSE ESTAN BIEN PORQUE LA AGREGACION NO LA PUDE HACER CREO
SI PODES TRATA DE PONER DATOS AHI EN EL OTRO ARCHIVO, HACE QUE TE LO GENERE A UNA RED NEURONAL QUE TE ROBA INFORMARCION EN TU NAVEGADOR QUE TE ROBA INFORMACION CORRIENDO UN SISTEMA OPERATIVO QUE TAMBIEN ROBA TU INFORMACION
YO COMO PUSE YA NUESTROS CLIENTES NO NECESITAMOS MAS POR AHORA DESPUES VEO QUE MAS PONGO  "Peace and long life"

LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER
LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER
LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER
LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER
LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER
LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER
LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER
LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER LEER

*/


CREATE TABLE ciudad(
    cod_postal SMALLINT(4) UNSIGNED NOT NULL,
    nombre VARCHAR(100) NOT NULL,

    PRIMARY KEY (cod_postal)
)

CREATE TABLE sucursal(
    nro_suc SMALLINT(3) UNSIGNED NOT NULL,
    nombre VARCHAR NOT NULL,
    direccion VARCHAR NOT NULL,
    telefono VARCHAR NOT NULL,
    horario VARCHAR NOT NULL,
    cod_postal SMALLINT(4) NOT NULL,

    PRIMARY KEY (nro_suc),
    FOREIGN KEY (cod_postal) REFERENCES ciudad (cod_postal)

)

CREATE TABLE empleado(
    legajo SMALLINT(4) UNSIGNED NOT NULL,
    apellido VARCHAR NOT NULL,
    nombre VARCHAR NOT NULL,
    tipo_doc VARCHAR NOT NULL,
    direccion VARCHAR NOT NULL,
    telefono VARCHAR NOT NULL,
    cargo VARCHAR NOT NULL,
    password CHAR(32) NOT NULL,
    nro_doc INT(8) UNSIGNED NOT NULL,
    nro_suc SMALLINT(3) UNSIGNED NOT NULL,

    PRIMARY KEY (legajo),
    FOREIGN KEY (nro_suc) REFERENCES sucursal(nro_suc)


)

CREATE TABLE cliente(
    nro_cliente INT(5) UNSIGNED NOT NULL,
    nro_doc INT(8) NOT NULL, /*Puede ser negativo xd la consigna no especifica que sea positivo*/
    apellido VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    tipo_doc VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(14) NOT NULL,
    fecha_nac DATE ,

    PRIMARY KEY (nro_cliente)
)

CREATE TABLE plazo_fijo(
    nro_plazo INT(8) UNSIGNED NOT NULL,
    nro_suc SMALLINT(3) UNSIGNED NOT NULL,
    capital DECIMAL(12,2) NOT NULL,
    tasa_interes DECIMAL(12,2) NULL,
    interes DECIMAL(12,2) NOT NULL,

    PRIMARY KEY (nro_plazo),
    FOREIGN KEY (nro_suc) REFERENCES sucursal(nro_suc)
)

CREATE TABLE tasa_plazo_fijo(
    periodo SMALLINT(3) NOT NULL,
    monto_inf DECIMAL(12,2) NOT NULL,
    monto_sup DECIMAL(12,2) NOT NULL,
    tasa DECIMAL(12,2) NOT NULL,

PRIMARY KEY(periodo, monto_inf, monto_sup)
)

CREATE TABLE plazo_cliente{
    nro_plazo   INT(8) UNSIGNED,
    nro_cliente INT(5) UNSIGNED,

INDEX (nro_plazo),
FOREIGN KEY (nro_plazo) REFERENCES plazo_fijo(nro_plazo),

INDEX (nro_cliente),
FOREIGN KEY (nro_cliente) REFERENCES cliente(nro_cliente),


}

CREATE TABLE prestamo{
nro_prestamo INT(8),
fecha VARCHAR,
cant_meses SMALLINT(2),
monto DECIMAL(12,2),
tasa_interes DECIMAL(12,2),
interes DECIMAL(12,2),
valor_cuota DECIMAL(12,2),
legajo SMALLINT(4),
nro_cliente INT(5),


PRIMARY KEY(nro_prestamo)
FOREIGN KEY (nro_cliente) REFERENCES cliente(nro_cliente)
FOREIGN KEY (legajo) REFERENCES empleado(legajo)
}

CREATE TABLE pago{
nro_prestamo INT(8),
nro_pago TINYINT(2) UNSIGNED,
fecha_venc DATE,
fecha_pago DATE,

/*
Deberia hacer del nro pago un index?
*/

INDEX (nro_prestamo)
FOREIGN KEY (nro_prestamo) REFERENCES prestamo(nro_prestamo) ON DELETE CASCADE

INDEX(nro_pago)

}

CREATE TABLE tasa_prestamo{
periodo SMALLINT(3) UNSIGNED,
monto_inf DECIMAL(12,2),
monto_sup DECIMAL(12,2),
tasa DECIMAL(12,2),


INDEX (periodo, monto_inf, monto_sup)
}

CREATE TABLE caja_ahorro{
nro_ca INT(8) UNSIGNED,
CBU BIGINT(18) UNSIGNED,
saldo DECIMAL(12,2),


PRIMARY KEY(nro_ca)
}

CREATE TABLE cliente_CA{
nro_cliente INT(5),
nro_ca INT(8),

INDEX(nro_ca),
FOREIGN KEY (nro_ca) REFERENCES caja_ahorro(nro_ca),

INDEX(nro_cliente),
FOREIGN KEY (nro_cliente) REFERENCES cliente(nro_cliente)


}

CREATE TABLE tarjeta{
nro_tarjeta BIGINT(16) UNSIGNED,
PIN CHAR(32),
CVT CHAR(32),
fecha_venc DATE,
nro_cliente INT(5),
nro_ca INT(8),

PRIMARY KEY(nro_tarjeta),

INDEX(nro_cliente),
FOREIGN KEY (nro_cliente) REFERENCES cliente(nro_cliente),

INDEX(nro_ca),
FOREIGN KEY (nro_ca) REFERENCES caja_ahorro(nro_ca)
}

CREATE TABLE caja{
cod_caja INT(5) UNSIGNED,
PRIMARY KEY(cod_caja)
}

CREATE TABLE ventanilla{
cod_caja INT(5) UNSIGNED,
nro_suc SMALLINT(3),


PRIMARY KEY (cod_caja),
FOREIGN KEY (cod_caja) REFERENCES caja(cod_caja),

INDEX (nro_suc),
FOREIGN KEY (nro_suc) REFERENCES sucursal(nro_suc)

}

CREATE TABLE ATM{
cod_caja INT(5) UNSIGNED,
cod_postal SMALLINT ,
direccion VARCHAR(100),


PRIMARY KEY (cod_caja),
FOREIGN KEY (cod_caja) REFERENCES caja(cod_caja),

INDEX(cod_postal),
FOREIGN KEY (cod_postal) REFERENCES ciudad(cod_postal)


}

CREATE TABLE transaccion(
    fecha DATE,
    hora TIME ,
    monto DECIMAL(12,2),
    nro_trans BIGINT(10) UNSIGNED,


    PRIMARY KEY (nro_trans)
)

CREATE TABLE debito(
    descripcion VARCHAR(100),
    nro_trans BIGINT(10) UNSIGNED,
    nro_cliente INT(5) UNSIGNED,
    nro_ca INT(8) UNSIGNED,

    PRIMARY KEY (nro_trans),
    FOREIGN KEY(nro_trans) REFERENCES transaccion(nro_trans),

    INDEX (nro_cliente,nro_ca),
    FOREIGN KEY(nro_cliente,nro_ca) REFERENCES cliente_CA(nro_cliente,nro_ca)
)


CREATE TABLE transaccion_por_caja{
nro_trans BIGINT(10) UNSIGNED,
cod_caja  INT(5) UNSIGNED,

INDEX (cod_caja),
FOREIGN KEY (cod_caja) REFERENCES caja_ahorro(cod_caja),

PRIMARY KEY(nro_trans),
FOREIGN KEY(nro_trans) REFERENCES transaccion(nro_trans)

}

CREATE TABLE extraccion(
nro_trans BIGINT(10) UNSIGNED,
nro_cliente INT(5) UNSIGNED,
nro_ca INT(8) UNSIGNED,

    PRIMARY KEY (nro_trans),
    FOREIGN KEY(nro_trans) REFERENCES transaccion(nro_trans),

    INDEX (nro_cliente,nro_ca),
    FOREIGN KEY(nro_cliente,nro_ca) REFERENCES cliente_CA(nro_cliente,nro_ca)
)

CREATE TABLE transferencia(
    nro_trans BIGINT(10) UNSIGNED,
    nro_cliente INT(5) UNSIGNED,
    origen INT(8) UNSIGNED,
    destino INT(8) UNSIGNED,

PRIMARY KEY (nro_trans),
FOREIGN KEY(nro_trans) REFERENCES transaccion(nro_trans),

INDEX (nro_cliente,origen),
FOREIGN KEY(nro_cliente,origen) REFERENCES cliente_CA(nro_cliente,nro_ca),

INDEX(destino),
FOREIGN KEY(destino) REFERENCES caja_ahorro(nro_ca)

)


CREATE TABLE deposito(
    nro_trans BIGINT(10) UNSIGNED,
    nro_ca INT(5) UNSIGNED,

    PRIMARY KEY (nro_trans),
    FOREIGN KEY(nro_trans) REFERENCES transaccion(nro_trans),

    INDEX(nro_ca),
    FOREIGN KEY(nro_ca) REFERENCES caja_ahorro(nro_ca)
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
SELECT  nro_ca,saldo,nro_trans,fecha,hora,tipo,monto,cod_caja,nro_cliente,tipo_doc,nro_doc, nombre,apellido,destino
FROM trans_tipo JOIN  caja_ahorro JOIN cliente


CREATE VIEW trans_tipo AS
SELECT * FROM ( SELECT * FROM Trans_debito
                UNION ALL
                SELECT * FROM Trans_extraccion
                UNION ALL
                SELECT * FROM Trans_transferencia
                UNION ALL
                SELECT * FROM Trans_deposito )

CREATE VIEW Trans_debito AS
SELECT nro_trans,fecha,hora,monto, "debito" as tipo ,descripcion,nro_cliente,nro_ca, NULL as origen , NULL as destino, NULL as cod_caja
FROM banco.debito JOIN banco.transaccion

CREATE VIEW Trans_extraccion AS
SELECT nro_trans,fecha,hora,monto, "extraccion" as tipo ,NULL as descripcion,nro_cliente,nro_ca ,NULL as origen , NULL as destino, cod_caja
FROM banco.extraccion JOIN banco.transaccion JOIN banco.transaccion_por_caja

CREATE VIEW Trans_transferencia AS
SELECT nro_trans,fecha,hora,monto, "transferencia" as tipo ,NULL as descripcion,nro_cliente,NULL as nro_ca, origen , destino, cod_caja
FROM banco.transferencia JOIN banco.transaccion JOIN banco.transaccion_por_caja

CREATE VIEW Trans_deposito AS
SELECT nro_trans,fecha,hora,monto, "deposito" as tipo ,NULL as descripcion, NULL as nro_cliente,nro_ca, NULL as origen , NULL as destino, cod_caja
FROM banco.deposito JOIN banco.transaccion JOIN banco.transaccion_por_caja


CREATE USER 'atm'@'%' IDENTIFIED BY 'atm'
GRANT SELECT ON trans_cajas_ahorro TO 'atm'@'%';
GRANT SELECT, UPDATE (pin) ON banco.tarjeta TO 'atm'@'%';
GRANT SELECT (nro_tarjeta) ON banco.tarjeta TO 'atm'@'%';

drop user @localhost;

