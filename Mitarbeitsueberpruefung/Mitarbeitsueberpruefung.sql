-- Name: Stefan Kasberger
-- Date Start: 28.11.2011
--------------------------------------

--AUFGABE 1: 
--Aufgabe: Erzeugen einer Tabelle "schwerpunkt“ mit dem Attribut „id“. 
--CREATE table schwerpunkt (id serial primary key);
--Aufgabe: Hinzufügen einer Geometrie Spalte (2D Punktgeometrien in UTM 33N)
--SELECT addgeometrycolumn ('schwerpunkt', 'geom', 32633, 'POINT', 2); 
--Aufgabe: Berechnen Sie den Schwerpunkt der Steiermark und speichern in der neu geschaffenen „schwerpunkt“-Tabelle.
--INSERT INTO schwerpunkt (geom) VALUES ((SELECT st_centroid(geom) FROM land));

--AUFGABE 2
--Aufgabe: Erweitern Sie die Tabelle „schwerpunkt“ um eine zusätzliche Geometriespalte, in der 2D Flächengeometrien in UTM 33N Koordinaten verspeichert werden können.
--SELECT addgeometrycolumn ('schwerpunkt', 'geombuffer', 32633, 'POLYGON', 2); 
--Aufgabe: Speichern Sie einen Puffer, rund um den Schwerpunkt mit einem Radius von 30km
--UPDATE schwerpunkt SET geombuffer = st_buffer((SELECT geom FROM schwerpunkt), 30000);

-- AUFGABE 3
--Aufgabe: Erzeugen Sie eine Tabelle „schwerpunkt_orte“ mit den Attributen „id“ und "name"
--CREATE table schwerpunkt_orte (id serial primary key, name varchar);
--Aufgabe: Fügen Sie dieser Tabelle eine Geometriespalte hinzu, in der 2D Punktgeometrien in UTM 33N Koordinaten verspeichert werden können.
--SELECT addgeometrycolumn ('schwerpunkt_orte', 'geom', 32633, 'POINT', 2); 
--Aufgabe: Speichern Sie all jene Namen und Geometrien aus der Ortstabelle in der neu geschaffenen „schwerpunkt_orte“-Tabelle, die sich innerhalb des Puffers der „schwerpunkt“-Tabelle befinden.
--INSERT INTO schwerpunkt_orte (name, geom) SELECT name, geom FROM ort WHERE (st_contains(st_buffer((SELECT geom FROM schwerpunkt), 30000), geom));

--Aufgabe 4
--Aufgabe: Erweitern Sie die Tabelle „schwerpunkt_orte“ um eine Attributspalte „in_leoben“ vom Typ integer.
--ALTER TABLE schwerpunkt_orte ADD COLUMN in_leoben integer;
--Aufgabe: Lassen Sie bei all jenen Orten der „schwerpunkt_orte“-Tabelle in der „in_leoben“-Spalte den Wert 1 eintragen, die sich im Bezirk Leoben befinden, allen anderen soll der Wert 0 zugewiesen werden.
--UPDATE schwerpunkt_orte SET in_leoben = 1 WHERE (st_contains((SELECT geom FROM bezirk WHERE name = 'Leoben'), geom));
--UPDATE schwerpunkt_orte SET in_leoben = 0 WHERE FALSE = (st_contains((SELECT geom FROM bezirk WHERE name = 'Leoben'), geom));
