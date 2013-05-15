--------------------------------------------------------
-- Export file for user SNDBA                         --
-- Created by Administrator on 2008-10-7, ÏÂÎç 04:44:48 --
--------------------------------------------------------

spool dbsql.log

prompt
prompt Creating table AIR
prompt ==================
prompt
create table SNDBA.AIR
(
  AIRID   VARCHAR2(20),
  AIRNAME VARCHAR2(40)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents 505
    pctincrease 50
  );

prompt
prompt Creating table BASE_USERINFO
prompt ============================
prompt
create table SNDBA.BASE_USERINFO
(
  USERID   VARCHAR2(10) not null,
  NAME     VARCHAR2(50),
  PASS     VARCHAR2(200),
  ROLEID   VARCHAR2(10),
  USERNAME VARCHAR2(50),
  SKIN     VARCHAR2(200)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 8K
    minextents 1
    maxextents 505
    pctincrease 50
  );
alter table SNDBA.BASE_USERINFO
  add constraint USSER_PK primary key (USERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents 505
    pctincrease 50
  );

prompt
prompt Creating table CRITY
prompt ====================
prompt
create table SNDBA.CRITY
(
  CRITY   VARCHAR2(50),
  AIRID   VARCHAR2(50),
  MODENUM VARCHAR2(50)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents 505
    pctincrease 50
  );

prompt
prompt Creating table DEPARTMENT
prompt =========================
prompt
create table SNDBA.DEPARTMENT
(
  DEPARTID  NVARCHAR2(6),
  DEPARNAME NVARCHAR2(100),
  PID       NUMBER(6)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents 505
    pctincrease 50
  );

prompt
prompt Creating table SYS_MODULEINFO
prompt =============================
prompt
create table SNDBA.SYS_MODULEINFO
(
  MODULEID   VARCHAR2(9) not null,
  MODULENAME VARCHAR2(200),
  MODULEURL  VARCHAR2(200),
  PID        VARCHAR2(9),
  HREFTARGET VARCHAR2(200),
  MODULETYPE CHAR(1)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 8K
    minextents 1
    maxextents 505
    pctincrease 50
  );
alter table SNDBA.SYS_MODULEINFO
  add constraint MODULE_INDEX primary key (MODULEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents 505
    pctincrease 50
  );

prompt
prompt Creating table SYS_ROLE
prompt =======================
prompt
create table SNDBA.SYS_ROLE
(
  ROLEID   VARCHAR2(9),
  ROLENAME NVARCHAR2(100)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 8K
    minextents 1
    maxextents 505
    pctincrease 50
  );

prompt
prompt Creating table SYS_ROLE_MODULE
prompt ==============================
prompt
create table SNDBA.SYS_ROLE_MODULE
(
  ROLEID    VARCHAR2(9) not null,
  MODULEID  VARCHAR2(9) not null,
  SYS_ADD   CHAR(1) default 0,
  SYS_DEL   CHAR(1) default 0,
  SYS_MOD   CHAR(1) default 0,
  SYS_OTHER CHAR(1) default 0
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 8K
    minextents 1
    maxextents 505
    pctincrease 50
  );

prompt
prompt Creating table SYS_ROLE_USER
prompt ============================
prompt
create table SNDBA.SYS_ROLE_USER
(
  ROLEID VARCHAR2(9),
  USERID VARCHAR2(9)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 16K
    minextents 1
    maxextents 505
    pctincrease 50
  );

prompt
prompt Creating sequence MODULE_SEQ
prompt ============================
prompt
create sequence SNDBA.MODULE_SEQ
minvalue 1
maxvalue 9999999999
start with 250
increment by 1
cache 20;

prompt
prompt Creating sequence USER_SEQ
prompt ==========================
prompt
create sequence SNDBA.USER_SEQ
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating function GETALLROLENAME
prompt ================================
prompt
create or replace function sndba.getAllRoleName(vuserId in varchar2) return varchar2 is
   Result varchar2(500) ;

  rolename varchar2(30);

   cursor vcur  is  select b.rolename   
    from  SYS_ROLE_USER a,SYS_ROLE b   
    Where a.roleid = b.roleid and a.userid = vuserId; 
begin
  open vcur ;
  loop
  fetch vcur into rolename;
  exit when vcur%notfound;
    Result:=Result||rolename||',';
  end loop;
  close vcur;

 
    return(Result);
end getAllRoleName;
/

prompt
prompt Creating procedure SYS_MAKE_QX
prompt ==============================
prompt
create or replace procedure sndba.SYS_MAKE_QX(name in Varchar2) is
begin
  
end SYS_MAKE_QX;
/

prompt
prompt Creating trigger REIROLE
prompt ========================
prompt
CREATE OR REPLACE TRIGGER SNDBA."REIROLE" BEFORE
INSERT ON "SYS_ROLE" FOR EACH ROW 
begin
select  'R'||LPAD(module_SEQ.nextval,4,'0')  into :new.ROLEID from dual;
end;
/

prompt
prompt Creating trigger REIUSER
prompt ========================
prompt
CREATE OR REPLACE TRIGGER "SNDBA"."REIUSER" BEFORE
INSERT ON "BASE_USERINFO" FOR EACH ROW 
begin
select  'M'||LPAD(module_SEQ.nextval,4,'0')  into :new.userid from dual;
end;
/

prompt
prompt Creating trigger TRIMODULEINFO
prompt ==============================
prompt
create or replace trigger SNDBA.triMODULEINFO
before insert on SYS_MODULEINFO
for each row
begin
select  'M'||LPAD(module_SEQ.nextval,4,'0')  into :new.MODULEID from dual;
end;
/

prompt
prompt Creating trigger TRIROLE
prompt ========================
prompt
create or replace trigger SNDBA.triROLE
before insert on SYS_ROLE
for each row
begin
select  'R'||LPAD(module_SEQ.nextval,4,'0')  into :new.ROLEID from dual;
end;
/


spool off
