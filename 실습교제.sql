--
DROP TABLE 부서     CASCADE CONSTRAINTS PURGE;
DROP TABLE 사원     CASCADE CONSTRAINTS PURGE;
DROP TABLE 협력업체 CASCADE CONSTRAINTS PURGE;
DROP TABLE 고객     CASCADE CONSTRAINTS PURGE;
DROP TABLE 개인고객 CASCADE CONSTRAINTS PURGE;
DROP TABLE 법인고객 CASCADE CONSTRAINTS PURGE;
DROP TABLE 고객등급 CASCADE CONSTRAINTS PURGE;
DROP TABLE 상품     CASCADE CONSTRAINTS PURGE;
DROP TABLE 상품가격 CASCADE CONSTRAINTS PURGE;
DROP TABLE 할인쿠폰 CASCADE CONSTRAINTS PURGE;
DROP TABLE 판매통계 CASCADE CONSTRAINTS PURGE;
DROP TABLE 주문     CASCADE CONSTRAINTS PURGE;
DROP TABLE 주문상세 CASCADE CONSTRAINTS PURGE;

--
CREATE TABLE 부서 (
    부서번호        NUMBER       NOT NULL
  , 부서명          VARCHAR2(10) NOT NULL
  , 상위부서번호    NUMBER
  , CONSTRAINTS 부서_PK PRIMARY KEY (부서번호)
  , CONSTRAINTS 부서_F1 FOREIGN KEY (상위부서번호) REFERENCES 부서 (부서번호));

CREATE TABLE 사원 (
    사원번호        NUMBER       NOT NULL
  , 사원명          VARCHAR2(10) NOT NULL
  , 급여            NUMBER       NOT NULL
  , 소속부서코드    NUMBER       NOT NULL
  , CONSTRAINTS 사원_PK PRIMARY KEY (사원번호)
  , CONSTRAINTS 사원_F1 FOREIGN KEY (소속부서코드) REFERENCES 부서 (부서번호));

CREATE TABLE 협력업체 (
    업체번호    NUMBER       NOT NULL
  , 업체명      VARCHAR2(10) NOT NULL
  , CONSTRAINTS 협력업체_PK PRIMARY KEY (업체번호));

CREATE TABLE 고객 (
    고객번호    NUMBER       NOT NULL
  , 고객명      VARCHAR2(10) NOT NULL
  , 고객유형    VARCHAR2(10) NOT NULL
  , CONSTRAINTS 고객_PK PRIMARY KEY (고객번호));

CREATE TABLE 개인고객 (
    고객번호    NUMBER       NOT NULL
  , 주민번호    VARCHAR2(13) NOT NULL
  , CONSTRAINTS 개인고객_PK PRIMARY KEY (고객번호)
  , CONSTRAINTS 개인고객_U1 UNIQUE (주민번호)
  , CONSTRAINTS 개인고객_F1 FOREIGN KEY (고객번호) REFERENCES 고객 (고객번호));

CREATE TABLE 법인고객 (
    고객번호    NUMBER       NOT NULL
  , 법인번호    VARCHAR2(13) NOT NULL
  , CONSTRAINTS 법인고객_PK PRIMARY KEY (고객번호)
  , CONSTRAINTS 법인고객_U1 UNIQUE (법인번호)
  , CONSTRAINTS 법인고객_F1 FOREIGN KEY (고객번호) REFERENCES 고객 (고객번호));

CREATE TABLE 상품 (
    상품코드        VARCHAR2(10) NOT NULL
  , 상품명          VARCHAR2(10) NOT NULL
  , 기획담당사번    NUMBER       NOT NULL
  , 구매담당사번    NUMBER
  , 구매담당업체    NUMBER
  , 관련부서목록    VARCHAR2(50) NOT NULL
  , CONSTRAINTS 상품_PK PRIMARY KEY (상품코드));

CREATE TABLE 상품가격 (
    상품코드    VARCHAR2(10) NOT NULL
  , 시작일자    DATE         NOT NULL
  , 종료일자    DATE         NOT NULL
  , 상품가격    NUMBER       NOT NULL
  , CONSTRAINTS 상품가격_PK PRIMARY KEY (상품코드, 시작일자)
  , CONSTRAINTS 상품가격_F1 FOREIGN KEY (상품코드) REFERENCES 상품 (상품코드));

CREATE TABLE 할인쿠폰 (
    쿠폰코드        VARCHAR2(10) NOT NULL
  , 발행일자        DATE         NOT NULL
  , 만료일자        DATE         NOT NULL
  , 할인비율        NUMBER       NOT NULL
  , 대상상품코드    VARCHAR2(10) NOT NULL
  , CONSTRAINTS 상품할인_PK PRIMARY KEY (쿠폰코드)
  , CONSTRAINTS 상품할인_F1 FOREIGN KEY (대상상품코드) REFERENCES 상품 (상품코드));

CREATE TABLE 주문 (
    주문번호        NUMBER NOT NULL
  , 주문일자        DATE   NOT NULL
  , 주문고객번호    NUMBER NOT NULL
  , CONSTRAINTS 주문_PK PRIMARY KEY (주문번호)
  , CONSTRAINTS 주문_F1 FOREIGN KEY (주문고객번호) REFERENCES 개인고객 (고객번호));

CREATE TABLE 주문상세 (
    주문번호    NUMBER       NOT NULL
  , 상품코드    VARCHAR2(10) NOT NULL
  , 주문수량    NUMBER       NOT NULL
  , CONSTRAINTS 주문상세_PK PRIMARY KEY (주문번호, 상품코드)
  , CONSTRAINTS 주문상세_F1 FOREIGN KEY (주문번호) REFERENCES 주문 (주문번호)
  , CONSTRAINTS 주문상세_F2 FOREIGN KEY (상품코드) REFERENCES 상품 (상품코드));

CREATE TABLE 판매통계 (
    상품코드    VARCHAR2(10) NOT NULL
  , 기준연월    VARCHAR2(6)  NOT NULL
  , 판매수량    NUMBER       NOT NULL
  , 판매금액    NUMBER       NOT NULL
  , CONSTRAINTS 판매통계_PK PRIMARY KEY (상품코드, 기준연월));

--
INSERT INTO 부서 VALUES (1, '부서1', NULL);
INSERT INTO 부서 VALUES (2, '부서2', 1   );
INSERT INTO 부서 VALUES (3, '부서3', 2   );

INSERT INTO 사원 VALUES (1, '사원1', 300, 1);
INSERT INTO 사원 VALUES (2, '사원2', 200, 2);
INSERT INTO 사원 VALUES (3, '사원3', 100, 3);

INSERT INTO 협력업체 VALUES (1, '업체1');
INSERT INTO 협력업체 VALUES (2, '업체2');
INSERT INTO 협력업체 VALUES (3, '업체3');

INSERT INTO 고객 VALUES (1, '고객1', 'P');
INSERT INTO 고객 VALUES (2, '고객2', 'P');
INSERT INTO 고객 VALUES (3, '고객3', 'C');

INSERT INTO 개인고객 VALUES (1, '0101013000001');
INSERT INTO 개인고객 VALUES (2, '0101013000002');
INSERT INTO 법인고객 VALUES (3, '1101110000001');

INSERT INTO 상품 VALUES ('A', '상품A', 2, 3, NULL, '1,2,3');
INSERT INTO 상품 VALUES ('B', '상품B', 2, 2, NULL, '1,2'  );
INSERT INTO 상품 VALUES ('C', '상품C', 2, NULL, 1, '1'    );

INSERT INTO 상품가격 VALUES ('A', DATE '2011-01-01', DATE '2011-12-31', 100);
INSERT INTO 상품가격 VALUES ('A', DATE '2012-01-01', DATE '9999-12-31', 200);
INSERT INTO 상품가격 VALUES ('B', DATE '2011-01-01', DATE '2011-06-30', 300);
INSERT INTO 상품가격 VALUES ('B', DATE '2011-07-01', DATE '9999-12-31', 400);
INSERT INTO 상품가격 VALUES ('C', DATE '2011-02-01', DATE '9999-12-31', 500);

INSERT INTO 할인쿠폰 VALUES ('X', DATE '2011-01-01', DATE '2011-06-01', 0.1, 'A');
INSERT INTO 할인쿠폰 VALUES ('Y', DATE '2011-07-01', DATE '9999-12-31', 0.2, 'A');

INSERT INTO 주문 VALUES (1, DATE '2011-01-01', 1);
INSERT INTO 주문 VALUES (2, DATE '2011-07-01', 1);
INSERT INTO 주문 VALUES (3, DATE '2011-01-01', 2);
INSERT INTO 주문 VALUES (4, DATE '2012-07-01', 2);

INSERT INTO 주문상세 VALUES (1, 'A', 10);
INSERT INTO 주문상세 VALUES (2, 'A', 20);
INSERT INTO 주문상세 VALUES (2, 'B', 30);
INSERT INTO 주문상세 VALUES (3, 'A', 100);
INSERT INTO 주문상세 VALUES (4, 'A', 200);
INSERT INTO 주문상세 VALUES (4, 'B', 300);

INSERT INTO 판매통계 VALUES ('A', '201101', 110,   9900);
INSERT INTO 판매통계 VALUES ('A', '201107',  20,   1600);
INSERT INTO 판매통계 VALUES ('A', '201207', 200,  32000);
INSERT INTO 판매통계 VALUES ('B', '201107',  30,  12000);
INSERT INTO 판매통계 VALUES ('B', '201207', 300, 120000);

COMMIT;


