------------  Oracle ----------------------
CREATE TABLE DEPT (
    DEPTNO     NUMBER(2)     NOT NULL,
    DNAME      VARCHAR2(14)  NOT NULL,
    LOC        VARCHAR2(13)  NOT NULL,
    CONSTRAINT DEPT_PK PRIMARY KEY (DEPTNO)
);

CREATE TABLE EMP (
    EMPNO      NUMBER(4)     NOT NULL,
    ENAME      VARCHAR2(10)  NOT NULL,
    JOB        VARCHAR2(9)   NOT NULL,
    MGR        NUMBER(4),
    HIREDATE   DATE          NOT NULL,
    SAL        NUMBER(7,2)   NOT NULL,
    COMM       NUMBER(7,2),
    DEPTNO     NUMBER(2)     NOT NULL,
    CONSTRAINT EMP_PK PRIMARY KEY (EMPNO),
    CONSTRAINT EMP_FK FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO)
);

CREATE TABLE SALGRADE (
    GRADE      NUMBER(2)     NOT NULL,
    LOSAL      NUMBER(7,2)   NOT NULL,
    HISAL      NUMBER(7,2)   NOT NULL,
    CONSTRAINT SALGRADE_PK PRIMARY KEY (GRADE)
);

CREATE TABLE BONUS (
    EMPNO      NUMBER(4)     NOT NULL,
    BONUS      NUMBER(7,2)   NOT NULL,
    CONSTRAINT BONUS_PK PRIMARY KEY (EMPNO),
    CONSTRAINT BONUS_FK FOREIGN KEY (EMPNO) REFERENCES EMP (EMPNO)
);

CREATE TABLE DEPT_VIEW (
    DEPTNO     NUMBER(2)     NOT NULL,
    DNAME      VARCHAR2(14)  NOT NULL,
    LOC        VARCHAR2(13)  NOT NULL,
    EMP_COUNT  NUMBER(4)     NOT NULL
);

CREATE TABLE EMP_VIEW (
    EMPNO      NUMBER(4)     NOT NULL,
    ENAME      VARCHAR2(10)  NOT NULL,
    JOB        VARCHAR2(9)   NOT NULL,
    MGR        NUMBER(4),
    HIREDATE   DATE          NOT NULL,
    SAL        NUMBER(7,2)   NOT NULL,
    COMM       NUMBER(7,2),
    DEPTNO     NUMBER(2)     NOT NULL,
    DNAME      VARCHAR2(14)  NOT NULL,
    LOC        VARCHAR2(13)  NOT NULL,
    GRADE      NUMBER(2)     NOT NULL,
    LOSAL      NUMBER(7,2)   NOT NULL,
    HISAL      NUMBER(7,2)   NOT NULL,
    BONUS      NUMBER(7,2)
);

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

INSERT INTO EMP VALUES (7369, 'SMITH', 'CLERK', 7902, TO_DATE('17-12-1980', 'DD-MM-YYYY'), 800, NULL, 20);
INSERT INTO EMP VALUES (7499, 'ALLEN', 'SALESMAN', 7698, TO_DATE('20-02-1981', 'DD-MM-YYYY'), 1600, 300, 30);
INSERT INTO EMP VALUES (7521, 'WARD', 'SALESMAN', 7698, TO_DATE('22-02-1981', 'DD-MM-YYYY'), 1250, 500, 30);
INSERT INTO EMP VALUES (7566, 'JONES', 'MANAGER', 7839, TO_DATE('02-04-1981', 'DD-MM-YYYY'), 2975, NULL, 20);
INSERT INTO EMP VALUES (7654, 'MARTIN', 'SALESMAN', 7698, TO_DATE('28-09-1981', 'DD-MM-YYYY'), 1250, 1400, 30);
INSERT INTO EMP VALUES (7698, 'BLAKE', 'MANAGER', 7839, TO_DATE('01-05-1981', 'DD-MM-YYYY'), 2850, NULL, 30);
INSERT INTO EMP VALUES (7782, 'CLARK', 'MANAGER', 7839, TO_DATE('09-06-1981', 'DD-MM-YYYY'), 2450, NULL, 10);
INSERT INTO EMP VALUES (7788, 'SCOTT', 'ANALYST', 7566, TO_DATE('19-04-1987', 'DD-MM-YYYY'), 3000, NULL, 20);
INSERT INTO EMP VALUES (7839, 'KING', 'PRESIDENT', NULL, TO_DATE('17-11-1981', 'DD-MM-YYYY'), 5000, NULL, 10);
INSERT INTO EMP VALUES (7844, 'TURNER', 'SALESMAN', 7698, TO_DATE('08-09-1981', 'DD-MM-YYYY'), 1500, 0, 30);
INSERT INTO EMP VALUES (7876, 'ADAMS', 'CLERK', 7788, TO_DATE('23-05-1987', 'DD-MM-YYYY'), 1100, NULL, 20);
INSERT INTO EMP VALUES (7900, 'JAMES', 'CLERK', 7698, TO_DATE('03-12-1981', 'DD-MM-YYYY'), 950, NULL, 30);
INSERT INTO EMP VALUES (7902, 'FORD', 'ANALYST', 7566, TO_DATE('03-12-1981', 'DD-MM-YYYY'), 3000, NULL, 20);
INSERT INTO EMP VALUES (7934, 'MILLER', 'CLERK', 7782, TO_DATE('23-01-1982', 'DD-MM-YYYY'), 1300, NULL, 10);

INSERT INTO SALGRADE VALUES (1, 700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);

INSERT INTO BONUS VALUES (7369, 100);
INSERT INTO BONUS VALUES (7499, 200);
INSERT INTO BONUS VALUES (7521, 300);
INSERT INTO BONUS VALUES (7566, 400);
INSERT INTO BONUS VALUES (7654, 500);
INSERT INTO BONUS VALUES (7698, 600);
INSERT INTO BONUS VALUES (7782, 700);
INSERT INTO BONUS VALUES (7788, 800);
INSERT INTO BONUS VALUES (7839, 900);
INSERT INTO BONUS VALUES (7844, 1000);
INSERT INTO BONUS VALUES (7876, 1100);
INSERT INTO BONUS VALUES (7900, 1200);
INSERT INTO BONUS VALUES (7902, 1300);
INSERT INTO BONUS VALUES (7934, 1400);

COMMIT;
COMMIT

------------------------------------------

------- PostgreSQL // MariaDB ------------

create table dept (
  deptno integer,
  dname  text,
  loc    text,
  constraint pk_dept primary key (deptno)
);

create table emp (
  empno    integer,
  ename    text,
  job      text,
  mgr      integer,
  hiredate date,
  sal      integer,
  comm     integer,
  deptno   integer,
  constraint pk_emp primary key (empno),
  constraint fk_mgr foreign key (mgr) references emp (empno),
  constraint fk_deptno foreign key (deptno) references dept (deptno)
);

create table salgrade (
  grade integer,
  losal integer,
  hisal integer,
  constraint pk_salgrade primary key (grade)
);

create table bonus (
  empno integer,
  bonus integer,
  constraint pk_bonus primary key (empno),
  constraint fk_empno foreign key (empno) references emp (empno)
);

insert into dept values (10, 'ACCOUNTING', 'NEW YORK');
insert into dept values (20, 'RESEARCH', 'DALLAS');
insert into dept values (30, 'SALES', 'CHICAGO');
insert into dept values (40, 'OPERATIONS', 'BOSTON');

insert into emp values (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, null, 20);
insert into emp values (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30);
insert into emp values (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30);
insert into emp values (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, null, 20);
insert into emp values (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30);
insert into emp values (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, null, 30);
insert into emp values (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, null, 10);
insert into emp values (7788, 'SCOTT', 'ANALYST', 7566, '1987-04-19', 3000, null, 20);
insert into emp values (7839, 'KING', 'PRESIDENT', null, '1981-11-17', 5000, null, 10);
insert into emp values (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30);
insert into emp values (7876, 'ADAMS', 'CLERK', 7788, '1987-05-23', 1100, null, 20);
insert into emp values (7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, null, 30);
insert into emp values (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, null, 20);
insert into emp values (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, null, 10);

insert into salgrade values (1, 700, 1200);
insert into salgrade values (2, 1201, 1400);
insert into salgrade values (3, 1401, 2000);
insert into salgrade values (4, 2001, 3000);
insert into salgrade values (5, 3001, 9999);

insert into bonus values (7369, 100);
insert into bonus values (7499, 200);
insert into bonus values (7521, 300);
insert into bonus values (7566, 400);
insert into bonus values (7654, 500);
insert into bonus values (7698, 600);
insert into bonus values (7782, 700);
insert into bonus values (7788, 800);
insert into bonus values (7839, 900);
insert into bonus values (7844, 1000);
insert into bonus values (7876, 1100);
insert into bonus values (7900, 1200);
insert into bonus values (7902, 1300);
insert into bonus values (7934, 1400);

commit;
