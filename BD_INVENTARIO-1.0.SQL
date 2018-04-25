/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     25/04/2018 12:07:05 a.m.                     */
/*==============================================================*/


drop table if exists ADMINISTRADOR;

drop table if exists COMPRA;

drop table if exists DETALLE_COMPRA;

drop table if exists DETALLE_VENTA;

drop table if exists EGRESO_ADICIONAL;

drop table if exists EMPRESA;

drop table if exists ENCARGADO_BODEGA;

drop table if exists INGRESO_ADICIONAL;

drop table if exists MOVIMIENTO;

drop table if exists PRODUCTO;

drop table if exists PRODUCTO_DISPONIBLE;

drop table if exists PROVEEDOR;

drop table if exists SUCURSAL;

drop table if exists TIPO_UNIDAD;

drop table if exists VENDEDOR;

drop table if exists VENTA;

/*==============================================================*/
/* Table: ADMINISTRADOR                                         */
/*==============================================================*/
create table ADMINISTRADOR
(
   IDADMINISTRADOR      numeric(8,0) not null,
   NOMBRE               varchar(20) not null,
   APELLIDO             varchar(20) not null,
   PASSWORD             varchar(20) not null,
   CEDULA               varchar(14) not null,
   primary key (IDADMINISTRADOR)
);

/*==============================================================*/
/* Table: COMPRA                                                */
/*==============================================================*/
create table COMPRA
(
   IDCOMPRA             numeric(8,0) not null,
   IDADMINISTRADOR      numeric(8,0),
   IDPROVEEDOR          numeric(8,0),
   IDSUCURSAL           numeric(8,0),
   IDBODEGUERO          numeric(8,0),
   FECHA                date not null,
   primary key (IDCOMPRA)
);

/*==============================================================*/
/* Table: DETALLE_COMPRA                                        */
/*==============================================================*/
create table DETALLE_COMPRA
(
   IDDETALLE_COMPRA     numeric(8,0) not null,
   IDCOMPRA             numeric(8,0),
   IDPRODUCTO           numeric(8,0),
   CANTIDAD             int not null,
   PRECIO               float not null,
   primary key (IDDETALLE_COMPRA)
);

/*==============================================================*/
/* Table: DETALLE_VENTA                                         */
/*==============================================================*/
create table DETALLE_VENTA
(
   IDDETALLE_VENTA      numeric(8,0) not null,
   IDVENTA              numeric(8,0),
   IDPRODUCTO           numeric(8,0),
   CANTIDAD             int not null,
   PRECIO               float not null,
   primary key (IDDETALLE_VENTA)
);

/*==============================================================*/
/* Table: EGRESO_ADICIONAL                                      */
/*==============================================================*/
create table EGRESO_ADICIONAL
(
   IDOTROS_EGRESOS      numeric(8,0) not null,
   IDSUCURSAL           numeric(8,0),
   DESCRIPCION          varchar(100),
   FECHA                date not null,
   VALOR                float not null,
   primary key (IDOTROS_EGRESOS)
);

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
create table EMPRESA
(
   IDEMPRESA            numeric(8,0) not null,
   IDADMINISTRADOR      numeric(8,0) not null,
   NOMBRE_EMPRESA       varchar(45) not null,
   USUARIO              varchar(20) not null,
   PASSWORD             varchar(20) not null,
   FECHA_CADUCIDAD      date,
   primary key (IDEMPRESA)
);

/*==============================================================*/
/* Table: ENCARGADO_BODEGA                                      */
/*==============================================================*/
create table ENCARGADO_BODEGA
(
   IDBODEGUERO          numeric(8,0) not null,
   IDSUCURSAL           numeric(8,0),
   NOMBRE               varchar(20) not null,
   APELLIDO             varchar(20) not null,
   PASSWORD             varchar(20) not null,
   CEDULA               varchar(14) not null,
   primary key (IDBODEGUERO)
);

/*==============================================================*/
/* Table: INGRESO_ADICIONAL                                     */
/*==============================================================*/
create table INGRESO_ADICIONAL
(
   IDOTROS_INGRESOS     numeric(8,0) not null,
   IDSUCURSAL           numeric(8,0),
   DESCRIPCION          varchar(100),
   FECHA                date not null,
   VALOR                float not null,
   primary key (IDOTROS_INGRESOS)
);

/*==============================================================*/
/* Table: MOVIMIENTO                                            */
/*==============================================================*/
create table MOVIMIENTO
(
   IDMOVIMIENTO         numeric(8,0) not null,
   IDCOMPRA             numeric(8,0),
   IDADMINISTRADOR      numeric(8,0),
   FECHA                date not null,
   ESTADO_INICIAL       varchar(40) not null,
   ESTADO_FINAL         varchar(40) not null,
   primary key (IDMOVIMIENTO)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO
(
   IDPRODUCTO           numeric(8,0) not null,
   IDTIPO               varchar(20),
   PRECIO_VENTA         float,
   CANTIDAD_DISPONIBLE  int not null,
   CODIGO               varchar(20),
   NOMBRE_PRODUCTO      varchar(45) not null,
   primary key (IDPRODUCTO)
);

/*==============================================================*/
/* Table: PRODUCTO_DISPONIBLE                                   */
/*==============================================================*/
create table PRODUCTO_DISPONIBLE
(
   IDSUCURSAL           numeric(8,0),
   IDPRODUCTO           numeric(8,0),
   CANTIDAD_DISPONIBLE  int not null
);

/*==============================================================*/
/* Table: PROVEEDOR                                             */
/*==============================================================*/
create table PROVEEDOR
(
   IDPROVEEDOR          numeric(8,0) not null,
   IDEMPRESA            numeric(8,0),
   NOMBRE               varchar(20) not null,
   DESCRIPCION          varchar(100),
   primary key (IDPROVEEDOR)
);

/*==============================================================*/
/* Table: SUCURSAL                                              */
/*==============================================================*/
create table SUCURSAL
(
   IDSUCURSAL           numeric(8,0) not null,
   IDEMPRESA            numeric(8,0),
   IDADMINISTRADOR      numeric(8,0),
   NOMBRE               varchar(20) not null,
   DIRECCION            varchar(100),
   TELEFONO             varchar(13),
   primary key (IDSUCURSAL)
);

/*==============================================================*/
/* Table: TIPO_UNIDAD                                           */
/*==============================================================*/
create table TIPO_UNIDAD
(
   IDTIPO               varchar(20) not null,
   primary key (IDTIPO)
);

/*==============================================================*/
/* Table: VENDEDOR                                              */
/*==============================================================*/
create table VENDEDOR
(
   IDVENDEDOR           numeric(8,0) not null,
   IDSUCURSAL           numeric(8,0),
   NOMBRE               varchar(20) not null,
   APELLIDO             varchar(20) not null,
   PASSWORD             varchar(20) not null,
   CEDULA               varchar(14) not null,
   primary key (IDVENDEDOR)
);

/*==============================================================*/
/* Table: VENTA                                                 */
/*==============================================================*/
create table VENTA
(
   IDVENTA              numeric(8,0) not null,
   IDSUCURSAL           numeric(8,0),
   IDADMINISTRADOR      numeric(8,0),
   IDVENDEDOR           numeric(8,0),
   FECHA                date not null,
   primary key (IDVENTA)
);

alter table COMPRA add constraint FK_RELATIONSHIP_1 foreign key (IDPROVEEDOR)
      references PROVEEDOR (IDPROVEEDOR) on delete restrict on update restrict;

alter table COMPRA add constraint FK_RELATIONSHIP_2 foreign key (IDADMINISTRADOR)
      references ADMINISTRADOR (IDADMINISTRADOR) on delete restrict on update restrict;

alter table COMPRA add constraint FK_RELATIONSHIP_3 foreign key (IDBODEGUERO)
      references ENCARGADO_BODEGA (IDBODEGUERO) on delete restrict on update restrict;

alter table COMPRA add constraint FK_RELATIONSHIP_4 foreign key (IDSUCURSAL)
      references SUCURSAL (IDSUCURSAL) on delete restrict on update restrict;

alter table DETALLE_COMPRA add constraint FK_RELATIONSHIP_7 foreign key (IDCOMPRA)
      references COMPRA (IDCOMPRA) on delete restrict on update restrict;

alter table DETALLE_COMPRA add constraint FK_RELATIONSHIP_8 foreign key (IDPRODUCTO)
      references PRODUCTO (IDPRODUCTO) on delete restrict on update restrict;

alter table DETALLE_VENTA add constraint FK_RELATIONSHIP_10 foreign key (IDVENTA)
      references VENTA (IDVENTA) on delete restrict on update restrict;

alter table DETALLE_VENTA add constraint FK_RELATIONSHIP_9 foreign key (IDPRODUCTO)
      references PRODUCTO (IDPRODUCTO) on delete restrict on update restrict;

alter table EGRESO_ADICIONAL add constraint FK_RELATIONSHIP_16 foreign key (IDSUCURSAL)
      references SUCURSAL (IDSUCURSAL) on delete restrict on update restrict;

alter table EMPRESA add constraint FK_GERENTE foreign key (IDADMINISTRADOR)
      references ADMINISTRADOR (IDADMINISTRADOR) on delete restrict on update restrict;

alter table ENCARGADO_BODEGA add constraint FK_RELATIONSHIP_12 foreign key (IDSUCURSAL)
      references SUCURSAL (IDSUCURSAL) on delete restrict on update restrict;

alter table INGRESO_ADICIONAL add constraint FK_RELATIONSHIP_17 foreign key (IDSUCURSAL)
      references SUCURSAL (IDSUCURSAL) on delete restrict on update restrict;

alter table MOVIMIENTO add constraint FK_RELATIONSHIP_5 foreign key (IDADMINISTRADOR)
      references ADMINISTRADOR (IDADMINISTRADOR) on delete restrict on update restrict;

alter table MOVIMIENTO add constraint FK_RELATIONSHIP_6 foreign key (IDCOMPRA)
      references COMPRA (IDCOMPRA) on delete restrict on update restrict;

alter table PRODUCTO add constraint FK_RELATIONSHIP_23 foreign key (IDTIPO)
      references TIPO_UNIDAD (IDTIPO) on delete restrict on update restrict;

alter table PRODUCTO_DISPONIBLE add constraint FK_RELATIONSHIP_21 foreign key (IDSUCURSAL)
      references SUCURSAL (IDSUCURSAL) on delete restrict on update restrict;

alter table PRODUCTO_DISPONIBLE add constraint FK_RELATIONSHIP_22 foreign key (IDPRODUCTO)
      references PRODUCTO (IDPRODUCTO) on delete restrict on update restrict;

alter table PROVEEDOR add constraint FK_RELATIONSHIP_24 foreign key (IDEMPRESA)
      references EMPRESA (IDEMPRESA) on delete restrict on update restrict;

alter table SUCURSAL add constraint FK_RELATIONSHIP_13 foreign key (IDADMINISTRADOR)
      references ADMINISTRADOR (IDADMINISTRADOR) on delete restrict on update restrict;

alter table SUCURSAL add constraint FK_RELATIONSHIP_14 foreign key (IDEMPRESA)
      references EMPRESA (IDEMPRESA) on delete restrict on update restrict;

alter table VENDEDOR add constraint FK_RELATIONSHIP_15 foreign key (IDSUCURSAL)
      references SUCURSAL (IDSUCURSAL) on delete restrict on update restrict;

alter table VENTA add constraint FK_RELATIONSHIP_18 foreign key (IDSUCURSAL)
      references SUCURSAL (IDSUCURSAL) on delete restrict on update restrict;

alter table VENTA add constraint FK_RELATIONSHIP_19 foreign key (IDADMINISTRADOR)
      references ADMINISTRADOR (IDADMINISTRADOR) on delete restrict on update restrict;

alter table VENTA add constraint FK_RELATIONSHIP_20 foreign key (IDVENDEDOR)
      references VENDEDOR (IDVENDEDOR) on delete restrict on update restrict;

