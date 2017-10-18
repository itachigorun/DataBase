The txt is copied from the internet.

一、字符串函数
1.CONCAT和"||"
CONCAT(char1,char2)用于返回两个字符串链接后的结果。
例如：SELECT CONCAT(CONCAT(name,':'),sal)FROM emp;
SMITH:800
ALLEN:1600
WARD:1250
JONES:2975
MARTIN:1250
BLAKE:2850
CLARK:2450
SCOTT:3000
KING:5000
TURNER:1500
ADAMS:1100
||可以连接多个字符串。
例如：SELECT name || ':' || sal FROM emp;

2.LENGTH
length(char)用于返回参数字符串的长度，如果字符类型是VARCHAR2，返回字符的实际长度，如果字符类型是CHAR，长度还包括后补的空格。
例如：SELECT name, LENGTH(name) FROM emp;  
将列出name和name的字符串长度：
SMITH 5
ALLEN 5
WARD  4
JONES 5

3.LENGTHB
length(str)返回表达式中的字节数
SELECT LENGTHB('Hello World!') FROM DUAL; --返回结果为12
SELECT LENGTHB('张三') FROM DUAL; --返回结果为6

4.UPPER、LOWER和INITCAP
这三个函数全部都是英文的大小写转换函数，用来转换字符的大小写：
UPPER(char)用于将字符转换为大写形式
LOWER(char)用于将字符转换为小写形式
INITCAP(char)用于将字符串每个单词的首字符大写，其他字符小写，单词之间用空格和非字母分隔
如果这三个函数的输入参数是NULL值，仍然返回NULL值。
SELECT UPPER('hello world'), LOWER('HELLO WORld'), INITCAP('hello world') FROM dual;
将列出参数"hello world"的大写、小写、和首字符大写的形式。一般用来查询数据表中不确定大小写的情况。

5.TRIM、LTRIM、RTRIM
这三个TRIM函数的作用都是截去子字符串。
TRIM(c2 from c1)表示从c1的前后截去c2
LTRIM(c1,c2)表示从c1的左边(Left)截去c2
RTRIM(c1,c2)表示从c1的右边(Right)截去c2
例如：SELECT TRIM('e' from 'elite') as t1,
      LTRIM('elite','e') as t2,
      RTRIM('elite','e') as t3
      FROM DUAL;
结果：
t1   t2    t3
lit  lite  elit
其中TRIM，经常用来去掉字符串前后的空格。

6.LAPD、RPAD
PAD意即补丁，LPAD和RPAD两个函数都叫做补位函数，LPAD表示 LEFT PAD,在左边打补丁，RPAD表示RIGHT PAD ,在右边打补丁。
LPAD(char1,n,char2) 左补位函数
RPAD(char1,n,char2) 右补位函数
参数含义：在字符串函数char1的左端或右端用char2补足到n位，其中参数char2可重复多次。例如在EMP表中使用左补位，将sal
用$补齐6位，运行结果：
ENAME   SAL
SMITH   $$$800
ALLEN   $$$1600
WARD    $$$1250
JONES   $$$2975

7.SUBSTR表示在一个字符串中截取字串
SUBSTR(char,m,n)
用于返回char中从m位开始取n个字符的字串，字符串的首位计数从1开始。
如果m=0，则从首字符开始，如果m取负数，则从尾部开始
如果没有设置n，或者n的长度超过了char的长度，则取到字符串末尾为止
SELECT SUBSTR('Doctor Who travels in TARDIS', 8, 25) as substr FROM DUAL
结果：
substr
Who travels in TARDIS

8.INSTR用来返回在一个字符串中字串的位置
INSTR(char1,char2,n,m)
返回字串char2在源字符串char1中的位置
从n的位置开始搜索，没有指定n，从第一个字符开始搜索
m用于制定字串的第m次出现次数，如果不指定取值1
如果在char1中没有找到字串char2，返回0
例如：SELECT INSTR('Doctor Who','Who') words FROM DUAL;
结果返回8

9.REPLACE
replace(str,n,m)从str字符串中搜过n，并用m字符替换，并不会改变数据库中的原始值
SELECT REPLACE('Hello World!','o','HA') FROM DUAL;

二、Oracle数值函数
1.ROUND
ROUND(n,m)用于将参数n按照m的数字要求四舍五入，其中：
参数中的n可以是任何数字，指要被处理的数字
m必须是整数
m取正数则四舍五入到小数点后第m位
m取0值则四舍五入到整数位
m取负数，则四舍五入到小数点前m位
m缺省，默认值是0
例如：
SELECT  ROUND(45.678,2) FROM DUAL; --45.68
SELECT  ROUND(45.678,0) FROM DUAL; --46
SELECT  ROUND(45.678,-1) FROM DUAL; --50

2.TRUNC
TRUNC(n,m)的功能是截取，其中n和m的定义和ROUND(n,m)相同，不同的是功能上按照截取的方式处理数字n。例如：
SELECT TRUNC(45.678, 2) FROM DUAL; --45.67
SELECT TRUNC(45.678, 0) FROM DUAL; --45
SELECT TRUNC(45.678, -1) FROM DUAL; --40

3.MOD
MOD(m,n)是取模函数，返回m除以n后的余数，如果n为0则直接返回m。例如：
--薪水值按1000取余数
SELECT ename， sal, MOD(sal, 1000) FROM emp;
SMITH    800    800
ALLEN    1600   600
WARD     1250   250
JONES    2975   975
MARTIN   1250   250

4.CEIL和FLOOR
CEIL(n)、FLOOR(n)这两个函数顾名思义，一个是天花板，就是取大于或等于n的最小整数值，一个是地板，就是取小于或等于n的
最大整数值。例如：
SELECT CEIL(45.678) FROM DUAL; --46
SELECT FLOOR(45.678) FROM DUAL; --45

5. ABS
abs(value) 返回value的绝对值
SELECT abs(-10) FROM DUAL; --返回结果为10

三、Oracle日期操作
常用的日期格式：
YY     2位数字的年份
YYYY   4位数字的年份
MM     2位数字的月份
MON    简拼的月份
MONTH  全拼的月份
DD     2位数字的天
DY     周几的缩写
DAY    周几的全拼
HH24   24小时制的小时
HH12   12小时制的小时
MI     显示分钟
SS     显示秒

1.SYSDATE
SYSDATE本质是一个Oracle的内部函数,用来返回当前的系统时间，精确到秒，默认显示格式是DD-MON-RR，只有年月日并不显示时间。例如：
SELECT SYSDATE FROM DUAL;
如果数据库是英文环境，将显示“03-MAY-14”的形式，如果是中文环境，将显示“03-5月-14”的形式。如果想显示时分秒，需要将格式转换一下：
SELECT TO_CHAR(SYSDATE,'yyyy-mm-dd day hh24:mi:ss') FROM DUAL;
2017-04-12 星期三 23:20:20

在建表时，可以将系统时间SYSDATE作为某一列的默认值，当插入新的纪录，将会取当时的系统时间，作为数据表的一列数据保存起来。

2.SYSTIMESTAMP
SYSTIMESTAMP也是Oracle的内部日期函数，返回当前系统日期和时间，精确到毫秒。

3.TO_DATE
日期数据有时需要和字符串数据相互转换，需要用到日期转换函数，包括TO_CHAR和TO_DATE。
TO_DATE的功能是将字符串按照定制格式转换为日期类型，语法格式是：
TO_DATE(char,fmt)
其中：char是要转换的字符串，fmt是转换格式，nlsparams是指定日期语言。其中比较重要的是格式，常用的日期格式如下：
to_date('2017-04-27','yyyy-mm-dd hh24:mi:ss')

to_date('10-12-06','MM-DD-YY')
to_date('jan 2007','MON YYYY')
to_date('2007/05/31','YYYY/MM/DD')
to_date('12-31-2007 12:15','MM-DD-YYYY HH:MI')
to_date('2006,091,00:00:00' , 'YYYY,DDD,HH24:MI:SS')
to_date('15-may-2006 06:00:01','dd-mon-yyyy hh24:mi:ss')
to_date('022002','mmyyyy')
to_date('12319999','MMDDYYYY')
to_date(substr( collection_started,1,12),'DD-MON-YY HH24')
to_date('2004/10/14 21', 'yyyy/mm/dd hh24')
TO_DATE(First_Load_Time, 'yyyy-mm-dd/hh24:mi:ss'))*24*60)

select to_char(sysdate,'yy-mm-dd hh24:mi:ss') from dual   //显示：08-11-07 13:22:42
select to_date('2005-12-25,13:25:59','yyyy-mm-dd,hh24:mi:ss') from dual //显示：2005-12-25 13:25:59
而如果把上式写作：select to_date('2005-12-25,13:25:59','yyyy-mm-dd,hh:mi:ss') from dual，则会报错，因为小时hh是12进制，13为非法输入，不能匹配。

4.TO_CHAR
TO_CHAR的作用是将其它类型(日期，数值)的数据转换为字符类型，主要应用在日期类型上。语法格式：
TO_CHAR(date,fmt) 其中fmt是格式，将日期类型数据date按照fmt格式输出字符串，例如
select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') as nowTime from dual;   //日期转化为字符串   
select to_char(sysdate,'yyyy') as nowYear   from dual;   //获取时间的年   
select to_char(sysdate,'mm')    as nowMonth from dual;   //获取时间的月   
select to_char(sysdate,'dd')    as nowDay    from dual;   //获取时间的日   
select to_char(sysdate,'hh24') as nowHour   from dual;   //获取时间的时   
select to_char(sysdate,'mi')    as nowMinute from dual;   //获取时间的分   
select to_char(sysdate,'ss')    as nowSecond from dual;   //获取时间的秒

select to_char('12345.67') from dual; --返回结果为12345.67
select to_char('12345.67','99,999.99') from dual; --返回结果为12,345.67

5.LAST_DAY
LAST_DAY(date):返回日期date所在月的最后一天，一般是在按照自然月计算某些业务逻辑，或者安排月末周期性活动时很有用处。例子：
SELECT LAST_DAY(SYSDATE) FROM DUAL; --查询当月的最后一天
SELECT LAST_DAY('20-2月-09') FROM DUAL; -- 查询09年2月的最后一天

6.ADD_MONTHS
ADD_MONTHS(date,i):返回日期date加上i个月后的日期值。
参数i可以是任何数字，大部分时候取正值整数
如果i是小数，将会被截取整数后再参与运算
如果i是负数，则获得的是减去i个月后的日期值
add_months(to_date('15-Nov-1961','d-mon-yyyy'),1) 返回 15-Dec-1961
add_months(to_date('30-Nov-1961','d-mon-yyyy'),1) 返回 31-Dec-1961

7.MONTHS_BETWEEN
MONTHS_BETWEEN(date1,date2):计算date1和date2两个日期值之间间隔了多少个月，实际运算是date1-date2，如果date2时间比date1晚，会得到负值
除非两个日期间隔是整数月，否则会得到带小数位的结果，比如计算2009年9月1日到2009年10月10日之间间隔多少个月，会得到1.29个月。

8.NEXT_DAY
NEXT_DAY(day,char):返回date日期数据的下一个周几，周几是由参数char来决定的。在中文环境中，直接使用“星期三”这种形式，英文环境下，需要使用
"WEDNESDAY"这种英文的周几，为避免麻烦，可以直接使用数字1-7表示周日-周六。
注意，NEXT_DAY不要按照字面意思理解为明天，是返回下个周几是几号。

9.LEAST、GERATEST
比较函数LEAST和GERATEST语法如下：
GERATEST(expr1,expr2,expr3...)
LEAST(expr1,expr2,expr3...)
两个函数都可以有多个参数值，但参数类型必须一致，返回结果是参数列表中最大或最小的值。
在比较之前，在参数列表中第二个以后的参数会被隐含的转换为第一个参数的数据类型，所以如果可以转换，则继续比较，如果不能转换将会报错。

10. EXTRACT
EXTRACT直译是抽取或提取：
EXTRACT(date FROM datetime):从参数datetime中提取参数date指定的数据比如提取年、月、日。例如取出当前日期的年：
SELECT EXTRACT(YEAR FROM SYSDATE) current_year FROM DUAL;
取出指定时间的小时：
SELECT EXTRACT(HOUR FROM TIMESTAMP '2008-10-10 10:10:10') FROM DUAL;

select extract(year from date'2011-05-17') year from dual;    
      YEAR    
----------    
      2011    
select extract(month from date'2011-05-17') month from dual;    
     MONTH    
----------    
         5    
select extract(day from date'2011-05-17') day from dual;    
       DAY    
----------    
        17  

//获取两个日期之间的具体时间间隔，extract函数是最好的选择    
select extract(day from dt2-dt1) day    
      ,extract(hour from dt2-dt1) hour    
      ,extract(minute from dt2-dt1) minute    
      ,extract(second from dt2-dt1) second    
from (    
     select to_timestamp('2011-02-04 15:07:00','yyyy-mm-dd hh24:mi:ss') dt1    
           ,to_timestamp('2011-05-17 19:08:46','yyyy-mm-dd hh24:mi:ss') dt2    
     from dual)    
/    
       DAY       HOUR     MINUTE     SECOND    
---------- ---------- ---------- ----------    
       102          4          1         46    
--    

四、空值操作
1.NULL 
NULL是数据库里的重要概念，即空值。当表中的某些字段值，数据未知或暂时不存在，取值NULL
Oracle在Order by 时缺省认为null是最大值，所以如果是ASC升序则排在最后，DESC降序则排在最前
Oracle中的“不等于操作符”是忽略Null的。
问：什么是NULL？ 
答：在我们不知道具体有什么数据的时候，也即未知，可以用NULL，我们称它为空，ORACLE中，含有空值的表列长度为零。 
ORACLE允许任何一种数据类型的字段为空，除了以下两种情况： 
1、主键字段（primary key）， 
2、定义时已经加了NOT NULL限制条件的字段 
说明： 
1、等价于没有任何值、是未知数。 
2、NULL与0、空字符串、空格都不同。 
3、对空值做加、减、乘、除等运算操作，结果仍为空。 
4、NULL的处理使用NVL函数。 
5、比较时使用关键字用“is null”和“is not null”。 SELECT * FROM student WHERE gender IS NULL;
6、空值不能被索引，所以查询时有些符合条件的数据可能查不出来，count(*)中，用nvl(列名,0)处理后再查。 
7、排序时比其他数据都大（索引默认是降序排列，小→大），所以NULL值总是排在最后。 

2.NVL 
NVL(exp1,exp2):将NULL转变为非NULL值。如果expr1为NULL，则取expr2，expr2是非空值。
其中expr1和expr2可以是任何数据类型，但两个参数的数据类型必须是一致的。
SELECTename, sal, comm,sal + nvl(comm, 0) salary FROM emp;

3.NVL2
NVL2(exp1,exp2,exp3):和NVL函数功能类似，都是讲NULL转变为非空值。NVL2用来判断expr1是否为NULL,如果不是NULL,返回expr2，如果是NULL,返回expr3.
SELECTename, sal, comm, nvl2(comm, sal + comm, sal) salary FROM emp;
