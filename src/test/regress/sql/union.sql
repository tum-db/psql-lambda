--
-- UNION (also INTERSECT, EXCEPT)
--

-- Simple UNION constructs

SELECT 1 AS two UNION SELECT 2;

SELECT 1 AS one UNION SELECT 1;

SELECT 1 AS two UNION ALL SELECT 2;

SELECT 1 AS two UNION ALL SELECT 1;

SELECT 1 AS three UNION SELECT 2 UNION SELECT 3;

SELECT 1 AS two UNION SELECT 2 UNION SELECT 2;

SELECT 1 AS three UNION SELECT 2 UNION ALL SELECT 2;

SELECT 1.1 AS two UNION SELECT 2.2;

-- Mixed types

SELECT 1.1 AS two UNION SELECT 2;

SELECT 1 AS two UNION SELECT 2.2;

SELECT 1 AS one UNION SELECT 1.0;

SELECT 1.1 AS two UNION ALL SELECT 2;

SELECT 1.0 AS two UNION ALL SELECT 1;

SELECT 1.1 AS three UNION SELECT 2 UNION SELECT 3;

SELECT 1.1 AS two UNION SELECT 2 UNION SELECT 2.0;

SELECT 1.1 AS three UNION SELECT 2 UNION ALL SELECT 2;

SELECT 1.1 AS two UNION (SELECT 2 UNION ALL SELECT 2);

--
-- Try testing from tables...
--

SELECT f1 AS five FROM FLOAT8_TBL
UNION
SELECT f1 FROM FLOAT8_TBL;

SELECT f1 AS ten FROM FLOAT8_TBL
UNION ALL
SELECT f1 FROM FLOAT8_TBL;

SELECT f1 AS nine FROM FLOAT8_TBL
UNION
SELECT f1 FROM INT4_TBL;

SELECT f1 AS ten FROM FLOAT8_TBL
UNION ALL
SELECT f1 FROM INT4_TBL;

SELECT f1 AS five FROM FLOAT8_TBL
  WHERE f1 BETWEEN -1e6 AND 1e6
UNION
SELECT f1 FROM INT4_TBL
  WHERE f1 BETWEEN 0 AND 1000000;

SELECT f1 AS five FROM VARCHAR_TBL
UNION
SELECT f1 FROM CHAR_TBL;

SELECT f1 AS three FROM VARCHAR_TBL
UNION
SELECT TRIM(TRAILING FROM f1) FROM CHAR_TBL;

SELECT f1 AS eight FROM VARCHAR_TBL
UNION ALL
SELECT f1 FROM CHAR_TBL;

SELECT f1 AS five FROM TEXT_TBL
UNION
SELECT f1 FROM VARCHAR_TBL
UNION
SELECT TRIM(TRAILING FROM f1) FROM CHAR_TBL;

--
-- INTERSECT and EXCEPT
--

SELECT q2 FROM int8_tbl INTERSECT SELECT q1 FROM int8_tbl;

SELECT q2 FROM int8_tbl INTERSECT ALL SELECT q1 FROM int8_tbl;

SELECT q2 FROM int8_tbl EXCEPT SELECT q1 FROM int8_tbl;

SELECT q2 FROM int8_tbl EXCEPT ALL SELECT q1 FROM int8_tbl;

SELECT q2 FROM int8_tbl EXCEPT ALL SELECT DISTINCT q1 FROM int8_tbl;

--
-- Mixed types
--

SELECT f1 FROM float8_tbl INTERSECT SELECT f1 FROM int4_tbl;

SELECT f1 FROM float8_tbl EXCEPT SELECT f1 FROM int4_tbl;
