# itachigorun 


查询数据库状态
SQL> select database_status from v$instance;

DATABASE_STATUS
-------------------
ACTIVE

查询实例活动状态
SQL> select active_state from v$instance;
ACTIVE_ST
---------------
NORMAL

SQL> select status from v$instance;
STATUS
---------
OPEN

SELECT * FROM ALL_OBJECTS WHERE OBJECT_NAME ='your_table_name'  查询表所有的储存信息

1.查询表空间
#sqlplus / as sysdba
SQL> select tablespace_name from dba_tablespaces;

TABLESPACE_NAME
------------------------------
SYSTEM
SYSAUX
UNDOTBS1
TEMP
USERS
TBS_FCS_SUM

已选择6行。

SQL> select * from v$tablespace;

       TS# NAME                           INC BIG FLA ENC
---------- ------------------------------ --- --- --- ---
         0 SYSTEM                         YES NO  YES
         1 SYSAUX                         YES NO  YES
         2 UNDOTBS1                       YES NO  YES
         4 USERS                          YES NO  YES
         3 TEMP                           NO  NO  YES
         6 TBS_FCS_TEMP                   NO  NO  YES
         7 TBS_FCS_DEFAULT                YES NO  YES
         8 TBS_FCS_SUM                    YES NO  YES
         9 TBS_FCS_DTL                    YES NO  YES
        10 TBS_FCS_FLUX                   YES NO  YES
        11 TBS_FCS_REG                    YES NO  YES

       TS# NAME                           INC BIG FLA ENC
---------- ------------------------------ --- --- --- ---
        12 TBS_FCS_TICK                   YES NO  YES
        13 TBS_FRS_TEMP                   NO  NO  YES
        14 TBS_FRS_DATA                   YES NO  YES
        15 TBS_FEP_TEMP                   NO  NO  YES
        16 TBS_FEP_DEFAULT                YES NO  YES
        17 TBS_FEP_DATA                   YES NO  YES

已选择17行。

2. 查看表空间详细信息
SQL> desc dba_data_files;
 名称                                      是否为空? 类型
 ----------------------------------------- -------- ----------------------------
 FILE_NAME                                          VARCHAR2(513)
 FILE_ID                                            NUMBER
 TABLESPACE_NAME                                    VARCHAR2(30)
 BYTES                                              NUMBER
 BLOCKS                                             NUMBER
 STATUS                                             VARCHAR2(9)
 RELATIVE_FNO                                       NUMBER
 AUTOEXTENSIBLE                                     VARCHAR2(3)
 MAXBYTES                                           NUMBER
 MAXBLOCKS                                          NUMBER
 INCREMENT_BY                                       NUMBER
 USER_BYTES                                         NUMBER
 USER_BLOCKS                                        NUMBER
 ONLINE_STATUS                                      VARCHAR2(7)


SQL> select * from dba_data_files;

FILE_NAME
--------------------------------------------------------------------------------
   FILE_ID TABLESPACE_NAME                     BYTES     BLOCKS STATUS
---------- ------------------------------ ---------- ---------- ---------
RELATIVE_FNO AUT   MAXBYTES  MAXBLOCKS INCREMENT_BY USER_BYTES USER_BLOCKS
------------ --- ---------- ---------- ------------ ---------- -----------
ONLINE_
-------
/opt/oracle/oradata/accdb/users01.dbf
         4 USERS                             5242880        640 AVAILABLE
           4 YES 3.4360E+10    4194302          160    4194304         512
ONLINE

3. alter table 表名 add constraint 约束名 约束内容
Oracle创建表和约束
create table INFOS(
     STUID      varchar2(7) not null,         --学号 学号=‘S’+班号+2位序号
     STUNAME    varchar2(10) not null,        --姓名
     GENDER     varchar2(2) not null,         --性别 
     AGE        number(2) not null,           --年龄
     SEAT       number(2) not null,           --座号
     ENROLLDATE    date,                      --入学时间
     STUADDRESS       varchar2(50) default '地址不详',     --住址
     CLASSNO          varchar2(4) not null,               --班号 班号=学期序号+班级序号 
);

alter table INFOS add constraint pk_INFOS primary key(STUID)  

alter table INFOS add constraint ck_INFOS_gender check(GENDER = '男' or GENDER = '女')  

alter table INFOS add constraint ck_INFOS_SEAT check(SEAT >=0 and SEAT <=50) 

alter table INFOS add constraint ck_INFOS_AGE check(AGE >=0 and AGE<=100) 

alter table INFOS add constraint ck_INFOS_CLASSNO check((CLASSNO >='1001' and CLASSNO<='1999') or
(CLASSNO >='2001' and CLASSNO<='2999'))  

alter table INFOS add constraint un_STUNAME unique(STUNAME)

5 禁用主键
语法：
ALTER TABLE table_name DISABLE CONSTRAINT constraint_name;  
示例：
alter table tb_employees disable constraint tb_employees_pk;  

6 启用主键
语法：
ALTER TABLE table_name ENABLE CONSTRAINT constraint_name;  
示例：
alter table tb_employees enable constraint tb_employees_pk;  

7 删除主键
语法：
ALTER TABLE table_name DROP CONSTRAINT constraint_name;  
示例：
alter table tb_employees drop constraint tb_employees_pk;  
alter table tb_departments drop constraint tb_departments_pk;  
alter table TB_PK_EXAMPLE drop constraint TB_PK_EXAMPLE_PK;  
alter table TB_SUPPLIER_EX drop constraint TB_SUPPLIER_EX_PK;  

4.Oracle表字段的增加、删除、修改和重命名
增加字段语法：
alter table tablename add (column datatype [default value][null/not null],….);
说明：
alter table 表名 add (字段名 字段类型 默认值 是否为空);
例：
alter table sf_users add (HeadPIC blob);
例：
alter table sf_users add (userName varchar2(30) default '空' not null);

修改字段的语法：
alter table tablename modify (column datatype [default value][null/not null],….); 
说明：
alter table 表名 modify (字段名 字段类型 默认值 是否为空);
例：
alter table sf_InvoiceApply modify (BILLCODE number(4));

删除字段的语法：
alter table tablename drop (column);
说明：
alter table 表名 drop column 字段名;
例：
alter table sf_users drop column HeadPIC;

字段的重命名：
说明：
alter table 表名 rename  column  列名 to 新列名   （其中：column是关键字）
例：
alter table sf_InvoiceApply rename column PIC to NEWPIC;

表的重命名：
说明：
alter table 表名 rename to  新表名
例：
alter table sf_InvoiceApply rename to  sf_New_InvoiceApply;

