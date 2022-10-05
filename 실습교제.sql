--
DROP TABLE �μ�     CASCADE CONSTRAINTS PURGE;
DROP TABLE ���     CASCADE CONSTRAINTS PURGE;
DROP TABLE ���¾�ü CASCADE CONSTRAINTS PURGE;
DROP TABLE ��     CASCADE CONSTRAINTS PURGE;
DROP TABLE ���ΰ� CASCADE CONSTRAINTS PURGE;
DROP TABLE ���ΰ� CASCADE CONSTRAINTS PURGE;
DROP TABLE ����� CASCADE CONSTRAINTS PURGE;
DROP TABLE ��ǰ     CASCADE CONSTRAINTS PURGE;
DROP TABLE ��ǰ���� CASCADE CONSTRAINTS PURGE;
DROP TABLE �������� CASCADE CONSTRAINTS PURGE;
DROP TABLE �Ǹ���� CASCADE CONSTRAINTS PURGE;
DROP TABLE �ֹ�     CASCADE CONSTRAINTS PURGE;
DROP TABLE �ֹ��� CASCADE CONSTRAINTS PURGE;

--
CREATE TABLE �μ� (
    �μ���ȣ        NUMBER       NOT NULL
  , �μ���          VARCHAR2(10) NOT NULL
  , �����μ���ȣ    NUMBER
  , CONSTRAINTS �μ�_PK PRIMARY KEY (�μ���ȣ)
  , CONSTRAINTS �μ�_F1 FOREIGN KEY (�����μ���ȣ) REFERENCES �μ� (�μ���ȣ));

CREATE TABLE ��� (
    �����ȣ        NUMBER       NOT NULL
  , �����          VARCHAR2(10) NOT NULL
  , �޿�            NUMBER       NOT NULL
  , �ҼӺμ��ڵ�    NUMBER       NOT NULL
  , CONSTRAINTS ���_PK PRIMARY KEY (�����ȣ)
  , CONSTRAINTS ���_F1 FOREIGN KEY (�ҼӺμ��ڵ�) REFERENCES �μ� (�μ���ȣ));

CREATE TABLE ���¾�ü (
    ��ü��ȣ    NUMBER       NOT NULL
  , ��ü��      VARCHAR2(10) NOT NULL
  , CONSTRAINTS ���¾�ü_PK PRIMARY KEY (��ü��ȣ));

CREATE TABLE �� (
    ����ȣ    NUMBER       NOT NULL
  , ����      VARCHAR2(10) NOT NULL
  , ������    VARCHAR2(10) NOT NULL
  , CONSTRAINTS ��_PK PRIMARY KEY (����ȣ));

CREATE TABLE ���ΰ� (
    ����ȣ    NUMBER       NOT NULL
  , �ֹι�ȣ    VARCHAR2(13) NOT NULL
  , CONSTRAINTS ���ΰ�_PK PRIMARY KEY (����ȣ)
  , CONSTRAINTS ���ΰ�_U1 UNIQUE (�ֹι�ȣ)
  , CONSTRAINTS ���ΰ�_F1 FOREIGN KEY (����ȣ) REFERENCES �� (����ȣ));

CREATE TABLE ���ΰ� (
    ����ȣ    NUMBER       NOT NULL
  , ���ι�ȣ    VARCHAR2(13) NOT NULL
  , CONSTRAINTS ���ΰ�_PK PRIMARY KEY (����ȣ)
  , CONSTRAINTS ���ΰ�_U1 UNIQUE (���ι�ȣ)
  , CONSTRAINTS ���ΰ�_F1 FOREIGN KEY (����ȣ) REFERENCES �� (����ȣ));

CREATE TABLE ��ǰ (
    ��ǰ�ڵ�        VARCHAR2(10) NOT NULL
  , ��ǰ��          VARCHAR2(10) NOT NULL
  , ��ȹ�����    NUMBER       NOT NULL
  , ���Ŵ����    NUMBER
  , ���Ŵ���ü    NUMBER
  , ���úμ����    VARCHAR2(50) NOT NULL
  , CONSTRAINTS ��ǰ_PK PRIMARY KEY (��ǰ�ڵ�));

CREATE TABLE ��ǰ���� (
    ��ǰ�ڵ�    VARCHAR2(10) NOT NULL
  , ��������    DATE         NOT NULL
  , ��������    DATE         NOT NULL
  , ��ǰ����    NUMBER       NOT NULL
  , CONSTRAINTS ��ǰ����_PK PRIMARY KEY (��ǰ�ڵ�, ��������)
  , CONSTRAINTS ��ǰ����_F1 FOREIGN KEY (��ǰ�ڵ�) REFERENCES ��ǰ (��ǰ�ڵ�));

CREATE TABLE �������� (
    �����ڵ�        VARCHAR2(10) NOT NULL
  , ��������        DATE         NOT NULL
  , ��������        DATE         NOT NULL
  , ���κ���        NUMBER       NOT NULL
  , ����ǰ�ڵ�    VARCHAR2(10) NOT NULL
  , CONSTRAINTS ��ǰ����_PK PRIMARY KEY (�����ڵ�)
  , CONSTRAINTS ��ǰ����_F1 FOREIGN KEY (����ǰ�ڵ�) REFERENCES ��ǰ (��ǰ�ڵ�));

CREATE TABLE �ֹ� (
    �ֹ���ȣ        NUMBER NOT NULL
  , �ֹ�����        DATE   NOT NULL
  , �ֹ�����ȣ    NUMBER NOT NULL
  , CONSTRAINTS �ֹ�_PK PRIMARY KEY (�ֹ���ȣ)
  , CONSTRAINTS �ֹ�_F1 FOREIGN KEY (�ֹ�����ȣ) REFERENCES ���ΰ� (����ȣ));

CREATE TABLE �ֹ��� (
    �ֹ���ȣ    NUMBER       NOT NULL
  , ��ǰ�ڵ�    VARCHAR2(10) NOT NULL
  , �ֹ�����    NUMBER       NOT NULL
  , CONSTRAINTS �ֹ���_PK PRIMARY KEY (�ֹ���ȣ, ��ǰ�ڵ�)
  , CONSTRAINTS �ֹ���_F1 FOREIGN KEY (�ֹ���ȣ) REFERENCES �ֹ� (�ֹ���ȣ)
  , CONSTRAINTS �ֹ���_F2 FOREIGN KEY (��ǰ�ڵ�) REFERENCES ��ǰ (��ǰ�ڵ�));

CREATE TABLE �Ǹ���� (
    ��ǰ�ڵ�    VARCHAR2(10) NOT NULL
  , ���ؿ���    VARCHAR2(6)  NOT NULL
  , �Ǹż���    NUMBER       NOT NULL
  , �Ǹűݾ�    NUMBER       NOT NULL
  , CONSTRAINTS �Ǹ����_PK PRIMARY KEY (��ǰ�ڵ�, ���ؿ���));

--
INSERT INTO �μ� VALUES (1, '�μ�1', NULL);
INSERT INTO �μ� VALUES (2, '�μ�2', 1   );
INSERT INTO �μ� VALUES (3, '�μ�3', 2   );

INSERT INTO ��� VALUES (1, '���1', 300, 1);
INSERT INTO ��� VALUES (2, '���2', 200, 2);
INSERT INTO ��� VALUES (3, '���3', 100, 3);

INSERT INTO ���¾�ü VALUES (1, '��ü1');
INSERT INTO ���¾�ü VALUES (2, '��ü2');
INSERT INTO ���¾�ü VALUES (3, '��ü3');

INSERT INTO �� VALUES (1, '��1', 'P');
INSERT INTO �� VALUES (2, '��2', 'P');
INSERT INTO �� VALUES (3, '��3', 'C');

INSERT INTO ���ΰ� VALUES (1, '0101013000001');
INSERT INTO ���ΰ� VALUES (2, '0101013000002');
INSERT INTO ���ΰ� VALUES (3, '1101110000001');

INSERT INTO ��ǰ VALUES ('A', '��ǰA', 2, 3, NULL, '1,2,3');
INSERT INTO ��ǰ VALUES ('B', '��ǰB', 2, 2, NULL, '1,2'  );
INSERT INTO ��ǰ VALUES ('C', '��ǰC', 2, NULL, 1, '1'    );

INSERT INTO ��ǰ���� VALUES ('A', DATE '2011-01-01', DATE '2011-12-31', 100);
INSERT INTO ��ǰ���� VALUES ('A', DATE '2012-01-01', DATE '9999-12-31', 200);
INSERT INTO ��ǰ���� VALUES ('B', DATE '2011-01-01', DATE '2011-06-30', 300);
INSERT INTO ��ǰ���� VALUES ('B', DATE '2011-07-01', DATE '9999-12-31', 400);
INSERT INTO ��ǰ���� VALUES ('C', DATE '2011-02-01', DATE '9999-12-31', 500);

INSERT INTO �������� VALUES ('X', DATE '2011-01-01', DATE '2011-06-01', 0.1, 'A');
INSERT INTO �������� VALUES ('Y', DATE '2011-07-01', DATE '9999-12-31', 0.2, 'A');

INSERT INTO �ֹ� VALUES (1, DATE '2011-01-01', 1);
INSERT INTO �ֹ� VALUES (2, DATE '2011-07-01', 1);
INSERT INTO �ֹ� VALUES (3, DATE '2011-01-01', 2);
INSERT INTO �ֹ� VALUES (4, DATE '2012-07-01', 2);

INSERT INTO �ֹ��� VALUES (1, 'A', 10);
INSERT INTO �ֹ��� VALUES (2, 'A', 20);
INSERT INTO �ֹ��� VALUES (2, 'B', 30);
INSERT INTO �ֹ��� VALUES (3, 'A', 100);
INSERT INTO �ֹ��� VALUES (4, 'A', 200);
INSERT INTO �ֹ��� VALUES (4, 'B', 300);

INSERT INTO �Ǹ���� VALUES ('A', '201101', 110,   9900);
INSERT INTO �Ǹ���� VALUES ('A', '201107',  20,   1600);
INSERT INTO �Ǹ���� VALUES ('A', '201207', 200,  32000);
INSERT INTO �Ǹ���� VALUES ('B', '201107',  30,  12000);
INSERT INTO �Ǹ���� VALUES ('B', '201207', 300, 120000);

COMMIT;


