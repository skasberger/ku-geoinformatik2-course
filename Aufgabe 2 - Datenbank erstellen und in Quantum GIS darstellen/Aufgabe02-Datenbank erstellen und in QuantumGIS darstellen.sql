-- Name: Stefan Kasberger
-- Date Start: 09.12.2011
--------------------------------------

--===##   BUILD TABLES   ##===

--# CREATE TABLES #--
--CREATE TABLE a2_festpunkte(id serial primary key, fp_nummer varchar unique, hoehe integer, fp_typ varchar, bezirk integer);
--SELECT addgeometrycolumn('a2_festpunkte', 'geom', 32633, 'POINT', 2);
--CREATE TABLE a2_rel_festpunkt_festpunkt(id serial primary key, festpunkt1 integer, festpunkt2 integer);
--CREATE TABLE a2_bezirke(id serial primary key, name varchar, land integer);
--SELECT addgeometrycolumn('a2_bezirke', 'geom', 32633, 'POLYGON', 2);
--CREATE TABLE a2_orte(id serial primary key, name varchar, bezirk integer);
--SELECT addgeometrycolumn('a2_orte', 'geom', 32633, 'POINT', 2);
--CREATE TABLE a2_land(id serial primary key, name varchar);
--SELECT addgeometrycolumn('a2_land', 'geom', 32633, 'POLYGON', 2);

--# FILL TABLES #--
--INSERT INTO a2_bezirke(name, geom) SELECT name, geom FROM bezirk;
--UPDATE a2_bezirke SET land = '1';
--INSERT INTO a2_orte(name, geom) SELECT name, geom FROM ort;
--INSERT INTO a2_land(name, geom) SELECT name, geom FROM land;
--UPDATE a2_orte SET bezirk = a2_bezirke.id FROM a2_bezirke WHERE st_contains(a2_bezirke.geom, a2_orte.geom);

--# Festpunkte
--INSERT INTO a2_festpunkte(fp_nummer, hoehe, fp_typ, geom) VALUES ('AC-158', '453', 'Höhenpunkt', geometryfromtext('POINT(528585 5215479)', 32633));
--INSERT INTO a2_festpunkte(fp_nummer, fp_typ, geom) VALUES ('AC-446', 'Festpunkt', geometryfromtext('POINT(532214 5215739)', 32633));
--INSERT INTO a2_festpunkte(fp_nummer, hoehe, fp_typ, geom) VALUES ('PP334', '252', 'Höhenpunkt', geometryfromtext('POINT(564979 5217812)', 32633));
--INSERT INTO a2_festpunkte(fp_nummer, fp_typ, geom) VALUES ('K262', 'Triangulierungs Punkt', geometryfromtext('POINT(437392 5220966)', 32633));
--INSERT INTO a2_festpunkte(fp_nummer, fp_typ, geom) VALUES ('mm33', 'Festpunkt', geometryfromtext('POINT(428407 5252069)', 32633));
--INSERT INTO a2_festpunkte(fp_nummer, fp_typ, geom) VALUES ('AC-287', 'Festpunkt', geometryfromtext('POINT(462102 5267447)', 32633));
--INSERT INTO a2_festpunkte(fp_nummer, fp_typ, geom) VALUES ('AC-98', 'Festpunkt', geometryfromtext('POINT(485602 5266584)', 32633));
--INSERT INTO a2_festpunkte(fp_nummer, hoehe, fp_typ, geom) VALUES ('PP558', '447', 'Höhenpunkt', geometryfromtext('POINT(488367 5254661)', 32633));
--INSERT INTO a2_festpunkte(fp_nummer, fp_typ, geom) VALUES ('K892', 'Festpunkt', geometryfromtext('POINT(483874 5239455)', 32633));
--INSERT INTO a2_festpunkte(fp_nummer, hoehe, fp_typ, geom) VALUES ('PP325', '787', 'Höhenpunkt', geometryfromtext('POINT(487157 5216646)', 32633));
--INSERT INTO a2_festpunkte(fp_nummer, fp_typ, geom) VALUES ('AC-554', 'Festpunkt', geometryfromtext('POINT(502882 5202304)', 32633));
--INSERT INTO a2_festpunkte(fp_nummer, fp_typ, geom) VALUES ('AC-365', 'Festpunkt', geometryfromtext('POINT(542279 5185715)', 32633));
--INSERT INTO a2_festpunkte(fp_nummer, fp_typ, geom) VALUES ('K202', 'Triangulierungs Punkt', geometryfromtext('POINT(573728 5202304)', 32633));
--INSERT INTO a2_festpunkte(fp_nummer, fp_typ, geom) VALUES ('AC-367', 'Festpunkt', geometryfromtext('POINT(584268 5205587)', 32633));
--INSERT INTO a2_festpunkte(fp_nummer, hoehe, fp_typ, geom) VALUES ('PP58', '354', 'Höhenpunkt', geometryfromtext('POINT(569408 5221138)', 32633));
--INSERT INTO a2_festpunkte(fp_nummer, fp_typ, geom) VALUES ('AC-175', 'Festpunkt', geometryfromtext('POINT(566643 5225285)', 32633));
--INSERT INTO a2_festpunkte(fp_nummer, fp_typ, geom) VALUES ('K237', 'Triangulierungs Punkt', geometryfromtext('POINT(559040 5235653)', 32633));
--INSERT INTO a2_festpunkte(fp_nummer, fp_typ, geom) VALUES ('AC-15', 'Festpunkt', geometryfromtext('POINT(537441 5242392)', 32633));
--INSERT INTO a2_festpunkte(fp_nummer, hoehe, fp_typ, geom) VALUES ('PP562', '294', 'Höhenpunkt', geometryfromtext('POINT(517224 5236690)', 32633));
--INSERT INTO a2_festpunkte(fp_nummer, fp_typ, geom) VALUES ('AC-3', 'Festpunkt', geometryfromtext('POINT(525864 5294922)', 32633));

--UPDATE a2_festpunkte SET bezirk = a2_bezirke.id FROM a2_bezirke WHERE st_contains(a2_bezirke.geom, a2_festpunkte.geom);

--INSERT INTO a2_rel_festpunkt_festpunkt(festpunkt1, festpunkt2) VALUES ('1', '2');
--INSERT INTO a2_rel_festpunkt_festpunkt(festpunkt1, festpunkt2) VALUES ('15', '16');
--INSERT INTO a2_rel_festpunkt_festpunkt(festpunkt1, festpunkt2) VALUES ('15', '3');


--===##   QUERIES   ##===
--Welche Festpunkte befinden sich im Bezirk Leoben?
--SELECT fp_nummer FROM a2_festpunkte WHERE st_contains((SELECT geom FROM bezirk WHERE name='Leoben'), geom);

--Welches ist der nördlichste Festpunkt?
--SELECT fp_nummer FROM a2_festpunkte WHERE st_y(geom) = (SELECT max(st_y(geom)) FROM a2_festpunkte); 

--Welcher Festpunkt kommt am meisten als Fernziel vor?

--Wie weit ist der westlichste Festpunkt vom östlichsten Festpunkt entfernt (km)?
--SELECT st_distance_sphere((
--SELECT geom FROM a2_festpunkte WHERE fp_nummer = 
--(SELECT fp_nummer FROM a2_festpunkte WHERE st_x(geom) = (SELECT MAX(st_x(geom)) FROM a2_festpunkte))
--), (
--SELECT geom FROM a2_festpunkte WHERE fp_nummer = 
--(SELECT fp_nummer FROM a2_festpunkte WHERE st_x(geom) = (SELECT MIN(st_x(geom)) FROM a2_festpunkte))
--))/1000 FROM a2_festpunkte;

--Wie viele Festpunkte befinden sich im Umkreis von 20 km um die Ortschaft Niedergams?
--SELECT COUNT(*) FROM a2_festpunkte WHERE 
--st_contains((st_buffer((SELECT geom FROM a2_orte WHERE name = 'Niedergams'), 20000)), geom);
--CREATE TABLE a2_buffer_niedergams (id serial primary key);
--SELECT addgeometrycolumn('a2_buffer_niedergams', 'geom', 32633, 'POINT', 2);
--INSERT INTO a2_buffer_niedergams (geom) VALUES (st_buffer((SELECT geom FROM a2_orte WHERE name = 'Niedergams'), 20000));

--Wie lauten die GK M34 Koordinaten bzw. Geographischen Koordinaten (WGS 84, Format GMS) der Festpunkte im Bezirk Graz?


--Welche zwei Festpunkte besitzen die geringste Entfernung zueinander?
--SELECT st_distance_sphere(geom, (SELECT geom FROM a2_festpunkte)) FROM a2_festpunkte;

--Wie groß ist die Fläche (km2), die alle Festpunkte umspannt?
--convexhull funkt hier

--Wie viele Festpunkte liegen im flächenmäßig zweitkleinsten Bezirk? 

--CREATE VIEW flaeche_bez AS SELECT id, name, st_area(geom) FROM a2_bezirke;
--SELECT id FROM flaeche_bez WHERE st_area = st_area ORDER BY DESC;


