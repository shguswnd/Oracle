
show user;

/*오라클에서는 commit을 마지막에 해줘야 쿼리 실행이됨.*/

/*
실습코드

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
---다시 insert 하고 commit

---------------------------------------------------------------------------------------

--1. 사원 테이블에서 모든 데이터를 출력하세요.
--쿼리는 대소문자 구분을 안한다.
select * from emp;
SELECT * FROM emp;

--2. 특정 컬럼 데이터 출력하기
select empno, ename, sal
from emp;


select ename from emp;

--3. 컬럼명 가명칭(alias) 별칭부여,
--select empno 사번, ename 이름
--from emp;

select empno as "사     번", ename "이 름"
from emp;

---SQL 표준 문법(ANSI 문법) >> 표준 >> oracle or Ms-sql 에서 사용가능

--Oracle에서 문자열 데이터는 '' 사용해서 표현
--Oracle 문자열데이터 엄격하게 대소문자 구분

select empno, ename
from emp
where ename='KING'

/*
   select 절 3번
   from 절 1번
   where 절 2번
*/

--Oracle query(질의어) : 언어
--연산자
--java : + 숫자(산술연산)
--java : + 문자열(결합연산)
--연산자 : 결합과 산술을 분리
--oracle 결합연산자 : ||
--oracle 산술연산자 : + (산술)
--tip) ms-sql + (결합, 산술)

--select '사원의 이름은 ' || ename || '입니다' as "사원정보"
--from emp;


DESC EMP;

/*
 타입
 java class Emp (privaet int empno, private String ename)
 oracle create table Emp(empno number, ename varchar2(20))
 orcale(컬럼) : 숫자, 문자열, 날짜
 varchar2(10) >> 10 > 10byte > 한글 1자 2byte, 영문자, 특수, 공백 1byte)
 --한글 5자, 영문 10자
 
*/
select empno || ename   --숫자 || 문자열
from emp;



--아래 코드 안됨.
select empno + ename --숫자 타입과 문자타입 더하기가 안됨
from emp;



--개발실
--사장님 ....
--우리 회사에 직종이 몇개나 있나
select distinct(job) from emp;
--중복 데이터를 제거하는 키워드 distinct
--distinct 원리
--그룹핑(grouping)
select distinct job, deptno
from emp
order by job;

select distinct deptno, job
from emp
order by deptno;


--Oracle 연산자
--java 거의 동일 (+, -, *, /) 나머지 %
--Oracle 동일 (+, -, *, /) 나머지 연산자가 없음. >> 함수를 통해서 Mod() 사용 
--ename like '%김%'

--사원테이블에서 사원의 급여를 100달라 인상한 결과를 출력

show user;

select sal+100 from emp

desc emp

--dual 임시 가사테이블 
select 100 + 100 from dual; -- 200
select 100 || 100 from dual --100100
select '100' + 100 from dual -- 숫자형 문자(형변환 가능)
select 'A100' + 100 from dual; --아예 못더함. 에러메세지 발생.                                                               

--비교연산자
-- <  >  <=
-- 주의
--java 같다 (==) 할당(=) , javascript (==, ===)

--논리 연산자
--AND, OR , NOT

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL >= 2000;

--사번이 7788번인 사원의 사번, 이름, 직종, 입사일을 출력하세요

DESC EMP;

SELECT EMPNO, ENAME, JOB, HIREDATE
FROM EMP
WHERE EMPNO = '7788';

--개발자 : CRUD >> CREATE (INSERT), READ (SELECT), UPDATE (UPDATE), DELETE ( DELETE)
-- DB 작업 : READ (SELECT) 70% 

--관리자 : 백업과 복원, 장애(네트워크, 성능) 관리, 보안 (사용자 권한, 암호화)
--튜닝 (쿼리튜닝, 하드웨어) >> 문장튜닝!!!!  >>> 시간을...
--설계(모델러) : 설계(요구사항 정의, 분석) : ERD 

--사원의 이름이 KING 인 사원의 사번, 이름, 급여 정보를 출력하세요.

DESC EMP;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE ENAME = 'KING';

--급여가 2000달러 이상이면 직종이 MANAGER 인 사원의 모든 정보를 출력하세요.

SELECT *
FROM EMP
WHERE SAL>=2000 AND JOB ='MANAGER';

--이상, 이하 (=)
--초과, 미만
/*      AND     OR
0 0      0      0
0 1      0      1
1 0      0      1
1 1      1      1
*/

--급여가 2000달러 초가 이면서 직종이 MANAGER인 사원의 모든 정보를 출력하세요.

SELECT *
FROM EMP
WHERE SAL>2000 AND JOB='MANAGER'

--오라클 날짜 (DB서버의 날짜)
--오라클 날짜 (SYSDATE)
SELECT SYSDATE FROM DUAL;
--22/09/27 앞에 20뺀 데이터 나옴


SELECT * FROM nls_session_parameters; --시스템 테이블
--현재 접속한 사용자(session) 가지는 환경정보.

--일반적으로 2022-09-27

--컴퓨터를 끄면 데이터가 날라감 휘발성(세션) 데이터
--해당 세션에서만 사용하다보니 접속을 끊고 다시 접속하면 원래 상태로 복원됨
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS'

--

SELECT HIREDATE FROM EMP;

SELECT *
FROM EMP
WHERE HIREDATE = '1980-12-17';

/*
모든 시스템 날짜 필수 구성
게시판
설계
글쓴이, 제목, 내용, 조회수, 작성날짜
INSERT INTO BOARD(WRITER, TITLE, CONTENT, HIT, REGDATE)
            VALUES('홍길동', '처음방가','졸립다',0,SYSDATE)

REGDATE : 컬럼의 데이터는 서버의 시간 (DB서버)
--TIP) MS-SQL : SELECT GETDATE()
       MYSQL : CURDATE(), CURTIME(), NOW(), SYSDATE()

*/

SELECT *
FROM EMP
WHERE HIREDATE = '1980/12/17'; --/인정
-- HIREDATE 값에 (YY-MM-DD) 값은 안넣어짐 위에 SESSION 값을 바꿨기때문

--사원의 급여가 2000이상이고 4000이하인 모든 사원의 정보를 출력

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
 USERID VARCHAR2(20) NOT NULL, --NULL을 허용하지 않겠다 (필수입력)
 NAME VARCHAR2(20) NOT NULL, -- 필수입력
 HOBBY VARCHAR2(50) --DEFAULT NULL 허용 : 선택적 입력사항
);



SELECT * FROM  MEMBER;

--NULL허용안함
INSERT INTO MEMBER(USERID, HOBBY) VALUES('HONG','농구');

--NULL허용
INSERT INTO MEMBER(USERID, NAME) VALUES('HONG','홍길동');

SELECT * FROM MEMBER;

--간단하게
--DB서버 마다 설정
--DML(데이터 조작어) : INSERT, UPDATE, DELETE
--오라클 실제반영을 위해서 개발자에게 : COMMIT, ROLLBACK 강제
--MS-SQL, MYSQL DEFAULT COMMIT >> BEGIN 명시 DML 작업 .... COMMIT, ROLLBACK 강제

COMMIT; --명령(INSERT, UPDATE, DELETE) 실제 반영

--수당(COMM)을 받지 않는 모든 사원의 정보를 출력하세요.
--0도 데이터(받는 조건)
SELECT COMM FROM EMP;

--COMM 컬럼의 데이ㅓ가 NULL인거만 출력
SELECT COMM FROM EMP WHERE COMM = NULL; --문법은 존재하지않은




--NULL 비교는 (IS NULL, IS NOT NULL) 암기...
--수당을 받는 사원들 (0도 받는 것으로)
SELECT COMM
FROM EMP
WHERE COMM IS NOT NULL

--사원테이블에서 사번, 이름, 급여, 수당, 총급여를 출력하세요.
--총급여 정의(급여 + 수당)

SELECT  EMPNO, ENAME, SAL, COMM, SAL+COMM AS 총급여
FROM EMP 
WHERE COMM IS NOT NULL

/*
NULL이란~~~
1. NULL 과의 모든 연산의 결과는 무조건 NULL ex) 100 + NULL => NULL, 100-NULL => NULL
2. 위 문제를 해결하기 위해서 함수 >> nvl(), nvl2() >> 암기
ex) nvl(컬럼명, 대체값) >> 치환

Tip) 
     oracle > NULL > NVL
     ms-sql > null > convert()
     Mysql > null > IFNULL() >> SELECT IFNULL(NULL, "W3Schools.com");
*/
SELECT EMPNO, ENAME, SAL, COMM, SAL + NVL(COMM,0) AS 총급여
FROM EMP;

SELECT 1000 + NULL FROM DUAL;

SELECT 1000 + NVL(NULL,0) FROM DUAL;

SELECT COMM, NVL(COMM,111111111)FROM EMP;

SELECT NVL(NULL, 'HELLO WORLD') FROM DUAL;

--사원의 급여가 1000이상이고 수당을 받지 않는 사원의 사번, 이름, 직종, 급여, 수당을 출력하시오.

DESC EMP;

SELECT EMPNO, ENAME, JOB, SAL, COMM
FROM EMP
WHERE SAL >= 1000 AND COMM IS NOT NULL;


--DQL : SELECT 데이터 쿼리 랭귀지
--DDL : 정의어 : CREATE, ALTER, DROP, (TABLE 생성, 수정, 삭제) >> 데이터 디피니션 랭귀지 DB정의 명령어
--DML : 조작어 : INSERT, UPDATE, DELETE (반드시 COMMIT, ROLLBACK)

--JAVA : CLASS BOARD (PRIVATE INT BOARDNO)
--DB : CREATE TABLE BOARD(BOARDNO NUMBER)

CREATE TABLE BOARD(
    BOARDID NUMBER NOT NULL, --숫자, 필수 입력
    TITLE VARCHAR2(50) NOT NULL, --글제목 (한글 25자, 영문자 50자), 필수입력
    CONTENT VARCHAR2(2000) NOT NULL, --글내용(한글 1000자, 영문자 2000) 필수
    HP VARCHAR2(20) --DEFAULT NULL 허용(선택사항)
);

DESC BOARD

SELECT * FROM BOARD;

ALTER TABLE BOARD RENAME COLUMN CONTENTS TO CONTENT;
COMMIT;

INSERT INTO BOARD(BOARDID, TITLE, CONTENT) 
VALUES(100, '오라클', '실수했네');
--데이터 잘못 넣었네 
ROLLBACK;


COMMIT;
SELECT * FROM BOARD;

/*

*/


SELECT BOARDID, TITLE, CONTENT, HP
FROM BOARD;

SELECT BOARDID, TITLE, CONTENT, NVL(HP,'EMPTY') AS HP
FROM BOARD;

--문자열 검색
--주소검색 : 검색어 : 역삼 -> 역삼이라는 단어가 들어가 있는 모든 주소가 출력
--LIKE 패턴검색
--LIKE (문자열 패턴 검색 연산자)
--LIKE 연산자 (와일드 카드 문자 : 1. %(모든것), _(한문자) 결합 패턴을 생성 일치
--검색이 한정적 >> JAVA 정규 표현식을 오라클 적용)

SELECT *
FROM EMP
WHERE ENAME LIKE 'A%'; --대소문자 엄격하게 구문

--주소검색
--SELECT * FROM ZIP WHERE DONG LIKE '%역삼%'
--SELECT * FROM MEMBER WHERE DONG LIKE '%역삼%'

SELECT *
FROM EMP
WHERE ENAME LIKE '%A%A%'; ---ADAMS ABABA AAAAAA


SELECT ENAME
FROM EMP
WHERE ENAME LIKE '_A%'; --첫 글자는 어떤것이 와도 상관없고 두번째 글자는 A시작
--WARD
--MARTIN
--JAMES

--과제 REGEXP_LIKE 연산자 (정교표현 사용)
SELECT * fROM EMP WHERE REGEXP_LIKE(ENAME, '[A-C]');
--정규표현 검색 5개 만들기

--데이터 정렬하기
--ORDER BY 컬럼명 : 문자, 숫자, 날짜
--오름차순 : ASC : 낮은순 : DEFAULT
--내림차순 : DESC : 높은순
--비용(COST) 많이 드는 작업

SELECT *
FROM EMP
ORDER BY SAL; --DEFAULT ASC

SELECT *
FROM EMP
ORDER BY SAL DESC;

--입사일이 가장 늦은 순으로 정렬해서 사번, 이름, 급여, 입사일을 출력하세요

SELECT EMPNO, ENAME, SAL, HIREDATE
FROM EMP
ORDER BY HIREDATE DESC;

SELECT EMPNO, ENAME, SAL, HIREDATE
FROM EMP
ORDER BY ENAME DESC;



/*
SELECT 절    3
FROM 절      1
WHERE 절     2
ORDER BY 절  4   (SELECT 결과를 정렬)
*/

SELECT EMPNO, ENAME, SAL, JOB, HIREDATE
FROM EMP
WHERE JOB='HANAGER'
ORDER BY HIREDATE DESC



SELECT JOB, DEPTNO
FROM EMP
ORDER BY JOB ASC , DEPTNO DESC;
--ORDER BY 컬럼명 ASC, 컬럼명 ASC..... 
--게시판 ..답변게시판

--연산자
--합집합(UNION) : 테이블과 테이블의 데이터를 합치는것(중복값 배제)
--합집합(UNION ALL) : 중복값 허용

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

--중복데이터를 죽이고 합침.
SELECT * FROM UT
UNION
SELECT * FROM UTA

SELECT * FROM UT
UNION ALL
SELECT * FROM UTA
--UT 집에 UTA 가족들이 놀러간것

--UNION
--1. 대응되는 컬럼의 타입이 동일해야함.
--아래를 보면 각 대응되는 컬럼의 타입이 다르기 때문에 UNION  사용이 불가능.
SELECT EMPNO, ENAME FROM EMP
UNION
SELECT DNAME, DEPTNO FROM DEPT;



SELECT EMPNO, ENAME FROM EMP
UNION
SELECT DEPTNO, DNAME FROM DEPT;

--2. [대응]대는 [컬럼]의 개수가 동일
SELECT EMPNO, ENAME, JOB, SAL FROM EMP
UNION
SELECT DEPTNO, DNAME, LOC, NULL FROM DEPT;

--------------------------------------------------
---함수
--함수 사용하기
--

/*
 단일 행 함수의 종류 
1) 문자형 함수 : 문자를 입력 받고 문자와 숫자 값 모두를 RETURN 할 수 있다.
2) 숫자형 함수 : 숫자를 입력 받고 숫자를 RETURN 한다.
3) 날짜형 함수 : 날짜형에 대해 수행하고 숫자를 RETURN 하는 MONTHS_BETWEEN 함수를
제외하고 모두 날짜 데이터형의 값을 RETURN 한다.
4) 변환형 함수 : 어떤 데이터형의 값을 다른 데이터형으로 변환한다.
5) 일반적인 함수 : NVL, DECODE
*/
--문자열 함수


SELECT INITCAP('THE SUPER MAN')
 FROM DUAL; --The Super Man
 
 SELECT LOWER('AAA'), UPPER('aaa') FROM DUAL;
 
 SELECT ENAME, LOWER(ENAME) AS "ENAME" FROM EMP;
 
 --이렇게 데이터 찾을 경우 사용하면 개꿀.
 SELECT * FROM EMP WHERE LOWER(ENAME) = 'king';
 
 SELECT LENGTH('ABCD') FROM DUAL; --문자열의 개수
 SELECT LENGTH('홍길동') FROM DUAL; --3개
 
 SELECT CONCAT('A','B') FROM DUAL;
 --SELECT CONCAT('A','B','C') FROM DUAL; CONCAT을 3번해야함
 SELECT 'A'||'B'||'C' FROM DUAL;
  
 SELECT ENAME || '      ' || JOB FROM EMP;
 SELECT CONCAT(ENAME, JOB) FROM EMP;
 
 --JAVA : SUBSTRING
 --ORACLE : SUBSTR
 
 SELECT SUBSTR('ABCDE', 2, 3) FROM DUAL; --BCD
 SELECT SUBSTR('ABCDE', 1, 1) FROM DUAL; --A
 SELECT SUBSTR('ABCDE', 3, 1) FROM DUAL; --C
 
 SELECT SUBSTR('abcasdwgqwgawgawdwgwgasg',3) FROM DUAL;
 
 
 
 SELECT SUBSTR('ABCDE', -2,1) FROM DUAL; -- 뒤에서 부터 읽음 D
 SELECT SUBSTR('ABCDE', -2,2) FROM DUAL;
 
 --사원테이블에서 ENAME 컬럼의 데이터에 대해서 첫글자는 소문자로 나머지 글자는 대문자로
 --출력하되 하나의 컬럼으로 만들어서 출력하시고 컬럼의 별칭은 FULLNAME 하고 첫글자와
 --나머지 문자 사이에는 공백하나를 넣으시오.

SELECT LOWER(SUBSTR(ENAME,1,1))|| '      ' || UPPER(SUBSTR(ENAME,1)) AS FULLNAME
FROM EMP

SELECT LPAD('ABC', 10, '*') FROM DUAL; --******ABC

SELECT RPAD('ABC', 10, '&') FROM DUAL; --ABC&&&&&&&

--사용자의 비번 : HONG1007 OR K1234
--화면 : 앞 두글자  >> HO*******
--               >> K1*****

SELECT  RPAD(SUBSTR('HONG1007',1,2),LENGTH('HONG1007'),'*'), RPAD(SUBSTR('K1234',1,2),LENGTH('K1234'),'*')
FROM EMP

--EMP 테이블에서 ENAME 컬럼의 데이터를 출력하되 첫글자만 출력하고 나머지는 * 로 출력

SELECT RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME),'*')
FROM EMP;


CREATE TABLE MEMBER2(
    ID NUMBER, --뒤에 아무것도 안쓰면 NULL을 허용하겠다.
    JUMIN VARCHAR2(14)
);

INSERT INTO MEMBER2(ID,JUMIN) VALUES(100,'123456-1234567');
INSERT INTO MEMBER2(ID,JUMIN) VALUES(200,'123456-1234567');
COMMIT;

SELECT * FROM MEMBER2;
--출력결과
--100 : 123456-********
--200 : 

SELECT  ID || ' : ' || RPAD(SUBSTR(JUMIN,1,7), LENGTH(JUMIN), '*') AS JUMINNUBER
FROM MEMBER2

DELETE FROM MEMBER2;


--RTRIM 함수
--오른쪽 문자 지워라

SELECT RTRIM('MILLER', 'ER') FROM DUAL; --MILL

SELECT '>' || RTRIM('MILLER           ', ' ') || '<' FROM DUAL;

SELECT '>' || LTRIM('            MILLER', ' ') || '<' FROM DUAL;

---치환함수
SELECT ENAME, REPLACE(ENAME, 'A','와우') FROM EMP

--숫자함수
--ROUND(반올림 함수)
--TRUNC(절삭함수)
--MOD() 나머지를 구하는 함수


--- -3 -2 -1 0(정수) 1 2 3
SELECT ROUND(12.345,0) AS "R" FROM DUAL; --정수부만 남겨라 --12
SELECT ROUND(12.567,0) AS "R" FROM DUAL; --13

SELECT ROUND(12.345,1) AS "R" FROM DUAL; --12.3
SELECT ROUND(12.567,1) AS "R" FROM DUAL; --12.6

SELECT ROUND(12.345,-1) AS "R" FROM DUAL; --10
SELECT ROUND(15.567,-1) AS "R" FROM DUAL; --20



--짤라버려라.
SELECT TRUNC(12.345,0) AS "R" FROM DUAL; --정수부만 남겨라 --12
SELECT TRUNC(12.567,0) AS "R" FROM DUAL; --12

SELECT TRUNC(12.345,1) AS "R" FROM DUAL; --12.3
SELECT TRUNC(12.567,1) AS "R" FROM DUAL; --12.5

SELECT TRUNC(12.345,-1) AS "R" FROM DUAL; --10
SELECT TRUNC(15.567,-1) AS "R" FROM DUAL; --10


--나머지
SELECT 12 / 10 FROM DUAL; --1.2

SELECT MOD(12,10) FROM DUAL; --2

SELECT MOD(0,0) FROM DUAL;


--날짜함수
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
SELECT SYSDATE FROM DUAL;

--POINT(날짜 연산)
--1. DATE + NUMBER >> DATE
--2. DATE - NUMBER >> DATE
--3. DATE - DATE >> NUMBER(일수)

SELECT SYSDATE + 100 FROM DUAL;
SELECT SYSDATE + 1000 FROM DUAL;

SELECT HIREDATE FROM EMP;
SELECT MONTHS_BETWEEN('2022-09-27','2019-09-27') FROM DUAL;
SELECT MONTHS_BETWEEN(SYSDATE, '1992-12-08') FROM DUAL;

SELECT '2022-01-01' + 100 FROM DUAL; --'2022-01-01' 날짜형식을 가지는 문자
--POINT 변환함수 TO_DATE()

SELECT TO_DATE('2022-01-01') + 100 FROM DUAL;

--사원 테이블에서 사원들의 입사일에서 현재날짜까지의 근속월수
DESC EMP

SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS A
FROM EMP
--1. 사원 테이블에서 사원들의 입사일에서 현재날짜까지의 근속월수를 구하세요.
--사원이름, 입사일, 근속월수 출력
--단 근속월수는 정수부분만 출력(반올림 하지 마세요)
SELECT EMPNO, HIREDATE,
TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE),0) AS '근속월수'
FROM EMP;

--2. 한달이 31일 이라는 기준에서 근속월수를 구하세요.
--(반올림 하지 마세요) (함수 사용(X) >> 날짜 - 날짜 >> 150일 소요)
SELECT EMPNO, HIREDATE, TRUNC((SYSDATE-HIREDATE)/31,0) AS "근속월수"
FROM EMP

--변환함수 TODAY POINT
--ORACLE 데이터 : 문자열, 숫자, 날짜
--TO_CHAR() : 숫자 -> 문자 (1000 -> $100,000) >> FORMAT 출력형식 정의

-- 날짜 -> 문자 ('2022-09-29' -> 2022년09월29일)

SELECT TO_CHAR(SYSDATE)
FROM DUAL;

--TO_NUMBER() : 문자 -> 숫자 >> 자동형변환
--SELECT '100' + 100 FROM DUAL;
--1.
SELECT '1' + 1 FROM DUAL;
SELECT TO_NUMBER('1') + 1 FROM DUAL; --'1' 문자 -> 숫자(형변환)
--원칙
SELECT TO_NUMBER('1') + 1 FROM DUAL;

--2
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY') || '년' AS "YYYY",
TO_CHAR(SYSDATE,'YEAR') AS "YEAR",
TO_CHAR(SYSDATE,'MM') AS "MM",
TO_CHAR(SYSDATE,'DD') AS "DAY", 
TO_CHAR(SYSDATE,'DAY') AS "DY" 
FROM DUAL

--입사일 12월인 사원의 사번, 이름, 입사일, 입사년도, 입사월을 출력

DESC EMP;

SELECT TO_CHAR(SYSDATE,'YYYY') || '년' AS 입사년도,
TO_CHAR(HIREDATE,'MM') || '월' AS 입사월,
TO_CHAR(HIREDATE,'DD') || '일' AS 입사일
FROM EMP
WHERE TO_CHAR(HIREDATE,'MM') ='12';


SELECT TO_CHAR(HIREDATE, 'YYYY MM DD') FROM EMP;
--TO_CHAR() : 날짜 -> 형식문자 변환
--오라클.PDF 68PAGE 표참조

--TO_CHAR : 숫자 -> 형식문자 변환
--오라클.PDF 71PAGE 표참조
--100000000 -> $10,000,000

SELECT '>' || TO_CHAR(12345, '9999999999999999') || '<' FROM DUAL;

SELECT SAL, TO_CHAR(SAL, '$999,999') FROM EMP;

---------------------------------------------------------------
 --HR 계정으로 변경
show user;
--USER이(가) "HR"입니다.
select * from employees;
select sysdate  from dual;
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
/*
사원테이블(employees)에서 사원의 이름은 last_name , first_name 합쳐서 fullname 별칭 
부여해서 출력하고 입사일은  YYYY-MM-DD 형식으로 출력하고 연봉(급여 *12)을 구하고 
연봉의 10%(연봉 * 1.1)인상한 값을
출력하고 그 결과는 1000단위 콤마 처리해서 출력하세요
단 2005년 이후 입사자들만 출력하세요 그리고 연봉이 높은 순으로  출력하세요*/

DESC employees
TO_CHAR(SAL, '$999,999')

SELECT TO_CHAR(FIRST_NAME) || TO_CHAR(LAST_NAME) AS FULLNAME, 
 TO_CHAR(HIRE_DATE,'YYYY')||'-'||TO_CHAR(HIRE_DATE,'MM')||'-'||TO_CHAR(HIRE_DATE,'DD') AS 입사일, 
TO_CHAR((SALARY*12*1.1),'$999,999') AS 연봉
FROM employees
WHERE TO_CHAR(HIRE_DATE,'YYYY') >= '2005'
ORDER BY SALARY DESC



SELECT TO_CHAR(FIRST_NAME) || TO_CHAR(LAST_NAME) AS FULLNAME, 
TO_CHAR(HIRE_DATE,'YYYY-MM-DD'),
TO_CHAR((SALARY*12*1.1),'$999,999') AS 연봉인상값
FROM employees
WHERE TO_CHAR(HIRE_DATE,'YYYY') >= '2005'
ORDER BY 연봉인상값 DESC

---문자함수, 숫자함수, 날짜함수
--변환함수(TO_CHAR, TO_NUMBER)

--일반함수(NVL, NVL2 ...)
--집계함수 (AVG(), SUM(), MIN(), MAX())
--------------------------------------------



# SQL코드질문


select last_name || first_name as "fullname",
to_char(hire_date , 'YYYY/MM/DD') as "입사일",
ltrim(to_char(((salary*12)*1.1), '$999,999,999')) as "연봉인상값"
from employees
order by "연봉인상값" desc ;


show user;

--ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS';

SELECT SYSDATE FROM DUAL;


-----------------------------------------------------------------------------

CREATE TABLE 테이블명(컬럼명 타입, 컬럼명)

CREATE TABLE MEMBER3(AGE NUMBER);
--1건 또는 100건

INSERT INTO MEMBER3(AGE) VALUES(100);
INSERT INTO MEMBER3(AGE) VALUES(200);
INSERT INTO MEMBER3(AGE) VALUES(300);
INSERT INTO MEMBER3(AGE) VALUES(400);

-----------------------------------------------------------------------------
/*
    CLASS MEMEBER3(PRIVATE INT AGE;)
    --1건
    MEMBER3 M = NEW MEMBER3();
    M.setAge(100);
    
    100건 데이터 넣어라
    List<member3> mlist = new ArrayList<member3();
    mlist.add(new member(100));
    mlist.add(new member(200));
    mlist.add(new member(300));
    mlist.add(new member(400));
    
    데이터 타입
    문자열 타입
    char(10) >> 10byte >> 한글5자, 영문자, 특수, 공백 10자 >> 고정길이 문자열
    
    varchar2(10) >> 10byte >> 한글5자, 영문자, 특수, 공백 10자 >> 가변길이 문자열
    
    >>
    char(10) >> 'abc' >> 3byte >> [a][b][c][][][][][][][][] >> 공간의 변화는 없음
    varchar(10) >> 'abc' >> 3byte >> [a][b][c]>> 데이터 크기만큼 공간이 사라짐, >> arrayList와 비슷한 느낌
    
    사람이름
    create table member (name char(30))
    create table member (name varchar2(3)) (0)
    
    성별 (남 또는 여)
    create table member(gender char(3))
    create table member(gender varchar2(3)) (0)
    
   약속 : 고정길이 문자열 (남,여 .... 대,중,소 ... 주민번호) char() --> 성능 
      가변길이 문자열 (사람의 이름 , 취미 , 주소) varchar2()
      
char() , varchar2() 고민 : 한글과 영어 혼합
varchar2(10)

unicode (2byte) : 한글, 영문자 , 특수문자, 공백 >> 2byte

nchar(20)  >> 20자 >> 2*20 >> 40byte
nvarchar2(20) >> 20자  

*/
--오라클 함수 ......
select * from SYS.NLS_DATABASE_PARAMETERS;
--NLS_CHARACTERSET  : 	AL32UTF8  한글 3byte 인식
--KO16KSC5601 2Byte (현재 변환하면 한글 다깨짐)
select * from nls_database_parameters where parameter like '%CHAR%';
--------------------------------------------------------------------------
    
create table test2(name varchar2(2));

insert into test2(name) values('a');
insert into test2(name) values('aa');
insert into test2(name) values('가'); --한글 1자 3byte 인지
-------------------------------------------------------------------------------
create table test3(name nchar(2) , ename nvarchar2(2));

insert into test3(name) values('a');
insert into test3(name) values('가');

insert into test3(name) values('ab');
insert into test3(name) values('가나');

insert into test3(name) values('abc');
insert into test3(ename) values('가나다');
commit;

--------------------------------------------------------------------
--일반함수(프로그램 성격이 강한 함수)
--NVL(), NVL2() >> NULL 처리하는 함수
--DECODE() >> JAVA의 IF문
--CASE() >> JAVA의 SWITCH 문 유사

--오라클 SQL(변수, 제어문 개념이 없다)
--오라클 PL-SQL(변수, 제어문) 고급기능

SELECT COMM, NVL(COMM, 0) FROM EMP;

CREATE TABLE T_EMP(
    ID NUMBER(6), --정수 6자리
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
100,'아이티',
200,'영업부',
300,'관리팀',
'기타부서') AS 부서이름
FROM T_EMP;

SELECT EMPNO, ENAME, DEPTNO, DECODE
(DEPTNO,
10,'인사부',
20,'관리부',
30,'회계부',
40,'부서',
'ETC') AS 부서이름
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
1,'남성',
2,'여성',
3,'중성',
'기타')AS 성별
FROM T_EMP2

/*
 응용문제: HINT) IF문 안에 IF문
    부서번호가 20번인 사원중에서 SMITH 라는 이름을 가진 사원이라면 HELLO 문자 출력하고
    부서번호가 20번인 사원중에서 SMITH 라는 이름을 가진 사원이 아니라면 WORLD 문자 출력하고
    부서번호가 20번인 사원이 아니라면 ETC 라는 문자를 출력하세요
*/
SELECT EMPNO, DEPTNO, DECODE(DEPTNO,20,DECODE(ENAME,'SMITH','HELLO','WORLD'),'ETC')
FROM EMP;

--DECODE 다양한 통계
/*
CASE 조건식 WHEN 결과1 THEN 출력1
           WHEN 결과2 THEN 출력2
           WHEN 결과3 THEN 출력3
           ELSE 출력 4
END "컬럼명"
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

SELECT '0' || TO_CHAR(ZIPCODE), CASE ZIPCODE WHEN 2 THEN '서울'
                                             WHEN 31 THEN '경기'
                                             WHEN 41 THEN '제주'
                                             ELSE '기타지역'
                                END "지역이름"
FROM T_ZIP;

/*
사원테이블에서 사원급여가 1000달러 이하면 4급
1001달러 2000달라 이하면 3급
2001달러 3000달라 이하면 2급
3001달러 4000달라 이하면 2급
4001달러 이상이면 '특급'이라는 데이터를 출력
--1. CASE 컬럼명 WHEN 결과 THEN 출력
--2. 비교식이 필료하다면 
     CASE WHEN 조건 비교식 THEN
     WHEN ....
     WHEN ....
*/

SELECT CASE WHEN SAL <=1000 THEN '4급'
            WHEN SAL BETWEEN 1001 AND 2000 THEN '3급'
            WHEN SAL BETWEEN 2001 AND 3000 THEN '2급'
            WHEN SAL BETWEEN 3001 AND 4000 THEN '1급'
            ELSE '특급'
        END "급수", EMPNO, ENAME
FROM EMP;
-----------------------------------------------------------------
--문자함수, 숫자함수, 날짜함수, 변환함수(TO_CHAR, TO_NUMBER, TO_DATE)
--일반함수 (NVL, DECODE(), CASE구문)
--기본함수 END
-----------------------------------------------------------------
--집계함수(그룹)함수
--오라클.PDF(75)
/*
1. COUNT(*) >> ROW수, COUNT(컬럼명) >> 데이터 건수 > (NULL 은 포함하지 않아요)
2. SUM()
3. AVG()
4. MAX()
5. MIN()
--기타

1. 집계함수는 GROUP BY 절과 같이 사용
2. 모든 집계함수는 NULL 무시
3. SELECT 절에 집계함수 이외에 다른 컬럼이 오면 반드시 그 컬럼은 GROUP BY 절에 명시

*/

SELECT COUNT(*) FROM EMP; --14개의 ROW

SELECT COUNT(EMPNO) FROM EMP;

SELECT COUNT(COMM) FROM EMP; --6 널없는것만 셈


SELECT COUNT(NVL(COMM,0)) FROM EMP; --POINT
--급여의합
SELECT SUM(SAL) AS 급여의합 FROM EMP;

SELECT ROUND(AVG(SAL),0) AS 급여의평균 FROM EMP;


--사장님 우리회의 총 수당이 얼마나 지급되었나.

SELECT SUM(COMM) FROM EMP;

--수당의 평균

SELECT ROUND(AVG(COMM),0) FROM EMP;

SELECT (300+200+30+300+3500+0) / 6 FROM DUAL;

SELECT AVG(NVL(COMM,0)) FROM EMP;

--둘다 맞음 회사 규칙에 따라 기준이 달라질듯
--개발자 721, 309 둘다 맞는다
--회사의 규정(전체 사원수 기준 --309)
--회사의 규정(전체 사원수 기준 --721)


SELECT MAX(SAL) FROM EMP;

SELECT MIN(SAL) FROM EMP;

SELECT EMPNO, COUNT(EMPNO) FROM EMP;
--14건       1건

SELECT SUM(SAL), AVG(SAL), MAX(SAL), MIN(SAL), COUNT(SAL) FROM EMP;

--부서별 평균 급여를 구하세요.
DESC EMP;

SELECT DEPTNO, ROUND(AVG(SAL)), COUNT(*)    --3
FROM EMP                                    --1
GROUP BY DEPTNO;                            --2

--직종별 평균 급여를 구하세요.

SELECT JOB, ROUND(AVG(SAL))
FROM EMP
GROUP BY JOB;

--직종별, 평균급여, 급여합, 최대급여, 최소급여, 건수를 구하시오.

SELECT ROUND(AVG(SAL)), SUM(SAL), MAX(SAL), MIN(SAL), COUNT(*)
FROM EMP
GROUP BY JOB;

/*
 그룹
 DISTINCT 컬럼명1, 컬럼명2
 ORDER BY 컬럼명1, 컬럼명2
 GROUP BY 컬럼명1, 컬럼명2
*/
--부서별, 직종별 급여의 합을 구하시오.

SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO;

/*
SELECT 절        4
FROM 절          1
WHERE 절         2
GROUP BY 절      3
ORDER BY 절      5
*/

--직종별 평균급여가 3000달러 이상인 사원의 직종별 평균급여를 출력

SELECT JOB, SAL
FROM EMP
WHERE SAL IN(SELECT AVG(SAL) FROM EMP GROUP BY JOB)

AND 
(SELECT AVG(SAL) FROM EMP GROUP BY JOB) >=3000


SELECT JOB, AVG(SAL) AS 평균급여
FROM EMP
--WHERE AVG(SAL) >= 3000 --WHERE 조건 --집계된 결과를 조건을 못함.
GROUP BY JOB
HAVING AVG(SAL)>=3000;

(실행순서)
                              
 --1.  from 조건절 where 
 --2.  group by 조건절 having
/*
select           5
from             1
where            2
group by         3
having           4 
order by         6

*/
/* 
사원테이블에서 직종별 급여합을 출력하되 수당은 지급 받고 급여의 합이 
5000 이상인  사원들의 목록을 출력하세요
급여의 합이 낮은 순으로 출력하세요 
*/


SELECT JOB, SUM(SAL)
FROM EMP
WHERE COMM IS NOT NULL
GROUP BY JOB
HAVING SUM(SAL) >= 5000
ORDER BY SUM(SAL);

/* 사원테이블에서 부서 인원이 4명보다 많은 부서의 부서번호 ,인원수 , 급여의 합을 출력하세요 */

DESC EMP;

select deptno, sum(sal)
from emp
group by deptno
having count(*) > 4;



/* 사원테이블에서 직종별 급여의 합이 5000을 초과하는 직종과 급여의 합을 출력하세요.
   단 판매직종(SALESMAN)은 제외하고 급여함으로 내림차순 정렬하세요/*/
      
   SELECT JOB, SUM(SAL)
   FROM EMP
   WHERE JOB!='SALESMAN'
   GROUP BY JOB
   HAVING SUM(SAL)>5000 
   ORDER BY SUM(SAL) DESC;
  
  
  -------------------------------------------------------------------------------
  --단일 테이블에 데이ㅓ를 가져오는 것은 END ------------------------------------------
  -------------------------------------------------------------------------------
  
  --여러개의 테이블에서 원하는 데이터를 추출하는 방법
  --JOIN(조인)
  --다중 테이블로부터 데이터 검색
  
  
--Equijoin Join 조건이 정확히 일치하는 경우 사용(일반적으로 PK 와 FK 사용)
--Non-Equijoin Join 조건이 정확히 일치하지 않는 경우에 사용(등급,학점)
--Outer Join Join 조건이 정확히 일치하지 않는 경우에도 모든 행들을 출력
--Self Join 하나의 테이블에서 행들을 Join 하고자 할 경우에 사용
--Set Operators 여러 개의 SELECT 문장을 연결하여 작성한다
   
--RDBMS (관계형) 
   
/*
관계 (테이블과 테이블과의 관계
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
1. 등가조인(EQUI JOIN)
원테이블과 대응대는 테이블에 있는 컬럼의 데이터를 1:1 매핑
1.1 문법
-SQL JOIN문법(오라클 문법) > 간단
-ANSI문법(표준) 권장 > 무조건 > [INNER] JOIN ON 조건절
*/

SELECT *
FROM M,S
WHERE M.M1 = S.S1

--ANSI 문법


SELECT *
FROM M INNER JOIN S
ON M.M1 = S.S1;
------위 아래 같음 
SELECT *
FROM M JOIN S   --구문
ON M.M1 = S.S1; --ON 조인의 조건절

--사원번호, 사원이름, 부서번호, 부서이름을 출력하세요.

SELECT *
FROM EMP JOIN DEPT
ON EMP.DEPTNO = DEPT.DEPTNO;

SELECT *
FROM M JOIN X
ON M.M1 = X.X1


--JOIN
--테이블 2개, 3개, 4개
--SQL JOIN

SELECT M.M1, M.M2, S.S2, X.X2
FROM M, S, X
WHERE M.M1 = S.S1 AND S.S1 = X.X1;
-- A = B, B = C, A = C
--ANSI 문법
SELECT *
FROM M JOIN S ON M.M1 = S.S1
       JOIN X ON S.S1 = X.X1;
       
       
--HR 계정으로 이동

SHOW USER; --USER이(가) "HR" 입니다.
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;


--문제) 사번, 이름(LAST_NAME), 부서번호, 부서이름을 출력(ANSI)

SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D
                ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
--문제점
--사원수 107명인데 (누군가 누락된)
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IS NULL;
--등가조인 NULL 처리 불가 >> 다른 조인 >> 잠시 후에

--1. 사번, 이름(LAST_NAME), 부서번호, 부서이름, 지역코드, 도시명 출력하세요 (ANSI)

SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME,
L.LOCATION_ID, L.CITY
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                 JOIN LOCATIONS L ON L.LOCATION_ID = D.LOCATION_ID



--------------------------------------------------------------------------------------
SHOW USER; 

--2. 비등가 조인 (NON-EQUI JOIN) => 1:1로 비교할 컬럼이 없는 경우
--의미만 존재 >> 등가조인의 문법을 그대로 사용
--1:1 매핑 ON EMP.DEPTNO = DEPT.DEPTNO

SELECT * FROM EMP;
SELECT * FROM SALGRADE

SELECT *
FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

--3. OUTER JOIN (EQUI JOIN 먼저 선행하고 나서 + 남아있는 데이터 가져오면 됨)
--OUTER JOIN 주종 관례를 파악
--주인이 되는 테이블의 남은 데이터를 가져 올 수 있다.
--문법
--3.1 LEFT OUTER JOIN (왼쪽이 주인)
--3.2 RIGHT OUTER JOIN (오른쪽이 주인)
--3.3 FULL OUTER JOIN(LEFT, RIGHT 값의 유니온(UNION) 한값이다)

SELECT * FROM M
SELECT * FROM S

--주인을 정하고 주인의 남은 데이터를 가져오는 조인
--OUTER는 굳이 안써도 된다.
SELECT *
FROM M LEFT JOIN S
ON M.M1 = S.S1;

SELECT *
FROM M RIGHT JOIN S
ON M.M1 = S.S1;

SELECT *
FROM M FULL OUTER JOIN S
ON M.M1 = S.S1;



--문제) 사번, 이름(LAST_NAME), 부서번호, 부서이름을 출력(ANSI)
SHOW USER;
--문제점
--사원수 107(누군가 누락)
--등가조인 null 처리 불가 >> 다른 조인 >> left join 사용

SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
                ON E.DEPARTMENT_ID = D.DEPARTMENT_ID

-----------------------------------------------------------------------------------------

SELECT * FROM EMP;

--3. SELF JOIN(자기 참조) -> 문법(X) 의미만 존재 >> 등가조인(문법)
--자기참조 테이블안에서 컬럼값을 응용해 다른 컬럼값을 비교하는 의미
-- 중복데이터가 생기니 그걸 막기위한 방법
--하나의 테이블에 있는 컬림이 자신의 테이블에 있는 다른 컬럼을 참조하는 경우
--EMP >> Mgr(관리자)


---------------------------------------------------------------------------------
select * from emp;
--3. self join (자기참조) -> 문법(X) 의미만 존재 >> 등가조인(문법)
--하나의 테이블에 있는 column 이 자신의 테이블에 있는 다른 column을 참조하는 경우
--Emp >> Mgr(관리자)
select e.empno, e.ename, m.empno, m.ename
from emp e join emp m
on e.mgr = m.empno; --문제가 있음: 사원 원래 14명인데 13명 밖에 안나옴.. 

select * from emp where ename = 'KING';

select e.empno, e.ename, m.empno, m.ename
from emp e left join emp m
on e.mgr = m.empno; --문제 해결됨 join 앞에 left 붙여서
--



-- 1. 사원들의 이름, 부서번호, 부서이름을 출력하라.

SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM  EMP E JOIN DEPT D
          ON E.DEPTNO = D.DEPTNO;
?

-- 2. DALLAS에서 근무하는 사원의 이름, 직위, 부서번호, 부서이름을

-- 출력하라.
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E JOIN DEPT D
           ON E.DEPTNO = D.DEPTNO
WHERE D.LOC = 'DALLAS';

  SELECT * FROM DEPT
    
SELECT * FROM EMP  
  
DESC EMP

DESC DEPT
?

-- 3. 이름에 'A'가 들어가는 사원들의 이름과 부서이름을 출력하라.

SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E JOIN DEPT D
           ON E.DEPTNO = D.DEPTNO
WHERE UPPER(E.ENAME) LIKE 'A%';

?

?

-- 4. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을

--출력하는데 월급이 3000이상인 사원을 출력하라.

SELECT E.ENAME, E.DEPTNO, D.DNAME, E.SAL
FROM EMP E JOIN DEPT D
           ON E.DEPTNO = D.DEPTNO
WHERE SAL >= 3000;

?

-- 5. 직위(직종)가 'SALESMAN'인 사원들의 직위와 그 사원이름, 그리고

-- 그 사원이 속한 부서 이름을 출력하라.
SELECT E.ENAME, E.DEPTNO, D.DNAME, E.SAL
FROM EMP E JOIN DEPT D
           ON E.DEPTNO = D.DEPTNO
WHERE JOB = 'SALESMAN';


?

SELECT * FROM EMP
-- 6. 커미션이 책정된 사원들의 사원번호, 이름, 연봉, 연봉+커미션,

-- 급여등급을 출력하되, 각각의 컬럼명을 '사원번호', '사원이름',

-- '연봉','실급여', '급여등급'으로 하여 출력하라.

--(비등가 ) 1 : 1 매핑 대는 컬럼이 없다

SELECT E.EMPNO, E.ENAME, E.SAL, (E.SAL+NVL(E.COMM,0)), S.GRADE
FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;


-- 7. 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름,

-- 월급, 급여등급을 출력하라.

SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = 10;

-- 8. 부서번호가 10번, 20번인 사원들의 부서번호, 부서이름,

-- 사원이름, 월급, 급여등급을 출력하라. 그리고 그 출력된

-- 결과물을 부서번호가 낮은 순으로, 월급이 높은 순으로

-- 정렬하라.

SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO IN(10,20)
ORDER BY SAL;

-- 9. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의

-- 사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호',

-- '사원이름', '관리자번호', '관리자이름'으로 하여 출력하라.

--SELF JOIN (자기 자신테이블의 컬럼을 참조 하는 경우)


SELECT E.EMPNO, E.ENAME 
FROM EMP E left JOIN EMP M
ON E.MGR = M.EMPNO

--기타
--NATURAL JOIN
--Equijoin과 동일하다고 보시면 됩니다
--[두 테이블]의 [동일한 이름]을 가지는 컬럼은 [모두 조인]이 됩니다
SELECT empno, ename, deptno, dname FROM emp NATURAL JOIN dept;

--Join ~ USING
--NATURAL JOIN의 단점은 동일한 이름을 가지는 컬럼은 모두 조인이 되는데
--USING문을 사용하면 컬럼을 선택해서 조인 할 수 있다
SELECT e.empno, e.ename, deptno, dname FROM emp e JOIN dept d
USING(deptno);

--조인 조건이 없는 조인 결과
select * from emp, dept; --카타시안 곱

SELECT * FROM EMP CROSS JOIN DEPT;

-------------------------------------------------------------------------
--해결 (초급개발자) 반드시 
-------------------------------------------------------------------------
/*
subquery
오라클.pdf(7장 100page)

sql 꽃..... sql 만능 해결사

1. 함수 > 단일테이블, 다중 테이블(join, union) >> subquery 
   조인이 안될경우 서브쿼리를 사용하자!!
*/
--사원테이블에서 사원들의 평균 월급보다 더 많은 월급을 받는 사원의 사번, 이름, 급여를 출력하시오.
DESC EMP

--두개의 쿼리를 하나로 통합하자!
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP)
ORDER BY SAL ASC;

--SUBQUERY
/*
1. SINGLE ROW SUBQUERY : 실행결과가 단일 ROW 단일 COLUMN 인 경우
  EX) SELECT AVG(SAL) FROM EMP
  연산자 : ( = != <  >)
  
2. MULTI ROW SUBQUERY : 실행결과가 단일 컬럼 ROW가 여러개인 경우
   EX) SELECT SAL FROM EMP
   연산자 : IN, NOT IN, ANY, ALL
   ALL : SAL > 1000 AND SAL > 4000 AND .....
   ANY : SAL > 1000 OR SAL > 4000 OR .......
  
   문법)
   1. 괄호안에 있어야 한다 >> (SELECT MAX(SAL) FROM EMP)
   2. 단일 컬럼으로 구성 >> SELECT MAX(SAL), SUM(SAL) FROM EMP (X) >> 왼쪽건 사용 불가능
   3. 단독으로 실행 가능

   실행순가
   1. SUBQUERY 먼저 실행
   2. 결과를 가지고 메인 쿼리 실행
   --TIP)
   SELECT .....(SUBQUERY) >> 한개의 행만 반환할 경우 (Scala SUBQUERY)
   FROM (SUBQUERY) >> 가상 테이블 (INLINE VIEW)...
   WHERE (SUBQUERY) >> 조건
*/
--사원 테이블에서 JONES의 급여보다 더 많은 급여를 받는 사원, 사번, 이름, 급여

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME ='JONES');


SELECT *
FROM EMP
WHERE SAL IN (SELECT SAL FROM EMP WHERE DEPTNO = 30);


- 종류 와드
--1. single row subquery : 실행결과가 단일 <<<row 단일>>> column인 경우 (한 개의 값을 반환하는 경우)
--      select avg(sal) from emp
--연산자 때문에 single과 multi를 구분함
-- 연산자 ( = != ㅡ < > )


--2. multi row subquery : 실행결과가 단일 column 이고 <<<<row 여러개>>>>
-- ex) select sal from emp
-- 연산자 : IN, NOT IN ANY, ALL
-- ALL : sal > 100 and sal > 4000 and .....
-- ANY : sal > 1000 or sal > 4000 or

--서브쿼리 문법)
--1.괄호안에 있어야 한다 >> select max(sal) from emp
--2. 단일 컬럼으로 구성 >> select max(sal), sum(sal) from emp; ==> 여러개 컬럼이 오면 안됨
--3. 단독으로 실행 가능

-- 실행 순서
-- 무조건 서브 쿼리가 먼저
-- 결과를 가지고 메인 쿼리가 실행됨

-- tip 쓰일 수 있는 곳
-- select 서브쿼리 .... >> 한 개의 행만 반환할 경우 (스칼라 서브쿼리)
-- from 서브쿼리 >> 가상 테이블 >> inline view >> 현업에서 제일 많이 쓰임 *****
-- where 서브쿼리 >> 조건절

--사원 테이블에서 jones의 급여보다 많은 급여를 받는 사람의 사번, 이름 급여를 출력
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
-- (서브 쿼리가 멀티인지 아닌지에 따라 연산자의 종류가 달라진다)
select *
from emp
where sal IN (select sal from emp where deptno = 30);
-- IN을 어떻게 풀어 쓰는지 알면 좋다ㅎㅎ
-- sal = 1600 or sal = 1250 or ....

select *
from emp
where sal NOT IN (select sal from emp where deptno = 30);
-- sal != 1600 and sal != 1250 and ....


-- 부하 직원이 있는 사원의 사번 이름 출력 (내 사번이 mgr 컬럼에 있다)
select *
from emp
where empno IN (select mgr from emp);
select mgr from emp;

-- -- 부하 직원이 없는 사원의 사번 이름 출력 (내 사번이 mgr 컬럼에 있다)
select * from emp;

select *
from emp
where empno NOT IN (select nvl(mgr, 0) from emp);
-- and 연산에 null이 있으면 결과는 null이 되어버림

select mgr from emp;

-- king에게 보고하는 즉 직속상관이 king인 사원의 사번 이름 직종 관리자 사번
select * from emp;

select empno, ename
from emp
where mgr = (select empno from emp where ename = 'KING');

-- 20번 부서의 사원중에서 가장 많은 급여를 받는 사원보다 더 많은 급여를 받는 사원의
-- 사번, 이름, 급여, 부서번호를 출력
select *
from emp
where sal > (select max(sal) from emp where deptno = 20);

-- 교수님 서브쿼리가 single 인지 multi인지 먼저 판단하심 >> 연산자 판단

-- 스칼라 서브 쿼리 문법은 있지만... 조인으로 해결할 수 있음



select empno, ename
from emp
where empno not in (select nvl(mgr, 0) from emp);



--WHERE EMPNO != 7902 AND EMPNO != 7788 AND EMPNO != NULL
--AND 연산 NULL 이 있으면 결과는 NULL

SELECT MGR FROM EMP;
SELECT *
FROM EMP
WHERE EMPNO NOT IN (SELECT NVL(MGR,0)FROM EMP);







--KING 에게 보고하는 즉 직속 상관이 KING인 사원의 사번, 이름 ,직종, 관리자

SELECT * FROM EMP;
SELECT EMPNO, ENAME, JOB, MGR
FROM EMP
WHERE MGR IN (SELECT EMPNO FROM EMP WHERE ENAME = 'KING')


--20번 부서의 사원중에서 가장 많은 급여를 받는 사원보다 더 많은 급여를 받는 사원의
--사번, 

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 20)



---자신의 월급여에서 해당 직족의 평균 연봉과 차이를 계산하는 쿼리

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
--조별 커피
--자기 부서의 평균 월급보다 더 많은 월급을 받는 사원의 사번, 이름 , 부서번호,
--부서별 평균 월급을 출력

FROM EMP E left JOIN EMP M
ON E.MGR = M.EMPNO

SELECT * FROM EMP

SELECT E.EMPNO, E.ENAME, E.DEPTNO E.EMPNO, E.SAL

SELECT E.EMPNO, E.SAL
FROM EMP E LEFT JOIN (SELECT DEPTNO, ROUND(AVG(SAL)) AS AVGSAL FROM EMP GROUP BY DEPTNO)S
ON E.DEPTNO = S.DEPTNO
WHERE E.SAL > S.AVGSAL;


-----------------------------------------------------------------------------------------------

--1. 'SMITH'보다 월급을 많이 받는 사원들의 이름과 월급을 출력하라.

SELECT ENAME, SAL
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'SMITH')

--2. 10번 부서의 사원들과 같은 월급을 받는 사원들의 이름, 월급,

-- 부서번호를 출력하라.

SELECT ENAME, SAL
FROM EMP
WHERE SAL IN (SELECT SAL FROM EMP WHERE DEPTNO = 10)

--3. 'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데
SELECT * FROM EMP
-- 'BLAKE'는 빼고 출력하라.
SELECT ENAME, HIREDATE
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE') AND ENAME != 'BLAKE';
?

?

?

--4. 평균급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을

-- 출력하되, 월급이 높은 사람 순으로 출력하라.

?
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT ROUND(AVG(SAL)) FROM EMP)
ORDER BY SAL DESC


--5. 이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고

-- 있는 사원의 사원번호와 이름을 출력하라.

?
SELECT * FROM EMP

SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%T%')
?

?

--6. 30번 부서에 있는 사원들 중에서 가장 많은 월급을 받는 사원보다

-- 많은 월급을 받는 사원들의 이름, 부서번호, 월급을 출력하라.

--(단, ALL(and) 또는 ANY(or) 연산자를 사용할 것)

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

--7. 'DALLAS'에서 근무하고 있는 사원과 같은 부서에서 일하는 사원의

-- 이름, 부서번호, 직업을 출력하라.

SELECT * FROM TAB

SELECT * FROM EMP 


SELECT ENAME, EMPNO, SAL
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS')

?

--8. SALES 부서에서 일하는 사원들의 부서번호, 이름, 직업을 출력하라.

?
SELECT * FROM DEPT
?
SELECT ENAME, EMPNO, SAL
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES')
?

?

?

--9. 'KING'에게 보고하는 모든 사원의 이름과 급여를 출력하라

--king 이 사수인 사람 (mgr 데이터가 king 사번)



SELECT ENAME, SAL
FROM EMP
WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING')

?

?

?

--10. 자신의 급여가 평균 급여보다 많고, 이름에 'S'가 들어가는

-- 사원과 동일한 부서에서 근무하는 모든 사원의 사원번호, 이름,

-- 급여를 출력하라.


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

--11. 커미션을 받는 사원과 부서번호, 월급이 같은 사원의

-- 이름, 월급, 부서번호를 출력하라.

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

--12. 30번 부서 사원들과 월급과 커미션이 같지 않은

-- 사원들의 이름, 월급, 커미션을 출력하라.

       
SELECT * FROM EMP
?SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE






/*
다중 테이블 : JOIN, SUBQUERY 까지............


DML

데이터 조작어(암기) >> DML
오라클.PDF(168PAGE)
INSERT, UPDATE, DELETE (반드시 암기)
*/

/*
오라클 기준
DDL(데이터 정의어) : [CREATE, ALTER, DROP, TRUNCATE], RENAME, MODIFY
DML(데이ㅓ 조작어) : INSERT, UPDATE, DELETE
DQL(데이터 질의어) : SELECT (함수, 조인, 서브쿼리)
DCL(데이ㅓ 제어어) : 관리자 : GRANT, REVOKE
TCL(트랜잭션) : COMMIT, ROLLBACK, SAVEPOINT
*/
--DML(INSERT, UPDATE, DELETE) 작업
--TRANSACTION : 하나의 논리적인 작업단위


--A라는 계좌에서 B라는 계좌 이체 (100만원)

--계좌 1000만원
--A계좌(100)출금 : UPDATE 계좌 SET 금액....
--900
--B계좌 (100) 입금 : UPDATE 계좌 SET 금액
--1100
---------------------------------------------------------------
--A계좌에서 출금 B계좌 입금(업무) >> 하나의 논리적인 단위 묶어서 처리
--둘다 성공 OR 둘다 실패
--처리하는 방법(COMMIT, ROLLBACK)


SELECT * FROM TAB; --테이블 목록 확인

SELECT * FROM TAB WHERE TNAME = 'BOARD';
SELECT * FROM TAB WHERE TNAME = 'BOARD2';

SELECT * fROM COL WHERE TNAME ='EMP';



CREATE TABLE TEMP(
    ID NUMBER PRIMARY KEY, --NULL(X),  중복 데이터 허용 않겠다
    NAME NVARCHAR2(20)
);

DESC TEMP


--1. 가장 일반적인 INSERT

INSERT INTO TEMP(ID,NAME)
VALUES(100,'홍길동');

SELECT * FROM TEMP

COMMIT;

--2. 컬럼 목록 생략
--왠만하면 쓰지말기....
INSERT INTO TEMP
VALUES(200,'김유신');

SELECT * FROM TEMP;
ROLLBACK;

--3. 문제(INSERT)
INSERT INTO TEMP(NAME)     --ORA-01400: cannot insert NULL into ("KOSA"."TEMP"."ID")
VALUES('아무개');            --ID PK 제약 (NULL X)

INSERT INTO TEMP(ID,NAME)   --ORA-00001: unique constraint (KOSA.SYS_C007070) violated
VALUES(100,'개똥이');

------------------------------------------------------------------
--TIP
--일반적인 SQL은 프로그램적인 요소 X
--PL-SQL(변수, 제어문)

--CREATE TABLE TEMP2(ID VARCHAR2(50));
--BEGIN
-- FOR i IN 1..1000 LOOP
--     INSERT INTO TEMP2(ID) VALUES('A' || TO_CHAR(i));
-- END LOOP;
--END;

SELECT * FROM TEMP2;


CREATE TABLE TEMP3(
    MEMBERID NUMBER(3) NOT NULL,  --3자리 정수
    NAME VARCHAR2(10), --NULL 허용
    REGDATE DATE DEFAULT SYSDATE --초기값 설정(기본값) (시스템 날짜를 기본값 사용)
);

SELECT * FROM COL WHERE TNAME ='TEMP3';

SELECT SYSDATE FROM DUAL;

alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

INSERT INTO TEMP3(MEMBERID, NAME, REGDATE)
VALUES(100,'홍길동','2022-09-29')

SELECT * FROM TEMP3

COMMIT;

INSERT INTO TEMP3(MEMBERID, NAME)
VALUES(200,'김유신');

COMMIT;

SELECT * FROM TEMP3;


INSERT INTO TEMP3(MEMBERID)
VALUES(300);

COMMIT;

SELECT * FROM TEMP3

INSERT INTO TEMP3(NAME)
VALUES('누구');
ROLLBACK;

SELECT * FROM TEMP3;
----------------------------------------------------------------------
--TIP)
--1. 대량 데이터 삽입하기

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
--요구사항 TEMP4에 있는 모든 데이터를 TEMP5 널고 싶어요
--INSERT INTO 테이블명(컬럼리스트) VALUES
--INSERT INTO 테이블명(컬럼리스트) SELECT 절

INSERT INTO TEMP5(NUM)
SELECT ID FROM TEMP4;  --대량 데이터 삽입

--2. 대량 INSERT
--담을 테이블이 없는 경우 >> 테이블 복제(구조 : 스키마) + 데이터 삽입)
--단 제약 정보는 복제하지 않아요.(PK, FK)
--순사한 데이터 구조 복제 + 데이터 복사

CREATE TABLE COPYEMP
AS
   SELECT * FROM EMP;

CREATE TABLE COPYEMP2
AS 
   SELECT EMPNO, ENAME, SAL 
   FROM EMP
   WHERE DEPTNO = 30;

--퀴즈
--틀(구조)만 복제하고 데이터를 복사하고 싶지 않음
CREATE TABLE COPYEMP3
AS 
    SELECT * FROM EMP WHERE 1=2;

----------------------- INSERT END --------------------------------


--UPDATE
/*
UPDATE 테이블명
SET 컬러명 = 값, 컬럼명2 = 값2.....
WHERE 조건절

UPDATE 테이블명
SET 컬럼 = (SUBQUERY)
WHERE 컬럼명 = (SUBQUERY)
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
개발자(SQL >> 
1. CRUD 관점 (CREATE>INSERT, READ>SELECT, UPDATE, DELETE)
2. APP(JAVA) - JDBC API - ORACLE
3. INSERT, UPDATE, DELETE, SELECT(70%)

하나의 테이블에 대해서 작업
JAVA 에서 EMP 테이블에 대해서 CRUD 작업
App(JAVA) 입장에서
1. 전체조회 (함수) >> public List<Emp? getEmpList() {select * from emp}
2. 조건조회 (함수) >> public Emp getEmpListByEmpno(int empno){select * from emp where empno=7788}
3. 삽입 >> public int insertEmp(Emp emp) {insert into emp(...) values(...)}
4. 수정
5. 삭제
개발 >> JAVA 코드 >> DAO(DATA ACCESS OBJECT)

--------------------------------------------------------------------------------------------------

--DDL(CREATE, ALTER, DROP, RENAME) 테이블을 생성, 수정, 삭제
--오라클.PDF 9장 138PAGE

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
SELECT * FROM COL WHERE LOWER(TNAME) = 'BOARD'; --개발자
--제약정보
SELECT * FROM USER_CONSTRAINTS WHERE LOWER(TABLE_NAME) = 'BOARD';


--Oracle 11G >> 가상컬럼(조합컬럼)
--학생 성적 테이블 : 국어, 영어, 수학

CREATE TABLE VTABLE(
   NO1 NUMBER,
   NO2 NUMBER,
   NO3 NUMBER GENERATED ALWAYS AS (NO1 + NO2) VIRTUAL
);
SELECT * FROM COL WHERE LOWER(TNAME) = 'VTABLE';
INSERT INTO VTABLE(NO1, NO2) VALUES(100,50);

SELECT * FROM VTABLE

--INSERT INTO VTABLE(NO1, NO2, NO3) VALUES(10,20,30); (X)
--실무에서 활용되는 코드
--제품정보(입고) : 분기별 데이터 추출(4분기)
--입고일 (2022-09-10)

CREATE TABLE VTABLE2(
    NO NUMBER, --순번
    P_CODE CHAR(4), --제품코드(A001, B002)
    P_DATE CHAR(8), --입고일
    P_QTY NUMBER, --입고 수량
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


--DDL 테이블 만들고 수정, 삭제
--1. 테이블 생성하기
CREATE TABLE TEMP6(ID NUMBER);

DESC TEMP6
--2. 테이블 생성 후에 컬럼 추가하기
ALTER TABLE TEMP6
ADD ENAME VARCHAR2(20);

--3. 기존 테이블에 있는 컬림이름 잘못 표기(ENAME -> USERNAME)
--기존 테이블에 있는 기존 컬럼의 이름 바꾸기(RENAME)

ALTER TABLE TEMP6
RENAME COLUMN ENAME TO USERNAME;

DESC TEMP6

--기존 테이블에 있는 기존 컬럼의 타입 크기 수정.(기억)

ALTER TABLE TEMP6
MODIFY (USERNAME VARCHAR2(2000));

DESC TEMP6

--5. 기존 테이블에 있는 기존 컬럼 삭제
ALTER TABLE TEMP6
DROP COLUMN USERNAME;

DESC TEMP6

---위 모든 작업은 툴을 사용해서 작업 가능.....

--6. 테이블 전체가 필요없어요
--6.1 DELETE : 데이터만 삭제
--테이블 처음 만들면 처음 크기 >> 데이터 넣으면 >> 데이터 크기 만큼 테이블 크기 증가
--EX) 처음 IM >> 데이터 10만건 >> 100M >> DELETE 10만건 삭제 >> 테이블 크기 100M

--테이블 삭제(공강의 크기도 줄일 수 없을까)
--TRUNCATE (단점 WHERE을 사용 못함)
--EX) 처음 IM >> 데이터 10만건 >> 100M >> DELETE 10만건 삭제 >> 테이블 크기 1M
--TRUNCATE TABLE EMP

--테이블 삭제
DROP TABLE TEMP6; 
--백업하지 않는이상 복원할수 없다.



-----------------------------------------------------------------------------
--테이블에 제약 설정하기
--오라클.PDF(144PAGE)
--데이터 무결성 확보
--INSERT, UPDATE 제약

--PRIMARY KEY(PK) 유일하게 테이블의 각행을 식별(NOT NULL 과 UNIQUE 조건을 만족)
--WHERE EMPNO=7788 >> 데이터 1건 보장 >> 성능 >> 조회 >> INDEX 자동 생성

--제약을 만드는 방법 (CREATE TABLE 안에서 생성)
--테이블이 생성된 다음 추가(ALTER TABLE ADD CONSTRAINT ..... ) 많이 사용 >> 툴....

--TIP)
--제약 정보 확인
SELECT * FROM USER_CONSTRINTS WHERE TABLE_NAME ='EMP';



CREATE TABLE TEMP7(
--    ID NUMBER PRIMARY KEY --권장하지 않아요 (제약이름 자동생성 > SYS_C006997 식으로 자동 생성됨)
                          --제약 삭제시, 수정시 찾기 어려움
    ID NUMBER CONSTRAINT PK_TEMP7_ID PRIMARY KEY, --PK_TEMP7_ID 관용적                          
    NAME VARCHAR2(20) NOT NULL, --CONSTRAINT 표현 쓰지 마세요.
    ADDR VARCHAR2(50)
);


SELECT * FROM USER_CONSTRAINTS WHERE LOWER(TABLE_NAME) = 'TEMP7'


--PK (NOT NULL 하고 UNIQUE 제약)
--PK 테이블 당 1개만 사용 (컬럼 1개, 여러개의 컬럼을 묶어서 1개 : 복합키)

INSERT INTO TEMP7(ID, NAME,ADDR) VALUES(1,'홍길동','서울시 강남구');
COMMIT;

INSERT INTO TEMP7(ID,NAME,ADDR) VALUES(10,'홍길동','서울시 강남구');

INSERT INTO TEMP7(ID,NAME,ADDR) VALUES(10,'홍길동','서울시 강남구');
--ORA-00001: unique constraint (KOSA.PK_TEMP7_ID) violated


--UNIQUE key(UK) 테이블의 모든 행을 유일하게 하는 값을 가진 열(NULL 을 허용)
--컬럼의 수 만큼 생성 가능
--NULL 허용
--NOT NULL, UNIQUE

CREATE TABLE TEMP8(
    ID NUMBER CONSTRAINT PK_TEMP8_ID PRIMARY KEY,
    NAME NVARCHAR2(20) NOT NULL,
    JUMIN NCHAR(6) CONSTRAINT UK_TEMP8_JUMIN UNIQUE, --NULL 허용
    ADDR NVARCHAR2(1000)
);



SELECT * FROM user_constraints WHERE LOWER(table_name)='temp8';

INSERT INTO TEMP8(ID, NAME, JUMIN, ADDR)
VALUES(10,'홍길동','123456','경기도');

INSERT INTO TEMP8(ID, NAME, JUMIN, ADDR)
VALUES(10,'홍길동','123456','경기도');
--ORA-00001: unique constraint (KOSA.PK_TEMP8_ID) violated
--중복안됨


INSERT INTO TEMP8(ID, NAME, ADDR)
VALUES(20,'김유신','강원도'); --UNIQUE NULL 허락

INSERT INTO TEMP8(ID, NAME, ADDR)
VALUES(30,'김유신','강원도'); --UNIQUE NULL 허락

SELECT * FROM TEMP8
--생성시
--그럼 NULL 도 중복체크
--JUMIN NCHAR(6) NOT NULL CONSTRAINT UK_TEMP8_JUMIN UNIQUE,

--테이블 생성 후에 제약 걸기

--테이블 생성 후에 제약 걸기
CREATE TABLE TEMP9 (ID NUMBER);

--기패키지
존 테이블에 제약 추가하기
--제약 추가시 테이블에 있는 데이터 검사

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
CHECK(CK) 참이어야 하는 조건을 지정함(대부분 업무 규칙을 설정)
--WHERE 조건과 동일한 형태의 제약
--WHERE GENDER IN ('남','여')

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
VALUES(100,'홍길동','123456','서울시',25);


INSERT INTO TEMP10(ID, NAME, JUMIN, ADDR, AGE)
VALUES(200,'홍길동','123456','서울시',15);
--ORA-02290: check constraint (KOSA.CK_TEMP10_AGE) violated


SELECT * FROM USER_CONSTRAINTS WHERE LOWER(TABLE_NAME)='TEMP10';

--FOREIGN KEY(FK) 열과 참조된 열 사이의 외래키 관계를 적용하고 설정합니다.
--참조제약(테이블과 테이블의 관계 설정)


create table c_emp
as
    select empno, ename, deptno from emp where 1=2; -- 테이블의 구조(스키마) 만 복사하기

--create table 테이블명 as select...
select * from c_emp;

create table c_dept
as
    select deptno, dname from dept where 1=2;
    
select * from c_emp;
select * from c_dept;

--c_emp 테이블에 있는 deptno는 c_dept테이블에 있는 deptno 컬럼에 있는 데이터만
--제약(참조)

alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno);

--foreign key(deptno) 성립하기 위해서는 >> c_dept(deptno) >> 믿음을 >> 내 데이터는
-- 무결성해 (중복,null) >> pk >> c_dept(deptno) >> unique, primary key

--반드시 c_dept에 pk 설정되어 있어야 한다
alter table c_dept
add constraint pk_c_dept_deptno primary key (deptno); -- 신용확보

select * from user_constraints where lower(table_name)='c_dept';


--pk선행되고 나서
alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno);

--제약
insert into c_dept(deptno,dname) values(100,'인사팀');
insert into c_dept(deptno,dname) values(200,'관리팀');
insert into c_dept(deptno,dname) values(300,'회계팀');
commit;

select* from c_dept;
--신입사원 입사

insert into c_emp(empno, ename) values(100,'홍길동');

--deptno 컬럼에 FK 설정되어 있어도 not null 강제하지 않으면 null값은 허용된다    
--요구사항 정의에 따라서....
--입사시 부서를 가지지 않을 수 도 있다.

--신입사원은 반드시 부서를 가져야 한다
--CREATE TABLE C_EMP(DEPTNO NOT NULL ...FK)
select * from C_EMP

INSERT INTO C_EMP(empno, ename, DEPTNO) VALUES(1,'홍길동',100);
INSERT INTO C_EMP(EMPNO, ENAME, DEPTNO) VALUES(2,'김유신',600);
INSERT INTO C_EMP(EMPNO, ENAME, DEPTNO) VALUES(1,'홍길동',100);
commit;
    
--PK 선행되고 나서
ALTER TABLE C_EMP
ADD CONSTRAINT FK_C_EMP_DEPTNO FOREIGN KEY(DEPTNO) REFERENCES C_DEPT(DEPTNO);

--제약
INSERT INTO C_DEPT(DEPTNO,DNAME) VALUES(100,'인사팀');
INSERT INTO C_DEPT(DEPTNO,DNAME) VALUES(200,'관리팀');
INSERT INTO C_DEPT(DEPTNO,DNAME) VALUES(300,'회계팀');

COMMIT;
SELECT * FROM C_DEPT;
SELECT * FROM C_EMP;

--신입사원, 입사
INSERT INTO C_EMP(EMPNO, ENAME_ VALUES(100,'홍길동');
---------------------------------------------------------------------------------
--DEPTNO 컬럼에 FK 설정되어 있어도 NOT NULL 강제하지 않으면 NULL값은 허용


/*
개발자
테이블과의 주종관계(부모, 자식)
C_EMP, C_DEPT [DEPTNO] 관계로 해석하면
부모 (MASTER) : PK (DEPTNO)
자식 (DETAIL) : FK (DEPTNO)

C_DEPT 에서 100번 부서를 삭제할 수 있을까요?

100번을 삭제하고 싶다면 순서대로 .....


*/

/*
column datatype [CONSTRAINT constraint_name]
 REFERENCES table_ name (column1[,column2,..] [ON DELETE CASCADE])
column datatype,
. . . . . . . ,
[CONSTRAINT constraint_name] FOREIGN KEY (column1[,column2,..])
 REFERENCES table_name (column1[,column2,..] [ON DELETE CASCADE])
 
 ON DELETE CASCADE : 부모 테이블과 생명을 같이 하겠다.
 --100 번 부서 삭제 : 네
 --DELETE FROM C_DEPT WHERE DEPTNO = 100
 --참조하는 자식 데이터 같이 삭제
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

--자식쪽 먼저 지움

DELETE FROM C_EMP WHERE EMPNO = 1;
DELETE FROM C_DEPT WHERE DEPTNO=100;
ROLLBACK

SELECT * FROM USER_CONSTRAINTS WHERE UPPER(TABLE_NAME)='C_EMP';


SELECT * FROM USER_CONSTRAINTS WHERE UPPER(TABLE_NAME)='C_DEPT';

INSERT INTO C_EMP(EMPNO, ENAME, DEPTNO) VALUES(1,'김유신', 100);

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
VALUES(1,'노현중',50,50,50);
INSERT INTO STUDENT(ID, NAME, KOR, ER, MATH)
VALUES(2,'고윤섭',60,80,90);
INSERT INTO STUDENT(ID, NAME, KOR, ER, MATH)
VALUES(3,'임준한',100,70,80);
INSERT INTO STUDENT(ID, NAME, KOR, ER)
VALUES(4,'노다영',100,80);
INSERT INTO STUDENT(ID, NAME, KOR, ER, MATH)
VALUES(5,'박예빈',70,100,80);

SELECT * FROM STUDENT

DELETE FROM STUDENT

alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno);


select * from user_constraints where lower(table_name)='c_dept';

DELETE FROM user_constraints WHERE lower(table_name)='c_dept';

alter table c_dept
drop constraint PK_C_DEPT_DEPTNO;

--NOT NULL(NN) 열은 NULL 값을 포함할 수 없습니다.
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
--중급(View)
--View 객체(가상테이블)
--CREATE 설정 ...  생성된 VIEW 영속적으로 저장



--OR REPLACE 이미 존재한다면 다시 생성한다.
--FORCE Base Table 유무에 관계없이 VIEW 을 만든다.
--NOFORCE 기본 테이블이 존재할 경우에만 VIEW 를 생성한다.
--view_name VIEW 의 이름
--Alias Subquery 를 통해 선택된 값에 대한 Column 명이 된다.
--Subquery SELECT 문장을 기술한다.
--WITH CHECK OPTION VIEW 에 의해 액세스 될 수 있는 행만이 입력,갱신될 수 있다. 
--Constraint CHECK OPTON 제약 조건에 대해 지정된 이름이다.
--WITH READ ONLY 이 VIEW 에서 DML 이 수행될 수 없게 한다.

CREATE VIEW VIEW001
AS 
   SELECT * FROM EMP;
   
SELECT * FROM VIEW001

--VIEW는 테이블처럼 사용가능한 가상테이블 : 데이터를 가지고 있지 않음.
--VIEW는 메모리상에만 존재하는 가상테이블.
--SUBQUERY -> IN LINE VIEW > FROM(...........)
--사용법 : 일반테이블과 사용법이 동일(SELECT, INSERT, UPDATE, DELETE)
--단 VIEW 가 볼수 있는 데이터에 한해서
--DML(INSERT, UPDATE, DELETE) -> 단일 테이블에 대한 VIEW 라면 

CREATE OR REPLACE VIEW V_001
AS 
    SELECT EMPNO, ENAME FROM EMP;
    
  SELECT * FROM V_001 --VIEW가 가지고 있는 SQL 문장이 실행

--VIEW 목적
--1. 개발자 편리성 : JOIN, SUBQUERY >> VIEW 사용 >> 성능(X) >> 개발자 편리성
--2. 쿼리 단순화 (편리성) : 복작한 쿼리를 미리 만들어 두고 사용
--3. 보안성 (특정 컬럼만 노출)

--신입사원 입사 >>> DBA 권한 부여 부탁 >> 인사정보 >> 특정 컬럼만 노출 >> VIEW

CREATE OR REPLACE VIEW V_EMP
AS 
   SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP;
--출근
SELECT * FROM V_EMP;

SELECT * FROM V_EMP WHERE EMPNO=7902;

--편리성
CREATE OR REPLACE VIEW V_002
AS 
  SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
  FROM EMP E JOIN DEPT D
  ON E.DEPTNO = D.DEPTNO

SELECT * FROM V_002;

CREATE VIEW V_003 --VIEW 자존심 나도 테이블인데 최소한 컬럼명을 줘야되는거 아니냐?
AS
  SELECT DEPTNO, AVG(SAL) AS AVGSAL --AS로 컬럼명을 줘야한다.
  FROM EMP
  GROUP BY DEPTNO;
  
SELECT * FROM V_003;  --직종별 평균 급여를 볼 수 있는 VIEW


CREATE OR REPLACE VIEW V_004
AS 
  SELECT ROUND(AVG(SAL),0) AS AVGSAL FROM EMP;

SELECT * FROM V_004;

/*
VIEW 는 가상 테이블 실제 데이터는 없음 가상 테이블 VIEW 통해서 INSERT, UPDATE ,DELETE 가능
단 단일 테이블


*/

SELECT * FROM V_EMP;

UPDATE V_EMP
SET SAL = 0; --V_EMP 는 SAL 컬럼의 데이터를 볼 수 없음.

UPDATE V_EMP
SET JOB = 'IT';


--30번 부서 사원들의 직위, 이름, 월급을 담는 VIEW를 만드는데,
--각각의 컬럼명을 직위, 사원이름, 월급으로 ALIAS를 주고 월급이
--300보다 많은 사원들만 추출하도록 하라.
CREATE OR REPLACE VIEW V_101
AS 
  SELECT JOB AS 직위, ENAME AS 사원이름, SAL AS 월듭
  FROM EMP 
  WHERE DEPTNO = 30 AND SAL>300
  
  SELECT * fROM V_004


--부서별 평균 월듭을 담는 VIEW 를 만들되, 평균월듭이 2000 이상인
--부서만 출력하도록 하라.

CREATE OR REPLACE VIEW VIEW102
AS
   SELECT DEPTNO, ROUND(AVG(SAL),0) AS 평균월급 
   FROM EMP
   GROUP BY DEPTNO
   HAVING AVG(SAL)>2000

SELECT * FROM VIEW102

SELECT V.DEPTNO, V.평균월급, D.DNAME
FROM DEPT D JOIN VIEW102 V
ON D.DEPTNO = V.DEPTNO;

------------------------------------------------------------------------------

--Quiz
--아래 3개의 테이블 이용하여 문제 3개를 만드세요
--필수사항) 함수 및 JOIN 쿼리는 반드시 필수....
--좋은 문제가 나온 조에게 포상함.

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;

CREATE OR REPLACE VIEW VIEW102

--부서별 직원들의 입사월을 추출하는 뷰를 만들고
--부서별 월 평균 월급을 아래 컬럼에 맞춰 출력하시오.
--도시이름, 부서이름, 각월, 평균월급

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



--4조 1번
CREATE OR REPLACE VIEW V_1
AS
    SELECT E.EMAIL, E.LAST_NAME || ' ' || E.FIRST_NAME AS 이름, D.DEPARTMENT_NAME, L.CITY, TO_CHAR(E.SALARY, '$999,999,999') AS SAL
    FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                     JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
    WHERE E.phone_number LIKE '011%' AND E.salary>10000


SELECT 이름, DEPARTMENT_NAME
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

--답
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

--개발자 관점에서 sql
-- 오라클.pdf(185page)
/*
CREATE SEQUENCE sequence_name
[INCREMENT BY n]
[START WITH n]
[{MAXVALUE n | NOMAXVALUE}]
[{MINVALUE n | NOMINVALUE}]
[{CYCLE | NOCYCLE}]
[{CACHE | NOCACHE}];
sequence_name SEQUENCE 의 이름입니다.
INCREMENT BY n 정수 값인 n 으로 SEQUENCE 번호 사이의 간격을 지정.
이 절이 생략되면 SEQUENCE 는 1 씩 증가.
START WITH n 생성하기 위해 첫번째 SEQUENCE 를 지정.
이 절이 생략되면 SEQUENCE 는 1 로 시작.
MAXVALUE n SEQUENCE 를 생성할 수 있는 최대 값을 지정.
NOMAXVALUE 오름차순용 10^27 최대값과 내림차순용-1 의 최소값을 지정.
MINVALUE n 최소 SEQUENCE 값을 지정.
NOMINVALUE 오름차순용 1 과 내림차순용-(10^26)의 최소값을 지정.
CYCLE | NOCYCLE 최대 또는 최소값에 도달한 후에 계속 값을 생성할 지의 여부를
지정. NOCYCLE 이 디폴트.
CACHE | NOCACHE 얼마나 많은 값이 메모리에 오라클 서버가 미리 할당하고 유지
하는가를 지정. 디폴트로 오라클 서버는 20 을 CACHE*/


desc board;
drop table board;


create table board(
 boardid number constraint pk_board_boardid primary key,
 title nvarchar2(50)
);

desc board;

select * from board;
--boardid (pk : not null, unique, 내부적으로 inde자동생성)
--where boardid = 10; 검색속도 향상...

--- 게시판 글쓰기 작업
insert into board(boardid, title) values(1, '처음글');
insert into board(boardid, title) values(2, '글');
--처음 글은 1번이고 그 다음글ㄹ부터는 순차적인 값을 insert
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
--CRUD 관점에서
--create (insert)
--read    (select)
--update
--delete

delete from board where boardid =1;
commit;
--새글 ....
insert into board(boardid, title) 
values((select count(boardid) + 1  from board),'4');
--ORA-00001: unique constraint (KOSA.PK_BOARD_BOARDID) violated
--DML 문제발생
select * from board;

--다른 방법
delete from board;
commit;

select * from board;
--집계함수

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
---글번호 고민 ...... 순번......
--sequence 객체 제공 : 중복값이 없고 순차적인 값을 제공하는 객체 
--공유객체
create sequence board_num;

select board_num.nextval from dual; --채번

select board_num.currval from dual; --현재까지 채번한 번호 확인(마지막)

/*
 NEXTVAL 과 CURRVAL 의사열 
1) NEXTVAL 는 다음 사용 가능한 SEQUENCE 값을 반환 한다.
2) SEQUENCE 가 참조될 때 마다, 다른 사용자에게 조차도 유일한 값을 반환한다.
3) CURRVAL 은 현재 SEQUENCE 값을 얻는다.
4) CURRVAL 이 참조되기 전에 NEXTVAL 이 사용되어야 한다
*/
--게시판
--게시판에 사용되는  채번기
create table kboard(
  num number constraint pk_kboard_num primary key,
  title nvarchar2(20)
);

create sequence kboard_num;

insert into kboard(num, title) 
values(kboard_num.nextval , '처음');

insert into kboard(num, title) 
values(kboard_num.nextval , '둘이당');

insert into kboard(num, title) 
values(kboard_num.nextval , '셋이당');

select * from kboard;

delete from kboard where num=1;

insert into kboard(num, title) 
values(kboard_num.nextval , '넷이당');

select * from kboard;
commit;


--------------------------------------------------------------------------------
--게시판
--공지사항, 자유게시판, 관리자게시판
--공지사항 1,2,3번글
--누군가 자유게시판에 글을 쓰면 4번글이 됨
--누가 관리자게시판에 글을 쓰면 5번 글이 됨
--누가 공지사항에 글을 쓰면 6번글이 되길 바람
--1. sequence객체는 공유객체(테이블에 종속되지 않다)
--  하나의 시퀀스는 여러곳에서 자유롭게 사용가능하다
--  sequence 하나 생성해서 >> 공지사항, 자유게시판, 관리자게시판 사용가능

--2. 웹사이트(게시판 10개)
--  상품게시판, 관리자게시판, 회원게시판...
--각각의 게시판은 순번을 따로 관리하기를 원함
--10개의 시퀀스를 만들어서 각각 사용하면 되여







--2. 웹 사이트 (게시판 10개)
--상품게시판, 관리자 게시판, 회원 게시판
--각각의 게시판은 순번을 따로 관리하기를 원해요
--10개의 시퀀스를 만들어서 각각 사용하면 되요

--tip)
--ms-sql : create table board(boardnum int identity(1,1)..... title
--identity 자동 증가값 하지만 오라클은 이런 함수기능이 없음.
--insert into(title) values('방가');; 자동으로 (1,2,3,.....)
--ms-sql : 2012 버전(sequence)

--mysql : create table board(boardnum int auto_increment, ... title)
--insert into board(title) values('방가'); 자동 (1,2,3, ...)


--mysql 만든 사람들이 open source >> mariadb (같은 엔진)
--mariadb 시퀀스 객체 존재







---옵션

create sequence seq_num
start with 10
increment by 2;
--10번 부터 시작해서 2씩 증가
--옵션은 잘 안씀.



select seq_num.nextval from dual;


select seq_num.currval from dual;


--게시판 글 100개
--num title, writer, content
--1, 2, 3 ...... 100
--일반적으로 게시판 글 볼때 (최신글) - 가장 나중에 쓴 글 ... 화면 출력

select * from kboard order by num desc; --일반 게시판 첫 쿼리


--개발자 관점
--rownum 오라클에선 정말 중요 !! 의사컬럼
--실제 물리적으로 존재하는 컬럼이 아니고 논리적으로 존재
--rownum : 실제로 테이블에 컬럼으로 존재하지 않지만 내부적으로 행 번호를 부여하는 컬럼

select * from emp;

select rownum as 순번, empno, ename from emp;

--select 한 결과에 순번을 부여 ....

--Top-n 쿼리 (정렬된 기준으로 위에서 몇개 추출)
-- 테이블에서 조건에 맞는 상위(Top) 에서 레코드(row) n 개를 추출
--Tip)
--ms-sql : select top 10 , * from emp order by sal desc;


--오라클은 top n 쿼리가 없음
--rownum : 순번을 부여해서 특정 조건에 맞게 top 쿼리 실행
--1. 정렬의 기준을 정의(선행)
--2. 정렬된 데이터를 기준으로 rownum설정하고 조건을 걸고 데이터 추출


--1단계
select *
from (
select *
from emp
order by sal desc
)e;

--2단계

select rownum as num, e.*
from (
        select *
        from emp
        order by sal desc
    ) e;
    
    
--3단계 (급여를 많이 받는 사원 5명)

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
--게시판
/*
100건
웹 사이트에 100건 데이터가 한 화면 출력 다능
10건씩 나누어서 화면에 출력

pagesize = 10 (한 화면에 (페이지)에 보여줄 수 있는 데이터 row수)
page 개수 = 10개

[1][2][3][4][5][6][7][8][9][10] >> java 구현 >> <a href='page.jsp?'></a>
1page >> 1~10 글 >> DB select 1~10글
2page >> 11~20 글 >> DB SELECT 11~20글

>>ROWNUM
>>BETWEEN A AND B
*/


-----------------------------------------------------------------------------------
--HR 계정 이동

SHOW USER;


SELECT * FROM EMPLOYEES; -- 107건


--1 단계 (기준 데이터 만들기(정렬))
--사번이 낮은 순으로 정렬

SELECT * FROM EMPLOYEES  ORDER BY EMPLOYEE_ID ASC;

--2단계 (기준 데이터에 순번 부여하기)

SELECT ROWNUM AS NUM, E.*
FROM (
        SELECT * fROM EMPLOYEES ORDER BY EMPLOYEE_ID ASC
     )E;
WHERE ROWNUM <= 50; --정렬된 데이터에 내부적으로 생성된 ROWNUM이다


--select *
--from (
--     select rownum as num, e.*
--     from emp e
--     order by sal desc
--     )n where num <=5;


--3단계
SELECT *
FROM (
SELECT ROWNUM AS NUM, E.*
FROM (
       SELECT * FROM EMPLOYEES ORDER BY EMPLOYEE_ID ASC
     ) E
   WHERE ROWNUM <=50
   )N WHERE NUM>=41;

------------------------------------------------------------------------
--107 건
--PAGESIZE = 10
--[1][2][3][4][5][6][7][8][9][10][11]
--[1] >> 1~10
--[2] >> 11~20
--[5] >> 41~50 데이터를 보여주세요.
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


--KOSA 계정에서
create table dmlemp
as 
   select * from emp;


--위 같이 복사하는 경우 제약 정보는 복사가 안됨.
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




