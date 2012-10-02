-- Name: Stefan Kasberger
-- Date Start: 21.11.2011
-------------------------------------------

--===##   BUILD TABLES   ##===

--# CREATE TABLE #--
--Aufgabe: Tabelle Stadt mit ID und Stadtnamen erstellt
--CREATE TABLE stadt (id serial primary key, name varchar); 

--Aufgabe: zur Tabelle Stadt eine zusätzliche Spalte für geometrische Daten in SRID 4326 (WGS 84) hinzu fügen
--SELECT addgeometrycolumn ('stadt', 'geom', 4326, 'POINT', 2); 

--Aufgabe: Tabelle zur Realisierung der Beziehung zwischen Bezirken und Bezirkshauptstädten erstellen
--CREATE table rel_bezirk_staedte (id serial primary key, id_bezirk integer, id_stadt integer); 

--# FILL TABLE #--
--Aufgabe: Alle steirischen Bezirkshauptstädte – ID, Name, Geometrie (X, Y, EPSG 4326)
-- Quelle: https://de.wikipedia.org/wiki/Liste_der_politischen_Bezirke_der_Steiermark
--INSERT INTO stadt (name, geom) VALUES ('Bruck an der Mur', geometryfromtext ('POINT(15.268731 47.410456)', 4326)); --Quelle: http://toolserver.org/~geohack/geohack.php?pagename=Bruck_an_der_Mur&language=de&params=47.410455555556_N_15.268730555556_E_dim:10000_region:AT-6_type:city%2812816%29
--INSERT INTO stadt (name, geom) VALUES ('Deutschlandsberg', geometryfromtext ('POINT(15.215 46.816111)', 4326)); --Quelle: http://toolserver.org/~geohack/geohack.php?pagename=Deutschlandsberg&language=de&params=46.816111111111_N_15.215_E_dim:10000_region:AT-6_type:city%288136%29
--INSERT INTO stadt (name, geom) VALUES ('Feldbach', geometryfromtext ('POINT(15.888333 46.955)', 4326)); --Quelle: http://toolserver.org/~geohack/geohack.php?pagename=Feldbach_%28Steiermark%29&language=de&params=46.955_N_15.888333333333_E_dim:10000_region:AT-6_type:city%284614%29
--INSERT INTO stadt (name, geom) VALUES ('Fürstenfeld', geometryfromtext ('POINT(16.083333 47.05)', 4326)); --Quelle: http://toolserver.org/~geohack/geohack.php?pagename=F%C3%BCrstenfeld&language=de&params=47.05_N_16.083333333333_E_dim:10000_region:AT-6_type:city%285951%29
--INSERT INTO stadt (name, geom) VALUES ('Graz', geometryfromtext ('POINT(15.433333 47.066667)', 4326)); --Quelle: http://toolserver.org/~geohack/geohack.php?pagename=Graz&language=de&params=47.066666666667_N_15.433333333333_E_dim:10000_region:AT-6_type:city%28261540%29
--INSERT INTO stadt (name, geom) VALUES ('Hartberg', geometryfromtext ('POINT(15.97 47.280556)', 4326)); --Quelle: http://toolserver.org/~geohack/geohack.php?pagename=Hartberg&language=de&params=47.280555555556_N_15.97_E_dim:10000_region:AT-6_type:city%286600%29
--INSERT INTO stadt (name, geom) VALUES ('Judenburg', geometryfromtext ('POINT(14.660278 47.1725)', 4326)); ----Quelle: http://toolserver.org/~geohack/geohack.php?pagename=Judenburg&language=de&params=47.1725_N_14.660277777778_E_dim:10000_region:AT-6_type:city%289314%29
--INSERT INTO stadt (name, geom) VALUES ('Knittelfeld', geometryfromtext ('POINT(14.82944447.215)', 4326)); --Quelle: http://toolserver.org/~geohack/geohack.php?pagename=Knittelfeld&language=de&params=47.215_N_14.829444444444_E_dim:10000_region:AT-6_type:city%2811607%29
--INSERT INTO stadt (name, geom) VALUES ('Leibnitz', geometryfromtext ('POINT(15.545 46.783056)', 4326)); --Quelle: http://toolserver.org/~geohack/geohack.php?pagename=Leibnitz&language=de&params=46.783055555556_N_15.545_E_dim:10000_region:AT-6_type:city%287796%29
--INSERT INTO stadt (name, geom) VALUES ('Leoben', geometryfromtext ('POINT(15.097222 47.381667)', 4326)); --Quelle: http://toolserver.org/~geohack/geohack.php?pagename=Leoben&language=de&params=47.381666666667_N_15.097222222222_E_dim:10000_region:AT-6_type:city%2824600%29
--INSERT INTO stadt (name, geom) VALUES ('Murau', geometryfromtext ('POINT(14.173056 47.111944)', 4326)); --Quelle: http://toolserver.org/~geohack/geohack.php?pagename=Murau&language=de&params=47.111944444444_N_14.173055555556_E_dim:10000_region:AT-6_type:city%282096%29
--INSERT INTO stadt (name, geom) VALUES ('Mürzzuschlag', geometryfromtext ('POINT(15.673056 47.6075)', 4326)); --Quelle: http://toolserver.org/~geohack/geohack.php?pagename=M%C3%BCrzzuschlag&language=de&params=47.6075_N_15.673055555556_E_dim:10000_region:AT-6_type:city%288745%29
--INSERT INTO stadt (name, geom) VALUES ('Bad Radkersburg', geometryfromtext ('POINT(15.988611 46.689722)', 4326)); --Quelle: http://toolserver.org/~geohack/geohack.php?pagename=Bad_Radkersburg&language=de&params=46.689722222222_N_15.988611111111_E_dim:10000_region:AT-6_type:city%281361%29
--INSERT INTO stadt (name, geom) VALUES ('Voitsberg', geometryfromtext ('POINT(15.150278 47.048333)', 4326)); --Quelle: http://toolserver.org/~geohack/geohack.php?pagename=Voitsberg&language=de&params=47.048333333333_N_15.150277777778_E_dim:10000_region:AT-6_type:city%289676%29
--INSERT INTO stadt (name, geom) VALUES ('Weiz', geometryfromtext ('POINT(15.625278 47.218889)', 4326)); --Quelle: http://toolserver.org/~geohack/geohack.php?pagename=Weiz&language=de&params=47.218888888889_N_15.625277777778_E_dim:10000_region:AT-6_type:city%288897%29
--INSERT INTO stadt (name, geom) VALUES ('Liezen', geometryfromtext ('POINT(14.233333 47.566667)', 4326)); --Quelle: http://toolserver.org/~geohack/geohack.php?pagename=Liezen&language=de&params=47.566666666667_N_14.233333333333_E_dim:10000_region:AT-6_type:city%286839%29
--INSERT INTO stadt (name, geom) VALUES ('Bad Aussee', geometryfromtext ('POINT(13.782778 47.61)', 4326));--Quelle: http://toolserver.org/~geohack/geohack.php?pagename=Bad_Aussee&language=de&params=47.61_N_13.782777777778_E_dim:10000_region:AT-6_type:city%284883%29
--INSERT INTO stadt (name, geom) VALUES ('Gröbming', geometryfromtext ('POINT(13.901111 47.445556)', 4326)); --Quelle: http://toolserver.org/~geohack/geohack.php?pagename=Gr%C3%B6bming&language=de&params=47.445555555556_N_13.901111111111_E_dim:10000_region:AT-6_type:city%282813%29
--INSERT INTO rel_bezirk_staedte (id_bezirk, id_stadt) VALUES ('2', '1'); --
--INSERT INTO rel_bezirk_staedte (id_bezirk, id_stadt) VALUES ('3', '2'); --
--INSERT INTO rel_bezirk_staedte (id_bezirk, id_stadt) VALUES ('4', '3'); --
--INSERT INTO rel_bezirk_staedte (id_bezirk, id_stadt) VALUES ('5', '4'); --
--INSERT INTO rel_bezirk_staedte (id_bezirk, id_stadt) VALUES ('1', '5'); --
--INSERT INTO rel_bezirk_staedte (id_bezirk, id_stadt) VALUES ('7', '6'); --
--INSERT INTO rel_bezirk_staedte (id_bezirk, id_stadt) VALUES ('8', '7'); --
--INSERT INTO rel_bezirk_staedte (id_bezirk, id_stadt) VALUES ('9', '8'); --
--INSERT INTO rel_bezirk_staedte (id_bezirk, id_stadt) VALUES ('10', '9'); --
--INSERT INTO rel_bezirk_staedte (id_bezirk, id_stadt) VALUES ('11', '10'); --
--INSERT INTO rel_bezirk_staedte (id_bezirk, id_stadt) VALUES ('14', '11'); --
--INSERT INTO rel_bezirk_staedte (id_bezirk, id_stadt) VALUES ('13', '12'); --
--INSERT INTO rel_bezirk_staedte (id_bezirk, id_stadt) VALUES ('15', '13'); --
--INSERT INTO rel_bezirk_staedte (id_bezirk, id_stadt) VALUES ('16', '14'); --
--INSERT INTO rel_bezirk_staedte (id_bezirk, id_stadt) VALUES ('17', '15'); --
--INSERT INTO rel_bezirk_staedte (id_bezirk, id_stadt) VALUES ('12', '16'); --
--INSERT INTO rel_bezirk_staedte (id_bezirk, id_stadt) VALUES ('12', '17'); --
--INSERT INTO rel_bezirk_staedte (id_bezirk, id_stadt) VALUES ('12', '18'); --

--===##   QUERIES   ##===
--Aufgabe: Wie lautet der WKT der Stadt Leoben?
--SELECT st_astext (geom) as wkt FROM stadt WHERE name = 'Leoben'; 
--Lösung: 15,097222 47,381667

--Aufgabe: Wie lautet die geographische Länge der Stadt Leoben?
--SELECT st_x(geom) FROM stadt WHERE name = 'Leoben'; 
--Lösung: 15,097222

--Aufgabe: Welchem Koordinatensystem entsprechen die Bezirke?
--SELECT st_srid(geom) FROM bezirk LIMIT 1; 
--Lösung: 32633 => WGS 84 / UTM zone 33N

--Aufgabe: Wie lautet der WKT der Stadt Judenburg nach der Transformation in das Koordinatensystem der Bezirke?
--geht nicht SELECT st_astext (SELECT st_transform (geom, st_srid(geom)) FROM bezirk limit 1) FROM stadt WHERE name like 'Judenburg'; 
--Lösung: 

--Aufgabe: Wie groß (in km2) ist der Bezirk Feldbach?
--SELECT st_area(geom)/1000000 FROM bezirk WHERE name = 'Feldbach'; 
--Lösung: 730.387829196533 km²

--Aufgabe: Wie lautet der Name der östlichsten Bezirkshauptstadt?
--SELECT name FROM stadt WHERE st_x(geom) = (SELECT max(st_x(geom)) FROM stadt); 
--Lösung: Fürstenfeld

--Aufgabe: Wie lautet der Name des größten Bezirks? => Liezen
--SELECT name FROM bezirk WHERE st_area(geom) = (SELECT max(st_area(geom)) FROM bezirk);
--Lösung: Liezen

--Wie lautet der Name des Bezirks mit der kürzesten Grenze?
--SELECT name FROM bezirk WHERE st_length(st_exteriorring(geom)) = (SELECT min(st_length(st_exteriorring(geom))) FROM bezirk); 
--Lösung: Graz Stadt

--Aufgabe: Ändern Sie kurzfristig das Koordinatensystem der Bezirkshauptstädte auf MGI (Ferro)
--SELECT st_astext(st_transform(geom, 4312)) FROM bezirk;
--Lösung: Tabelle mit den transformierten Polygonen

--Aufgabe: Wie lauten die Nachbarbezirke des Bezirks Fürstenfeld? 
--SELECT name FROM bezirk WHERE st_touches((SELECT geom FROM bezirk WHERE name = 'Fürstenfeld'), geom); 
--Lösung => Fehler in GIS Steiermark, da ein Abstand zwischen den Ecktpunkten der Polygone!
--besserer Lösungsansatz =>
--SELECT name FROM bezirk WHERE (st_distance((SELECT geom FROM bezirk WHERE name = 'Fürstenfeld'), geom)=0) AND (name!='Fürstenfeld'); 
--Lösung: Feldbach, Hartberg, Weiz

--Aufgabe: Wie weit ist Liezen von Deutschlandsberg entfernt (in km)? 
--SELECT st_distance_sphere((SELECT st_transform(geom, 4326) FROM stadt WHERE name = 'Liezen'), (SELECT st_transform(geom, 4326) FROM stadt WHERE name = 'Deutschlandsberg'))/1000;
--Lösung: 111,655942608 km
--Hinweis: st_transform benötigt SRID 4326 (WGS 84)

--Aufgabe: Wie groß (in km2) ist ein Puffer mit Zentrum in Graz, der die Stadt Feldbach berührt?
--SELECT st_area(st_buffer((SELECT geom FROM stadt WHERE name = 'Graz'), (SELECT st_distance_sphere((SELECT geom FROM stadt WHERE name = 'Graz'), (SELECT geom FROM stadt WHERE name = 'Feldbach')))))/1000000;
--Lösung: 4196,05224897 km²

--Aufgabe: Welche Bezirkshauptstädte beinhaltet dieser Puffer?
--SELECT name FROM stadt WHERE st_contains(
	--st_buffer(
	--	(SELECT st_transform(geom, 32633) FROM stadt WHERE name='Graz'),
	--	st_distance_sphere((SELECT st_transform(geom, 32633) FROM stadt WHERE name = 'Graz'), 
	--	(SELECT st_transform(geom, 32633) FROM stadt WHERE name = 'Feldbach'))), st_transform(geom, 32633));

--Lösung: Weiz, Voitsberg, Feldbach, Leibnitz, Deutschlandsberg

--Aufgabe: Welche Bezirkshauptstadt ist am weitesten vom Schwerpunkt des zu verwaltenden Bezirks entfernt.
SELECT 
	name,
	st_distance_sphere(
		st_centroid(st_transform(bezirk.geom, 32633),
		(SELECT geom FROM bezirk WHERE id=(SELECT id FROM rel_bezirk_staedte WHERE id=(SELECT id FROM stadt)))
		) AS distance
	FROM
		stadt,
		bezirk
	ORDER BY distance ASC
	LIMIT 1
FROM
	bezirk
;

--CREATE TABLE distanz_bez_stad AS (st_distance_sphere((st_centroid(SELECT geom FROM bezirk)), (SELECT geom FROM stadt WHERE id=(SELECT id_stadt FROM rel_bezirk_staedte))) ORDER BY DESC LIMIT 1)
--SELECT name FROM stadt WHERE (
--	st_distance_sphere((st_centroid(SELECT geom FROM bezirk WHERE id=(SELECT id_bezirk FROM rel_bezirk_staedte WHERE id_stadt=id))), 
--	(geom)) ORDER BY LIMIT 1);
--ALTER TABLE rel_bezirk_staedte ADD distance integer;
--UPDATE rel_bezirk_staedte SET distance=
--	st_distance_sphere(
--	(st_centroid(SELECT geom FROM bezirk WHERE id=(SELECT id_bezirk FROM rel_bezirk_staedte))), 
--	(SELECT geom FROM stadt WHERE id=(SELECT id_stadt FROM rel_bezirk_staedte)))
--	;

--SELECT name FROM stadt WHERE id=(
	--(SELECT id FROM stadt WHERE 
	--(st_distance_sphere((st_centroid(SELECT geom FROM bezirk)), (SELECT geom FROM stadt WHERE id=(SELECT id_stadt FROM rel_bezirk_staedte))) ORDER BY DESC LIMIT 1))
--);




--Lösung: 
--Aufgabe: Löschen Sie die Geometriespalten der Bezirkshauptstadttabelle.
--Lösung: 
--Aufgabe: Löschen Sie die restlichen Tabellen AUSSER geometry_columns und spacial_ref_sys! 
--Lösung: 
