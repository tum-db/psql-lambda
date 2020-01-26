import psycopg2
from datetime import datetime

connection = psycopg2.connect(user="huber",
                                  password="",
                                  host="/tmp",
                                  port="7483",
                                  database="huber")
cursor = connection.cursor()
connection2 = psycopg2.connect(user="huber",
                                  password="",
                                  host="localhost",
                                  port="10000",
                                  database="postgres")
cursor2 = connection2.cursor()
cursor2.execute("load 'llvmjit.so'")
	
def measure(q, c):
	start = datetime.now()
	c.execute(q)
	return (datetime.now() - start).total_seconds() * 1000.0

def exp_test(q1, q2, e):
	print("Hyper query: " + q1.format("<SIZE>"))
	print("Postgres query: " + q2.format("<SIZE>") + "\n")
	for n in range(1, e+1):
		r1 = measure(q1.format(10**n), cursor)
		r2 = measure(q2.format(10**n), cursor2)

		print("Input size: 10^{} - Hyper: {:.3f} - Postgres: {:.3f}".format(n, r1, r2))

def linear_test_single(q, a, b, step, c):
	print("Query: " + q.format("<X>") + "\n")
	for n in range(a, b, step):
		r = measure(q.format(n), c)

		print("{} - {:.3f}".format(n, r))


print("\n==== PAGERANK: LDBC - VARYING NUMBER OF THREADS, 10^6 TUPLES ====")
linear_test_single("select * from pagerank_threads((select * from knows limit 10e6), lambda(src)(src.src), lambda(dst)(dst.dst), 0.85, 0.00001, 100, {}) as (a bigint, b double precision) order by a", 8, 128, 8, cursor2)

print("\n==== KMEANS: TAXI DATASET ====")
exp_test("select * from kmeans((select (x / 180 * pi()) as lat,  (y / 180 * pi()) as lng, id from taxi limit {}),λ(a,b)(2.0 * atan2(sqrt(sin((b.lat-a.lat)/2.0) ^ 2.0 + cos(a.lat) * cos(b.lat) * (sin((b.lng - a.lng) / 2.0) ^ 2.0)), sqrt(1-sin((b.lat-a.lat)/2.0) ^ 2.0 + cos(a.lat) * cos(b.lat) * (sin((b.lng - a.lng) / 2.0) ^ 2.0)))), 10)", "select * from kmeans_threads((select (x / 180 * pi()) as lat, (y / 180 * pi()) as lng, id  from taxi LIMIT 10), (select (x / 180 * pi()) as lat, (y / 180 * pi()) as lng, id from taxi limit {}), LAMBDA(a,b)(2.0 * atan2(sqrt(sin((b.lat-a.lat)/2.0) ^ 2.0 + cos(a.lat) * cos(b.lat) * (sin((b.lng - a.lng) / 2.0) ^ 2.0)), sqrt(1-sin((b.lat-a.lat)/2.0) ^ 2.0 + cos(a.lat) * cos(b.lat) * (sin((b.lng - a.lng) / 2.0) ^ 2.0)))), 10, 80) as (a double precision, b double precision, c character varying, d integer)", 6)

print("\n==== PAGERANK: LDBC PERSON KNOWS PERSON ====")
exp_test("select * from pagerank((select * from knows limit {}), λ(src)(src.src), λ(dst)(dst.dst), 0.85, 0.00001, 100)", "select * from pagerank_threads((select * from knows limit {}), lambda(src)(src.src), lambda(dst)(dst.dst), 0.85, 0.00001, 100, 80) as (a bigint, b double precision) order by a", 6)

print("\n==== LABELING: GENERATE_SERIES WITH BASIC LAMBDAS ====")
exp_test("select * from labeling((SELECT generate_series(1, {}) as n),(SELECT 1 AS g ),λ(a,b) (a.n+1+b.g))", "select * from label((select n, 1 as g from generate_series(1, {}) as n), LAMBDA(a)(a.n+1+a.g)) as (a integer, b integer, c integer)", 5)

print("\n==== LABELING: EUCLIDEAN DISTANCE WITH BASIC LAMBDAS ====")
exp_test("select * from labeling((SELECT x, y from points LIMIT {}),(SELECT 1 AS g), λ(a,b) (sqrt(a.x^2+a.y^2)))", "select * from label((select x, y from points limit {}), LAMBDA(a)(sqrt(a.x^2+a.y^2))) as (a double precision, b double precision, c double precision)", 7)

print("\n==== LABELING: GENERATE_SERIES WITH FAST LAMBDAS ====")
exp_test("select * from labeling((SELECT generate_series(1, {}) as n),(SELECT 1 AS g ),λ(a,b) (a.n+1+b.g))", "select * from label_fast((select n, 1 as g from generate_series(1, {}) as n), LAMBDA(a)(a.n+1+a.g)) as (a integer, b integer, c integer)", 5)

print("\n==== LABELING: EUCLIDEAN DISTANCE WITH FAST LAMBDAS ====")
exp_test("select * from labeling((SELECT x, y from points LIMIT {}),(SELECT 1 AS g), λ(a,b) (sqrt(a.x^2+a.y^2)))", "select * from label_fast((select x, y from points limit {}), LAMBDA(a)(sqrt(a.x^2+a.y^2))) as (a double precision, b double precision, c double precision)", 7)

print("\n==== KMEANS: UNIFORMLY DISTRIBUTED POINTS ====")
exp_test("select * from kmeans((select * from points limit {}),λ(a,b)(pow(a.x-b.x, 2.0)+pow(a.y-b.y, 2.0)), 10)", "select * from kmeans_threads((select * from points LIMIT 10), (select * from points limit {}), LAMBDA(a,b)(pow(a.x-b.x, 2.0)+pow(a.y-b.y, 2.0)), 10, 80) as (a double precision, b double precision, c integer, d integer)", 7)

print("\n==== KMEANS: UNIFORMLY DISTRIBUTED POINTS - VARYING NUMBER OF THREADS, 10^6 TUPLES ====")
linear_test_single("select * from kmeans_threads((select * from points LIMIT 10), (select * from points limit 1000000), LAMBDA(a,b)(pow(a.x-b.x, 2.0)+pow(a.y-b.y, 2.0)), 10, {}) as (a double precision, b double precision, c integer, d integer)", 8, 128, 8, cursor2)

print("\n==== KMEANS: TAXI - VARYING NUMBER OF THREADS, 10^6 TUPLES ====")
linear_test_single("select * from kmeans_threads((select x, y, id from taxi LIMIT 10), (select x, y, id from taxi limit 1000000), LAMBDA(a,b)(2.0 * atan2(sqrt(sin((b.x-a.x)/2.0) ^ 2.0 + cos(a.x) * cos(b.x) * (sin((b.y - a.y) / 2.0) ^ 2.0)), sqrt(1-sin((b.x-a.x)/2.0) ^ 2.0 + cos(a.x) * cos(b.x) * (sin((b.y - a.y) / 2.0) ^ 2.0)))), 10, {}) as (a double precision, b double precision, c character varying, d integer)", 8, 128, 8, cursor2)

