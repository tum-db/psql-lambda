\echo Use "CREATE EXTENSION lambda_ext" to load this file. \quit

CREATE OR REPLACE FUNCTION label(lambdatable, lambda)
    RETURNS setof record
    AS 'lambda_ext.so', 'label'
    LANGUAGE C STRICT;