
show user;

/*����Ŭ������ commit�� �������� ����� ���� �����̵�.*/

/*
�ǽ��ڵ�

CREATE TABLE EMP
(EMPNO number not null,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR number ,
HIREDATE date,
SAL number ,
COMM number ,
DEPTNO number );
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,200,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,30,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,300,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,'1981-04-01',2850,null,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,'1981-06-01',2450,null,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,'1982-10-09',3000,null,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,3500,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,null,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,'1981-10-03',950,null,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,'1981-10-3',3000,null,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);

COMMIT;

CREATE TABLE DEPT
(DEPTNO number,
DNAME VARCHAR2(14),
LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

COMMIT;



CREATE TABLE SALGRADE
( GRADE number,
LOSAL number,
HISAL number );

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;

*/

---------------------------------------------------------------------------------------
---�ٽ� insert �ϰ� commit

---------------------------------------------------------------------------------------

--1. ��� ���̺��� ��� �����͸� ����ϼ���.
--������ ��ҹ��� ������ ���Ѵ�.
select * from emp;
SELECT * FROM emp;

--2. Ư�� �÷� ������ ����ϱ�
select empno, ename, sal
from emp;


select ename from emp;

--3. �÷��� ����Ī(alias) ��Ī�ο�,
--select empno ���, ename �̸�
--from emp;

select empno as "��     ��", ename "�� ��"
from emp;

---SQL ǥ�� ����(ANSI ����) >> ǥ�� >> oracle or Ms-sql ���� ��밡��

--Oracle���� ���ڿ� �����ʹ� '' ����ؼ� ǥ��
--Oracle ���ڿ������� �����ϰ� ��ҹ��� ����

select empno, ename
from emp
where ename='KING'

/*
   select �� 3��
   from �� 1��
   where �� 2��
*/

--Oracle query(���Ǿ�) : ���
--������
--java : + ����(�������)
--java : + ���ڿ�(���տ���)
--������ : ���հ� ����� �и�
--oracle ���տ����� : ||
--oracle ��������� : + (���)
--tip) ms-sql + (����, ���)

--select '����� �̸��� ' || ename || '�Դϴ�' as "�������"
--from emp;


DESC EMP;

/*
 Ÿ��
 java class Emp (privaet int empno, private String ename)
 oracle create table Emp(empno number, ename varchar2(20))
 orcale(�÷�) : ����, ���ڿ�, ��¥
 varchar2(10) >> 10 > 10byte > �ѱ� 1�� 2byte, ������, Ư��, ���� 1byte)
 --�ѱ� 5��, ���� 10��
 
*/
select empno || ename   --���� || ���ڿ�
from emp;



--�Ʒ� �ڵ� �ȵ�.
select empno + ename --���� Ÿ�԰� ����Ÿ�� ���ϱⰡ �ȵ�
from emp;



--���߽�
--����� ....
--�츮 ȸ�翡 ������ ��� �ֳ�
select distinct(job) from emp;
--�ߺ� �����͸� �����ϴ� Ű���� distinct
--distinct ����
--�׷���(grouping)
select distinct job, deptno
from emp
order by job;

select distinct deptno, job
from emp
order by deptno;


--Oracle ������
--java ���� ���� (+, -, *, /) ������ %
--Oracle ���� (+, -, *, /) ������ �����ڰ� ����. >> �Լ��� ���ؼ� Mod() ��� 
--ename like '%��%'

--������̺��� ����� �޿��� 100�޶� �λ��� ����� ���

show user;

select sal+100 from emp

desc emp

--dual �ӽ� �������̺� 
select 100 + 100 from dual; -- 200
select 100 || 100 from dual --100100
select '100' + 100 from dual -- ������ ����(����ȯ ����)
select 'A100' + 100 from dual; --�ƿ� ������. �����޼��� �߻�.                                                               

--�񱳿�����
-- <  >  <=
-- ����
--java ���� (==) �Ҵ�(=) , javascript (==, ===)

--�� ������
--AND, OR , NOT

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL >= 2000;

--����� 7788���� ����� ���, �̸�, ����, �Ի����� ����ϼ���

DESC EMP;

SELECT EMPNO, ENAME, JOB, HIREDATE
FROM EMP
WHERE EMPNO = '7788';

--������ : CRUD >> CREATE (INSERT), READ (SELECT), UPDATE (UPDATE), DELETE ( DELETE)
-- DB �۾� : READ (SELECT) 70% 

--������ : ����� ����, ���(��Ʈ��ũ, ����) ����, ���� (����� ����, ��ȣȭ)
--Ʃ�� (����Ʃ��, �ϵ����) >> ����Ʃ��!!!!  >>> �ð���...
--����(�𵨷�) : ����(�䱸���� ����, �м�) : ERD 

--����� �̸��� KING �� ����� ���, �̸�, �޿� ������ ����ϼ���.

DESC EMP;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE ENAME = 'KING';

--�޿��� 2000�޷� �̻��̸� ������ MANAGER �� ����� ��� ������ ����ϼ���.

SELECT *
FROM EMP
WHERE SAL>=2000 AND JOB ='MANAGER';

--�̻�, ���� (=)
--�ʰ�, �̸�
/*      AND     OR
0 0      0      0
0 1      0      1
1 0      0      1
1 1      1      1
*/

--�޿��� 2000�޷� �ʰ� �̸鼭 ������ MANAGER�� ����� ��� ������ ����ϼ���.

SELECT *
FROM EMP
WHERE SAL>2000 AND JOB='MANAGER'

--����Ŭ ��¥ (DB������ ��¥)
--����Ŭ ��¥ (SYSDATE)
SELECT SYSDATE FROM DUAL;
--22/09/27 �տ� 20�� ������ ����


SELECT * FROM nls_session_parameters; --�ý��� ���̺�
--���� ������ �����(session) ������ ȯ������.

--�Ϲ������� 2022-09-27

--��ǻ�͸� ���� �����Ͱ� ���� �ֹ߼�(����) ������
--�ش� ���ǿ����� ����ϴٺ��� ������ ���� �ٽ� �����ϸ� ���� ���·� ������
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS'

--

SELECT HIREDATE FROM EMP;

SELECT *
FROM EMP
WHERE HIREDATE = '1980-12-17';

/*
��� �ý��� ��¥ �ʼ� ����
�Խ���
����
�۾���, ����, ����, ��ȸ��, �ۼ���¥
INSERT INTO BOARD(WRITER, TITLE, CONTENT, HIT, REGDATE)
            VALUES('ȫ�浿', 'ó���氡','������',0,SYSDATE)

REGDATE : �÷��� �����ʹ� ������ �ð� (DB����)
--TIP) MS-SQL : SELECT GETDATE()
       MYSQL : CURDATE(), CURTIME(), NOW(), SYSDATE()

*/

SELECT *
FROM EMP
WHERE HIREDATE = '1980/12/17'; --/����
-- HIREDATE ���� (YY-MM-DD) ���� �ȳ־��� ���� SESSION ���� �ٲ�⶧��

--����� �޿��� 2000�̻��̰� 4000������ ��� ����� ������ ���

SELECT *
FROM EMP
WHERE SAL>=2000 AND SAL<=4000;

SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 4000;

SELECT *
FROM EMP
WHERE DEPNO NOT IN (10,20); --DEPTNO != 10 AND DRPNO != 20

--NOT IN >> != .. AND

--POINT : NULL

CREATE TABLE MEMBER(
 USERID VARCHAR2(20) NOT NULL, --NULL�� ������� �ʰڴ� (�ʼ��Է�)
 NAME VARCHAR2(20) NOT NULL, -- �ʼ��Է�
 HOBBY VARCHAR2(50) --DEFAULT NULL ��� : ������ �Է»���
);



SELECT * FROM  MEMBER;

--NULL������
INSERT INTO MEMBER(USERID, HOBBY) VALUES('HONG','��');

--NULL���
INSERT INTO MEMBER(USERID, NAME) VALUES('HONG','ȫ�浿');

SELECT * FROM MEMBER;

--�����ϰ�
--DB���� ���� ����
--DML(������ ���۾�) : INSERT, UPDATE, DELETE
--����Ŭ �����ݿ��� ���ؼ� �����ڿ��� : COMMIT, ROLLBACK ����
--MS-SQL, MYSQL DEFAULT COMMIT >> BEGIN ��� DML �۾� .... COMMIT, ROLLBACK ����

COMMIT; --���(INSERT, UPDATE, DELETE) ���� �ݿ�

--����(COMM)�� ���� �ʴ� ��� ����� ������ ����ϼ���.
--0�� ������(�޴� ����)
SELECT COMM FROM EMP;

--COMM �÷��� ���̤ð� NULL�ΰŸ� ���
SELECT COMM FROM EMP WHERE COMM = NULL; --������ ������������




--NULL �񱳴� (IS NULL, IS NOT NULL) �ϱ�...
--������ �޴� ����� (0�� �޴� ������)
SELECT COMM
FROM EMP
WHERE COMM IS NOT NULL

--������̺��� ���, �̸�, �޿�, ����, �ѱ޿��� ����ϼ���.
--�ѱ޿� ����(�޿� + ����)

SELECT  EMPNO, ENAME, SAL, COMM, SAL+COMM AS �ѱ޿�
FROM EMP 
WHERE COMM IS NOT NULL

/*
NULL�̶�~~~
1. NULL ���� ��� ������ ����� ������ NULL ex) 100 + NULL => NULL, 100-NULL => NULL
2. �� ������ �ذ��ϱ� ���ؼ� �Լ� >> nvl(), nvl2() >> �ϱ�
ex) nvl(�÷���, ��ü��) >> ġȯ

Tip) 
     oracle > NULL > NVL
     ms-sql > null > convert()
     Mysql > null > IFNULL() >> SELECT IFNULL(NULL, "W3Schools.com");
*/
SELECT EMPNO, ENAME, SAL, COMM, SAL + NVL(COMM,0) AS �ѱ޿�
FROM EMP;

SELECT 1000 + NULL FROM DUAL;

SELECT 1000 + NVL(NULL,0) FROM DUAL;

SELECT COMM, NVL(COMM,111111111)FROM EMP;

SELECT NVL(NULL, 'HELLO WORLD') FROM DUAL;

--����� �޿��� 1000�̻��̰� ������ ���� �ʴ� ����� ���, �̸�, ����, �޿�, ������ ����Ͻÿ�.

DESC EMP;

SELECT EMPNO, ENAME, JOB, SAL, COMM
FROM EMP
WHERE SAL >= 1000 AND COMM IS NOT NULL;


--DQL : SELECT ������ ���� ������
--DDL : ���Ǿ� : CREATE, ALTER, DROP, (TABLE ����, ����, ����) >> ������ ���Ǵϼ� ������ DB���� ��ɾ�
--DML : ���۾� : INSERT, UPDATE, DELETE (�ݵ�� COMMIT, ROLLBACK)

--JAVA : CLASS BOARD (PRIVATE INT BOARDNO)
--DB : CREATE TABLE BOARD(BOARDNO NUMBER)

CREATE TABLE BOARD(
    BOARDID NUMBER NOT NULL, --����, �ʼ� �Է�
    TITLE VARCHAR2(50) NOT NULL, --������ (�ѱ� 25��, ������ 50��), �ʼ��Է�
    CONTENT VARCHAR2(2000) NOT NULL, --�۳���(�ѱ� 1000��, ������ 2000) �ʼ�
    HP VARCHAR2(20) --DEFAULT NULL ���(���û���)
);

DESC BOARD

SELECT * FROM BOARD;

ALTER TABLE BOARD RENAME COLUMN CONTENTS TO CONTENT;
COMMIT;

INSERT INTO BOARD(BOARDID, TITLE, CONTENT) 
VALUES(100, '����Ŭ', '�Ǽ��߳�');
--������ �߸� �־��� 
ROLLBACK;


COMMIT;
SELECT * FROM BOARD;

/*

*/


SELECT BOARDID, TITLE, CONTENT, HP
FROM BOARD;

SELECT BOARDID, TITLE, CONTENT, NVL(HP,'EMPTY') AS HP
FROM BOARD;

--���ڿ� �˻�
--�ּҰ˻� : �˻��� : ���� -> �����̶�� �ܾ �� �ִ� ��� �ּҰ� ���
--LIKE ���ϰ˻�
--LIKE (���ڿ� ���� �˻� ������)
--LIKE ������ (���ϵ� ī�� ���� : 1. %(����), _(�ѹ���) ���� ������ ���� ��ġ
--�˻��� ������ >> JAVA ���� ǥ������ ����Ŭ ����)

SELECT *
FROM EMP
WHERE ENAME LIKE 'A%'; --��ҹ��� �����ϰ� ����

--�ּҰ˻�
--SELECT * FROM ZIP WHERE DONG LIKE '%����%'
--SELECT * FROM MEMBER WHERE DONG LIKE '%����%'

SELECT *
FROM EMP
WHERE ENAME LIKE '%A%A%'; ---ADAMS ABABA AAAAAA


SELECT ENAME
FROM EMP
WHERE ENAME LIKE '_A%'; --ù ���ڴ� ����� �͵� ������� �ι�° ���ڴ� A����
--WARD
--MARTIN
--JAMES

--���� REGEXP_LIKE ������ (����ǥ�� ���)
SELECT * fROM EMP WHERE REGEXP_LIKE(ENAME, '[A-C]');
--����ǥ�� �˻� 5�� �����

--������ �����ϱ�
--ORDER BY �÷��� : ����, ����, ��¥
--�������� : ASC : ������ : DEFAULT
--�������� : DESC : ������
--���(COST) ���� ��� �۾�

SELECT *
FROM EMP
ORDER BY SAL; --DEFAULT ASC

SELECT *
FROM EMP
ORDER BY SAL DESC;

--�Ի����� ���� ���� ������ �����ؼ� ���, �̸�, �޿�, �Ի����� ����ϼ���

SELECT EMPNO, ENAME, SAL, HIREDATE
FROM EMP
ORDER BY HIREDATE DESC;

SELECT EMPNO, ENAME, SAL, HIREDATE
FROM EMP
ORDER BY ENAME DESC;



/*
SELECT ��    3
FROM ��      1
WHERE ��     2
ORDER BY ��  4   (SELECT ����� ����)
*/

SELECT EMPNO, ENAME, SAL, JOB, HIREDATE
FROM EMP
WHERE JOB='HANAGER'
ORDER BY HIREDATE DESC



SELECT JOB, DEPTNO
FROM EMP
ORDER BY JOB ASC , DEPTNO DESC;
--ORDER BY �÷��� ASC, �÷��� ASC..... 
--�Խ��� ..�亯�Խ���

--������
--������(UNION) : ���̺�� ���̺��� �����͸� ��ġ�°�(�ߺ��� ����)
--������(UNION ALL) : �ߺ��� ���

CREATE TABLE UTA(NAME VARCHAR2(20));


INSERT INTO UTA(NAME) VALUES('AAA');
INSERT INTO UTA(NAME) VALUES('BBB');
INSERT INTO UTA(NAME) VALUES('CCC');
INSERT INTO UTA(NAME) VALUES('DDD');
COMMIT;


CREATE TABLE UT(NAME VARCHAR2(20));
INSERT INTO UT(NAME) VALUES('AAA');
INSERT INTO UT(NAME) VALUES('BBB');
INSERT INTO UT(NAME) VALUES('CCC');
COMMIT;



SELECT * FROM UTA;

--�ߺ������͸� ���̰� ��ħ.
SELECT * FROM UT
UNION
SELECT * FROM UTA

SELECT * FROM UT
UNION ALL
SELECT * FROM UTA
--UT ���� UTA �������� �����

--UNION
--1. �����Ǵ� �÷��� Ÿ���� �����ؾ���.
--�Ʒ��� ���� �� �����Ǵ� �÷��� Ÿ���� �ٸ��� ������ UNION  ����� �Ұ���.
SELECT EMPNO, ENAME FROM EMP
UNION
SELECT DNAME, DEPTNO FROM DEPT;



SELECT EMPNO, ENAME FROM EMP
UNION
SELECT DEPTNO, DNAME FROM DEPT;

--2. [����]��� [�÷�]�� ������ ����
SELECT EMPNO, ENAME, JOB, SAL FROM EMP
UNION
SELECT DEPTNO, DNAME, LOC, NULL FROM DEPT;

--------------------------------------------------
---�Լ�
--�Լ� ����ϱ�
--

/*
 ���� �� �Լ��� ���� 
1) ������ �Լ� : ���ڸ� �Է� �ް� ���ڿ� ���� �� ��θ� RETURN �� �� �ִ�.
2) ������ �Լ� : ���ڸ� �Է� �ް� ���ڸ� RETURN �Ѵ�.
3) ��¥�� �Լ� : ��¥���� ���� �����ϰ� ���ڸ� RETURN �ϴ� MONTHS_BETWEEN �Լ���
�����ϰ� ��� ��¥ ���������� ���� RETURN �Ѵ�.
4) ��ȯ�� �Լ� : � ���������� ���� �ٸ� ������������ ��ȯ�Ѵ�.
5) �Ϲ����� �Լ� : NVL, DECODE
*/
--���ڿ� �Լ�


SELECT INITCAP('THE SUPER MAN')
 FROM DUAL; --The Super Man
 
 SELECT LOWER('AAA'), UPPER('aaa') FROM DUAL;
 
 SELECT ENAME, LOWER(ENAME) AS "ENAME" FROM EMP;
 
 --�̷��� ������ ã�� ��� ����ϸ� ����.
 SELECT * FROM EMP WHERE LOWER(ENAME) = 'king';
 
 SELECT LENGTH('ABCD') FROM DUAL; --���ڿ��� ����
 SELECT LENGTH('ȫ�浿') FROM DUAL; --3��
 
 SELECT CONCAT('A','B') FROM DUAL;
 --SELECT CONCAT('A','B','C') FROM DUAL; CONCAT�� 3���ؾ���
 SELECT 'A'||'B'||'C' FROM DUAL;
  
 SELECT ENAME || '      ' || JOB FROM EMP;
 SELECT CONCAT(ENAME, JOB) FROM EMP;
 
 --JAVA : SUBSTRING
 --ORACLE : SUBSTR
 
 SELECT SUBSTR('ABCDE', 2, 3) FROM DUAL; --BCD
 SELECT SUBSTR('ABCDE', 1, 1) FROM DUAL; --A
 SELECT SUBSTR('ABCDE', 3, 1) FROM DUAL; --C
 
 SELECT SUBSTR('abcasdwgqwgawgawdwgwgasg',3) FROM DUAL;
 
 
 
 SELECT SUBSTR('ABCDE', -2,1) FROM DUAL; -- �ڿ��� ���� ���� D
 SELECT SUBSTR('ABCDE', -2,2) FROM DUAL;
 
 --������̺��� ENAME �÷��� �����Ϳ� ���ؼ� ù���ڴ� �ҹ��ڷ� ������ ���ڴ� �빮�ڷ�
 --����ϵ� �ϳ��� �÷����� ���� ����Ͻð� �÷��� ��Ī�� FULLNAME �ϰ� ù���ڿ�
 --������ ���� ���̿��� �����ϳ��� �����ÿ�.

SELECT LOWER(SUBSTR(ENAME,1,1))|| '      ' || UPPER(SUBSTR(ENAME,1)) AS FULLNAME
FROM EMP

SELECT LPAD('ABC', 10, '*') FROM DUAL; --******ABC

SELECT RPAD('ABC', 10, '&') FROM DUAL; --ABC&&&&&&&

--������� ��� : HONG1007 OR K1234
--ȭ�� : �� �α���  >> HO*******
--               >> K1*****

SELECT  RPAD(SUBSTR('HONG1007',1,2),LENGTH('HONG1007'),'*'), RPAD(SUBSTR('K1234',1,2),LENGTH('K1234'),'*')
FROM EMP

--EMP ���̺��� ENAME �÷��� �����͸� ����ϵ� ù���ڸ� ����ϰ� �������� * �� ���

SELECT RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME),'*')
FROM EMP;


CREATE TABLE MEMBER2(
    ID NUMBER, --�ڿ� �ƹ��͵� �Ⱦ��� NULL�� ����ϰڴ�.
    JUMIN VARCHAR2(14)
);

INSERT INTO MEMBER2(ID,JUMIN) VALUES(100,'123456-1234567');
INSERT INTO MEMBER2(ID,JUMIN) VALUES(200,'123456-1234567');
COMMIT;

SELECT * FROM MEMBER2;
--��°��
--100 : 123456-********
--200 : 

SELECT  ID || ' : ' || RPAD(SUBSTR(JUMIN,1,7), LENGTH(JUMIN), '*') AS JUMINNUBER
FROM MEMBER2

DELETE FROM MEMBER2;


--RTRIM �Լ�
--������ ���� ������

SELECT RTRIM('MILLER', 'ER') FROM DUAL; --MILL

SELECT '>' || RTRIM('MILLER           ', ' ') || '<' FROM DUAL;

SELECT '>' || LTRIM('            MILLER', ' ') || '<' FROM DUAL;

---ġȯ�Լ�
SELECT ENAME, REPLACE(ENAME, 'A','�Ϳ�') FROM EMP

--�����Լ�
--ROUND(�ݿø� �Լ�)
--TRUNC(�����Լ�)
--MOD() �������� ���ϴ� �Լ�


--- -3 -2 -1 0(����) 1 2 3
SELECT ROUND(12.345,0) AS "R" FROM DUAL; --�����θ� ���ܶ� --12
SELECT ROUND(12.567,0) AS "R" FROM DUAL; --13

SELECT ROUND(12.345,1) AS "R" FROM DUAL; --12.3
SELECT ROUND(12.567,1) AS "R" FROM DUAL; --12.6

SELECT ROUND(12.345,-1) AS "R" FROM DUAL; --10
SELECT ROUND(15.567,-1) AS "R" FROM DUAL; --20



--©�������.
SELECT TRUNC(12.345,0) AS "R" FROM DUAL; --�����θ� ���ܶ� --12
SELECT TRUNC(12.567,0) AS "R" FROM DUAL; --12

SELECT TRUNC(12.345,1) AS "R" FROM DUAL; --12.3
SELECT TRUNC(12.567,1) AS "R" FROM DUAL; --12.5

SELECT TRUNC(12.345,-1) AS "R" FROM DUAL; --10
SELECT TRUNC(15.567,-1) AS "R" FROM DUAL; --10


--������
SELECT 12 / 10 FROM DUAL; --1.2

SELECT MOD(12,10) FROM DUAL; --2

SELECT MOD(0,0) FROM DUAL;


--��¥�Լ�
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
SELECT SYSDATE FROM DUAL;

--POINT(��¥ ����)
--1. DATE + NUMBER >> DATE
--2. DATE - NUMBER >> DATE
--3. DATE - DATE >> NUMBER(�ϼ�)

SELECT SYSDATE + 100 FROM DUAL;
SELECT SYSDATE + 1000 FROM DUAL;

SELECT HIREDATE FROM EMP;
SELECT MONTHS_BETWEEN('2022-09-27','2019-09-27') FROM DUAL;
SELECT MONTHS_BETWEEN(SYSDATE, '1992-12-08') FROM DUAL;

SELECT '2022-01-01' + 100 FROM DUAL; --'2022-01-01' ��¥������ ������ ����
--POINT ��ȯ�Լ� TO_DATE()

SELECT TO_DATE('2022-01-01') + 100 FROM DUAL;

--��� ���̺��� ������� �Ի��Ͽ��� ���糯¥������ �ټӿ���
DESC EMP

SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS A
FROM EMP
--1. ��� ���̺��� ������� �Ի��Ͽ��� ���糯¥������ �ټӿ����� ���ϼ���.
--����̸�, �Ի���, �ټӿ��� ���
--�� �ټӿ����� �����κи� ���(�ݿø� ���� ������)
SELECT EMPNO, HIREDATE,
TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE),0) AS '�ټӿ���'
FROM EMP;

--2. �Ѵ��� 31�� �̶�� ���ؿ��� �ټӿ����� ���ϼ���.
--(�ݿø� ���� ������) (�Լ� ���(X) >> ��¥ - ��¥ >> 150�� �ҿ�)
SELECT EMPNO, HIREDATE, TRUNC((SYSDATE-HIREDATE)/31,0) AS "�ټӿ���"
FROM EMP

--��ȯ�Լ� TODAY POINT
--ORACLE ������ : ���ڿ�, ����, ��¥
--TO_CHAR() : ���� -> ���� (1000 -> $100,000) >> FORMAT ������� ����

-- ��¥ -> ���� ('2022-09-29' -> 2022��09��29��)

SELECT TO_CHAR(SYSDATE)
FROM DUAL;

--TO_NUMBER() : ���� -> ���� >> �ڵ�����ȯ
--SELECT '100' + 100 FROM DUAL;
--1.
SELECT '1' + 1 FROM DUAL;
SELECT TO_NUMBER('1') + 1 FROM DUAL; --'1' ���� -> ����(����ȯ)
--��Ģ
SELECT TO_NUMBER('1') + 1 FROM DUAL;

--2
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY') || '��' AS "YYYY",
TO_CHAR(SYSDATE,'YEAR') AS "YEAR",
TO_CHAR(SYSDATE,'MM') AS "MM",
TO_CHAR(SYSDATE,'DD') AS "DAY", 
TO_CHAR(SYSDATE,'DAY') AS "DY" 
FROM DUAL

--�Ի��� 12���� ����� ���, �̸�, �Ի���, �Ի�⵵, �Ի���� ���

DESC EMP;

SELECT TO_CHAR(SYSDATE,'YYYY') || '��' AS �Ի�⵵,
TO_CHAR(HIREDATE,'MM') || '��' AS �Ի��,
TO_CHAR(HIREDATE,'DD') || '��' AS �Ի���
FROM EMP
WHERE TO_CHAR(HIREDATE,'MM') ='12';


SELECT TO_CHAR(HIREDATE, 'YYYY MM DD') FROM EMP;
--TO_CHAR() : ��¥ -> ���Ĺ��� ��ȯ
--����Ŭ.PDF 68PAGE ǥ����

--TO_CHAR : ���� -> ���Ĺ��� ��ȯ
--����Ŭ.PDF 71PAGE ǥ����
--100000000 -> $10,000,000

SELECT '>' || TO_CHAR(12345, '9999999999999999') || '<' FROM DUAL;

SELECT SAL, TO_CHAR(SAL, '$999,999') FROM EMP;

---------------------------------------------------------------
 --HR �������� ����
show user;
--USER��(��) "HR"�Դϴ�.
select * from employees;
select sysdate  from dual;
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
/*
������̺�(employees)���� ����� �̸��� last_name , first_name ���ļ� fullname ��Ī 
�ο��ؼ� ����ϰ� �Ի�����  YYYY-MM-DD �������� ����ϰ� ����(�޿� *12)�� ���ϰ� 
������ 10%(���� * 1.1)�λ��� ����
����ϰ� �� ����� 1000���� �޸� ó���ؼ� ����ϼ���
�� 2005�� ���� �Ի��ڵ鸸 ����ϼ��� �׸��� ������ ���� ������  ����ϼ���*/

DESC employees
TO_CHAR(SAL, '$999,999')

SELECT TO_CHAR(FIRST_NAME) || TO_CHAR(LAST_NAME) AS FULLNAME, 
 TO_CHAR(HIRE_DATE,'YYYY')||'-'||TO_CHAR(HIRE_DATE,'MM')||'-'||TO_CHAR(HIRE_DATE,'DD') AS �Ի���, 
TO_CHAR((SALARY*12*1.1),'$999,999') AS ����
FROM employees
WHERE TO_CHAR(HIRE_DATE,'YYYY') >= '2005'
ORDER BY SALARY DESC



SELECT TO_CHAR(FIRST_NAME) || TO_CHAR(LAST_NAME) AS FULLNAME, 
TO_CHAR(HIRE_DATE,'YYYY-MM-DD'),
TO_CHAR((SALARY*12*1.1),'$999,999') AS �����λ�
FROM employees
WHERE TO_CHAR(HIRE_DATE,'YYYY') >= '2005'
ORDER BY �����λ� DESC

---�����Լ�, �����Լ�, ��¥�Լ�
--��ȯ�Լ�(TO_CHAR, TO_NUMBER)

--�Ϲ��Լ�(NVL, NVL2 ...)
--�����Լ� (AVG(), SUM(), MIN(), MAX())
--------------------------------------------



# SQL�ڵ�����


select last_name || first_name as "fullname",
to_char(hire_date , 'YYYY/MM/DD') as "�Ի���",
ltrim(to_char(((salary*12)*1.1), '$999,999,999')) as "�����λ�"
from employees
order by "�����λ�" desc ;


show user;

--ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS';

SELECT SYSDATE FROM DUAL;


-----------------------------------------------------------------------------

CREATE TABLE ���̺��(�÷��� Ÿ��, �÷���)

CREATE TABLE MEMBER3(AGE NUMBER);
--1�� �Ǵ� 100��

INSERT INTO MEMBER3(AGE) VALUES(100);
INSERT INTO MEMBER3(AGE) VALUES(200);
INSERT INTO MEMBER3(AGE) VALUES(300);
INSERT INTO MEMBER3(AGE) VALUES(400);

-----------------------------------------------------------------------------
/*
    CLASS MEMEBER3(PRIVATE INT AGE;)
    --1��
    MEMBER3 M = NEW MEMBER3();
    M.setAge(100);
    
    100�� ������ �־��
    List<member3> mlist = new ArrayList<member3();
    mlist.add(new member(100));
    mlist.add(new member(200));
    mlist.add(new member(300));
    mlist.add(new member(400));
    
    ������ Ÿ��
    ���ڿ� Ÿ��
    char(10) >> 10byte >> �ѱ�5��, ������, Ư��, ���� 10�� >> �������� ���ڿ�
    
    varchar2(10) >> 10byte >> �ѱ�5��, ������, Ư��, ���� 10�� >> �������� ���ڿ�
    
    >>
    char(10) >> 'abc' >> 3byte >> [a][b][c][][][][][][][][] >> ������ ��ȭ�� ����
    varchar(10) >> 'abc' >> 3byte >> [a][b][c]>> ������ ũ�⸸ŭ ������ �����, >> arrayList�� ����� ����
    
    ����̸�
    create table member (name char(30))
    create table member (name varchar2(3)) (0)
    
    ���� (�� �Ǵ� ��)
    create table member(gender char(3))
    create table member(gender varchar2(3)) (0)
    
   ��� : �������� ���ڿ� (��,�� .... ��,��,�� ... �ֹι�ȣ) char() --> ���� 
      �������� ���ڿ� (����� �̸� , ��� , �ּ�) varchar2()
      
char() , varchar2() ��� : �ѱ۰� ���� ȥ��
varchar2(10)

unicode (2byte) : �ѱ�, ������ , Ư������, ���� >> 2byte

nchar(20)  >> 20�� >> 2*20 >> 40byte
nvarchar2(20) >> 20��  

*/
--����Ŭ �Լ� ......
select * from SYS.NLS_DATABASE_PARAMETERS;
--NLS_CHARACTERSET  : 	AL32UTF8  �ѱ� 3byte �ν�
--KO16KSC5601 2Byte (���� ��ȯ�ϸ� �ѱ� �ٱ���)
select * from nls_database_parameters where parameter like '%CHAR%';
--------------------------------------------------------------------------
    
create table test2(name varchar2(2));

insert into test2(name) values('a');
insert into test2(name) values('aa');
insert into test2(name) values('��'); --�ѱ� 1�� 3byte ����
-------------------------------------------------------------------------------
create table test3(name nchar(2) , ename nvarchar2(2));

insert into test3(name) values('a');
insert into test3(name) values('��');

insert into test3(name) values('ab');
insert into test3(name) values('����');

insert into test3(name) values('abc');
insert into test3(ename) values('������');
commit;

--------------------------------------------------------------------
--�Ϲ��Լ�(���α׷� ������ ���� �Լ�)
--NVL(), NVL2() >> NULL ó���ϴ� �Լ�
--DECODE() >> JAVA�� IF��
--CASE() >> JAVA�� SWITCH �� ����

--����Ŭ SQL(����, ��� ������ ����)
--����Ŭ PL-SQL(����, ���) ��ޱ��

SELECT COMM, NVL(COMM, 0) FROM EMP;

CREATE TABLE T_EMP(
    ID NUMBER(6), --���� 6�ڸ�
    JOB NVARCHAR2(20)
)



SELECT * FROM T_EMP;

INSERT INTO T_EMP(ID,JOB) VALUES(100,'IT');
INSERT INTO T_EMP(ID,JOB) VALUES(200,'SALES');
INSERT INTO T_EMP(ID,JOB) VALUES(300,'MGR');
INSERT INTO T_EMP(ID) VALUES(400);
INSERT INTO T_EMP(ID,JOB) VALUES(500,'IT');
COMMIT;

SELECT * FROM T_EMP;

SELECT ID, DECODE(ID,
100,'����Ƽ',
200,'������',
300,'������',
'��Ÿ�μ�') AS �μ��̸�
FROM T_EMP;

SELECT EMPNO, ENAME, DEPTNO, DECODE
(DEPTNO,
10,'�λ��',
20,'������',
30,'ȸ���',
40,'�μ�',
'ETC') AS �μ��̸�
FROM EMP;



CREATE TABLE t_emp2(
id NUMBER(2),
jumin CHAR(7)
);
INSERT INTO t_emp2(id, jumin) VALUES(1,'1234567');
INSERT INTO t_emp2(id, jumin) VALUES(2,'2234567');
INSERT INTO t_emp2(id, jumin) VALUES(3,'3234567');
INSERT INTO t_emp2(id, jumin) VALUES(4,'4234567');
INSERT INTO t_emp2(id, jumin) VALUES(5,'5234567');
COMMIT;


SELECT ID, DECODE(SUBSTR(JUMIN,1,1),
1,'����',
2,'����',
3,'�߼�',
'��Ÿ')AS ����
FROM T_EMP2

/*
 ���빮��: HINT) IF�� �ȿ� IF��
    �μ���ȣ�� 20���� ����߿��� SMITH ��� �̸��� ���� ����̶�� HELLO ���� ����ϰ�
    �μ���ȣ�� 20���� ����߿��� SMITH ��� �̸��� ���� ����� �ƴ϶�� WORLD ���� ����ϰ�
    �μ���ȣ�� 20���� ����� �ƴ϶�� ETC ��� ���ڸ� ����ϼ���
*/
SELECT EMPNO, DEPTNO, DECODE(DEPTNO,20,DECODE(ENAME,'SMITH','HELLO','WORLD'),'ETC')
FROM EMP;

--DECODE �پ��� ���
/*
CASE ���ǽ� WHEN ���1 THEN ���1
           WHEN ���2 THEN ���2
           WHEN ���3 THEN ���3
           ELSE ��� 4
END "�÷���"
*/

CREATE TABLE T_ZIP
(
    ZIPCODE NUMBER(10)
);

SELECT * FROM T_ZIP;

INSERT INTO T_ZIP(ZIPCODE) VALUES(2);
INSERT INTO T_ZIP(ZIPCODE) VALUES(31);
INSERT INTO T_ZIP(ZIPCODE) VALUES(32);
INSERT INTO T_ZIP(ZIPCODE) VALUES(41);
COMMIT;

SELECT * FROM T_ZIP;

SELECT '0' || TO_CHAR(ZIPCODE), CASE ZIPCODE WHEN 2 THEN '����'
                                             WHEN 31 THEN '���'
                                             WHEN 41 THEN '����'
                                             ELSE '��Ÿ����'
                                END "�����̸�"
FROM T_ZIP;

/*
������̺��� ����޿��� 1000�޷� ���ϸ� 4��
1001�޷� 2000�޶� ���ϸ� 3��
2001�޷� 3000�޶� ���ϸ� 2��
3001�޷� 4000�޶� ���ϸ� 2��
4001�޷� �̻��̸� 'Ư��'�̶�� �����͸� ���
--1. CASE �÷��� WHEN ��� THEN ���
--2. �񱳽��� �ʷ��ϴٸ� 
     CASE WHEN ���� �񱳽� THEN
     WHEN ....
     WHEN ....
*/

SELECT CASE WHEN SAL <=1000 THEN '4��'
            WHEN SAL BETWEEN 1001 AND 2000 THEN '3��'
            WHEN SAL BETWEEN 2001 AND 3000 THEN '2��'
            WHEN SAL BETWEEN 3001 AND 4000 THEN '1��'
            ELSE 'Ư��'
        END "�޼�", EMPNO, ENAME
FROM EMP;
-----------------------------------------------------------------
--�����Լ�, �����Լ�, ��¥�Լ�, ��ȯ�Լ�(TO_CHAR, TO_NUMBER, TO_DATE)
--�Ϲ��Լ� (NVL, DECODE(), CASE����)
--�⺻�Լ� END
-----------------------------------------------------------------
--�����Լ�(�׷�)�Լ�
--����Ŭ.PDF(75)
/*
1. COUNT(*) >> ROW��, COUNT(�÷���) >> ������ �Ǽ� > (NULL �� �������� �ʾƿ�)
2. SUM()
3. AVG()
4. MAX()
5. MIN()
--��Ÿ

1. �����Լ��� GROUP BY ���� ���� ���
2. ��� �����Լ��� NULL ����
3. SELECT ���� �����Լ� �̿ܿ� �ٸ� �÷��� ���� �ݵ�� �� �÷��� GROUP BY ���� ���

*/

SELECT COUNT(*) FROM EMP; --14���� ROW

SELECT COUNT(EMPNO) FROM EMP;

SELECT COUNT(COMM) FROM EMP; --6 �ξ��°͸� ��


SELECT COUNT(NVL(COMM,0)) FROM EMP; --POINT
--�޿�����
SELECT SUM(SAL) AS �޿����� FROM EMP;

SELECT ROUND(AVG(SAL),0) AS �޿������ FROM EMP;


--����� �츮ȸ�� �� ������ �󸶳� ���޵Ǿ���.

SELECT SUM(COMM) FROM EMP;

--������ ���

SELECT ROUND(AVG(COMM),0) FROM EMP;

SELECT (300+200+30+300+3500+0) / 6 FROM DUAL;

SELECT AVG(NVL(COMM,0)) FROM EMP;

--�Ѵ� ���� ȸ�� ��Ģ�� ���� ������ �޶�����
--������ 721, 309 �Ѵ� �´´�
--ȸ���� ����(��ü ����� ���� --309)
--ȸ���� ����(��ü ����� ���� --721)


SELECT MAX(SAL) FROM EMP;

SELECT MIN(SAL) FROM EMP;

SELECT EMPNO, COUNT(EMPNO) FROM EMP;
--14��       1��

SELECT SUM(SAL), AVG(SAL), MAX(SAL), MIN(SAL), COUNT(SAL) FROM EMP;

--�μ��� ��� �޿��� ���ϼ���.
DESC EMP;

SELECT DEPTNO, ROUND(AVG(SAL)), COUNT(*)    --3
FROM EMP                                    --1
GROUP BY DEPTNO;                            --2

--������ ��� �޿��� ���ϼ���.

SELECT JOB, ROUND(AVG(SAL))
FROM EMP
GROUP BY JOB;

--������, ��ձ޿�, �޿���, �ִ�޿�, �ּұ޿�, �Ǽ��� ���Ͻÿ�.

SELECT ROUND(AVG(SAL)), SUM(SAL), MAX(SAL), MIN(SAL), COUNT(*)
FROM EMP
GROUP BY JOB;

/*
 �׷�
 DISTINCT �÷���1, �÷���2
 ORDER BY �÷���1, �÷���2
 GROUP BY �÷���1, �÷���2
*/
--�μ���, ������ �޿��� ���� ���Ͻÿ�.

SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO;

/*
SELECT ��        4
FROM ��          1
WHERE ��         2
GROUP BY ��      3
ORDER BY ��      5
*/

--������ ��ձ޿��� 3000�޷� �̻��� ����� ������ ��ձ޿��� ���

SELECT JOB, SAL
FROM EMP
WHERE SAL IN(SELECT AVG(SAL) FROM EMP GROUP BY JOB)

AND 
(SELECT AVG(SAL) FROM EMP GROUP BY JOB) >=3000


SELECT JOB, AVG(SAL) AS ��ձ޿�
FROM EMP
--WHERE AVG(SAL) >= 3000 --WHERE ���� --����� ����� ������ ����.
GROUP BY JOB
HAVING AVG(SAL)>=3000;

(�������)
                              
 --1.  from ������ where 
 --2.  group by ������ having
/*
select           5
from             1
where            2
group by         3
having           4 
order by         6

*/
/* 
������̺��� ������ �޿����� ����ϵ� ������ ���� �ް� �޿��� ���� 
5000 �̻���  ������� ����� ����ϼ���
�޿��� ���� ���� ������ ����ϼ��� 
*/


SELECT JOB, SUM(SAL)
FROM EMP
WHERE COMM IS NOT NULL
GROUP BY JOB
HAVING SUM(SAL) >= 5000
ORDER BY SUM(SAL);

/* ������̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ ,�ο��� , �޿��� ���� ����ϼ��� */

DESC EMP;

select deptno, sum(sal)
from emp
group by deptno
having count(*) > 4;



/* ������̺��� ������ �޿��� ���� 5000�� �ʰ��ϴ� ������ �޿��� ���� ����ϼ���.
   �� �Ǹ�����(SALESMAN)�� �����ϰ� �޿������� �������� �����ϼ���/*/
      
   SELECT JOB, SUM(SAL)
   FROM EMP
   WHERE JOB!='SALESMAN'
   GROUP BY JOB
   HAVING SUM(SAL)>5000 
   ORDER BY SUM(SAL) DESC;
  
  
  -------------------------------------------------------------------------------
  --���� ���̺� ���̤ø� �������� ���� END ------------------------------------------
  -------------------------------------------------------------------------------
  
  --�������� ���̺��� ���ϴ� �����͸� �����ϴ� ���
  --JOIN(����)
  --���� ���̺�κ��� ������ �˻�
  
  
--Equijoin Join ������ ��Ȯ�� ��ġ�ϴ� ��� ���(�Ϲ������� PK �� FK ���)
--Non-Equijoin Join ������ ��Ȯ�� ��ġ���� �ʴ� ��쿡 ���(���,����)
--Outer Join Join ������ ��Ȯ�� ��ġ���� �ʴ� ��쿡�� ��� ����� ���
--Self Join �ϳ��� ���̺��� ����� Join �ϰ��� �� ��쿡 ���
--Set Operators ���� ���� SELECT ������ �����Ͽ� �ۼ��Ѵ�
   
--RDBMS (������) 
   
/*
���� (���̺�� ���̺���� ����
1 : 1
1 : N (70%)
M : N 
*/



--create table M (M1 char(6) , M2 char(10));
--create table S (S1 char(6) , S2 char(10));
--create table X (X1 char(6) , X2 char(10));
--
--insert into M values('A','1');
--insert into M values('B','1');
--insert into M values('C','3');
--insert into M values(null,'3');
--commit;
--
--insert into S values('A','X');
--insert into S values('B','Y');
--insert into S values(null,'Z');
--commit;
--
--insert into X values('A','DATA');
--commit;


SELECT * FROM M;
SELECT * FROM S;
SELECT * FROM X;


/*
1. �����(EQUI JOIN)
�����̺�� ������� ���̺� �ִ� �÷��� �����͸� 1:1 ����
1.1 ����
-SQL JOIN����(����Ŭ ����) > ����
-ANSI����(ǥ��) ���� > ������ > [INNER] JOIN ON ������
*/

SELECT *
FROM M,S
WHERE M.M1 = S.S1

--ANSI ����


SELECT *
FROM M INNER JOIN S
ON M.M1 = S.S1;
------�� �Ʒ� ���� 
SELECT *
FROM M JOIN S   --����
ON M.M1 = S.S1; --ON ������ ������

--�����ȣ, ����̸�, �μ���ȣ, �μ��̸��� ����ϼ���.

SELECT *
FROM EMP JOIN DEPT
ON EMP.DEPTNO = DEPT.DEPTNO;

SELECT *
FROM M JOIN X
ON M.M1 = X.X1


--JOIN
--���̺� 2��, 3��, 4��
--SQL JOIN

SELECT M.M1, M.M2, S.S2, X.X2
FROM M, S, X
WHERE M.M1 = S.S1 AND S.S1 = X.X1;
-- A = B, B = C, A = C
--ANSI ����
SELECT *
FROM M JOIN S ON M.M1 = S.S1
       JOIN X ON S.S1 = X.X1;
       
       
--HR �������� �̵�

SHOW USER; --USER��(��) "HR" �Դϴ�.
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;


--����) ���, �̸�(LAST_NAME), �μ���ȣ, �μ��̸��� ���(ANSI)

SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D
                ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
--������
--����� 107���ε� (������ ������)
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IS NULL;
--����� NULL ó�� �Ұ� >> �ٸ� ���� >> ��� �Ŀ�

--1. ���, �̸�(LAST_NAME), �μ���ȣ, �μ��̸�, �����ڵ�, ���ø� ����ϼ��� (ANSI)

SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME,
L.LOCATION_ID, L.CITY
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                 JOIN LOCATIONS L ON L.LOCATION_ID = D.LOCATION_ID



--------------------------------------------------------------------------------------
SHOW USER; 

--2. �� ���� (NON-EQUI JOIN) => 1:1�� ���� �÷��� ���� ���
--�ǹ̸� ���� >> ������� ������ �״�� ���
--1:1 ���� ON EMP.DEPTNO = DEPT.DEPTNO

SELECT * FROM EMP;
SELECT * FROM SALGRADE

SELECT *
FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

--3. OUTER JOIN (EQUI JOIN ���� �����ϰ� ���� + �����ִ� ������ �������� ��)
--OUTER JOIN ���� ���ʸ� �ľ�
--������ �Ǵ� ���̺��� ���� �����͸� ���� �� �� �ִ�.
--����
--3.1 LEFT OUTER JOIN (������ ����)
--3.2 RIGHT OUTER JOIN (�������� ����)
--3.3 FULL OUTER JOIN(LEFT, RIGHT ���� ���Ͽ�(UNION) �Ѱ��̴�)

SELECT * FROM M
SELECT * FROM S

--������ ���ϰ� ������ ���� �����͸� �������� ����
--OUTER�� ���� �Ƚᵵ �ȴ�.
SELECT *
FROM M LEFT JOIN S
ON M.M1 = S.S1;

SELECT *
FROM M RIGHT JOIN S
ON M.M1 = S.S1;

SELECT *
FROM M FULL OUTER JOIN S
ON M.M1 = S.S1;



--����) ���, �̸�(LAST_NAME), �μ���ȣ, �μ��̸��� ���(ANSI)
SHOW USER;
--������
--����� 107(������ ����)
--����� null ó�� �Ұ� >> �ٸ� ���� >> left join ���

SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
                ON E.DEPARTMENT_ID = D.DEPARTMENT_ID

-----------------------------------------------------------------------------------------

SELECT * FROM EMP;

--3. SELF JOIN(�ڱ� ����) -> ����(X) �ǹ̸� ���� >> �����(����)
--�ڱ����� ���̺�ȿ��� �÷����� ������ �ٸ� �÷����� ���ϴ� �ǹ�
-- �ߺ������Ͱ� ����� �װ� �������� ���
--�ϳ��� ���̺� �ִ� �ø��� �ڽ��� ���̺� �ִ� �ٸ� �÷��� �����ϴ� ���
--EMP >> Mgr(������)


---------------------------------------------------------------------------------
select * from emp;
--3. self join (�ڱ�����) -> ����(X) �ǹ̸� ���� >> �����(����)
--�ϳ��� ���̺� �ִ� column �� �ڽ��� ���̺� �ִ� �ٸ� column�� �����ϴ� ���
--Emp >> Mgr(������)
select e.empno, e.ename, m.empno, m.ename
from emp e join emp m
on e.mgr = m.empno; --������ ����: ��� ���� 14���ε� 13�� �ۿ� �ȳ���.. 

select * from emp where ename = 'KING';

select e.empno, e.ename, m.empno, m.ename
from emp e left join emp m
on e.mgr = m.empno; --���� �ذ�� join �տ� left �ٿ���
--



-- 1. ������� �̸�, �μ���ȣ, �μ��̸��� ����϶�.

SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM  EMP E JOIN DEPT D
          ON E.DEPTNO = D.DEPTNO;
?

-- 2. DALLAS���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �μ��̸���

-- ����϶�.
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E JOIN DEPT D
           ON E.DEPTNO = D.DEPTNO
WHERE D.LOC = 'DALLAS';

  SELECT * FROM DEPT
    
SELECT * FROM EMP  
  
DESC EMP

DESC DEPT
?

-- 3. �̸��� 'A'�� ���� ������� �̸��� �μ��̸��� ����϶�.

SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E JOIN DEPT D
           ON E.DEPTNO = D.DEPTNO
WHERE UPPER(E.ENAME) LIKE 'A%';

?

?

-- 4. ����̸��� �� ����� ���� �μ��� �μ���, �׸��� ������

--����ϴµ� ������ 3000�̻��� ����� ����϶�.

SELECT E.ENAME, E.DEPTNO, D.DNAME, E.SAL
FROM EMP E JOIN DEPT D
           ON E.DEPTNO = D.DEPTNO
WHERE SAL >= 3000;

?

-- 5. ����(����)�� 'SALESMAN'�� ������� ������ �� ����̸�, �׸���

-- �� ����� ���� �μ� �̸��� ����϶�.
SELECT E.ENAME, E.DEPTNO, D.DNAME, E.SAL
FROM EMP E JOIN DEPT D
           ON E.DEPTNO = D.DEPTNO
WHERE JOB = 'SALESMAN';


?

SELECT * FROM EMP
-- 6. Ŀ�̼��� å���� ������� �����ȣ, �̸�, ����, ����+Ŀ�̼�,

-- �޿������ ����ϵ�, ������ �÷����� '�����ȣ', '����̸�',

-- '����','�Ǳ޿�', '�޿����'���� �Ͽ� ����϶�.

--(�� ) 1 : 1 ���� ��� �÷��� ����

SELECT E.EMPNO, E.ENAME, E.SAL, (E.SAL+NVL(E.COMM,0)), S.GRADE
FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;


-- 7. �μ���ȣ�� 10���� ������� �μ���ȣ, �μ��̸�, ����̸�,

-- ����, �޿������ ����϶�.

SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = 10;

-- 8. �μ���ȣ�� 10��, 20���� ������� �μ���ȣ, �μ��̸�,

-- ����̸�, ����, �޿������ ����϶�. �׸��� �� ��µ�

-- ������� �μ���ȣ�� ���� ������, ������ ���� ������

-- �����϶�.

SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO IN(10,20)
ORDER BY SAL;

-- 9. �����ȣ�� ����̸�, �׸��� �� ����� �����ϴ� ��������

-- �����ȣ�� ����̸��� ����ϵ� ������ �÷����� '�����ȣ',

-- '����̸�', '�����ڹ�ȣ', '�������̸�'���� �Ͽ� ����϶�.

--SELF JOIN (�ڱ� �ڽ����̺��� �÷��� ���� �ϴ� ���)


SELECT E.EMPNO, E.ENAME 
FROM EMP E left JOIN EMP M
ON E.MGR = M.EMPNO

--��Ÿ
--NATURAL JOIN
--Equijoin�� �����ϴٰ� ���ø� �˴ϴ�
--[�� ���̺�]�� [������ �̸�]�� ������ �÷��� [��� ����]�� �˴ϴ�
SELECT empno, ename, deptno, dname FROM emp NATURAL JOIN dept;

--Join ~ USING
--NATURAL JOIN�� ������ ������ �̸��� ������ �÷��� ��� ������ �Ǵµ�
--USING���� ����ϸ� �÷��� �����ؼ� ���� �� �� �ִ�
SELECT e.empno, e.ename, deptno, dname FROM emp e JOIN dept d
USING(deptno);

--���� ������ ���� ���� ���
select * from emp, dept; --īŸ�þ� ��

SELECT * FROM EMP CROSS JOIN DEPT;

-------------------------------------------------------------------------
--�ذ� (�ʱް�����) �ݵ�� 
-------------------------------------------------------------------------
/*
subquery
����Ŭ.pdf(7�� 100page)

sql ��..... sql ���� �ذ��

1. �Լ� > �������̺�, ���� ���̺�(join, union) >> subquery 
   ������ �ȵɰ�� ���������� �������!!
*/
--������̺��� ������� ��� ���޺��� �� ���� ������ �޴� ����� ���, �̸�, �޿��� ����Ͻÿ�.
DESC EMP

--�ΰ��� ������ �ϳ��� ��������!
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP)
ORDER BY SAL ASC;

--SUBQUERY
/*
1. SINGLE ROW SUBQUERY : �������� ���� ROW ���� COLUMN �� ���
  EX) SELECT AVG(SAL) FROM EMP
  ������ : ( = != <  >)
  
2. MULTI ROW SUBQUERY : �������� ���� �÷� ROW�� �������� ���
   EX) SELECT SAL FROM EMP
   ������ : IN, NOT IN, ANY, ALL
   ALL : SAL > 1000 AND SAL > 4000 AND .....
   ANY : SAL > 1000 OR SAL > 4000 OR .......
  
   ����)
   1. ��ȣ�ȿ� �־�� �Ѵ� >> (SELECT MAX(SAL) FROM EMP)
   2. ���� �÷����� ���� >> SELECT MAX(SAL), SUM(SAL) FROM EMP (X) >> ���ʰ� ��� �Ұ���
   3. �ܵ����� ���� ����

   �������
   1. SUBQUERY ���� ����
   2. ����� ������ ���� ���� ����
   --TIP)
   SELECT .....(SUBQUERY) >> �Ѱ��� �ุ ��ȯ�� ��� (Scala SUBQUERY)
   FROM (SUBQUERY) >> ���� ���̺� (INLINE VIEW)...
   WHERE (SUBQUERY) >> ����
*/
--��� ���̺��� JONES�� �޿����� �� ���� �޿��� �޴� ���, ���, �̸�, �޿�

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME ='JONES');


SELECT *
FROM EMP
WHERE SAL IN (SELECT SAL FROM EMP WHERE DEPTNO = 30);


- ���� �͵�
--1. single row subquery : �������� ���� <<<row ����>>> column�� ��� (�� ���� ���� ��ȯ�ϴ� ���)
--      select avg(sal) from emp
--������ ������ single�� multi�� ������
-- ������ ( = != �� < > )


--2. multi row subquery : �������� ���� column �̰� <<<<row ������>>>>
-- ex) select sal from emp
-- ������ : IN, NOT IN ANY, ALL
-- ALL : sal > 100 and sal > 4000 and .....
-- ANY : sal > 1000 or sal > 4000 or

--�������� ����)
--1.��ȣ�ȿ� �־�� �Ѵ� >> select max(sal) from emp
--2. ���� �÷����� ���� >> select max(sal), sum(sal) from emp; ==> ������ �÷��� ���� �ȵ�
--3. �ܵ����� ���� ����

-- ���� ����
-- ������ ���� ������ ����
-- ����� ������ ���� ������ �����

-- tip ���� �� �ִ� ��
-- select �������� .... >> �� ���� �ุ ��ȯ�� ��� (��Į�� ��������)
-- from �������� >> ���� ���̺� >> inline view >> �������� ���� ���� ���� *****
-- where �������� >> ������

--��� ���̺��� jones�� �޿����� ���� �޿��� �޴� ����� ���, �̸� �޿��� ���
select * from emp;
select sal from emp where ename = 'JONES';

select empno, ename, sal
from emp
where sal > (select sal 
             from emp 
             where ename = 'JONES'
);

-----------------
-- ORA-01427: single-row subquery returns more than one row 
-- (���� ������ ��Ƽ���� �ƴ����� ���� �������� ������ �޶�����)
select *
from emp
where sal IN (select sal from emp where deptno = 30);
-- IN�� ��� Ǯ�� ������ �˸� ���٤���
-- sal = 1600 or sal = 1250 or ....

select *
from emp
where sal NOT IN (select sal from emp where deptno = 30);
-- sal != 1600 and sal != 1250 and ....


-- ���� ������ �ִ� ����� ��� �̸� ��� (�� ����� mgr �÷��� �ִ�)
select *
from emp
where empno IN (select mgr from emp);
select mgr from emp;

-- -- ���� ������ ���� ����� ��� �̸� ��� (�� ����� mgr �÷��� �ִ�)
select * from emp;

select *
from emp
where empno NOT IN (select nvl(mgr, 0) from emp);
-- and ���꿡 null�� ������ ����� null�� �Ǿ����

select mgr from emp;

-- king���� �����ϴ� �� ���ӻ���� king�� ����� ��� �̸� ���� ������ ���
select * from emp;

select empno, ename
from emp
where mgr = (select empno from emp where ename = 'KING');

-- 20�� �μ��� ����߿��� ���� ���� �޿��� �޴� ������� �� ���� �޿��� �޴� �����
-- ���, �̸�, �޿�, �μ���ȣ�� ���
select *
from emp
where sal > (select max(sal) from emp where deptno = 20);

-- ������ ���������� single ���� multi���� ���� �Ǵ��Ͻ� >> ������ �Ǵ�

-- ��Į�� ���� ���� ������ ������... �������� �ذ��� �� ����



select empno, ename
from emp
where empno not in (select nvl(mgr, 0) from emp);



--WHERE EMPNO != 7902 AND EMPNO != 7788 AND EMPNO != NULL
--AND ���� NULL �� ������ ����� NULL

SELECT MGR FROM EMP;
SELECT *
FROM EMP
WHERE EMPNO NOT IN (SELECT NVL(MGR,0)FROM EMP);







--KING ���� �����ϴ� �� ���� ����� KING�� ����� ���, �̸� ,����, ������

SELECT * FROM EMP;
SELECT EMPNO, ENAME, JOB, MGR
FROM EMP
WHERE MGR IN (SELECT EMPNO FROM EMP WHERE ENAME = 'KING')


--20�� �μ��� ����߿��� ���� ���� �޿��� �޴� ������� �� ���� �޿��� �޴� �����
--���, 

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 20)



---�ڽ��� ���޿����� �ش� ������ ��� ������ ���̸� ����ϴ� ����

SELECT A.EMPNO
      , A.ENAME
      , A.JOB
      , A.SAL
      , A.SAL - (SELECT ROUND(AVG(AA.SAL))
                FROM EMP AA
                WHERE AA.JOB = A.JOB) AS AVG_SAL_DIFF
FROM EMP A
WHERE A.DEPTNO = 20
ORDER BY 3, 1;

----------------------------------------------------------------------
--���� Ŀ��
--�ڱ� �μ��� ��� ���޺��� �� ���� ������ �޴� ����� ���, �̸� , �μ���ȣ,
--�μ��� ��� ������ ���

FROM EMP E left JOIN EMP M
ON E.MGR = M.EMPNO

SELECT * FROM EMP

SELECT E.EMPNO, E.ENAME, E.DEPTNO E.EMPNO, E.SAL

SELECT E.EMPNO, E.SAL
FROM EMP E LEFT JOIN (SELECT DEPTNO, ROUND(AVG(SAL)) AS AVGSAL FROM EMP GROUP BY DEPTNO)S
ON E.DEPTNO = S.DEPTNO
WHERE E.SAL > S.AVGSAL;


-----------------------------------------------------------------------------------------------

--1. 'SMITH'���� ������ ���� �޴� ������� �̸��� ������ ����϶�.

SELECT ENAME, SAL
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'SMITH')

--2. 10�� �μ��� ������ ���� ������ �޴� ������� �̸�, ����,

-- �μ���ȣ�� ����϶�.

SELECT ENAME, SAL
FROM EMP
WHERE SAL IN (SELECT SAL FROM EMP WHERE DEPTNO = 10)

--3. 'BLAKE'�� ���� �μ��� �ִ� ������� �̸��� ������� �̴µ�
SELECT * FROM EMP
-- 'BLAKE'�� ���� ����϶�.
SELECT ENAME, HIREDATE
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE') AND ENAME != 'BLAKE';
?

?

?

--4. ��ձ޿����� ���� �޿��� �޴� ������� �����ȣ, �̸�, ������

-- ����ϵ�, ������ ���� ��� ������ ����϶�.

?
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT ROUND(AVG(SAL)) FROM EMP)
ORDER BY SAL DESC


--5. �̸��� 'T'�� �����ϰ� �ִ� ������ ���� �μ����� �ٹ��ϰ�

-- �ִ� ����� �����ȣ�� �̸��� ����϶�.

?
SELECT * FROM EMP

SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%T%')
?

?

--6. 30�� �μ��� �ִ� ����� �߿��� ���� ���� ������ �޴� �������

-- ���� ������ �޴� ������� �̸�, �μ���ȣ, ������ ����϶�.

--(��, ALL(and) �Ǵ� ANY(or) �����ڸ� ����� ��)

?
SELECT * FROM EMP

SELECT ENAME,DEPTNO , SAL
FROM EMP
WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 30)


SELECT ENAME,DEPTNO , SAL
FROM EMP
WHERE SAL > ALL(SELECT SAL FROM EMP WHERE DEPTNO = 30)






?

?

?

?

--7. 'DALLAS'���� �ٹ��ϰ� �ִ� ����� ���� �μ����� ���ϴ� �����

-- �̸�, �μ���ȣ, ������ ����϶�.

SELECT * FROM TAB

SELECT * FROM EMP 


SELECT ENAME, EMPNO, SAL
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS')

?

--8. SALES �μ����� ���ϴ� ������� �μ���ȣ, �̸�, ������ ����϶�.

?
SELECT * FROM DEPT
?
SELECT ENAME, EMPNO, SAL
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES')
?

?

?

--9. 'KING'���� �����ϴ� ��� ����� �̸��� �޿��� ����϶�

--king �� ����� ��� (mgr �����Ͱ� king ���)



SELECT ENAME, SAL
FROM EMP
WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING')

?

?

?

--10. �ڽ��� �޿��� ��� �޿����� ����, �̸��� 'S'�� ����

-- ����� ������ �μ����� �ٹ��ϴ� ��� ����� �����ȣ, �̸�,

-- �޿��� ����϶�.


SELECT EMPNO, ENAME, SAL
FROM EMP E LEFT JOIN
(SELECT DEPTNO, ROUND(AVG(SAL)) AS AVGSAL FROM EMP 
WHERE ENAME LIKE '%S%' GROUP BY DEPTNO) E2
ON E.DEPTNO = E2.DEPTNO
WHERE E.SAL > E2.AVGSAL


?

?

?

?

--11. Ŀ�̼��� �޴� ����� �μ���ȣ, ������ ���� �����

-- �̸�, ����, �μ���ȣ�� ����϶�.

SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                      FROM EMP
                      WHERE COMM IS NOT NULL)
AND SAL IN( SELECT SAL
               FROM EMP
               WHERE COMM IS NOT NULL);?

?
SELECT * FROM EMP


TURNER	1500	30
WARD	1250	30
MARTIN	1250	30
ALLEN	1600	30
JONES	2975	20
KING	5000	10

SELECT E.ENAME, E.SAL, E.DEPTNO
FROM EMP E
LEFT JOIN (SELECT SAL, DEPTNO FROM EMP WHERE COMM IS NOT NULL 
GROUP BY DEPTNO, SAL) E2
ON E.DEPTNO = E2.DEPTNO
WHERE E.SAL = E2.SAL
ORDER BY E.DEPTNO DESC

GROUP BY E.DEPTNO


?SELECT ENAME, SAL, DEPTNO
FROM EMP E
WHERE ALL(SELECT SAL, DEPTNO FROM EMP WHERE COMM IS NOT NULL 
GROUP BY DEPTNO, SAL)E2

--12. 30�� �μ� ������ ���ް� Ŀ�̼��� ���� ����

-- ������� �̸�, ����, Ŀ�̼��� ����϶�.

       
SELECT * FROM EMP
?SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE






/*
���� ���̺� : JOIN, SUBQUERY ����............


DML

������ ���۾�(�ϱ�) >> DML
����Ŭ.PDF(168PAGE)
INSERT, UPDATE, DELETE (�ݵ�� �ϱ�)
*/

/*
����Ŭ ����
DDL(������ ���Ǿ�) : [CREATE, ALTER, DROP, TRUNCATE], RENAME, MODIFY
DML(���̤� ���۾�) : INSERT, UPDATE, DELETE
DQL(������ ���Ǿ�) : SELECT (�Լ�, ����, ��������)
DCL(���̤� �����) : ������ : GRANT, REVOKE
TCL(Ʈ�����) : COMMIT, ROLLBACK, SAVEPOINT
*/
--DML(INSERT, UPDATE, DELETE) �۾�
--TRANSACTION : �ϳ��� ������ �۾�����


--A��� ���¿��� B��� ���� ��ü (100����)

--���� 1000����
--A����(100)��� : UPDATE ���� SET �ݾ�....
--900
--B���� (100) �Ա� : UPDATE ���� SET �ݾ�
--1100
---------------------------------------------------------------
--A���¿��� ��� B���� �Ա�(����) >> �ϳ��� ������ ���� ��� ó��
--�Ѵ� ���� OR �Ѵ� ����
--ó���ϴ� ���(COMMIT, ROLLBACK)


SELECT * FROM TAB; --���̺� ��� Ȯ��

SELECT * FROM TAB WHERE TNAME = 'BOARD';
SELECT * FROM TAB WHERE TNAME = 'BOARD2';

SELECT * fROM COL WHERE TNAME ='EMP';



CREATE TABLE TEMP(
    ID NUMBER PRIMARY KEY, --NULL(X),  �ߺ� ������ ��� �ʰڴ�
    NAME NVARCHAR2(20)
);

DESC TEMP


--1. ���� �Ϲ����� INSERT

INSERT INTO TEMP(ID,NAME)
VALUES(100,'ȫ�浿');

SELECT * FROM TEMP

COMMIT;

--2. �÷� ��� ����
--�ظ��ϸ� ��������....
INSERT INTO TEMP
VALUES(200,'������');

SELECT * FROM TEMP;
ROLLBACK;

--3. ����(INSERT)
INSERT INTO TEMP(NAME)     --ORA-01400: cannot insert NULL into ("KOSA"."TEMP"."ID")
VALUES('�ƹ���');            --ID PK ���� (NULL X)

INSERT INTO TEMP(ID,NAME)   --ORA-00001: unique constraint (KOSA.SYS_C007070) violated
VALUES(100,'������');

------------------------------------------------------------------
--TIP
--�Ϲ����� SQL�� ���α׷����� ��� X
--PL-SQL(����, ���)

--CREATE TABLE TEMP2(ID VARCHAR2(50));
--BEGIN
-- FOR i IN 1..1000 LOOP
--     INSERT INTO TEMP2(ID) VALUES('A' || TO_CHAR(i));
-- END LOOP;
--END;

SELECT * FROM TEMP2;


CREATE TABLE TEMP3(
    MEMBERID NUMBER(3) NOT NULL,  --3�ڸ� ����
    NAME VARCHAR2(10), --NULL ���
    REGDATE DATE DEFAULT SYSDATE --�ʱⰪ ����(�⺻��) (�ý��� ��¥�� �⺻�� ���)
);

SELECT * FROM COL WHERE TNAME ='TEMP3';

SELECT SYSDATE FROM DUAL;

alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

INSERT INTO TEMP3(MEMBERID, NAME, REGDATE)
VALUES(100,'ȫ�浿','2022-09-29')

SELECT * FROM TEMP3

COMMIT;

INSERT INTO TEMP3(MEMBERID, NAME)
VALUES(200,'������');

COMMIT;

SELECT * FROM TEMP3;


INSERT INTO TEMP3(MEMBERID)
VALUES(300);

COMMIT;

SELECT * FROM TEMP3

INSERT INTO TEMP3(NAME)
VALUES('����');
ROLLBACK;

SELECT * FROM TEMP3;
----------------------------------------------------------------------
--TIP)
--1. �뷮 ������ �����ϱ�

CREATE TABLE TEMP4(ID NUMBER)
CREATE TABLE TEMP5(NUM NUMBER)

INSERT INTO TEMP4(ID) VALUES(1);
INSERT INTO TEMP4(ID) VALUES(2);
INSERT INTO TEMP4(ID) VALUES(3);
INSERT INTO TEMP4(ID) VALUES(4);
INSERT INTO TEMP4(ID) VALUES(5);
INSERT INTO TEMP4(ID) VALUES(6);
INSERT INTO TEMP4(ID) VALUES(7);
INSERT INTO TEMP4(ID) VALUES(8);
INSERT INTO TEMP4(ID) VALUES(9);
INSERT INTO TEMP4(ID) VALUES(10);
INSERT INTO TEMP4(ID) VALUES(11);
INSERT INTO TEMP4(ID) VALUES(12);
INSERT INTO TEMP4(ID) VALUES(13);
INSERT INTO TEMP4(ID) VALUES(14);

COMMIT;
SELECT * FROM TEMP4;

SELECT * FROM TEMP5;
--�䱸���� TEMP4�� �ִ� ��� �����͸� TEMP5 �ΰ� �;��
--INSERT INTO ���̺��(�÷�����Ʈ) VALUES
--INSERT INTO ���̺��(�÷�����Ʈ) SELECT ��

INSERT INTO TEMP5(NUM)
SELECT ID FROM TEMP4;  --�뷮 ������ ����

--2. �뷮 INSERT
--���� ���̺��� ���� ��� >> ���̺� ����(���� : ��Ű��) + ������ ����)
--�� ���� ������ �������� �ʾƿ�.(PK, FK)
--������ ������ ���� ���� + ������ ����

CREATE TABLE COPYEMP
AS
   SELECT * FROM EMP;

CREATE TABLE COPYEMP2
AS 
   SELECT EMPNO, ENAME, SAL 
   FROM EMP
   WHERE DEPTNO = 30;

--����
--Ʋ(����)�� �����ϰ� �����͸� �����ϰ� ���� ����
CREATE TABLE COPYEMP3
AS 
    SELECT * FROM EMP WHERE 1=2;

----------------------- INSERT END --------------------------------


--UPDATE
/*
UPDATE ���̺��
SET �÷��� = ��, �÷���2 = ��2.....
WHERE ������

UPDATE ���̺��
SET �÷� = (SUBQUERY)
WHERE �÷��� = (SUBQUERY)
*/
SELECT * FROM COPYEMP
ORDER BY SAL;

UPDATE COPYEMP
SET SAL = 0;

ROLLBACK;

UPDATE COPYEMP
SET SAL = 0
WHERE COMM IS NULL;



UPDATE COPYEMP
SET SAL = (SELECT SUM(SAL) FROM EMP);


SELECT * FROM COPYEMP

ROLLBACK

UPDATE COPYEMP
SET ENAME = 'AAAA', JOB='BBB', HIREDATE =SYSDATE, SAL = (SELECT SUM(SAL) FROM EMP)
WHERE EMPNO=7369;

SELECT * FROM COPYEMP
--------------------------------------------(UPDATE END)---------------------------------
--DELETE
DELETE FROM COPYEMP

SELECT * FROM COPYEMP
ROLLBACK;

SELECT * FROM COPYEMP;


DELETE FROM COPYEMP WHERE DEPTNO = 10;

DELETE FROM COPYEMP WHERE DEPTNO = 10;

COMMIT
SELECT * FROM COPYEMP WHERE DEPTNO = 10

ROLLBACK


---------------------------------------[DELETE END] -----------------------------
/*
������(SQL >> 
1. CRUD ���� (CREATE>INSERT, READ>SELECT, UPDATE, DELETE)
2. APP(JAVA) - JDBC API - ORACLE
3. INSERT, UPDATE, DELETE, SELECT(70%)

�ϳ��� ���̺� ���ؼ� �۾�
JAVA ���� EMP ���̺� ���ؼ� CRUD �۾�
App(JAVA) ���忡��
1. ��ü��ȸ (�Լ�) >> public List<Emp? getEmpList() {select * from emp}
2. ������ȸ (�Լ�) >> public Emp getEmpListByEmpno(int empno){select * from emp where empno=7788}
3. ���� >> public int insertEmp(Emp emp) {insert into emp(...) values(...)}
4. ����
5. ����
���� >> JAVA �ڵ� >> DAO(DATA ACCESS OBJECT)

--------------------------------------------------------------------------------------------------

--DDL(CREATE, ALTER, DROP, RENAME) ���̺��� ����, ����, ����
--����Ŭ.PDF 9�� 138PAGE

*/

SELECT * FROM BOARD;

DROP TABLE BOARD

CREATE TABLE BOARD(
    BOARDID NUMBER,
    TITLE NVARCHAR2(50),
    CONTENT NVARCHAR2(2000),
    REGDATE DATE
);

DESC BOARD



SELECT * FROM USER_TABLES WHERE LOWER(TABLE_NAME) = 'BOARD';
SELECT * FROM COL WHERE LOWER(TNAME) = 'BOARD'; --������
--��������
SELECT * FROM USER_CONSTRAINTS WHERE LOWER(TABLE_NAME) = 'BOARD';


--Oracle 11G >> �����÷�(�����÷�)
--�л� ���� ���̺� : ����, ����, ����

CREATE TABLE VTABLE(
   NO1 NUMBER,
   NO2 NUMBER,
   NO3 NUMBER GENERATED ALWAYS AS (NO1 + NO2) VIRTUAL
);
SELECT * FROM COL WHERE LOWER(TNAME) = 'VTABLE';
INSERT INTO VTABLE(NO1, NO2) VALUES(100,50);

SELECT * FROM VTABLE

--INSERT INTO VTABLE(NO1, NO2, NO3) VALUES(10,20,30); (X)
--�ǹ����� Ȱ��Ǵ� �ڵ�
--��ǰ����(�԰�) : �б⺰ ������ ����(4�б�)
--�԰��� (2022-09-10)

CREATE TABLE VTABLE2(
    NO NUMBER, --����
    P_CODE CHAR(4), --��ǰ�ڵ�(A001, B002)
    P_DATE CHAR(8), --�԰���
    P_QTY NUMBER, --�԰� ����
    P_BUNGI NUMBER(1) GENERATED ALWAYS as(
                      CASE WHEN SUBSTR(p_date,5,2) in ('01','02','03') THEN 1
                           WHEN substr(p_date,5,2) in ('04','05','06') THEN 2
                           WHEN substr(p_date,5,2) in ('07','08','09') THEN 3
                           ELSE 4
                           END )VIRTUAL
);

INSERT INTO VTABLE2(P_DATE) VALUES('20190301');
INSERT INTO VTABLE2(P_DATE) VALUES('20190401');
INSERT INTO VTABLE2(P_DATE) VALUES('20190501');
INSERT INTO VTABLE2(P_DATE) VALUES('20190601');
INSERT INTO VTABLE2(P_DATE) VALUES('20191101');
INSERT INTO VTABLE2(P_DATE) VALUES('20191201');


--DDL ���̺� ����� ����, ����
--1. ���̺� �����ϱ�
CREATE TABLE TEMP6(ID NUMBER);

DESC TEMP6
--2. ���̺� ���� �Ŀ� �÷� �߰��ϱ�
ALTER TABLE TEMP6
ADD ENAME VARCHAR2(20);

--3. ���� ���̺� �ִ� �ø��̸� �߸� ǥ��(ENAME -> USERNAME)
--���� ���̺� �ִ� ���� �÷��� �̸� �ٲٱ�(RENAME)

ALTER TABLE TEMP6
RENAME COLUMN ENAME TO USERNAME;

DESC TEMP6

--���� ���̺� �ִ� ���� �÷��� Ÿ�� ũ�� ����.(���)

ALTER TABLE TEMP6
MODIFY (USERNAME VARCHAR2(2000));

DESC TEMP6

--5. ���� ���̺� �ִ� ���� �÷� ����
ALTER TABLE TEMP6
DROP COLUMN USERNAME;

DESC TEMP6

---�� ��� �۾��� ���� ����ؼ� �۾� ����.....

--6. ���̺� ��ü�� �ʿ�����
--6.1 DELETE : �����͸� ����
--���̺� ó�� ����� ó�� ũ�� >> ������ ������ >> ������ ũ�� ��ŭ ���̺� ũ�� ����
--EX) ó�� IM >> ������ 10���� >> 100M >> DELETE 10���� ���� >> ���̺� ũ�� 100M

--���̺� ����(������ ũ�⵵ ���� �� ������)
--TRUNCATE (���� WHERE�� ��� ����)
--EX) ó�� IM >> ������ 10���� >> 100M >> DELETE 10���� ���� >> ���̺� ũ�� 1M
--TRUNCATE TABLE EMP

--���̺� ����
DROP TABLE TEMP6; 
--������� �ʴ��̻� �����Ҽ� ����.



-----------------------------------------------------------------------------
--���̺� ���� �����ϱ�
--����Ŭ.PDF(144PAGE)
--������ ���Ἲ Ȯ��
--INSERT, UPDATE ����

--PRIMARY KEY(PK) �����ϰ� ���̺��� ������ �ĺ�(NOT NULL �� UNIQUE ������ ����)
--WHERE EMPNO=7788 >> ������ 1�� ���� >> ���� >> ��ȸ >> INDEX �ڵ� ����

--������ ����� ��� (CREATE TABLE �ȿ��� ����)
--���̺��� ������ ���� �߰�(ALTER TABLE ADD CONSTRAINT ..... ) ���� ��� >> ��....

--TIP)
--���� ���� Ȯ��
SELECT * FROM USER_CONSTRINTS WHERE TABLE_NAME ='EMP';



CREATE TABLE TEMP7(
--    ID NUMBER PRIMARY KEY --�������� �ʾƿ� (�����̸� �ڵ����� > SYS_C006997 ������ �ڵ� ������)
                          --���� ������, ������ ã�� �����
    ID NUMBER CONSTRAINT PK_TEMP7_ID PRIMARY KEY, --PK_TEMP7_ID ������                          
    NAME VARCHAR2(20) NOT NULL, --CONSTRAINT ǥ�� ���� ������.
    ADDR VARCHAR2(50)
);


SELECT * FROM USER_CONSTRAINTS WHERE LOWER(TABLE_NAME) = 'TEMP7'


--PK (NOT NULL �ϰ� UNIQUE ����)
--PK ���̺� �� 1���� ��� (�÷� 1��, �������� �÷��� ��� 1�� : ����Ű)

INSERT INTO TEMP7(ID, NAME,ADDR) VALUES(1,'ȫ�浿','����� ������');
COMMIT;

INSERT INTO TEMP7(ID,NAME,ADDR) VALUES(10,'ȫ�浿','����� ������');

INSERT INTO TEMP7(ID,NAME,ADDR) VALUES(10,'ȫ�浿','����� ������');
--ORA-00001: unique constraint (KOSA.PK_TEMP7_ID) violated


--UNIQUE key(UK) ���̺��� ��� ���� �����ϰ� �ϴ� ���� ���� ��(NULL �� ���)
--�÷��� �� ��ŭ ���� ����
--NULL ���
--NOT NULL, UNIQUE

CREATE TABLE TEMP8(
    ID NUMBER CONSTRAINT PK_TEMP8_ID PRIMARY KEY,
    NAME NVARCHAR2(20) NOT NULL,
    JUMIN NCHAR(6) CONSTRAINT UK_TEMP8_JUMIN UNIQUE, --NULL ���
    ADDR NVARCHAR2(1000)
);



SELECT * FROM user_constraints WHERE LOWER(table_name)='temp8';

INSERT INTO TEMP8(ID, NAME, JUMIN, ADDR)
VALUES(10,'ȫ�浿','123456','��⵵');

INSERT INTO TEMP8(ID, NAME, JUMIN, ADDR)
VALUES(10,'ȫ�浿','123456','��⵵');
--ORA-00001: unique constraint (KOSA.PK_TEMP8_ID) violated
--�ߺ��ȵ�


INSERT INTO TEMP8(ID, NAME, ADDR)
VALUES(20,'������','������'); --UNIQUE NULL ���

INSERT INTO TEMP8(ID, NAME, ADDR)
VALUES(30,'������','������'); --UNIQUE NULL ���

SELECT * FROM TEMP8
--������
--�׷� NULL �� �ߺ�üũ
--JUMIN NCHAR(6) NOT NULL CONSTRAINT UK_TEMP8_JUMIN UNIQUE,

--���̺� ���� �Ŀ� ���� �ɱ�

--���̺� ���� �Ŀ� ���� �ɱ�
CREATE TABLE TEMP9 (ID NUMBER);

--����Ű��
�� ���̺� ���� �߰��ϱ�
--���� �߰��� ���̺� �ִ� ������ �˻�

ALTER TABLE TEMP9
ADD CONSTRAINT PK_TEMP9 PRIMARY KEY(ID);


select * from TEMP9

DESC TEMP9

ALTER TABLE TEMP9
ADD ENAME VARCHAR2(50)

DESC TEMP9

--ENAME NOT NULL 
ALTER TABLE TEMP9
MODIFY(ENAME NOT NULL)

DESC TEMP9

SELECT * FROM USER_CONSTRAINTS WHERE LOWER(TABLE_NAME)='TEMP9'

-------------------------
CHECK(CK) ���̾�� �ϴ� ������ ������(��κ� ���� ��Ģ�� ����)
--WHERE ���ǰ� ������ ������ ����
--WHERE GENDER IN ('��','��')

CREATE TABLE TEMP10(
 ID NUMBER CONSTRAINT PK_TEMP10_ID PRIMARY KEY,
 NAME VARCHAR2(20) NOT NULL,
 JUMIN CHAR(6) CONSTRAINT UK_TEMP10_JUMIN UNIQUE,
 ADDR VARCHAR2(20),
 AGE NUMBER CONSTRAINT CK_TEMP10_AGE CHECK(AGE >= 19) --WHERE AGE >=19
);

SELECT * FROM USER_CONSTRAINTS WHERE LOWER(TABLE_NAME)='TEMP10';
COMMIT;

INSERT INTO TEMP10(ID, NAME, JUMIN, ADDR, AGE)
VALUES(100,'ȫ�浿','123456','�����',25);


INSERT INTO TEMP10(ID, NAME, JUMIN, ADDR, AGE)
VALUES(200,'ȫ�浿','123456','�����',15);
--ORA-02290: check constraint (KOSA.CK_TEMP10_AGE) violated


SELECT * FROM USER_CONSTRAINTS WHERE LOWER(TABLE_NAME)='TEMP10';

--FOREIGN KEY(FK) ���� ������ �� ������ �ܷ�Ű ���踦 �����ϰ� �����մϴ�.
--��������(���̺�� ���̺��� ���� ����)


create table c_emp
as
    select empno, ename, deptno from emp where 1=2; -- ���̺��� ����(��Ű��) �� �����ϱ�

--create table ���̺�� as select...
select * from c_emp;

create table c_dept
as
    select deptno, dname from dept where 1=2;
    
select * from c_emp;
select * from c_dept;

--c_emp ���̺� �ִ� deptno�� c_dept���̺� �ִ� deptno �÷��� �ִ� �����͸�
--����(����)

alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno);

--foreign key(deptno) �����ϱ� ���ؼ��� >> c_dept(deptno) >> ������ >> �� �����ʹ�
-- ���Ἲ�� (�ߺ�,null) >> pk >> c_dept(deptno) >> unique, primary key

--�ݵ�� c_dept�� pk �����Ǿ� �־�� �Ѵ�
alter table c_dept
add constraint pk_c_dept_deptno primary key (deptno); -- �ſ�Ȯ��

select * from user_constraints where lower(table_name)='c_dept';


--pk����ǰ� ����
alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno);

--����
insert into c_dept(deptno,dname) values(100,'�λ���');
insert into c_dept(deptno,dname) values(200,'������');
insert into c_dept(deptno,dname) values(300,'ȸ����');
commit;

select* from c_dept;
--���Ի�� �Ի�

insert into c_emp(empno, ename) values(100,'ȫ�浿');

--deptno �÷��� FK �����Ǿ� �־ not null �������� ������ null���� ���ȴ�    
--�䱸���� ���ǿ� ����....
--�Ի�� �μ��� ������ ���� �� �� �ִ�.

--���Ի���� �ݵ�� �μ��� ������ �Ѵ�
--CREATE TABLE C_EMP(DEPTNO NOT NULL ...FK)
select * from C_EMP

INSERT INTO C_EMP(empno, ename, DEPTNO) VALUES(1,'ȫ�浿',100);
INSERT INTO C_EMP(EMPNO, ENAME, DEPTNO) VALUES(2,'������',600);
INSERT INTO C_EMP(EMPNO, ENAME, DEPTNO) VALUES(1,'ȫ�浿',100);
commit;
    
--PK ����ǰ� ����
ALTER TABLE C_EMP
ADD CONSTRAINT FK_C_EMP_DEPTNO FOREIGN KEY(DEPTNO) REFERENCES C_DEPT(DEPTNO);

--����
INSERT INTO C_DEPT(DEPTNO,DNAME) VALUES(100,'�λ���');
INSERT INTO C_DEPT(DEPTNO,DNAME) VALUES(200,'������');
INSERT INTO C_DEPT(DEPTNO,DNAME) VALUES(300,'ȸ����');

COMMIT;
SELECT * FROM C_DEPT;
SELECT * FROM C_EMP;

--���Ի��, �Ի�
INSERT INTO C_EMP(EMPNO, ENAME_ VALUES(100,'ȫ�浿');
---------------------------------------------------------------------------------
--DEPTNO �÷��� FK �����Ǿ� �־ NOT NULL �������� ������ NULL���� ���


/*
������
���̺���� ��������(�θ�, �ڽ�)
C_EMP, C_DEPT [DEPTNO] ����� �ؼ��ϸ�
�θ� (MASTER) : PK (DEPTNO)
�ڽ� (DETAIL) : FK (DEPTNO)

C_DEPT ���� 100�� �μ��� ������ �� �������?

100���� �����ϰ� �ʹٸ� ������� .....


*/

/*
column datatype [CONSTRAINT constraint_name]
 REFERENCES table_ name (column1[,column2,..] [ON DELETE CASCADE])
column datatype,
. . . . . . . ,
[CONSTRAINT constraint_name] FOREIGN KEY (column1[,column2,..])
 REFERENCES table_name (column1[,column2,..] [ON DELETE CASCADE])
 
 ON DELETE CASCADE : �θ� ���̺�� ������ ���� �ϰڴ�.
 --100 �� �μ� ���� : ��
 --DELETE FROM C_DEPT WHERE DEPTNO = 100
 --�����ϴ� �ڽ� ������ ���� ����
 */
ALTER TABLE C_EMP
DROP CONSTRAINT FK_C_EMP_DEPTNO;

ALTER TABLE C_EMP
ADD CONSTRAINT FK_C_EMP_DEPTNO FOREIGN KEY(DEPTNO) REFERENCES C_DEPT(DEPTNO)
ON DELETE CASCADE;

SELECT * FROM C_EMP;

SELECT * fROM C_EMP;
SELECT * FROM C_DEPT;

DELETE FROM C_DEPT WHERE DEPTNO=100;

--�ڽ��� ���� ����

DELETE FROM C_EMP WHERE EMPNO = 1;
DELETE FROM C_DEPT WHERE DEPTNO=100;
ROLLBACK

SELECT * FROM USER_CONSTRAINTS WHERE UPPER(TABLE_NAME)='C_EMP';


SELECT * FROM USER_CONSTRAINTS WHERE UPPER(TABLE_NAME)='C_DEPT';

INSERT INTO C_EMP(EMPNO, ENAME, DEPTNO) VALUES(1,'������', 100);

COMMIT;



DELETE FROM C_DEPT WHERE DEPTNO=100;

--TIP)
--MS-SQL
--ON DELETE CASCADE
--ON UPDATE CASCADE

DROP TABLE STUDENT

CREATE TABLE STUDENT(
    ID NUMBER,
    NAME VARCHAR(20) NOT NULL,
    KOR NUMBER DEFAULT 0,
    ER NUMBER DEFAULT 0,
    MATH NUMBER DEFAULT 0,
    SUM NUMBER GENERATED ALWAYS AS (KOR + ER + MATH) VIRTUAL,
    AVG NUMBER GENERATED ALWAYS AS (ROUND((KOR + ER + MATH)/3)) VIRTUAL,
    DEPT number
);
ALTER TABLE STUDENT
ADD CONSTRAINT PK_STUDENT_ID PRIMARY KEY(ID)


ALTER TABLE STUDENT
MODIFY AVG NUMBER GENERATED ALWAYS AS ROUND(AVG((KOR + ER + MATH)) VIRTUAL);


INSERT INTO STUDENT(ID, NAME, KOR, ER, MATH)
VALUES(1,'������',50,50,50);
INSERT INTO STUDENT(ID, NAME, KOR, ER, MATH)
VALUES(2,'������',60,80,90);
INSERT INTO STUDENT(ID, NAME, KOR, ER, MATH)
VALUES(3,'������',100,70,80);
INSERT INTO STUDENT(ID, NAME, KOR, ER)
VALUES(4,'��ٿ�',100,80);
INSERT INTO STUDENT(ID, NAME, KOR, ER, MATH)
VALUES(5,'�ڿ���',70,100,80);

SELECT * FROM STUDENT

DELETE FROM STUDENT

alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno);


select * from user_constraints where lower(table_name)='c_dept';

DELETE FROM user_constraints WHERE lower(table_name)='c_dept';

alter table c_dept
drop constraint PK_C_DEPT_DEPTNO;

--NOT NULL(NN) ���� NULL ���� ������ �� �����ϴ�.
--
--
--SELECT * FROM TEMP7


--EMP EMPNO PK
--DEPT DEPTNO PK
--EMP DEPTNO FK
 
ALTER TABLE EMP
ADD CONSTRAINT PK_EMP_EMPNO PRIMARY KEY(EMPNO);

ALTER TABLE DEPT
ADD CONSTRAINT PK_DEPT_DEPTNO PRIMARY KEY(DEPTNO);

ALTER TABLE EMP
ADD CONSTRAINT FK_EMP_DEPTNO FOREIGN KEY(DEPTNO);


REFERENCES DEPT(DEPTNO)

SELECT * FROM USER_CONSTRAINTS WHERE UPPER(TABLE_NAME) = 'EMP';

select * from user_constraints where lower(table_name)='c_dept';
alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno);


------------------------------------------------------------------------------------------
--�߱�(View)
--View ��ü(�������̺�)
--CREATE ���� ...  ������ VIEW ���������� ����



--OR REPLACE �̹� �����Ѵٸ� �ٽ� �����Ѵ�.
--FORCE Base Table ������ ������� VIEW �� �����.
--NOFORCE �⺻ ���̺��� ������ ��쿡�� VIEW �� �����Ѵ�.
--view_name VIEW �� �̸�
--Alias Subquery �� ���� ���õ� ���� ���� Column ���� �ȴ�.
--Subquery SELECT ������ ����Ѵ�.
--WITH CHECK OPTION VIEW �� ���� �׼��� �� �� �ִ� �ุ�� �Է�,���ŵ� �� �ִ�. 
--Constraint CHECK OPTON ���� ���ǿ� ���� ������ �̸��̴�.
--WITH READ ONLY �� VIEW ���� DML �� ����� �� ���� �Ѵ�.

CREATE VIEW VIEW001
AS 
   SELECT * FROM EMP;
   
SELECT * FROM VIEW001

--VIEW�� ���̺�ó�� ��밡���� �������̺� : �����͸� ������ ���� ����.
--VIEW�� �޸𸮻󿡸� �����ϴ� �������̺�.
--SUBQUERY -> IN LINE VIEW > FROM(...........)
--���� : �Ϲ����̺�� ������ ����(SELECT, INSERT, UPDATE, DELETE)
--�� VIEW �� ���� �ִ� �����Ϳ� ���ؼ�
--DML(INSERT, UPDATE, DELETE) -> ���� ���̺� ���� VIEW ��� 

CREATE OR REPLACE VIEW V_001
AS 
    SELECT EMPNO, ENAME FROM EMP;
    
  SELECT * FROM V_001 --VIEW�� ������ �ִ� SQL ������ ����

--VIEW ����
--1. ������ ���� : JOIN, SUBQUERY >> VIEW ��� >> ����(X) >> ������ ����
--2. ���� �ܼ�ȭ (����) : ������ ������ �̸� ����� �ΰ� ���
--3. ���ȼ� (Ư�� �÷��� ����)

--���Ի�� �Ի� >>> DBA ���� �ο� ��Ź >> �λ����� >> Ư�� �÷��� ���� >> VIEW

CREATE OR REPLACE VIEW V_EMP
AS 
   SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP;
--���
SELECT * FROM V_EMP;

SELECT * FROM V_EMP WHERE EMPNO=7902;

--����
CREATE OR REPLACE VIEW V_002
AS 
  SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
  FROM EMP E JOIN DEPT D
  ON E.DEPTNO = D.DEPTNO

SELECT * FROM V_002;

CREATE VIEW V_003 --VIEW ������ ���� ���̺��ε� �ּ��� �÷����� ��ߵǴ°� �ƴϳ�?
AS
  SELECT DEPTNO, AVG(SAL) AS AVGSAL --AS�� �÷����� ����Ѵ�.
  FROM EMP
  GROUP BY DEPTNO;
  
SELECT * FROM V_003;  --������ ��� �޿��� �� �� �ִ� VIEW


CREATE OR REPLACE VIEW V_004
AS 
  SELECT ROUND(AVG(SAL),0) AS AVGSAL FROM EMP;

SELECT * FROM V_004;

/*
VIEW �� ���� ���̺� ���� �����ʹ� ���� ���� ���̺� VIEW ���ؼ� INSERT, UPDATE ,DELETE ����
�� ���� ���̺�


*/

SELECT * FROM V_EMP;

UPDATE V_EMP
SET SAL = 0; --V_EMP �� SAL �÷��� �����͸� �� �� ����.

UPDATE V_EMP
SET JOB = 'IT';


--30�� �μ� ������� ����, �̸�, ������ ��� VIEW�� ����µ�,
--������ �÷����� ����, ����̸�, �������� ALIAS�� �ְ� ������
--300���� ���� ����鸸 �����ϵ��� �϶�.
CREATE OR REPLACE VIEW V_101
AS 
  SELECT JOB AS ����, ENAME AS ����̸�, SAL AS ����
  FROM EMP 
  WHERE DEPTNO = 30 AND SAL>300
  
  SELECT * fROM V_004


--�μ��� ��� ������ ��� VIEW �� �����, ��տ����� 2000 �̻���
--�μ��� ����ϵ��� �϶�.

CREATE OR REPLACE VIEW VIEW102
AS
   SELECT DEPTNO, ROUND(AVG(SAL),0) AS ��տ��� 
   FROM EMP
   GROUP BY DEPTNO
   HAVING AVG(SAL)>2000

SELECT * FROM VIEW102

SELECT V.DEPTNO, V.��տ���, D.DNAME
FROM DEPT D JOIN VIEW102 V
ON D.DEPTNO = V.DEPTNO;

------------------------------------------------------------------------------

--Quiz
--�Ʒ� 3���� ���̺� �̿��Ͽ� ���� 3���� ���弼��
--�ʼ�����) �Լ� �� JOIN ������ �ݵ�� �ʼ�....
--���� ������ ���� ������ ������.

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;

CREATE OR REPLACE VIEW VIEW102

--�μ��� �������� �Ի���� �����ϴ� �並 �����
--�μ��� �� ��� ������ �Ʒ� �÷��� ���� ����Ͻÿ�.
--�����̸�, �μ��̸�, ����, ��տ���

SELECT * FROM 

CREATE OR REPLACE VIEW DATE_EMP
AS   
    SELECT  SUBSTR(E.HIRE_DATE, 4, 2)AS MON, E.SALARY, D.DEPARTMENT_ID, D.LOCATION_ID, D.DEPARTMENT_NAME
    FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID


SELECT LAST.*
FROM (
SELECT E.DEPARTMENT_NAME,L.CITY, MON,DEPARTMENT_ID, ROUND(AVG(SALARY),0) AS TT
FROM DATE_EMP E JOIN LOCATIONS L
ON E.LOCATION_ID = L.LOCATION_ID
GROUP BY E.MON, E.DEPARTMENT_ID, L.CITY,E.DEPARTMENT_NAME
ORDER BY MON DESC, TT DESC
)LAST

   
------------------------------------------------------------------------------
SELECT * FROM EMPLOYEES;    
SELECT * FROM DEPARTMENTS;  
SELECT * FROM LOCATIONS; 



SELECT * FROM EMPLOYEES
ORDER BY DEPARTMENT_ID
MANAGER_ID
SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEES
WHERE MANAGER_ID IN (SELECT EMPLOYEE_ID FROM EMPLOYEES)
GROUP BY MANAGER_ID





SELECT * FROM EMPLOYEES E
JOIN DEPARTMENTS 



-----------------
-------------

SELECT * FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES
WHERE MANAGER_ID = 100)



--4�� 1��
CREATE OR REPLACE VIEW V_1
AS
    SELECT E.EMAIL, E.LAST_NAME || ' ' || E.FIRST_NAME AS �̸�, D.DEPARTMENT_NAME, L.CITY, TO_CHAR(E.SALARY, '$999,999,999') AS SAL
    FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                     JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
    WHERE E.phone_number LIKE '011%' AND E.salary>10000


SELECT �̸�, DEPARTMENT_NAME
FROM V_1 
WHERE SAL >(SELECT SAL FROM V_1 WHERE EMAIL = 'EZLOTKEY')





CREATE OR REPLACE VIEW DATE_EMP
AS   
    SELECT  SUBSTR(E.HIRE_DATE, 4, 2)AS MON, E.SALARY, D.DEPARTMENT_ID, D.LOCATION_ID, D.DEPARTMENT_NAME
    FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID

SELECT LAST.*
FROM (
SELECT E.DEPARTMENT_NAME,L.CITY, MON,DEPARTMENT_ID, ROUND(AVG(SALARY),0) AS TT
FROM DATE_EMP E JOIN LOCATIONS L
ON E.LOCATION_ID = L.LOCATION_ID
GROUP BY E.MON, E.DEPARTMENT_ID, L.CITY,E.DEPARTMENT_NAME
ORDER BY MON DESC, TT DESC
)LAST




------------------
create or replace view v_employees
as
select manager_id, count(manager_id) as subordinates from employees group by manager_id having count(manager_id) >=5;
select * from v_employees;

--��
select e.employee_id, e.first_name || ' ' || e.last_name , v.subordinates, e.department_id, d.department_name, l.city
from employees e join v_employees v on e.employee_id = v.manager_id
join departments d on nvl(e.department_id,0) = d.department_id
join locations l on d.location_id = l.location_id
where (salary*12)+(salary*12)*nvl(commission_pct,1) > (select avg((salary*12)+(salary*12)*nvl(commission_pct,1)) from employees WHERE )
and l.city = 'Seattle';
--------------------
SELECT commission_pct FROM employees

select avg((salary*12)+(salary*12)*nvl(commission_pct,1)) from employees



CREATE OR REPLACE VIEW CNT_DATE
AS
SELECT CASE WHEN COUNT(EMPLOYEE_ID)> = 5 THEN '1'
            ELSE '0'
        END CNT , MANAGER_ID, COUNT(EMPLOYEE_ID)AS CNTSUM
FROM EMPLOYEES
WHERE MANAGER_ID IN (SELECT EMPLOYEE_ID FROM EMPLOYEES)
GROUP BY MANAGER_ID



SELECT E.EMPLOYEE_ID, E.LAST_NAME,E.DEPARTMENT_ID, C.CNTSUM, L.CITY FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
JOIN CNT_DATE C ON C.MANAGER_ID = E.MANAGER_ID
WHERE L.CITY = 'Seattle' AND C.CNT = 1
AND E.SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES
WHERE MANAGER_ID = C.MANAGER_ID)



---------------------------------------------------------------------------------------------------------

--������ �������� sql
-- ����Ŭ.pdf(185page)
/*
CREATE SEQUENCE sequence_name
[INCREMENT BY n]
[START WITH n]
[{MAXVALUE n | NOMAXVALUE}]
[{MINVALUE n | NOMINVALUE}]
[{CYCLE | NOCYCLE}]
[{CACHE | NOCACHE}];
sequence_name SEQUENCE �� �̸��Դϴ�.
INCREMENT BY n ���� ���� n ���� SEQUENCE ��ȣ ������ ������ ����.
�� ���� �����Ǹ� SEQUENCE �� 1 �� ����.
START WITH n �����ϱ� ���� ù��° SEQUENCE �� ����.
�� ���� �����Ǹ� SEQUENCE �� 1 �� ����.
MAXVALUE n SEQUENCE �� ������ �� �ִ� �ִ� ���� ����.
NOMAXVALUE ���������� 10^27 �ִ밪�� ����������-1 �� �ּҰ��� ����.
MINVALUE n �ּ� SEQUENCE ���� ����.
NOMINVALUE ���������� 1 �� ����������-(10^26)�� �ּҰ��� ����.
CYCLE | NOCYCLE �ִ� �Ǵ� �ּҰ��� ������ �Ŀ� ��� ���� ������ ���� ���θ�
����. NOCYCLE �� ����Ʈ.
CACHE | NOCACHE �󸶳� ���� ���� �޸𸮿� ����Ŭ ������ �̸� �Ҵ��ϰ� ����
�ϴ°��� ����. ����Ʈ�� ����Ŭ ������ 20 �� CACHE*/


desc board;
drop table board;


create table board(
 boardid number constraint pk_board_boardid primary key,
 title nvarchar2(50)
);

desc board;

select * from board;
--boardid (pk : not null, unique, ���������� inde�ڵ�����)
--where boardid = 10; �˻��ӵ� ���...

--- �Խ��� �۾��� �۾�
insert into board(boardid, title) values(1, 'ó����');
insert into board(boardid, title) values(2, '��');
--ó�� ���� 1���̰� �� �����ۤ����ʹ� �������� ���� insert
insert into board(boardid, title) 
values(1,'1');

insert into board(boardid, title) 
values(2,'2');
--hint) subquery
--select boardid + 1
select count(boardid) + 1  from board;


insert into board(boardid, title) 
values((select count(boardid) + 1  from board),'1');

insert into board(boardid, title) 
values((select count(boardid) + 1  from board),'2');

insert into board(boardid, title) 
values((select count(boardid) + 1  from board),'3');

select * from board;
commit;
--CRUD ��������
--create (insert)
--read    (select)
--update
--delete

delete from board where boardid =1;
commit;
--���� ....
insert into board(boardid, title) 
values((select count(boardid) + 1  from board),'4');
--ORA-00001: unique constraint (KOSA.PK_BOARD_BOARDID) violated
--DML �����߻�
select * from board;

--�ٸ� ���
delete from board;
commit;

select * from board;
--�����Լ�

select nvl(max(boardid),0) + 1 from board;

insert into board(boardid, title) 
values((select nvl(max(boardid),0) + 1 from board),'1');

insert into board(boardid, title) 
values((select nvl(max(boardid),0) + 1 from board),'2');

select * from board  order by boardid;

delete from board where boardid=1;
commit;

insert into board(boardid, title) 
values((select nvl(max(boardid),0) + 1 from board),'3');

select * from board;
commit;
---�۹�ȣ ��� ...... ����......
--sequence ��ü ���� : �ߺ����� ���� �������� ���� �����ϴ� ��ü 
--������ü
create sequence board_num;

select board_num.nextval from dual; --ä��

select board_num.currval from dual; --������� ä���� ��ȣ Ȯ��(������)

/*
 NEXTVAL �� CURRVAL �ǻ翭 
1) NEXTVAL �� ���� ��� ������ SEQUENCE ���� ��ȯ �Ѵ�.
2) SEQUENCE �� ������ �� ����, �ٸ� ����ڿ��� ������ ������ ���� ��ȯ�Ѵ�.
3) CURRVAL �� ���� SEQUENCE ���� ��´�.
4) CURRVAL �� �����Ǳ� ���� NEXTVAL �� ���Ǿ�� �Ѵ�
*/
--�Խ���
--�Խ��ǿ� ���Ǵ�  ä����
create table kboard(
  num number constraint pk_kboard_num primary key,
  title nvarchar2(20)
);

create sequence kboard_num;

insert into kboard(num, title) 
values(kboard_num.nextval , 'ó��');

insert into kboard(num, title) 
values(kboard_num.nextval , '���̴�');

insert into kboard(num, title) 
values(kboard_num.nextval , '���̴�');

select * from kboard;

delete from kboard where num=1;

insert into kboard(num, title) 
values(kboard_num.nextval , '���̴�');

select * from kboard;
commit;


--------------------------------------------------------------------------------
--�Խ���
--��������, �����Խ���, �����ڰԽ���
--�������� 1,2,3����
--������ �����Խ��ǿ� ���� ���� 4������ ��
--���� �����ڰԽ��ǿ� ���� ���� 5�� ���� ��
--���� �������׿� ���� ���� 6������ �Ǳ� �ٶ�
--1. sequence��ü�� ������ü(���̺� ���ӵ��� �ʴ�)
--  �ϳ��� �������� ���������� �����Ӱ� ��밡���ϴ�
--  sequence �ϳ� �����ؼ� >> ��������, �����Խ���, �����ڰԽ��� ��밡��

--2. ������Ʈ(�Խ��� 10��)
--  ��ǰ�Խ���, �����ڰԽ���, ȸ���Խ���...
--������ �Խ����� ������ ���� �����ϱ⸦ ����
--10���� �������� ���� ���� ����ϸ� �ǿ�







--2. �� ����Ʈ (�Խ��� 10��)
--��ǰ�Խ���, ������ �Խ���, ȸ�� �Խ���
--������ �Խ����� ������ ���� �����ϱ⸦ ���ؿ�
--10���� �������� ���� ���� ����ϸ� �ǿ�

--tip)
--ms-sql : create table board(boardnum int identity(1,1)..... title
--identity �ڵ� ������ ������ ����Ŭ�� �̷� �Լ������ ����.
--insert into(title) values('�氡');; �ڵ����� (1,2,3,.....)
--ms-sql : 2012 ����(sequence)

--mysql : create table board(boardnum int auto_increment, ... title)
--insert into board(title) values('�氡'); �ڵ� (1,2,3, ...)


--mysql ���� ������� open source >> mariadb (���� ����)
--mariadb ������ ��ü ����







---�ɼ�

create sequence seq_num
start with 10
increment by 2;
--10�� ���� �����ؼ� 2�� ����
--�ɼ��� �� �Ⱦ�.



select seq_num.nextval from dual;


select seq_num.currval from dual;


--�Խ��� �� 100��
--num title, writer, content
--1, 2, 3 ...... 100
--�Ϲ������� �Խ��� �� ���� (�ֽű�) - ���� ���߿� �� �� ... ȭ�� ���

select * from kboard order by num desc; --�Ϲ� �Խ��� ù ����


--������ ����
--rownum ����Ŭ���� ���� �߿� !! �ǻ��÷�
--���� ���������� �����ϴ� �÷��� �ƴϰ� �������� ����
--rownum : ������ ���̺� �÷����� �������� ������ ���������� �� ��ȣ�� �ο��ϴ� �÷�

select * from emp;

select rownum as ����, empno, ename from emp;

--select �� ����� ������ �ο� ....

--Top-n ���� (���ĵ� �������� ������ � ����)
-- ���̺��� ���ǿ� �´� ����(Top) ���� ���ڵ�(row) n ���� ����
--Tip)
--ms-sql : select top 10 , * from emp order by sal desc;


--����Ŭ�� top n ������ ����
--rownum : ������ �ο��ؼ� Ư�� ���ǿ� �°� top ���� ����
--1. ������ ������ ����(����)
--2. ���ĵ� �����͸� �������� rownum�����ϰ� ������ �ɰ� ������ ����


--1�ܰ�
select *
from (
select *
from emp
order by sal desc
)e;

--2�ܰ�

select rownum as num, e.*
from (
        select *
        from emp
        order by sal desc
    ) e;
    
    
--3�ܰ� (�޿��� ���� �޴� ��� 5��)

select *
from  (
        select rownum as num, e.*
        from (
            select *
            from emp
            order by sal desc
        )e
    )n where num <=5;
    
    
select *
from (
     select rownum as num, e.*
     from emp e
     order by sal desc
     )n where num <=5;

--------------------------------------------------------------------
--�Խ���
/*
100��
�� ����Ʈ�� 100�� �����Ͱ� �� ȭ�� ��� �ٴ�
10�Ǿ� ����� ȭ�鿡 ���

pagesize = 10 (�� ȭ�鿡 (������)�� ������ �� �ִ� ������ row��)
page ���� = 10��

[1][2][3][4][5][6][7][8][9][10] >> java ���� >> <a href='page.jsp?'></a>
1page >> 1~10 �� >> DB select 1~10��
2page >> 11~20 �� >> DB SELECT 11~20��

>>ROWNUM
>>BETWEEN A AND B
*/


-----------------------------------------------------------------------------------
--HR ���� �̵�

SHOW USER;


SELECT * FROM EMPLOYEES; -- 107��


--1 �ܰ� (���� ������ �����(����))
--����� ���� ������ ����

SELECT * FROM EMPLOYEES  ORDER BY EMPLOYEE_ID ASC;

--2�ܰ� (���� �����Ϳ� ���� �ο��ϱ�)

SELECT ROWNUM AS NUM, E.*
FROM (
        SELECT * fROM EMPLOYEES ORDER BY EMPLOYEE_ID ASC
     )E;
WHERE ROWNUM <= 50; --���ĵ� �����Ϳ� ���������� ������ ROWNUM�̴�


--select *
--from (
--     select rownum as num, e.*
--     from emp e
--     order by sal desc
--     )n where num <=5;


--3�ܰ�
SELECT *
FROM (
SELECT ROWNUM AS NUM, E.*
FROM (
       SELECT * FROM EMPLOYEES ORDER BY EMPLOYEE_ID ASC
     ) E
   WHERE ROWNUM <=50
   )N WHERE NUM>=41;

------------------------------------------------------------------------
--107 ��
--PAGESIZE = 10
--[1][2][3][4][5][6][7][8][9][10][11]
--[1] >> 1~10
--[2] >> 11~20
--[5] >> 41~50 �����͸� �����ּ���.
--[10] >> 91~100
--[11]>> 101~107


SELECT *
FROM (
      SELECT ROWNUM AS NUM, E.*
      FROM (
             SELECT * FROM EMPLOYEES ORDER BY EMPLOYEE_ID ASC
            )E
    WHERE ROWNUM <=10
    ) N WHERE NUM>=1;
    
--WHERE ROWNUM BETWEEN 1 AND 10


     select *
     FROM (
             SELECT ROWNUM AS NUM, E.* 
             FROM EMPLOYEES E ORDER BY EMPLOYEE_ID ASC
     ) WHERE NUM <=10;


--KOSA ��������
create table dmlemp
as 
   select * from emp;


--�� ���� �����ϴ� ��� ���� ������ ���簡 �ȵ�.
select * from dmlemp;
alter table dmlemp
add constraint pk_dmlemp_empno primary key(empno);


select * from user_constraints where table_name = 'dmlemp'

select * from dmlemp

select * from tabs;


select * from dmlemp 
where empno = 7900
order by empno asc



select empno, ename, from emp where deptno = 30;



create table sdept

as

   select * from sdept where deptno = 44;
   
   select * from sdept where deptno =10
   
desc sdept
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table trans_A(
    num number,
    name varchar2(20)
);

create table trans_B(
    num number constraint pk_trans_B_num primary key ,
    name varchar2(20)
);

--alter table trans_B
--add constraint pk_trans_B_num primary key(num);


select * from trans_B




