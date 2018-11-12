------------------------------------------------
-- Export file for user YYCG                  --
-- Created by Thinkpad on 2014/5/18, 20:20:18 --
------------------------------------------------

set define off
spool oracle_yycg20140518.log

prompt
prompt Creating table AREA_BACKUP
prompt ==========================
prompt
create table AREA_BACKUP
(
  areaid       VARCHAR2(128) not null,
  areacode     VARCHAR2(128),
  areaname     VARCHAR2(128) not null,
  arealevel    CHAR(1) not null,
  areafullname VARCHAR2(200),
  parentid     VARCHAR2(128) not null,
  vchar1       VARCHAR2(32),
  vchar2       VARCHAR2(32),
  vchar3       VARCHAR2(32),
  isused       CHAR(1) default 1
)
;
comment on column AREA_BACKUP.areaid
  is '区域id';
comment on column AREA_BACKUP.areacode
  is '全国行政区代码';
comment on column AREA_BACKUP.areaname
  is '区域名称';
comment on column AREA_BACKUP.arealevel
  is '区域级别，1：省级，2：市级，3，区县';
comment on column AREA_BACKUP.areafullname
  is '区域全称';
comment on column AREA_BACKUP.parentid
  is '父级区域id';
comment on column AREA_BACKUP.isused
  is '是否使用，1：使用，0：不使用';
alter table AREA_BACKUP
  add constraint PK_AREA primary key (AREAID);

prompt
prompt Creating table BASICINFO
prompt ========================
prompt
create table BASICINFO
(
  id      VARCHAR2(32) not null,
  name    VARCHAR2(200) not null,
  value   VARCHAR2(512) not null,
  type    VARCHAR2(20) not null,
  tag     VARCHAR2(30),
  isalive CHAR(1) not null,
  vchar1  VARCHAR2(32),
  vchar3  VARCHAR2(60),
  vchar2  VARCHAR2(32)
)
;
comment on table BASICINFO
  is '基础配置信息表';
alter table BASICINFO
  add constraint PK_BASICINFO primary key (ID);

prompt
prompt Creating table BSS_SYS_AREA
prompt ===========================
prompt
create table BSS_SYS_AREA
(
  areaid       VARCHAR2(32) not null,
  areaname     VARCHAR2(128) not null,
  arealevel    NUMBER(8) not null,
  areafullname VARCHAR2(200),
  parentid     VARCHAR2(32),
  shortname    VARCHAR2(32),
  isunit       CHAR(1),
  lastupdate   VARCHAR2(14),
  yzcode       VARCHAR2(32),
  vchar1       VARCHAR2(300),
  vchar2       VARCHAR2(300),
  vchar3       VARCHAR2(300),
  vchar4       VARCHAR2(300),
  vchar5       VARCHAR2(300),
  vchar6       VARCHAR2(500)
)
;
alter table BSS_SYS_AREA
  add primary key (AREAID);

prompt
prompt Creating table BSS_SYS_DEPLOYNODE
prompt =================================
prompt
create table BSS_SYS_DEPLOYNODE
(
  nodeid    VARCHAR2(32) not null,
  name      VARCHAR2(200) not null,
  sysid     VARCHAR2(32) not null,
  url       VARCHAR2(200) not null,
  icon      VARCHAR2(500),
  showorder NUMBER(8) not null,
  vchar1    VARCHAR2(200),
  vchar6    VARCHAR2(500),
  vchar2    VARCHAR2(200),
  vchar3    VARCHAR2(200),
  vchar4    VARCHAR2(300),
  vchar5    VARCHAR2(300)
)
;
alter table BSS_SYS_DEPLOYNODE
  add primary key (NODEID);

prompt
prompt Creating table BSS_SYS_LOG
prompt ==========================
prompt
create table BSS_SYS_LOG
(
  logid       VARCHAR2(32) not null,
  username    VARCHAR2(64) not null,
  truename    VARCHAR2(20) not null,
  clientip    VARCHAR2(32),
  opertype    VARCHAR2(32) not null,
  modulename  VARCHAR2(32) not null,
  opercontent VARCHAR2(600),
  operdate    VARCHAR2(14) not null,
  vchar1      VARCHAR2(300),
  vchar2      VARCHAR2(300),
  vchar3      VARCHAR2(300),
  vchar4      VARCHAR2(300),
  vchar5      VARCHAR2(300),
  vchar6      VARCHAR2(500)
)
;
alter table BSS_SYS_LOG
  add primary key (LOGID);

prompt
prompt Creating table BSS_SYS_MODULE
prompt =============================
prompt
create table BSS_SYS_MODULE
(
  moduleid  VARCHAR2(32) not null,
  sysid     VARCHAR2(32) not null,
  name      VARCHAR2(64) not null,
  parentid  VARCHAR2(32) not null,
  url       VARCHAR2(200),
  icon      VARCHAR2(500),
  showorder NUMBER(8) not null,
  isused    CHAR(1) not null,
  vchar1    VARCHAR2(300),
  vchar2    VARCHAR2(300),
  vchar3    VARCHAR2(300),
  vchar4    VARCHAR2(300),
  vchar5    VARCHAR2(300),
  vchar6    VARCHAR2(500)
)
;
alter table BSS_SYS_MODULE
  add primary key (MODULEID);

prompt
prompt Creating table BSS_SYS_OPERATE
prompt ==============================
prompt
create table BSS_SYS_OPERATE
(
  operateid   VARCHAR2(32) not null,
  operatename VARCHAR2(100) not null,
  operatecode VARCHAR2(64),
  method      VARCHAR2(200),
  moduleid    VARCHAR2(32),
  icon        VARCHAR2(500),
  showorder   NUMBER(8) not null,
  vchar1      VARCHAR2(300),
  vchar2      VARCHAR2(300),
  vchar3      VARCHAR2(300),
  vchar4      VARCHAR2(300),
  vchar5      VARCHAR2(300),
  vchar6      VARCHAR2(500)
)
;
alter table BSS_SYS_OPERATE
  add primary key (OPERATEID);

prompt
prompt Creating table BSS_SYS_ROLE
prompt ===========================
prompt
create table BSS_SYS_ROLE
(
  roleid   VARCHAR2(32) not null,
  rolename VARCHAR2(128) not null,
  roledes  VARCHAR2(200),
  vchar1   VARCHAR2(300),
  vchar2   VARCHAR2(300),
  vchar3   VARCHAR2(300),
  vchar4   VARCHAR2(300),
  vchar5   VARCHAR2(300),
  vchar6   VARCHAR2(500)
)
;
alter table BSS_SYS_ROLE
  add primary key (ROLEID);

prompt
prompt Creating table BSS_SYS_ROLEMODULE
prompt =================================
prompt
create table BSS_SYS_ROLEMODULE
(
  rmid     VARCHAR2(32) not null,
  rnid     VARCHAR2(32) not null,
  moduleid VARCHAR2(32) not null,
  vchar1   VARCHAR2(100),
  vchar2   VARCHAR2(100),
  vchar3   VARCHAR2(200),
  vchar4   VARCHAR2(200)
)
;
alter table BSS_SYS_ROLEMODULE
  add primary key (RMID);

prompt
prompt Creating table BSS_SYS_ROLENODE
prompt ===============================
prompt
create table BSS_SYS_ROLENODE
(
  rnid   VARCHAR2(32) not null,
  rsid   VARCHAR2(32) not null,
  nodeid VARCHAR2(32) not null,
  vchar1 VARCHAR2(100),
  vchar2 VARCHAR2(100),
  vchar3 VARCHAR2(200),
  vchar4 VARCHAR2(200)
)
;
alter table BSS_SYS_ROLENODE
  add primary key (RNID);

prompt
prompt Creating table BSS_SYS_ROLEOPERATE
prompt ==================================
prompt
create table BSS_SYS_ROLEOPERATE
(
  roid      VARCHAR2(32) not null,
  rmid      VARCHAR2(32) not null,
  operateid VARCHAR2(32) not null,
  vchar1    VARCHAR2(100),
  vchar2    VARCHAR2(100),
  vchar3    VARCHAR2(200),
  vchar4    VARCHAR2(200)
)
;
alter table BSS_SYS_ROLEOPERATE
  add primary key (ROID);

prompt
prompt Creating table BSS_SYS_ROLESYS
prompt ==============================
prompt
create table BSS_SYS_ROLESYS
(
  rsid   VARCHAR2(32) not null,
  roleid VARCHAR2(32) not null,
  sysid  VARCHAR2(32) not null,
  vchar1 VARCHAR2(100),
  vchar2 VARCHAR2(100),
  vchar3 VARCHAR2(200),
  vchar4 VARCHAR2(200)
)
;
alter table BSS_SYS_ROLESYS
  add primary key (RSID);

prompt
prompt Creating table BSS_SYS_SYSTEM
prompt =============================
prompt
create table BSS_SYS_SYSTEM
(
  sysid     VARCHAR2(32) not null,
  sysname   VARCHAR2(64) not null,
  url       VARCHAR2(200),
  icon      VARCHAR2(500) not null,
  showorder NUMBER(8),
  vchar1    VARCHAR2(300),
  vchar2    VARCHAR2(300),
  vchar3    VARCHAR2(300),
  vchar4    VARCHAR2(300),
  vchar5    VARCHAR2(300),
  vchar6    VARCHAR2(500)
)
;
alter table BSS_SYS_SYSTEM
  add primary key (SYSID);

prompt
prompt Creating table DICTINFO
prompt =======================
prompt
create table DICTINFO
(
  id         VARCHAR2(32) not null,
  dictcode   VARCHAR2(32),
  typecode   VARCHAR2(32) not null,
  info       VARCHAR2(64) not null,
  remark     VARCHAR2(256),
  updatetime VARCHAR2(16),
  dictsort   INTEGER,
  isenable   VARCHAR2(1) default '1' not null,
  valuetype  VARCHAR2(1)
)
;
comment on column DICTINFO.dictcode
  is '字典代码';
comment on column DICTINFO.typecode
  is '字典类型代码';
comment on column DICTINFO.info
  is '字典信息';
comment on column DICTINFO.remark
  is '备注';
comment on column DICTINFO.updatetime
  is '修改时间';
comment on column DICTINFO.dictsort
  is '排序';
comment on column DICTINFO.isenable
  is '是否启用。1启用；0停用';
alter table DICTINFO
  add constraint PK_DICTINFO primary key (ID);
alter table DICTINFO
  add constraint FK_TYPECODE foreign key (TYPECODE)
  references DICTTYPE (TYPECODE);

prompt
prompt Creating table DICTTYPE
prompt =======================
prompt
create table DICTTYPE
(
  typecode   VARCHAR2(32) not null,
  typename   VARCHAR2(64) not null,
  remark     VARCHAR2(256),
  typesort   INTEGER,
  codelength VARCHAR2(32)
)
;
comment on column DICTTYPE.typecode
  is '字典类型代码';
comment on column DICTTYPE.typename
  is '字典类型名称';
comment on column DICTTYPE.remark
  is '备注';
comment on column DICTTYPE.typesort
  is '排序';
comment on column DICTTYPE.codelength
  is 'dictcode的字符长度';
alter table DICTTYPE
  add constraint PK_DICTTYPE primary key (TYPECODE);

prompt
prompt Creating table ERROR_TASK_BACKUP
prompt ================================
prompt
create table ERROR_TASK_BACKUP
(
  taskid      VARCHAR2(32),
  wsurl       VARCHAR2(400),
  wsmethod    VARCHAR2(100),
  wsnamespace VARCHAR2(300),
  vchar1      VARCHAR2(300),
  vchar2      VARCHAR2(300),
  vchar3      VARCHAR2(300)
)
;

prompt
prompt Creating table YPXX
prompt ===================
prompt
create table YPXX
(
  id        VARCHAR2(32) not null,
  bm        VARCHAR2(32) not null,
  scqymc    VARCHAR2(128) not null,
  spmc      VARCHAR2(64) not null,
  zbjg      FLOAT not null,
  zpdz      VARCHAR2(128),
  pzwh      VARCHAR2(64),
  pzwhyxq   DATE,
  jky       CHAR(1),
  bzcz      VARCHAR2(64),
  bzdw      VARCHAR2(64),
  lsjg      FLOAT,
  lsjgcc    VARCHAR2(64),
  zlcc      VARCHAR2(32),
  zlccsm    VARCHAR2(200),
  ypjybg    CHAR(1),
  ypjybgbm  VARCHAR2(128),
  ypjybgyxq DATE,
  cpsm      CLOB,
  jyzt      CHAR(1) not null,
  vchar1    VARCHAR2(128),
  vchar2    VARCHAR2(128),
  vchar3    VARCHAR2(128),
  dw        VARCHAR2(32),
  mc        VARCHAR2(128),
  jx        VARCHAR2(32),
  gg        VARCHAR2(128),
  zhxs      VARCHAR2(16),
  pinyin    VARCHAR2(768),
  lb        VARCHAR2(32)
)
;
comment on column YPXX.bm
  is '药品流水号';
comment on column YPXX.scqymc
  is '生产企业名称';
comment on column YPXX.spmc
  is '商品名';
comment on column YPXX.zbjg
  is '中标价';
comment on column YPXX.zpdz
  is '产品照片';
comment on column YPXX.pzwh
  is '批准文号';
comment on column YPXX.pzwhyxq
  is '批准文号有效期';
comment on column YPXX.jky
  is '是否进口药';
comment on column YPXX.bzcz
  is '包装材质';
comment on column YPXX.bzdw
  is '包装单位';
comment on column YPXX.lsjg
  is '最新零售价';
comment on column YPXX.lsjgcc
  is '零售价出处';
comment on column YPXX.zlcc
  is '质量层次';
comment on column YPXX.zlccsm
  is '质量层次说明';
comment on column YPXX.ypjybg
  is '有无药品检验报告';
comment on column YPXX.ypjybgbm
  is '药品检验报告编号';
comment on column YPXX.ypjybgyxq
  is '药品检验报告有效期';
comment on column YPXX.cpsm
  is '产品说明';
comment on column YPXX.jyzt
  is '药品交易状态';
comment on column YPXX.dw
  is '单位';
comment on column YPXX.mc
  is '通用名';
comment on column YPXX.jx
  is '剂型';
comment on column YPXX.gg
  is '规格';
comment on column YPXX.zhxs
  is '转换系数';
comment on column YPXX.pinyin
  is '通用名拼音';
comment on column YPXX.lb
  is '药品类别';
alter table YPXX
  add constraint PK_YPXX primary key (ID);
alter table YPXX
  add constraint AK_YYXX_NEWINDEX1_YPXX unique (BM);
alter table YPXX
  add constraint AK_YYXX_NEWINDEX2_YPXX unique (SCQYMC, SPMC, MC, JX, GG, ZHXS);

prompt
prompt Creating table GYSYPML
prompt ======================
prompt
create table GYSYPML
(
  id        VARCHAR2(32) not null,
  ypxxid    VARCHAR2(32) not null,
  usergysid VARCHAR2(64) not null,
  vchar1    VARCHAR2(64),
  vchar2    VARCHAR2(64)
)
;
comment on table GYSYPML
  is '供应商药品目录';
comment on column GYSYPML.ypxxid
  is '药品信息id';
comment on column GYSYPML.usergysid
  is '供应商id';
create unique index AK_GYSYPML_NEWINDEX1_GYSYPML on GYSYPML (YPXXID, USERGYSID);
alter table GYSYPML
  add constraint PK_GYSYPML primary key (ID);
alter table GYSYPML
  add constraint UNI_GYSYPML unique (YPXXID, USERGYSID);
alter table GYSYPML
  add constraint FK_GYSYPML foreign key (YPXXID)
  references YPXX (ID);

prompt
prompt Creating table GYSYPML_CONTROL
prompt ==============================
prompt
create table GYSYPML_CONTROL
(
  id        VARCHAR2(32) not null,
  ypxxid    VARCHAR2(32) not null,
  usergysid VARCHAR2(64) not null,
  control   CHAR(1) not null,
  advice    VARCHAR2(128),
  vchar1    VARCHAR2(64),
  vchar2    VARCHAR2(64)
)
;
comment on table GYSYPML_CONTROL
  is '供应商药品目录控制表';
comment on column GYSYPML_CONTROL.ypxxid
  is '药品信息id';
comment on column GYSYPML_CONTROL.usergysid
  is '供应商id';
comment on column GYSYPML_CONTROL.control
  is '监督机构控制状态(1：正常 ,2：暂停)';
comment on column GYSYPML_CONTROL.advice
  is '监督机构意见';
create unique index AK_GYSYPMLCONTROL on GYSYPML_CONTROL (YPXXID, USERGYSID);
alter table GYSYPML_CONTROL
  add constraint PK_GYSYPMLCONTROL primary key (ID);
alter table GYSYPML_CONTROL
  add constraint UNI_GYSYPMLCONTROL unique (YPXXID, USERGYSID);
alter table GYSYPML_CONTROL
  add constraint FK_GYSYPMLCONTROL foreign key (YPXXID)
  references YPXX (ID);

prompt
prompt Creating table SYSLOG
prompt =====================
prompt
create table SYSLOG
(
  id          VARCHAR2(64) not null,
  userid      VARCHAR2(32),
  operatedate DATE,
  userip      VARCHAR2(20),
  username    VARCHAR2(64),
  logtype     CHAR(1),
  messages    VARCHAR2(200)
)
;
comment on table SYSLOG
  is '用户操作日志表';
comment on column SYSLOG.userid
  is '用户账号';
comment on column SYSLOG.operatedate
  is '操作时间';
comment on column SYSLOG.userip
  is '用户ip';
comment on column SYSLOG.username
  is '用户名称';
comment on column SYSLOG.logtype
  is '日志类型1:操作成功日志，2：操作失败日志';
comment on column SYSLOG.messages
  is '日志明细';
alter table SYSLOG
  add constraint PK_SYSLOG primary key (ID);

prompt
prompt Creating table SYSMODULE
prompt ========================
prompt
create table SYSMODULE
(
  moduleid   VARCHAR2(32) not null,
  modulename VARCHAR2(64) not null,
  parentid   VARCHAR2(32) not null,
  url        VARCHAR2(200),
  icon       VARCHAR2(128),
  showorder  NUMBER(8) not null,
  isused     CHAR(1) not null,
  vchar1     VARCHAR2(300),
  vchar2     VARCHAR2(300),
  vchar3     VARCHAR2(300),
  vchar4     VARCHAR2(300),
  vchar5     VARCHAR2(300),
  vchar6     VARCHAR2(500)
)
;
comment on column SYSMODULE.moduleid
  is '模块id';
comment on column SYSMODULE.modulename
  is '模块名称';
comment on column SYSMODULE.parentid
  is '父模块id';
comment on column SYSMODULE.url
  is '模块url即访问地址';
comment on column SYSMODULE.icon
  is '模块图标';
comment on column SYSMODULE.showorder
  is '显示顺序，用于菜单排列顺序';
comment on column SYSMODULE.isused
  is '状态标记： 1:使用， 2：暂不使用';
alter table SYSMODULE
  add constraint PK_SYSMODULE primary key (MODULEID);

prompt
prompt Creating table SYSOPERATION
prompt ===========================
prompt
create table SYSOPERATION
(
  operateid   VARCHAR2(32) not null,
  operatename VARCHAR2(64) not null,
  url         VARCHAR2(200),
  moduleid    VARCHAR2(32),
  icon        VARCHAR2(128),
  showorder   NUMBER(8) not null,
  vchar1      VARCHAR2(300),
  vchar2      VARCHAR2(300),
  vchar3      VARCHAR2(300),
  vchar4      VARCHAR2(300),
  vchar5      VARCHAR2(300),
  vchar6      VARCHAR2(500)
)
;
comment on table SYSOPERATION
  is '系统模块操作表';
comment on column SYSOPERATION.operateid
  is '操作id';
comment on column SYSOPERATION.operatename
  is '操作名称';
comment on column SYSOPERATION.url
  is '访问地址';
comment on column SYSOPERATION.moduleid
  is '所属模块id';
comment on column SYSOPERATION.icon
  is '图标';
comment on column SYSOPERATION.showorder
  is '显示顺序';
alter table SYSOPERATION
  add constraint PK_SYSOPERTION primary key (OPERATEID);
alter table SYSOPERATION
  add constraint FK_SYSOPERA_REFERENCE_SYSMODUL foreign key (MODULEID)
  references SYSMODULE (MODULEID);

prompt
prompt Creating table SYSROLE
prompt ======================
prompt
create table SYSROLE
(
  id       VARCHAR2(32) not null,
  rolename VARCHAR2(64) not null,
  groupid  CHAR(1) not null,
  vchar1   VARCHAR2(64),
  vchar2   VARCHAR2(64),
  vchar3   VARCHAR2(64)
)
;
comment on column SYSROLE.id
  is '角色id';
comment on column SYSROLE.rolename
  is '角色名称';
comment on column SYSROLE.groupid
  is '所属用户类型';
comment on column SYSROLE.vchar1
  is '备用';
comment on column SYSROLE.vchar2
  is '备用';
comment on column SYSROLE.vchar3
  is '备用';
alter table SYSROLE
  add constraint PK_SYSROLE primary key (ID);

prompt
prompt Creating table SYSROLEMODULE
prompt ============================
prompt
create table SYSROLEMODULE
(
  roleid   VARCHAR2(32) not null,
  moduleid VARCHAR2(32) not null
)
;
comment on table SYSROLEMODULE
  is '系统角色对应模块权限表';
comment on column SYSROLEMODULE.roleid
  is '角色id，对应角色表主键';
comment on column SYSROLEMODULE.moduleid
  is '模块id，对应模块表主键';
alter table SYSROLEMODULE
  add constraint PK_SYSROLEMODULE primary key (ROLEID, MODULEID);
alter table SYSROLEMODULE
  add constraint FK_SYSROLEM_REFERENCE_SYSMODUL foreign key (MODULEID)
  references SYSMODULE (MODULEID);

prompt
prompt Creating table SYSUSER
prompt ======================
prompt
create table SYSUSER
(
  id         VARCHAR2(32) not null,
  userid     VARCHAR2(20) not null,
  username   VARCHAR2(128) not null,
  groupid    CHAR(1) not null,
  pwd        VARCHAR2(64) not null,
  contact    VARCHAR2(128),
  addr       VARCHAR2(256),
  email      VARCHAR2(64),
  userstate  CHAR(1) default 1 not null,
  remark     VARCHAR2(256),
  createtime TIMESTAMP(6) default sysdate,
  sex        VARCHAR2(4),
  phone      VARCHAR2(20),
  movephone  VARCHAR2(11),
  fax        VARCHAR2(20),
  lastupdate VARCHAR2(14),
  vchar1     VARCHAR2(300),
  vchar2     VARCHAR2(300),
  vchar3     VARCHAR2(300),
  vchar4     VARCHAR2(300),
  vchar5     VARCHAR2(300),
  sysid      VARCHAR2(64)
)
;
comment on table SYSUSER
  is '用户表';
comment on column SYSUSER.id
  is '主键';
comment on column SYSUSER.userid
  is '用户账号';
comment on column SYSUSER.username
  is '用户名称';
comment on column SYSUSER.groupid
  is '用户类别 0:系统管理员,1：卫生局 2:卫生院 3：卫生室 4:供货商';
comment on column SYSUSER.pwd
  is '密码';
comment on column SYSUSER.contact
  is '联系方式';
comment on column SYSUSER.addr
  is '地址';
comment on column SYSUSER.email
  is '电子邮件';
comment on column SYSUSER.userstate
  is '用户状态：1正常，0暂停';
comment on column SYSUSER.remark
  is '备注';
comment on column SYSUSER.createtime
  is '创建时间';
comment on column SYSUSER.sex
  is '性别';
comment on column SYSUSER.phone
  is '电话';
comment on column SYSUSER.movephone
  is '移动电话';
comment on column SYSUSER.fax
  is '传真';
comment on column SYSUSER.lastupdate
  is '最后修改时间';
comment on column SYSUSER.sysid
  is '单位id';
alter table SYSUSER
  add constraint PK_SYSUSER primary key (ID);
alter table SYSUSER
  add constraint INDEX_UNIQUE_USERID unique (USERID);

prompt
prompt Creating table USERAREA
prompt =======================
prompt
create table USERAREA
(
  userid VARCHAR2(32) not null,
  areaid VARCHAR2(32) not null,
  vchar1 VARCHAR2(64),
  vchar2 VARCHAR2(64),
  vchar3 VARCHAR2(64)
)
;
comment on table USERAREA
  is '用户区域表';
alter table USERAREA
  add constraint PK_USERAREA primary key (USERID, AREAID);
alter table USERAREA
  add constraint FK_USERAREA_REFERENCE_SYSUSER foreign key (USERID)
  references SYSUSER (ID);

prompt
prompt Creating table USERGYS
prompt ======================
prompt
create table USERGYS
(
  id      VARCHAR2(64) not null,
  mc      VARCHAR2(128) not null,
  lb      VARCHAR2(32),
  xkz     VARCHAR2(128),
  xkzyxq  VARCHAR2(128),
  lxr     VARCHAR2(64),
  dh      VARCHAR2(64),
  jyfw    VARCHAR2(256),
  zcdz    VARCHAR2(128),
  lxdz    VARCHAR2(128),
  yzbm    VARCHAR2(32),
  zzc     VARCHAR2(32),
  cz      VARCHAR2(64),
  frmc    VARCHAR2(16),
  frsfz   VARCHAR2(64),
  zczj    VARCHAR2(32),
  xse     VARCHAR2(32),
  dzyx    VARCHAR2(128),
  wz      VARCHAR2(256),
  dmzh    VARCHAR2(128),
  dmzhyxq VARCHAR2(128),
  yyzz    VARCHAR2(64),
  yyzzyxq VARCHAR2(128),
  xyz     CHAR(1),
  xyzbm   VARCHAR2(64),
  xyzyxq  VARCHAR2(128),
  gdzc    VARCHAR2(32),
  jj      CLOB,
  bz      VARCHAR2(200),
  vchar1  VARCHAR2(128),
  vchar2  VARCHAR2(128),
  vchar3  VARCHAR2(128),
  vchar4  VARCHAR2(128),
  vchar5  VARCHAR2(128)
)
;
comment on column USERGYS.mc
  is '企业名称(中文)';
comment on column USERGYS.lb
  is '企业类别';
comment on column USERGYS.xkz
  is '(生产或经营)许可证';
comment on column USERGYS.xkzyxq
  is '许可证到期时间(年月日)';
comment on column USERGYS.lxr
  is '企业联系人';
comment on column USERGYS.dh
  is '企业联系电话';
comment on column USERGYS.jyfw
  is '经营范围';
comment on column USERGYS.zcdz
  is '注册地址(中文)';
comment on column USERGYS.lxdz
  is '联系地址';
comment on column USERGYS.yzbm
  is '邮政编码';
comment on column USERGYS.zzc
  is '总资产(万元)';
comment on column USERGYS.cz
  is '企业传真';
comment on column USERGYS.frmc
  is '法人代表姓名';
comment on column USERGYS.frsfz
  is '法人身份证';
comment on column USERGYS.zczj
  is '企业注册资金(万元)';
comment on column USERGYS.xse
  is '上年度销售金额(万元)';
comment on column USERGYS.dzyx
  is '电子信箱';
comment on column USERGYS.wz
  is '网址';
comment on column USERGYS.dmzh
  is '企业代码证号';
comment on column USERGYS.dmzhyxq
  is '企业代码有效期';
comment on column USERGYS.yyzz
  is '营业执照';
comment on column USERGYS.yyzzyxq
  is '营业执照有效期';
comment on column USERGYS.xyz
  is '是否有企业信用证';
comment on column USERGYS.xyzbm
  is '信用证号';
comment on column USERGYS.xyzyxq
  is '信用证有效期';
comment on column USERGYS.gdzc
  is '固定资产（万元）';
comment on column USERGYS.jj
  is '公司简介(中文)';
comment on column USERGYS.bz
  is '备注';
alter table USERGYS
  add constraint PK_USERGYS primary key (ID);
alter table USERGYS
  add constraint AK_USERGYS_NEWINDEX2_USERGYS unique (MC);

prompt
prompt Creating table USERGYSAREA
prompt ==========================
prompt
create table USERGYSAREA
(
  usergysid VARCHAR2(64) not null,
  areaid    VARCHAR2(32) not null,
  vchar1    VARCHAR2(64),
  vchar2    VARCHAR2(64),
  vchar3    VARCHAR2(64)
)
;
comment on table USERGYSAREA
  is '供货商供货地区';
alter table USERGYSAREA
  add constraint PK_USERGYSAREA primary key (USERGYSID, AREAID);
alter table USERGYSAREA
  add constraint FK_USERGYSAREA_REF_USERGYS foreign key (USERGYSID)
  references USERGYS (ID);

prompt
prompt Creating table USERJD
prompt =====================
prompt
create table USERJD
(
  id     VARCHAR2(64) not null,
  mc     VARCHAR2(128) not null,
  dz     VARCHAR2(256),
  yzbm   VARCHAR2(32),
  xlr    VARCHAR2(64),
  dh     VARCHAR2(64),
  cz     VARCHAR2(64),
  dzyx   VARCHAR2(128),
  wz     VARCHAR2(128),
  vchar1 VARCHAR2(128),
  vchar2 VARCHAR2(128),
  vchar3 VARCHAR2(128),
  dq     VARCHAR2(1024)
)
;
comment on column USERJD.mc
  is '机构名称';
comment on column USERJD.dz
  is '联系地址';
comment on column USERJD.yzbm
  is '邮政编码';
comment on column USERJD.xlr
  is '联系人';
comment on column USERJD.dh
  is '联系电话';
comment on column USERJD.cz
  is '传真';
comment on column USERJD.dzyx
  is 'email';
comment on column USERJD.wz
  is '网址';
comment on column USERJD.dq
  is '所属地区';
alter table USERJD
  add constraint PK_USERJD primary key (ID);
alter table USERJD
  add constraint AK_USERJD_NEWINDEX2_USERJD unique (MC);

prompt
prompt Creating table USERROLE
prompt =======================
prompt
create table USERROLE
(
  userid   VARCHAR2(32) not null,
  userrole VARCHAR2(32) not null,
  vchar1   VARCHAR2(64)
)
;
comment on table USERROLE
  is '用户角色表';
comment on column USERROLE.userid
  is '用户id，对应用户表主键';
comment on column USERROLE.userrole
  is '用户角色id，对应角色表主键';
alter table USERROLE
  add constraint PK_USERROLE primary key (USERID, USERROLE);
alter table USERROLE
  add constraint FK_USERROLE_REFERENCE_SYSROLE foreign key (USERROLE)
  references SYSROLE (ID);

prompt
prompt Creating table USERYY
prompt =====================
prompt
create table USERYY
(
  id     VARCHAR2(64) not null,
  mc     VARCHAR2(128) not null,
  dz     VARCHAR2(256),
  yzbm   VARCHAR2(32),
  dq     VARCHAR2(128),
  jb     VARCHAR2(32),
  cws    VARCHAR2(64),
  fyljg  CHAR(1),
  dh     VARCHAR2(64),
  yjkdh  VARCHAR2(64),
  lb     VARCHAR2(64),
  ypsr   VARCHAR2(32),
  ywsr   VARCHAR2(32),
  cz     VARCHAR2(64),
  vchar1 VARCHAR2(128),
  vchar2 VARCHAR2(128),
  vchar3 VARCHAR2(128),
  vchar4 VARCHAR2(128),
  vchar5 VARCHAR2(128)
)
;
comment on column USERYY.mc
  is '医院名称';
comment on column USERYY.dz
  is '通讯地址';
comment on column USERYY.yzbm
  is '邮政编码';
comment on column USERYY.dq
  is '所属地区id';
comment on column USERYY.jb
  is '医院级别';
comment on column USERYY.cws
  is '床位数';
comment on column USERYY.fyljg
  is '是否非营利性医疗机构';
comment on column USERYY.dh
  is '院办电话';
comment on column USERYY.yjkdh
  is '药剂科电话';
comment on column USERYY.lb
  is '医院类型';
comment on column USERYY.ypsr
  is '上年度药品收入';
comment on column USERYY.ywsr
  is '上年度业务收入';
comment on column USERYY.cz
  is '院办传真';
alter table USERYY
  add constraint PK_USERYY primary key (ID);
alter table USERYY
  add constraint AK_USERYY_MC_NEWINDEX_USERYY unique (MC);

prompt
prompt Creating table YPPMBACKUP
prompt =========================
prompt
create table YPPMBACKUP
(
  id     VARCHAR2(32) not null,
  bm     VARCHAR2(10) not null,
  mc     VARCHAR2(128) not null,
  jx     VARCHAR2(32) not null,
  dw     VARCHAR2(64),
  zhxs   VARCHAR2(16) not null,
  lb     VARCHAR2(32),
  zt     CHAR(1),
  zl     VARCHAR2(16),
  hl     VARCHAR2(16),
  yb     CHAR(1),
  ybbm   VARCHAR2(128),
  bz     VARCHAR2(200),
  vchar1 VARCHAR2(768),
  vchar2 VARCHAR2(128),
  vchar3 VARCHAR2(128),
  gg     VARCHAR2(128)
)
;
comment on column YPPMBACKUP.id
  is '主键';
comment on column YPPMBACKUP.bm
  is '药品品目号';
comment on column YPPMBACKUP.mc
  is '通用名';
comment on column YPPMBACKUP.jx
  is '剂型';
comment on column YPPMBACKUP.dw
  is '单位';
comment on column YPPMBACKUP.zhxs
  is '转换系数';
comment on column YPPMBACKUP.lb
  is '药品类别';
comment on column YPPMBACKUP.zt
  is '状态';
comment on column YPPMBACKUP.zl
  is '装量';
comment on column YPPMBACKUP.hl
  is '含量';
comment on column YPPMBACKUP.yb
  is '是否医保';
comment on column YPPMBACKUP.ybbm
  is '医保编码';
comment on column YPPMBACKUP.bz
  is '备注';
comment on column YPPMBACKUP.gg
  is '规格';
alter table YPPMBACKUP
  add constraint PK_YPPM primary key (ID);
alter table YPPMBACKUP
  add constraint AK_YYPM_NEWINDEX1_YPPM unique (BM);
alter table YPPMBACKUP
  add constraint AK_YYPM_NEWINDEX2_YPPM unique (ZHXS, GG, MC, JX);

prompt
prompt Creating table YPXX_BACKUP
prompt ==========================
prompt
create table YPXX_BACKUP
(
  id        VARCHAR2(32) not null,
  bm        VARCHAR2(32) not null,
  scqymc    VARCHAR2(128) not null,
  spmc      VARCHAR2(64) not null,
  zbjg      FLOAT not null,
  zpdz      VARCHAR2(128),
  pzwh      VARCHAR2(64),
  pzwhyxq   DATE,
  jky       CHAR(1),
  bzcz      VARCHAR2(64),
  bzdw      VARCHAR2(64),
  lsjg      FLOAT,
  lsjgcc    VARCHAR2(64),
  zlcc      VARCHAR2(32),
  zlccsm    VARCHAR2(200),
  ypjybg    CHAR(1),
  ypjybgbm  VARCHAR2(128),
  ypjybgyxq DATE,
  jyzt      CHAR(1) not null,
  vchar1    VARCHAR2(128),
  vchar2    VARCHAR2(128),
  vchar3    VARCHAR2(128),
  dw        VARCHAR2(32),
  mc        VARCHAR2(128),
  jx        VARCHAR2(32),
  gg        VARCHAR2(128),
  zhxs      VARCHAR2(16),
  pinyin    VARCHAR2(768),
  lb        VARCHAR2(32)
)
;

prompt
prompt Creating table YYBUSINESS
prompt =========================
prompt
create table YYBUSINESS
(
  id        VARCHAR2(32) not null,
  yycgdid   VARCHAR2(32) not null,
  useryyid  VARCHAR2(64) not null,
  ypxxid    VARCHAR2(32) not null,
  zbjg      FLOAT not null,
  jyjg      FLOAT not null,
  cgl       INTEGER not null,
  cgje      FLOAT not null,
  cgzt      CHAR(1) not null,
  rkl       INTEGER,
  rkje      FLOAT,
  rkdh      VARCHAR2(32),
  ypph      VARCHAR2(32),
  ypyxq     FLOAT,
  rktime    TIMESTAMP(6),
  fhtime    TIMESTAMP(6),
  yythdid   VARCHAR2(32),
  thl       VARCHAR2(32),
  thje      FLOAT,
  thzt      CHAR(1),
  thyy      VARCHAR2(100),
  yyjsdid   VARCHAR2(32),
  jsl       INTEGER,
  jsje      FLOAT,
  jszt      CHAR(1),
  vchar1    VARCHAR2(64),
  vchar2    VARCHAR2(64),
  vchar3    VARCHAR2(64),
  usergysid VARCHAR2(64)
)
;
comment on table YYBUSINESS
  is '医院交易明细表(用于交易查询统计)';
comment on column YYBUSINESS.yycgdid
  is '采购单id';
comment on column YYBUSINESS.useryyid
  is '医院id';
comment on column YYBUSINESS.ypxxid
  is '药品信息id';
comment on column YYBUSINESS.zbjg
  is '中标价';
comment on column YYBUSINESS.jyjg
  is '交易价';
comment on column YYBUSINESS.cgl
  is '采购量';
comment on column YYBUSINESS.cgje
  is '采购金额';
comment on column YYBUSINESS.cgzt
  is '存储数据字典：1、未确认送货  2、已发货、3、已入库';
comment on column YYBUSINESS.rkl
  is '入库量';
comment on column YYBUSINESS.rkje
  is '入库金额';
comment on column YYBUSINESS.rkdh
  is '发票号或入库单号';
comment on column YYBUSINESS.ypph
  is '药品批号';
comment on column YYBUSINESS.ypyxq
  is '药品有效期(年)';
comment on column YYBUSINESS.rktime
  is '入库时间（年月日时分秒）';
comment on column YYBUSINESS.fhtime
  is '发货时间（年月日时分秒）';
comment on column YYBUSINESS.yythdid
  is '退货单id';
comment on column YYBUSINESS.thl
  is '退货量';
comment on column YYBUSINESS.thje
  is '退货金额';
comment on column YYBUSINESS.thzt
  is '退货状态 1、未确认退货 2、已确认退货';
comment on column YYBUSINESS.thyy
  is '退货原因';
comment on column YYBUSINESS.yyjsdid
  is '结算单id';
comment on column YYBUSINESS.jsl
  is '结算量';
comment on column YYBUSINESS.jsje
  is '结算金额';
comment on column YYBUSINESS.jszt
  is '结算状态1、未确认结算 2、已确认结算';
comment on column YYBUSINESS.usergysid
  is '供货商id';
create index INDEX_YYBUSINESS_1 on YYBUSINESS (CGZT, THZT, YYCGDID, YYJSDID, USERGYSID, YYTHDID, JSZT);
alter table YYBUSINESS
  add constraint PK_YYBUSINESS primary key (ID);
alter table YYBUSINESS
  add constraint UNI_YYBUSINESS unique (YYCGDID, YPXXID);
alter table YYBUSINESS
  add constraint FK_YYBUSINESS_2 foreign key (USERYYID)
  references USERYY (ID);
alter table YYBUSINESS
  add constraint FK_YYBUSINESS_3 foreign key (YPXXID)
  references YPXX (ID);

prompt
prompt Creating table YYBUSINESS2014
prompt =============================
prompt
create table YYBUSINESS2014
(
  id        VARCHAR2(32) not null,
  yycgdid   VARCHAR2(32) not null,
  useryyid  VARCHAR2(64) not null,
  ypxxid    VARCHAR2(32) not null,
  zbjg      FLOAT not null,
  jyjg      FLOAT not null,
  cgl       INTEGER not null,
  cgje      FLOAT not null,
  cgzt      CHAR(1) not null,
  rkl       INTEGER,
  rkje      FLOAT,
  rkdh      VARCHAR2(32),
  ypph      VARCHAR2(32),
  ypyxq     FLOAT,
  rktime    TIMESTAMP(6),
  fhtime    TIMESTAMP(6),
  yythdid   VARCHAR2(32),
  thl       VARCHAR2(32),
  thje      FLOAT,
  thzt      CHAR(1),
  thyy      VARCHAR2(100),
  yyjsdid   VARCHAR2(32),
  jsl       INTEGER,
  jsje      FLOAT,
  jszt      CHAR(1),
  vchar1    VARCHAR2(64),
  vchar2    VARCHAR2(64),
  vchar3    VARCHAR2(64),
  usergysid VARCHAR2(64)
)
;
create index INDEX_YYBUSINESS2014_1 on YYBUSINESS2014 (CGZT, THZT, YYCGDID, YYJSDID, USERGYSID, YYTHDID, JSZT);
alter table YYBUSINESS2014
  add constraint PK_YYBUSINESS2014 primary key (ID);
alter table YYBUSINESS2014
  add constraint UNI_YYBUSINESS2014 unique (YYCGDID, YPXXID);
alter table YYBUSINESS2014
  add constraint FK_YYBUSINESS2014_2 foreign key (USERYYID)
  references USERYY (ID);
alter table YYBUSINESS2014
  add constraint FK_YYBUSINESS2014_3 foreign key (YPXXID)
  references YPXX (ID);

prompt
prompt Creating table YYBUSINESS2015
prompt =============================
prompt
create table YYBUSINESS2015
(
  id        VARCHAR2(32) not null,
  yycgdid   VARCHAR2(32) not null,
  useryyid  VARCHAR2(64) not null,
  ypxxid    VARCHAR2(32) not null,
  zbjg      FLOAT not null,
  jyjg      FLOAT not null,
  cgl       INTEGER not null,
  cgje      FLOAT not null,
  cgzt      CHAR(1) not null,
  rkl       INTEGER,
  rkje      FLOAT,
  rkdh      VARCHAR2(32),
  ypph      VARCHAR2(32),
  ypyxq     FLOAT,
  rktime    TIMESTAMP(6),
  fhtime    TIMESTAMP(6),
  yythdid   VARCHAR2(32),
  thl       VARCHAR2(32),
  thje      FLOAT,
  thzt      CHAR(1),
  thyy      VARCHAR2(100),
  yyjsdid   VARCHAR2(32),
  jsl       INTEGER,
  jsje      FLOAT,
  jszt      CHAR(1),
  vchar1    VARCHAR2(64),
  vchar2    VARCHAR2(64),
  vchar3    VARCHAR2(64),
  usergysid VARCHAR2(64)
)
;
create index INDEX_YYBUSINESS2015_1 on YYBUSINESS2015 (CGZT, THZT, YYCGDID, YYJSDID, USERGYSID, YYTHDID, JSZT);
alter table YYBUSINESS2015
  add constraint PK_YYBUSINESS2015 primary key (ID);
alter table YYBUSINESS2015
  add constraint UNI_YYBUSINESS2015 unique (YYCGDID, YPXXID);
alter table YYBUSINESS2015
  add constraint FK_YYBUSINESS2015_2 foreign key (USERYYID)
  references USERYY (ID);
alter table YYBUSINESS2015
  add constraint FK_YYBUSINESS2015_3 foreign key (YPXXID)
  references YPXX (ID);

prompt
prompt Creating table YYCGD
prompt ====================
prompt
create table YYCGD
(
  id       VARCHAR2(32) not null,
  bm       VARCHAR2(10) not null,
  mc       VARCHAR2(128) not null,
  useryyid VARCHAR2(64) not null,
  lxr      VARCHAR2(64),
  lxdh     VARCHAR2(64),
  cjr      VARCHAR2(64),
  cjtime   TIMESTAMP(6) default SYSDATE not null,
  tjtime   TIMESTAMP(6),
  bz       VARCHAR2(256),
  zt       CHAR(1) not null,
  shyj     VARCHAR2(256),
  shtime   TIMESTAMP(6),
  vchar1   VARCHAR2(64),
  vchar2   VARCHAR2(64),
  vchar3   VARCHAR2(64),
  vchar4   VARCHAR2(128),
  vchar5   VARCHAR2(128),
  xgtime   TIMESTAMP(6)
)
;
comment on table YYCGD
  is '医院采购单表';
comment on column YYCGD.bm
  is '采购单编号';
comment on column YYCGD.mc
  is '采购单名称';
comment on column YYCGD.useryyid
  is '医院id';
comment on column YYCGD.lxr
  is '联系人';
comment on column YYCGD.lxdh
  is '联系电话';
comment on column YYCGD.cjr
  is '建单人';
comment on column YYCGD.cjtime
  is '建单时间(年月日时分秒)';
comment on column YYCGD.tjtime
  is '提交时间(年月日时分秒)';
comment on column YYCGD.bz
  is '备注';
comment on column YYCGD.zt
  is '采购单状态(存储数据字典：1：未提交、2：已提交未审核、3：审核通过、4：审核不通过)';
comment on column YYCGD.shyj
  is '审核意见';
comment on column YYCGD.shtime
  is '审核时间(年月日时分秒)';
comment on column YYCGD.xgtime
  is '最近修改时间';
create index INDEX_YYCGD_1 on YYCGD (USERYYID, ZT);
alter table YYCGD
  add constraint PK_YYCGD primary key (ID);
alter table YYCGD
  add constraint UNI_YYCGD unique (BM);
alter table YYCGD
  add constraint FK_YYCGD_USERYYID foreign key (USERYYID)
  references USERYY (ID);

prompt
prompt Creating table YYCGD2014
prompt ========================
prompt
create table YYCGD2014
(
  id       VARCHAR2(32) not null,
  bm       VARCHAR2(10) not null,
  mc       VARCHAR2(128) not null,
  useryyid VARCHAR2(64) not null,
  lxr      VARCHAR2(64),
  lxdh     VARCHAR2(64),
  cjr      VARCHAR2(64),
  cjtime   TIMESTAMP(6) not null,
  tjtime   TIMESTAMP(6),
  xgtime   TIMESTAMP(6),
  bz       VARCHAR2(256),
  ksghdate DATE,
  jsghdate DATE,
  zt       CHAR(1) not null,
  shyj     VARCHAR2(256),
  shtime   TIMESTAMP(6),
  vchar1   VARCHAR2(64),
  vchar2   VARCHAR2(64),
  vchar3   VARCHAR2(64),
  vchar4   VARCHAR2(128),
  vchar5   VARCHAR2(128)
)
;
create index INDEX_YYCGD2014_1 on YYCGD2014 (USERYYID, ZT);
create index INDEX_YYCGD2014_2 on YYCGD2014 (CJTIME);
alter table YYCGD2014
  add constraint PK_YYCGD2014 primary key (ID);
alter table YYCGD2014
  add constraint UNI_YYCGD2014 unique (BM);

prompt
prompt Creating table YYCGDMX
prompt ======================
prompt
create table YYCGDMX
(
  id        VARCHAR2(32) not null,
  yycgdid   VARCHAR2(32) not null,
  ypxxid    VARCHAR2(32) not null,
  usergysid VARCHAR2(64) not null,
  zbjg      FLOAT,
  jyjg      FLOAT,
  cgl       INTEGER,
  cgje      FLOAT,
  cgzt      CHAR(1),
  vchar1    VARCHAR2(64),
  vchar2    VARCHAR2(64),
  vchar3    VARCHAR2(64),
  vchar4    VARCHAR2(128),
  vchar5    VARCHAR2(128)
)
;
comment on table YYCGDMX
  is '医院采购单明细表';
comment on column YYCGDMX.yycgdid
  is '采购单id';
comment on column YYCGDMX.ypxxid
  is '药品信息id';
comment on column YYCGDMX.usergysid
  is '供货企业id';
comment on column YYCGDMX.zbjg
  is '中标价';
comment on column YYCGDMX.jyjg
  is '交易价';
comment on column YYCGDMX.cgl
  is '采购量';
comment on column YYCGDMX.cgje
  is '采购金额';
comment on column YYCGDMX.cgzt
  is '存储数据字典：1、未确认送货  2、已发货、3、已入库、4无法供货';
alter table YYCGDMX
  add constraint PK_YYCGDMX primary key (ID);
alter table YYCGDMX
  add constraint AK_YYCGDMX_NEWINDEX1_YYCGDMX unique (YYCGDID, YPXXID);
alter table YYCGDMX
  add constraint FK_YYCGDMX_USERGYSID foreign key (USERGYSID)
  references USERGYS (ID);
alter table YYCGDMX
  add constraint FK_YYCGDMX_YYXID foreign key (YPXXID)
  references YPXX (ID);

prompt
prompt Creating table YYCGDMX2014
prompt ==========================
prompt
create table YYCGDMX2014
(
  id        VARCHAR2(32) not null,
  yycgdid   VARCHAR2(32) not null,
  usergysid VARCHAR2(64) not null,
  ypxxid    VARCHAR2(32) not null,
  zbjg      FLOAT not null,
  jyjg      FLOAT,
  cgl       INTEGER,
  cgje      FLOAT,
  cgzt      CHAR(1) not null,
  vchar1    VARCHAR2(64),
  vchar2    VARCHAR2(64),
  vchar3    VARCHAR2(64),
  vchar4    VARCHAR2(128),
  vchar5    VARCHAR2(128)
)
;
alter table YYCGDMX2014
  add constraint PK_YYCGDMX2014 primary key (ID);
alter table YYCGDMX2014
  add constraint UNI_YYCGDMX2014 unique (YYCGDID, YPXXID);
alter table YYCGDMX2014
  add constraint FK_YYCGDMX2014_1 foreign key (YYCGDID)
  references YYCGD2014 (ID);
alter table YYCGDMX2014
  add constraint FK_YYCGDMX2014_3 foreign key (YPXXID)
  references YPXX (ID);

prompt
prompt Creating table YYCGDRK
prompt ======================
prompt
create table YYCGDRK
(
  id      VARCHAR2(32) not null,
  yycgdid VARCHAR2(32) not null,
  ypxxid  VARCHAR2(32) not null,
  vchar1  VARCHAR2(64),
  vchar2  VARCHAR2(64),
  vchar3  VARCHAR2(64),
  vchar4  VARCHAR2(128),
  vchar5  VARCHAR2(128),
  rkl     INTEGER not null,
  rkje    FLOAT not null,
  rkdh    VARCHAR2(32) not null,
  ypph    VARCHAR2(32) not null,
  ypyxq   FLOAT not null,
  rktime  TIMESTAMP(6) default SYSDATE not null,
  cgzt    CHAR(1)
)
;
comment on table YYCGDRK
  is '医院交易采购单入库表';
comment on column YYCGDRK.yycgdid
  is '采购单id';
comment on column YYCGDRK.ypxxid
  is '药品信息id';
comment on column YYCGDRK.rkl
  is '入库量';
comment on column YYCGDRK.rkje
  is '入库金额';
comment on column YYCGDRK.rkdh
  is '发票号或入库单号';
comment on column YYCGDRK.ypph
  is '药品批号';
comment on column YYCGDRK.ypyxq
  is '药品有效期(年)';
comment on column YYCGDRK.rktime
  is '入库时间（年月日时分秒）';
comment on column YYCGDRK.cgzt
  is '采购状态,已入库';
create unique index AK_YYCGDRK_NEWINDEX1_YYCGDRK on YYCGDRK (YYCGDID, YPXXID);
create unique index PK_YYCGDRK on YYCGDRK (ID);
alter table YYCGDRK
  add constraint PK_YYBUSINESSCGDRK primary key (ID);
alter table YYCGDRK
  add constraint UNI_YYBUSINESSCGDRK unique (YYCGDID, YPXXID);

prompt
prompt Creating table YYCGDRK2014
prompt ==========================
prompt
create table YYCGDRK2014
(
  id      VARCHAR2(32) not null,
  yycgdid VARCHAR2(32) not null,
  ypxxid  VARCHAR2(32) not null,
  vchar1  VARCHAR2(64),
  vchar2  VARCHAR2(64),
  vchar3  VARCHAR2(64),
  vchar4  VARCHAR2(128),
  vchar5  VARCHAR2(128),
  rkl     INTEGER not null,
  cgzt    CHAR(1) not null,
  rkje    FLOAT not null,
  rkdh    VARCHAR2(32) not null,
  ypph    VARCHAR2(32) not null,
  ypyxq   FLOAT not null,
  rktime  TIMESTAMP(6) default SYSDATE not null
)
;
alter table YYCGDRK2014
  add constraint PK_YYCGDRK2014 primary key (ID);
alter table YYCGDRK2014
  add constraint UNI_YYCGDRK2014 unique (YYCGDID, YPXXID);

prompt
prompt Creating table YYJSD
prompt ====================
prompt
create table YYJSD
(
  id       VARCHAR2(32) not null,
  bm       VARCHAR2(10) not null,
  mc       VARCHAR2(128) not null,
  useryyid VARCHAR2(64) not null,
  lxr      VARCHAR2(64),
  lxdh     VARCHAR2(64),
  cjr      VARCHAR2(64),
  cjtime   TIMESTAMP(6) not null,
  xgtime   TIMESTAMP(6),
  tjtime   TIMESTAMP(6) not null,
  bz       VARCHAR2(256),
  zt       CHAR(1),
  vchar1   VARCHAR2(64),
  vchar2   VARCHAR2(64),
  vchar3   VARCHAR2(64)
)
;
comment on table YYJSD
  is '医院交易结算单表(用于交易查询统计)';
comment on column YYJSD.id
  is '结算单id';
comment on column YYJSD.bm
  is '结算单编号';
comment on column YYJSD.mc
  is '结算单名称';
comment on column YYJSD.useryyid
  is '医院id';
comment on column YYJSD.lxr
  is '联系人';
comment on column YYJSD.lxdh
  is '联系电话';
comment on column YYJSD.cjr
  is '建单人';
comment on column YYJSD.cjtime
  is '建单时间(年月日时分秒)';
comment on column YYJSD.xgtime
  is '最近修改时间';
comment on column YYJSD.tjtime
  is '提交时间(年月日时分秒)';
comment on column YYJSD.bz
  is '备注';
comment on column YYJSD.zt
  is '存储数据字典：1：未提交、2：已提交至供货商';
create index INDEX_YYBUSINESSJSD_1 on YYJSD (USERYYID);
alter table YYJSD
  add constraint PK_YYBUSINESSJSD primary key (ID);
alter table YYJSD
  add constraint UNI_YYBUSSINESSJSD unique (BM);

prompt
prompt Creating table YYJSD2014
prompt ========================
prompt
create table YYJSD2014
(
  id       VARCHAR2(32) not null,
  bm       VARCHAR2(10) not null,
  mc       VARCHAR2(128) not null,
  useryyid VARCHAR2(64) not null,
  lxr      VARCHAR2(64),
  lxdh     VARCHAR2(64),
  cjr      VARCHAR2(64),
  cjtime   TIMESTAMP(6) not null,
  tjtime   TIMESTAMP(6),
  xgtime   TIMESTAMP(6),
  bz       VARCHAR2(256),
  zt       CHAR(1) not null,
  vchar1   VARCHAR2(64),
  vchar2   VARCHAR2(64),
  vchar3   VARCHAR2(64)
)
;
create index INDEX_YYJSD2014_1 on YYJSD2014 (USERYYID);
alter table YYJSD2014
  add constraint PK_YYJSD2014 primary key (ID);
alter table YYJSD2014
  add constraint UNI_YYJSD2014 unique (BM);

prompt
prompt Creating table YYJSDMX
prompt ======================
prompt
create table YYJSDMX
(
  id      VARCHAR2(32) not null,
  yyjsdid VARCHAR2(32) not null,
  ypxxid  VARCHAR2(32) not null,
  yycgdid VARCHAR2(32) not null,
  jsl     INTEGER not null,
  jsje    FLOAT not null,
  jszt    CHAR(1) not null,
  vchar1  VARCHAR2(64),
  vchar2  VARCHAR2(64),
  vchar3  VARCHAR2(64),
  vchar4  VARCHAR2(128),
  vchar5  VARCHAR2(128)
)
;
comment on column YYJSDMX.yyjsdid
  is '结算单id';
comment on column YYJSDMX.ypxxid
  is '药品信息id';
comment on column YYJSDMX.yycgdid
  is '采购单id';
comment on column YYJSDMX.jsl
  is '结算量';
comment on column YYJSDMX.jsje
  is '结算金额';
comment on column YYJSDMX.jszt
  is '结算状态1、未确认结算 2、已确认结算';
alter table YYJSDMX
  add constraint PK_YYBUSINESSJSDMX primary key (ID);
alter table YYJSDMX
  add constraint UNI_YYBUSINESSJSDMX unique (YPXXID, YYCGDID);

prompt
prompt Creating table YYJSDMX2014
prompt ==========================
prompt
create table YYJSDMX2014
(
  id      VARCHAR2(32) not null,
  yyjsdid VARCHAR2(32) not null,
  ypxxid  VARCHAR2(32) not null,
  yycgdid VARCHAR2(32) not null,
  jsl     INTEGER not null,
  jsje    FLOAT not null,
  jszt    CHAR(1) not null,
  vchar1  VARCHAR2(64),
  vchar2  VARCHAR2(64),
  vchar3  VARCHAR2(64),
  vchar4  VARCHAR2(128),
  vchar5  VARCHAR2(128)
)
;
alter table YYJSDMX2014
  add constraint PK_YYJSDMX2014 primary key (ID);
alter table YYJSDMX2014
  add constraint UNI_YYJSDMX2014 unique (YPXXID, YYCGDID);

prompt
prompt Creating table YYTHD
prompt ====================
prompt
create table YYTHD
(
  id       VARCHAR2(32) not null,
  bm       VARCHAR2(10),
  mc       VARCHAR2(128),
  useryyid VARCHAR2(64),
  lxr      VARCHAR2(64),
  lxdh     VARCHAR2(64),
  cjr      VARCHAR2(64),
  cjtime   TIMESTAMP(6),
  xgtime   TIMESTAMP(6),
  tjtime   TIMESTAMP(6),
  bz       VARCHAR2(256),
  zt       CHAR(1),
  vchar1   VARCHAR2(64),
  vchar2   VARCHAR2(64),
  vchar3   VARCHAR2(64)
)
;
comment on table YYTHD
  is '医院交易退货单表(用于交易查询统计)';
comment on column YYTHD.id
  is '退货单id';
comment on column YYTHD.bm
  is '退货单编号';
comment on column YYTHD.mc
  is '退货单名称';
comment on column YYTHD.useryyid
  is '医院id';
comment on column YYTHD.lxr
  is '联系人';
comment on column YYTHD.lxdh
  is '联系电话';
comment on column YYTHD.cjr
  is '建单人';
comment on column YYTHD.cjtime
  is '建单时间(年月日时分秒)';
comment on column YYTHD.xgtime
  is '修改时间';
comment on column YYTHD.tjtime
  is '提交时间(年月日时分秒)';
comment on column YYTHD.bz
  is '备注';
comment on column YYTHD.zt
  is '存储数据字典：1：未提交、2：已提交至供货商';
create index INDEX_YYBUSSINESSTHD_1 on YYTHD (USERYYID);
alter table YYTHD
  add constraint PK_YYBUSSINESSTHD primary key (ID);
alter table YYTHD
  add constraint UNI_YYBUSSINESSTHD unique (BM);

prompt
prompt Creating table YYTHD2014
prompt ========================
prompt
create table YYTHD2014
(
  id       VARCHAR2(32) not null,
  bm       VARCHAR2(10) not null,
  mc       VARCHAR2(128) not null,
  useryyid VARCHAR2(64) not null,
  lxr      VARCHAR2(64),
  lxdh     VARCHAR2(64),
  cjr      VARCHAR2(64),
  cjtime   TIMESTAMP(6) not null,
  tjtime   TIMESTAMP(6),
  xgtime   TIMESTAMP(6),
  bz       VARCHAR2(256),
  zt       CHAR(1) not null,
  vchar1   VARCHAR2(64),
  vchar2   VARCHAR2(64),
  vchar3   VARCHAR2(64)
)
;
create index INDEX_YYTHD2014_1 on YYTHD2014 (USERYYID);
alter table YYTHD2014
  add constraint PK_YYTHD2014 primary key (ID);
alter table YYTHD2014
  add constraint UNI_YYTHD2014 unique (BM);

prompt
prompt Creating table YYTHDMX
prompt ======================
prompt
create table YYTHDMX
(
  id      VARCHAR2(32) not null,
  yythdid VARCHAR2(32) not null,
  yycgdid VARCHAR2(32) not null,
  ypxxid  VARCHAR2(32) not null,
  thl     INTEGER not null,
  thje    FLOAT not null,
  thzt    CHAR(1) not null,
  thyy    VARCHAR2(100),
  vchar1  VARCHAR2(64),
  vchar2  VARCHAR2(64),
  vchar3  VARCHAR2(64),
  vchar4  VARCHAR2(128),
  vchar5  VARCHAR2(128)
)
;
comment on column YYTHDMX.yythdid
  is '退货单id';
comment on column YYTHDMX.yycgdid
  is '采购单id';
comment on column YYTHDMX.ypxxid
  is '药品信息id';
comment on column YYTHDMX.thl
  is '退货量';
comment on column YYTHDMX.thje
  is '退货金额';
comment on column YYTHDMX.thzt
  is '退货状态 1、未确认退货 2、已确认退货';
comment on column YYTHDMX.thyy
  is '退货原因';
alter table YYTHDMX
  add constraint PK_YYBUSINESSTHDM primary key (ID);
alter table YYTHDMX
  add constraint UNI_YYBUSINESSTHDM unique (YYCGDID, YPXXID);

prompt
prompt Creating table YYTHDMX2014
prompt ==========================
prompt
create table YYTHDMX2014
(
  id      VARCHAR2(32) not null,
  yythdid VARCHAR2(32) not null,
  ypxxid  VARCHAR2(32) not null,
  yycgdid VARCHAR2(32) not null,
  thl     INTEGER not null,
  thje    FLOAT not null,
  thzt    CHAR(1) not null,
  thyy    VARCHAR2(100),
  vchar1  VARCHAR2(64),
  vchar2  VARCHAR2(64),
  vchar3  VARCHAR2(64),
  vchar4  VARCHAR2(128),
  vchar5  VARCHAR2(128)
)
;
alter table YYTHDMX2014
  add constraint PK_YYTHDMX2014 primary key (ID);
alter table YYTHDMX2014
  add constraint UNI_YYTHDMX2014 unique (YPXXID, YYCGDID);

prompt
prompt Creating table YYYPML
prompt =====================
prompt
create table YYYPML
(
  id        VARCHAR2(32) not null,
  useryyid  VARCHAR2(64) not null,
  ypxxid    VARCHAR2(32) not null,
  usergysid VARCHAR2(64) not null,
  vchar1    VARCHAR2(64),
  vchar2    VARCHAR2(64)
)
;
comment on table YYYPML
  is '医院药品目录表';
comment on column YYYPML.useryyid
  is '医院id';
comment on column YYYPML.ypxxid
  is '药品信息id';
comment on column YYYPML.usergysid
  is '药品供货企业id';
alter table YYYPML
  add constraint PK_YYYPML primary key (ID);
alter table YYYPML
  add constraint AK_YYYPML_NEWINDEX1 unique (USERYYID, YPXXID, USERGYSID);
alter table YYYPML
  add constraint FK_YYYPML foreign key (YPXXID)
  references YPXX (ID);

prompt
prompt Creating sequence SEQ_SYS_LOG
prompt =============================
prompt
create sequence SEQ_SYS_LOG
minvalue 1
maxvalue 999999999
start with 81
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_MODULE
prompt ================================
prompt
create sequence SEQ_SYS_MODULE
minvalue 1
maxvalue 999999999999999999999999999
start with 20000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_OPERATION
prompt ===================================
prompt
create sequence SEQ_SYS_OPERATION
minvalue 1
maxvalue 999999999999999999999999999
start with 20000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_ROLE
prompt ==============================
prompt
create sequence SEQ_SYS_ROLE
minvalue 1
maxvalue 999999999999999999999999999
start with 20000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_USER
prompt ==============================
prompt
create sequence SEQ_SYS_USER
minvalue 1
maxvalue 999999999999999999999999999
start with 20000
increment by 1
cache 20;

prompt
prompt Creating sequence YPXXBM
prompt ========================
prompt
create sequence YPXXBM
minvalue 200000
maxvalue 999999999999
start with 200000
increment by 1
cache 20;

prompt
prompt Creating sequence YYCGDBM
prompt =========================
prompt
create sequence YYCGDBM
minvalue 1
maxvalue 9999999
start with 1000100
increment by 1
cache 20;

prompt
prompt Creating sequence YYCGDBM2014
prompt =============================
prompt
create sequence YYCGDBM2014
minvalue 1
maxvalue 999999
start with 100020
increment by 1
cache 20;

prompt
prompt Creating sequence YYJSDBM
prompt =========================
prompt
create sequence YYJSDBM
minvalue 1
maxvalue 9999999
start with 1000000
increment by 1
cache 20;

prompt
prompt Creating sequence YYJSDBM2014
prompt =============================
prompt
create sequence YYJSDBM2014
minvalue 1
maxvalue 999999
start with 100000
increment by 1
cache 20;

prompt
prompt Creating sequence YYTHDBM
prompt =========================
prompt
create sequence YYTHDBM
minvalue 1
maxvalue 9999999
start with 1000040
increment by 1
cache 20;

prompt
prompt Creating sequence YYTHDBM2014
prompt =============================
prompt
create sequence YYTHDBM2014
minvalue 1
maxvalue 999999
start with 100000
increment by 1
cache 20;

prompt
prompt Creating view ROLE_AUTH
prompt =======================
prompt
CREATE OR REPLACE FORCE VIEW ROLE_AUTH AS
SELECT bss_sys_role.ROLEID,
       bss_sys_rolesys.SYSID,
       bss_sys_rolenode.NODEID,
       bss_sys_rolemodule.MODULEID,
       bss_sys_roleoperate.operateid
  FROM bss_sys_role, bss_sys_rolesys, bss_sys_rolenode, bss_sys_rolemodule,bss_sys_roleoperate
 WHERE bss_sys_role.ROLEID = bss_sys_rolesys.ROLEID
   AND bss_sys_rolesys.RSID = bss_sys_rolenode.RSID
   AND bss_sys_rolenode.RNID = bss_sys_rolemodule.RNID
   and bss_sys_rolemodule.rmid = bss_sys_roleoperate.rmid;

prompt
prompt Creating procedure CREATE_BUSINESS
prompt ==================================
prompt
create or replace procedure create_business(year in varchar2) Authid Current_User as

  v_tab_sl number;
  business varchar2(100);
  businesscgd varchar2(100);
  str varchar2(1000);
begin

        -- 表名称
        businesscgd := 'Yybusinesscgd' || year;
        business := 'Yybusiness' || year;
        -- 验证表是否存在
        select count(1) into v_tab_sl from user_tables where table_name=upper(business);
        if v_tab_sl = 0 then


        str := 'create table ' || business ||
               '(ID            VARCHAR2(32) not null,' ||
                'yycgdid   VARCHAR2(32) not null,' ||
                'useryyid  VARCHAR2(64) not null,' ||
                'ypxxid    VARCHAR2(32) not null,' ||
                'zbjg      FLOAT not null,' ||
                'jyjg      FLOAT not null,' ||
                'cgl       INTEGER not null,' ||
                'cgje      FLOAT not null,' ||
                'cgzt      CHAR(1) not null,' ||
                'rkl       INTEGER,' ||
                'rkje      FLOAT,' ||
                'rkdh      VARCHAR2(32),' ||
                'ypph      VARCHAR2(32),' ||
                'ypyxq     FLOAT,' ||
                'rktime    TIMESTAMP(6),' ||
                'fhtime    TIMESTAMP(6),' ||
                'yythdid   VARCHAR2(32),' ||
                'thl       VARCHAR2(32),' ||
                'thje      FLOAT,' ||
                'thzt      CHAR(1),' ||
                'thyy      VARCHAR2(100),' ||
                'yyjsdid   VARCHAR2(32),' ||
                'jsl       INTEGER,' ||
                'jsje      FLOAT,' ||
                'jszt      CHAR(1),' ||
                'vchar1    VARCHAR2(64),' ||
                'vchar2    VARCHAR2(64),' ||
                'vchar3    VARCHAR2(64),' ||
                'usergysid VARCHAR2(64)' ||
                               
               ')';
        execute immediate str;
 str := 'create index INDEX_'||business||'_1 on '||business||' (CGZT, THZT, YYCGDID, YYJSDID, USERGYSID, YYTHDID, JSZT)';
 execute immediate str;
str := 'alter table '||business||' add constraint PK_'||business||' primary key (ID)';
execute immediate str;
str := 'alter table '||business||' add constraint UNI_'||business||' unique (YYCGDID, YPXXID)';
execute immediate str;
str := 'alter table '||business||' add constraint FK_'||business||'_1 foreign key (YYCGDID) references '||businesscgd||' (ID)';
execute immediate str;
str := 'alter table '||business||'  add constraint FK_'||business||'_2 foreign key (USERYYID)  references USERYY (ID)';
execute immediate str;
str := 'alter table '||business||'  add constraint FK_'||business||'_3 foreign key (YPXXID)  references YPXX (ID)';
execute immediate str;
        end if;

end create_business;
/

prompt
prompt Creating procedure CREATE_BUSINESSCGD
prompt =====================================
prompt
create or replace procedure create_businesscgd(year in varchar2) Authid Current_User as

  v_tab_sl number;
  yycgd varchar2(100);
  str varchar2(1000);
begin
 -- 表名称
        yycgd := 'yycgd' || year;
        -- 验证表是否存在
        select count(1) into v_tab_sl from user_tables where table_name=upper(yycgd);
        if v_tab_sl = 0 then


        str := 'create table ' || yycgd ||
               '(ID            VARCHAR2(32) not null,' ||
    'bm       VARCHAR2(10) not null,' ||
    'mc       VARCHAR2(128) not null,' ||
    'useryyid VARCHAR2(64) not null,' ||
    'lxr      VARCHAR2(64),' ||
    'lxdh     VARCHAR2(64),' ||
    'cjr      VARCHAR2(64),' ||
    'cjtime   TIMESTAMP(6) not null,' ||
    'tjtime   TIMESTAMP(6),' ||
    'xgtime   TIMESTAMP(6),' ||
    'bz       VARCHAR2(256),' ||
    'ksghdate DATE,' ||
    'jsghdate DATE,' ||
    'zt       CHAR(1) not null,' ||
    'shyj     VARCHAR2(256),' ||
    'shtime   TIMESTAMP(6),' ||
    'vchar1   VARCHAR2(64),' ||
    'vchar2   VARCHAR2(64),' ||
    'vchar3   VARCHAR2(64),' ||
    'vchar4   VARCHAR2(128),' ||
    'vchar5   VARCHAR2(128)' ||
                               
               ')';
        execute immediate str;
 str := 'create index INDEX_'||yycgd||'_1 on '||yycgd||' (USERYYID, ZT)';
 execute immediate str;
str := 'create index INDEX_'||yycgd||'_2 on '||yycgd||' (CJTIME)';
execute immediate str;
str := 'alter table '||yycgd||'  add constraint PK_'||yycgd||' primary key (ID)';
execute immediate str;
str := 'alter table '||yycgd||'  add constraint UNI_'||yycgd||' unique (BM)';
execute immediate str;

str := 'create sequence YYCGDBM'||year ||
' minvalue 1 '||
' maxvalue 999999 '||
' start with 100000 '||
' increment by 1 '||
' cache 20';
execute immediate str;
        end if;

end create_businesscgd;
/

prompt
prompt Creating procedure CREATE_BUSINESSCGDMX
prompt =======================================
prompt
create or replace procedure create_businesscgdmx(year in varchar2) Authid Current_User as

  v_tab_sl number;
  yycgdmx varchar2(100);
  yycgd varchar2(100);
  business varchar2(100);
  str varchar2(1000);
begin

        -- 表名称
        yycgd := 'yycgd' || year;
        yycgdmx := 'yycgdmx' || year;
        business :='yybusiness'||year;
        -- 验证表是否存在
        select count(1) into v_tab_sl from user_tables where table_name=upper(yycgdmx);
        if v_tab_sl = 0 then


        str := 'create table ' || yycgdmx ||
               '(ID            VARCHAR2(32) not null,' ||
                'yycgdid   VARCHAR2(32) not null,' ||
                'usergysid VARCHAR2(64) not null,' ||
                'ypxxid    VARCHAR2(32) not null,' ||
                'zbjg      FLOAT not null,' ||
                'jyjg      FLOAT ,' ||
                'cgl       INTEGER ,' ||
                'cgje      FLOAT ,' ||
                'cgzt      CHAR(1) not null,' ||
               
                'vchar1    VARCHAR2(64),' ||
                'vchar2    VARCHAR2(64),' ||
                'vchar3    VARCHAR2(64),' ||
                'vchar4    VARCHAR2(128),' ||
                'vchar5    VARCHAR2(128)' ||
                               
               ')';
        execute immediate str;

str := 'alter table '||yycgdmx||' add constraint PK_'||yycgdmx||' primary key (ID)';
execute immediate str;
str := 'alter table '||yycgdmx||' add constraint UNI_'||yycgdmx||' unique (YYCGDID, YPXXID)';
execute immediate str;
str := 'alter table '||yycgdmx||' add constraint FK_'||yycgdmx||'_1 foreign key (YYCGDID) references '||yycgd||' (ID)';
execute immediate str;
str := 'alter table '||yycgdmx||'  add constraint FK_'||yycgdmx||'_3 foreign key (YPXXID)  references YPXX (ID)';
execute immediate str;

 str :='create or replace trigger '||yycgdmx||'_update ' ||
  ' after update on ' || yycgdmx ||
  ' for each row ' ||
'declare ' ||
'begin ' ||
  'update '||business||' t ' ||
     'set ' ||
         't.zbjg    = :new.zbjg,' ||
         't.jyjg   = :new.jyjg,' ||
          't.cgzt   = :new.cgzt,' ||
         't.cgl   = :new.cgl ' ||
         ' where t.yycgdid = :new.yycgdid and t.ypxxid = :new.ypxxid;'||
'end '||yycgdmx||'_update ;';

execute immediate str;


        end if;

end create_businesscgdmx;
/

prompt
prompt Creating procedure CREATE_BUSINESSCGDRK
prompt =======================================
prompt
create or replace procedure create_businesscgdrk(year in varchar2) Authid Current_User as

  v_tab_sl number;
  yycgdrk varchar2(100);
  business varchar2(100);
  str varchar2(1000);
begin
 -- 表名称
        yycgdrk := 'yycgdrk' || year;
         business:= 'Yybusiness' || year;
        -- 验证表是否存在
        select count(1) into v_tab_sl from user_tables where table_name=upper(yycgdrk);
        if v_tab_sl = 0 then


        str := 'create table ' || yycgdrk ||
               '(ID            VARCHAR2(32) not null,' ||
      'yycgdid VARCHAR2(32) not null,' ||
      'ypxxid  VARCHAR2(32) not null,' ||
      'vchar1  VARCHAR2(64),' ||
      'vchar2  VARCHAR2(64),' ||
      'vchar3  VARCHAR2(64),' ||
      'vchar4  VARCHAR2(128),' ||
      'vchar5  VARCHAR2(128),' ||
      'rkl     INTEGER not null,' ||
      'cgzt     CHAR(1) not null,' ||
      'rkje    FLOAT not null,' ||
      'rkdh    VARCHAR2(32) not null,' ||
      'ypph    VARCHAR2(32) not null,' ||
      'ypyxq   FLOAT not null,' ||
      'rktime  TIMESTAMP(6) default SYSDATE not null' ||
                               
               ')';
        execute immediate str;
 str := 'alter table '||yycgdrk||' add constraint PK_'||yycgdrk||' primary key (ID)';
 execute immediate str;
str := 'alter table '||yycgdrk||' add constraint UNI_'||yycgdrk||' unique (YYCGDID, YPXXID)';
execute immediate str;

 str :='create or replace trigger '||yycgdrk||'_insert' ||
  ' after insert on ' || yycgdrk ||
  ' for each row ' ||
' declare' ||
' begin '||
  ' update '||business||' t' ||
     ' set t.rkl    = :new.rkl,' ||
         't.rkje   = :new.rkje,' ||
         't.ypph   = :new.ypph,' ||
         't.cgzt   = :new.cgzt,' ||
         't.rkdh   = :new.rkdh,' ||
         't.ypyxq  = :new.ypyxq,' ||
         't.rktime = :new.rktime'||
         ' where t.yycgdid = :new.yycgdid and t.ypxxid = :new.ypxxid;'||
' end '||yycgdrk||'_insert;'; 

execute immediate str;
        end if;

end create_businesscgdrk;
/

prompt
prompt Creating procedure CREATE_BUSINESSJSD
prompt =====================================
prompt
create or replace procedure create_businessjsd(year in varchar2) Authid Current_User as

  v_tab_sl number;
  yyjsd varchar2(100);
  str varchar2(1000);
begin
 -- 表名称
        yyjsd := 'yyjsd' || year;
        -- 验证表是否存在
        select count(1) into v_tab_sl from user_tables where table_name=upper(yyjsd);
        if v_tab_sl = 0 then


        str := 'create table ' || yyjsd ||
               '(ID            VARCHAR2(32) not null,' ||
    'bm       VARCHAR2(10) not null,' ||
    'mc       VARCHAR2(128) not null,' ||
    'useryyid VARCHAR2(64) not null,' ||
    'lxr      VARCHAR2(64),' ||
    'lxdh     VARCHAR2(64),' ||
    'cjr      VARCHAR2(64),' ||
    'cjtime   TIMESTAMP(6) not null,' ||
    'tjtime   TIMESTAMP(6),' ||
    'xgtime   TIMESTAMP(6),' ||
    'bz       VARCHAR2(256),' ||
    'zt       CHAR(1) not null,' ||
    'vchar1   VARCHAR2(64),' ||
    'vchar2   VARCHAR2(64),' ||
    'vchar3   VARCHAR2(64)' ||
                               
               ')';
        execute immediate str;
 str := 'create index INDEX_'||yyjsd||'_1 on '||yyjsd||' (USERYYID)';
 execute immediate str;
str := 'alter table '||yyjsd||' add constraint PK_'||yyjsd||' primary key (ID)';
execute immediate str;
str := 'alter table '||yyjsd||' add constraint UNI_'||yyjsd||' unique (BM)';
execute immediate str;


str := 'create sequence YYJSDBM'||year ||
' minvalue 1 '||
' maxvalue 999999 '||
' start with 100000 '||
' increment by 1 '||
' cache 20';
execute immediate str;

        end if;

end create_businessjsd;
/

prompt
prompt Creating procedure CREATE_BUSINESSJSDMX
prompt =======================================
prompt
create or replace procedure create_businessjsdmx(year in varchar2) Authid Current_User as

  v_tab_sl number;
  yyjsdmx varchar2(100);
  business varchar2(100);
  str varchar2(1000);
begin
 -- 表名称
        yyjsdmx := 'yyjsdmx' || year;
        business :='yybusiness' || year;
        -- 验证表是否存在
        select count(1) into v_tab_sl from user_tables where table_name=upper(yyjsdmx);
        if v_tab_sl = 0 then


        str := 'create table ' || yyjsdmx ||
               '(ID            VARCHAR2(32) not null,' ||
		'yyjsdid VARCHAR2(32) not null,' ||
		'ypxxid  VARCHAR2(32) not null,' ||
		'yycgdid VARCHAR2(32) not null,' ||
		'jsl     INTEGER not null,' ||
		'jsje    FLOAT not null,' ||
		'jszt    CHAR(1) not null,' ||
		'vchar1  VARCHAR2(64),' ||
		'vchar2  VARCHAR2(64),' ||
		'vchar3  VARCHAR2(64),' ||
		'vchar4  VARCHAR2(128),' ||
		'vchar5  VARCHAR2(128)' ||
                               
               ')';
        execute immediate str;
 str := 'alter table '||yyjsdmx||'  add constraint PK_'||yyjsdmx||' primary key (ID)';
 execute immediate str;
str := 'alter table '||yyjsdmx||' add constraint UNI_'||yyjsdmx||' unique (YPXXID, YYCGDID)';
execute immediate str;

 str :='create or replace trigger '||yyjsdmx||'_insert ' ||
  ' after insert on ' || yyjsdmx ||
  ' for each row ' ||
'declare ' ||
'begin ' ||
  'update '||business||' t ' ||
     'set t.yyjsdid = :new.id,' ||
         't.jsl    = :new.jsl,' ||
         't.jszt   = :new.jszt,' ||
         't.jsje   = :new.jsje ' ||
         ' where t.yycgdid = :new.yycgdid and t.ypxxid = :new.ypxxid;'||
'end '||yyjsdmx||'_insert ;';

execute immediate str;


 str :='create or replace trigger '||yyjsdmx||'_update ' ||
  ' after update on ' || yyjsdmx ||
  ' for each row ' ||
'declare ' ||
'begin ' ||
  'update '||business||' t ' ||
     'set t.yyjsdid = :new.id,' ||
         't.jsl    = :new.jsl,' ||
         't.jszt   = :new.jszt,' ||
         't.jsje   = :new.jsje ' ||
          ' where t.yycgdid = :new.yycgdid and t.ypxxid = :new.ypxxid;'||
'end '||yyjsdmx||'_insert ;';
execute immediate str;
        end if;

end create_businessjsdmx;
/

prompt
prompt Creating procedure CREATE_BUSINESSTHD
prompt =====================================
prompt
create or replace procedure create_businessthd(year in varchar2) Authid Current_User as

  v_tab_sl number;
  yythd varchar2(100);
  str varchar2(1000);
begin
 -- 表名称
        yythd := 'yythd' || year;
        -- 验证表是否存在
        select count(1) into v_tab_sl from user_tables where table_name=upper(yythd);
        if v_tab_sl = 0 then


        str := 'create table ' || yythd ||
               '(ID            VARCHAR2(32) not null,' ||
    'bm       VARCHAR2(10) not null,' ||
    'mc       VARCHAR2(128) not null,' ||
    'useryyid VARCHAR2(64) not null,' ||
    'lxr      VARCHAR2(64),' ||
    'lxdh     VARCHAR2(64),' ||
    'cjr      VARCHAR2(64),' ||
    'cjtime   TIMESTAMP(6) not null,' ||
    'tjtime   TIMESTAMP(6),' ||
    'xgtime   TIMESTAMP(6),' ||
    'bz       VARCHAR2(256),' ||
    'zt       CHAR(1) not null,' ||
    'vchar1   VARCHAR2(64),' ||
    'vchar2   VARCHAR2(64),' ||
    'vchar3   VARCHAR2(64)' ||
                               
               ')';
        execute immediate str;
 str := 'create index INDEX_'||yythd||'_1 on '||yythd||' (USERYYID)';
 execute immediate str;
str := 'alter table '||yythd||' add constraint PK_'||yythd||' primary key (ID)';
execute immediate str;
str := 'alter table '||yythd||' add constraint UNI_'||yythd||' unique (BM)';
execute immediate str;


str := 'create sequence YYTHDBM'||year ||
' minvalue 1 '||
' maxvalue 999999 '||
' start with 100000 '||
' increment by 1 '||
' cache 20';
execute immediate str;

        end if;

end create_businessthd;
/

prompt
prompt Creating procedure CREATE_BUSINESSTHDMX
prompt =======================================
prompt
create or replace procedure create_businessthdmx(year in varchar2) Authid Current_User as

  v_tab_sl number;
  yythdmx varchar2(100);
  business varchar2(100);
  str varchar2(1000);
begin
 -- 表名称
        yythdmx := 'yythdmx' || year;
        business:= 'Yybusiness' || year;
        -- 验证表是否存在
        select count(1) into v_tab_sl from user_tables where table_name=upper(yythdmx);
        if v_tab_sl = 0 then


        str := 'create table ' || yythdmx ||
               '(ID            VARCHAR2(32) not null,' ||
		'yythdid VARCHAR2(32) not null,' ||
		'ypxxid  VARCHAR2(32) not null,' ||
		'yycgdid VARCHAR2(32) not null,' ||
		'thl     INTEGER not null,' ||
		'thje    FLOAT not null,' ||
		'thzt    CHAR(1) not null,' ||
    'thyy    VARCHAR2(100),' ||
		'vchar1  VARCHAR2(64),' ||
		'vchar2  VARCHAR2(64),' ||
		'vchar3  VARCHAR2(64),' ||
		'vchar4  VARCHAR2(128),' ||
		'vchar5  VARCHAR2(128)' ||
                               
               ')';
        execute immediate str;
 str := 'alter table '||yythdmx||'  add constraint PK_'||yythdmx||' primary key (ID)';
 execute immediate str;
str := 'alter table '||yythdmx||' add constraint UNI_'||yythdmx||' unique (YPXXID, YYCGDID)';
execute immediate str;

 str :='create or replace trigger '||yythdmx||'_insert ' ||
  ' after insert on ' || yythdmx ||
  ' for each row ' ||
'declare ' ||
'begin ' ||
  'update '||business||' t ' ||
     'set t.yythdid = :new.id,' ||
         't.thl    = :new.thl,' ||
         't.thje   = :new.thje,' ||
         't.thzt   = :new.thzt ' ||
         ' where t.yycgdid = :new.yycgdid and t.ypxxid = :new.ypxxid;'||
'end '||yythdmx||'_insert ;';

execute immediate str;


 str :='create or replace trigger '||yythdmx||'_update ' ||
  ' after update on ' || yythdmx ||
  ' for each row ' ||
'declare ' ||
'begin ' ||
  'update '||business||' t ' ||
     'set t.yythdid = :new.id,' ||
         't.thl    = :new.thl,' ||
         't.thje   = :new.thje,' ||
         't.thzt   = :new.thzt ' ||
          ' where t.yycgdid = :new.yycgdid and t.ypxxid = :new.ypxxid;'||
'end '||yythdmx||'_insert ;';

execute immediate str;

        end if;

end create_businessthdmx;
/

prompt
prompt Creating procedure CREATE_BUSINESSTABLE
prompt =======================================
prompt
create or replace procedure create_businesstable(year in varchar2) Authid Current_User as


begin

      create_business(year);
      create_businesscgd(year);
      create_businesscgdmx(year);
      create_businesscgdrk(year);
      create_businessthd(year);
      create_businessthdmx(year);
      create_businessjsd(year);
      create_businessjsdmx(year);

end create_businesstable;
/

prompt
prompt Creating procedure CREATE_TABLEJOB
prompt ==================================
prompt
create or replace procedure create_tableJob Authid Current_User as
   year1 varchar2(4);
   year2 varchar2(4);
begin
  select to_char(sysdate,'yyyy')into year1 from dual;

  select to_char(to_char(sysdate,'yyyy')+1)into year2 from dual;
   
  create_businesstable(year1);
  create_businesstable(year2);
   
end create_tableJob;
/

prompt
prompt Creating trigger GENERATOR_YPXXBM
prompt =================================
prompt
create or replace trigger generator_ypxxbm
  before insert on ypxx
  for each row
declare
  -- local variables here
begin
   select ypxxbm.nextval into :new.bm from dual;
end generator_ypxxbm;
/

prompt
prompt Creating trigger YYCGDMX2014_UPDATE
prompt ===================================
prompt
create or replace trigger yycgdmx2014_update  after update on yycgdmx2014 for each row 
declare begin update yybusiness2014 t set t.zbjg    = :new.zbjg,t.jyjg   = :new.jyjg,t.cgzt   = :new.cgzt,t.cgl   = :new.cgl  where t.yycgdid = :new.yycgdid and t.ypxxid = :new.ypxxid;end yycgdmx2014_update ;
/

prompt
prompt Creating trigger YYCGDRK2014_INSERT
prompt ===================================
prompt
create or replace trigger yycgdrk2014_insert after insert on yycgdrk2014 for each row  
declare begin  update Yybusiness2014 t set t.rkl    = :new.rkl,t.rkje   = :new.rkje,t.ypph   = :new.ypph,t.cgzt   = :new.cgzt,t.rkdh   = :new.rkdh,t.ypyxq  = :new.ypyxq,t.rktime = :new.rktime where t.yycgdid = :new.yycgdid and t.ypxxid = :new.ypxxid; end yycgdrk2014_insert;
/

prompt
prompt Creating trigger YYJSDMX2014_INSERT
prompt ===================================
prompt
create or replace trigger yyjsdmx2014_insert  after insert on yyjsdmx2014 for each row 
declare begin update yybusiness2014 t set t.yyjsdid = :new.id,t.jsl    = :new.jsl,t.jszt   = :new.jszt,t.jsje   = :new.jsje  where t.yycgdid = :new.yycgdid and t.ypxxid = :new.ypxxid;end yyjsdmx2014_insert ;
/

prompt
prompt Creating trigger YYJSDMX2014_UPDATE
prompt ===================================
prompt
create or replace trigger yyjsdmx2014_update  after update on yyjsdmx2014 for each row 
declare begin update yybusiness2014 t set t.yyjsdid = :new.id,t.jsl    = :new.jsl,t.jszt   = :new.jszt,t.jsje   = :new.jsje  where t.yycgdid = :new.yycgdid and t.ypxxid = :new.ypxxid;end yyjsdmx2014_insert ;
/

prompt
prompt Creating trigger YYTHDMX2014_INSERT
prompt ===================================
prompt
create or replace trigger yythdmx2014_insert  after insert on yythdmx2014 for each row 
declare begin update Yybusiness2014 t set t.yythdid = :new.id,t.thl    = :new.thl,t.thje   = :new.thje,t.thzt   = :new.thzt  where t.yycgdid = :new.yycgdid and t.ypxxid = :new.ypxxid;end yythdmx2014_insert ;
/

prompt
prompt Creating trigger YYTHDMX2014_UPDATE
prompt ===================================
prompt
create or replace trigger yythdmx2014_update  after update on yythdmx2014 for each row 
declare begin update Yybusiness2014 t set t.yythdid = :new.id,t.thl    = :new.thl,t.thje   = :new.thje,t.thzt   = :new.thzt  where t.yycgdid = :new.yycgdid and t.ypxxid = :new.ypxxid;end yythdmx2014_insert ;
/


spool off
