-- Name: Stefan Kasberger
-- Date Start: 12.11.2011
-------------------------------------------


--===##   AUFGABENSTELLUNG   ##===

--Länder Europas (5, inkl. Frankreich u. Spanien): ID, Name, Hauptstadt, Einwohner, Fläche in km2 
--Gebirge Europas (3, inkl. Alpen): ID, Name, Höhe der höchsten Erhebung
--Ströme Europas (3, inkl. Rhein & Donau): ID, Name, Länge, mündet in
--Beziehungstabellen zur Realisierung der n:m Beziehungen 


--===##   TABELLE ERZEUGEN   ##===

-- TABELLEN ERSTELLEN
--CREATE table pc34_laender (id serial primary key, name varchar, hauptstadt varchar, einwohner integer, flaeche integer); -- Tabelle für die Länder erstellen mit ID (Primäschlüssel), Name, Hauptstadt, Einwohner und Fläche erstellen
--CREATE table pc34_stroeme (id serial primary key, name varchar, laenge integer, muendet_in varchar); -- Tabelle für die Ströme erstellen mit ID (Primäschlüssel), Name und Länge des Stromes und in welchem Gewässer er mündet erstellen
--CREATE table pc34_gebirge (id serial primary key, name varchar, hoehe integer); -- Tabelle für die Gebirge erstellen mit ID (Primäschlüssel), Name des Gebirges und Höhe des höchsten Berges erstellen
--CREATE table pc34_rel_gebirge_laender (id serial primary key, id_land integer, id_gebirge integer); -- Tabelle für die Relation zwischen Gebirge und Länder mit ID (Primäschlüssel), ID vom Gebirge und ID vom Strom erstellen
--CREATE table pc34_rel_laender_stroeme (id serial primary key, id_land integer, id_strom integer); -- Tabelle für die Relation zwischen Ströme und Länder mit ID (Primäschlüssel), ID vom Land und ID vom Strom erstellen

-- LAENDER MIT DATEN FUELLEN
--INSERT INTO pc34_laender (id, name, hauptstadt, einwohner, flaeche) values (1, 'Österreich', 'Wien', 8405500, 83878.99); -- Österreich: https://secure.wikimedia.org/wikipedia/de/wiki/%C3%96sterreich
--INSERT INTO pc34_laender (id, name, hauptstadt, einwohner, flaeche) values (2, 'Deutschland', 'Berlin', 81729000, 357111.91); -- Deutschland: https://secure.wikimedia.org/wikipedia/de/wiki/Deutschland
--INSERT INTO pc34_laender (id, name, hauptstadt, einwohner, flaeche) values (3, 'Frankreich', 'Paris', 65447374, 674843); -- Frankreich: https://secure.wikimedia.org/wikipedia/de/wiki/Frankreich
--INSERT INTO pc34_laender (id, name, hauptstadt, einwohner, flaeche) values (4, 'Spanien', 'Madrid', 47150819, 504645); -- Spanien: https://secure.wikimedia.org/wikipedia/de/wiki/Spanien
--INSERT INTO pc34_laender (id, name, hauptstadt, einwohner, flaeche) values (5, 'Italien', 'Rom', 60626442, 301338); -- Italien: https://secure.wikimedia.org/wikipedia/de/wiki/Italien

-- GEBIRGE MIT DATEN FUELLEN 
--INSERT INTO pc34_gebirge (id, name, hoehe) values (1, 'Alpen', 4810); --Alpen: https://secure.wikimedia.org/wikipedia/de/wiki/Alpen
--INSERT INTO pc34_gebirge (id, name, hoehe) values (2, 'Karpaten', 2655); --Karpaten: https://secure.wikimedia.org/wikipedia/de/wiki/Karpaten
--INSERT INTO pc34_gebirge (id, name, hoehe) values (3, 'Skanden', 2469); -- Skanden: https://secure.wikimedia.org/wikipedia/de/wiki/Skanden

-- STROEME MIT DATEN FUELLEN
--INSERT INTO pc34_stroeme (id, name, laenge, muendet_in) values (1, 'Donau', 2857, 'Schwarzes Meer'); -- Donau: https://secure.wikimedia.org/wikipedia/de/wiki/Donau
--INSERT INTO pc34_stroeme (id, name, laenge, muendet_in) values (2, 'Rhein', 1233, 'Nordsee'); -- Rhein: https://secure.wikimedia.org/wikipedia/de/wiki/Rhein
--INSERT INTO pc34_stroeme (id, name, laenge, muendet_in) values (3, 'Po', 652, 'Adria'); -- Po: https://secure.wikimedia.org/wikipedia/de/wiki/Po_%28Fluss%29

-- RELATIONEN STROEME/LAENDER MIT DATEN FUELLEN
--INSERT INTO pc34_rel_laender_stroeme (id, id_land, id_strom) values (1, 2, 2); -- Rhein geht durch Deutschland
--INSERT INTO pc34_rel_laender_stroeme (id, id_land, id_strom) values (2, 3, 2); -- Rhein geht durch Frankreich
--INSERT INTO pc34_rel_laender_stroeme (id, id_land, id_strom) values (3, 1, 1); -- Donau geht durch Österreich
--INSERT INTO pc34_rel_laender_stroeme (id, id_land, id_strom) values (4, 2, 1); -- Donau geht durch Deutschland
--INSERT INTO pc34_rel_laender_stroeme (id, id_land, id_strom) values (5, 5, 3); -- Po geht durch Italien

-- RELATIONEN GEBIRGE/LAENDER MIT DATEN FUELLEN
--INSERT INTO pc34_rel_gebirge_laender (id, id_land, id_gebirge) values (1, 1, 1); -- Alpen liegen in Österreich
--INSERT INTO pc34_rel_gebirge_laender (id, id_land, id_gebirge) values (2, 2, 1); -- Alpen liegen in Deutschland
--INSERT INTO pc34_rel_gebirge_laender (id, id_land, id_gebirge) values (3, 3, 1); -- Alpen liegen in Frankreich
--INSERT INTO pc34_rel_gebirge_laender (id, id_land, id_gebirge) values (4, 5, 1); -- Alpen liegen in Italien
--INSERT INTO pc34_rel_gebirge_laender (id, id_land, id_gebirge) values (5, 1, 2); -- Karpaten liegen in Österreich


--===##   QUERIES   ##===

--SELECT * FROM pc34_laender; --Fragen Sie alle Länder ab.
--SELECT * FROM pc34_laender LIMIT 3; --Fragen Sie nur drei (beliebige) Länder ab.
--SELECT * FROM pc34_laender ORDER BY name DESC; --Fragen Sie alle Länder in umgekehrter alphabetischer Reihenfolge ab.
--SELECT COUNT(*) FROM pc34_stroeme; --Fragen Sie die Anzahl der Ströme ab.
--SELECT AVG(hoehe) FROM pc34_gebirge; --Fragen Sie den Wert der mittleren Höhe der Gebirge ab.
--SELECT einwohner / flaeche AS Einwohnerdichte FROM pc34_laender; --Fragen Sie die Einwohnerdichte (EW/Fläche) aller Länder ab.
--SELECT name AS Land, flaeche AS Flaeche FROM pc34_laender WHERE flaeche > 100000; --Welche Länder sind größer als 100.000km2?
--SELECT hoehe FROM pc34_gebirge WHERE name = 'Alpen'; --Wie hoch sind die Alpen?
--SELECT SUM(laenge) FROM pc34_stroeme WHERE name = 'Donau' OR name = 'Rhein'; --Wie lange ist Donau und Rhein zusammen?
--SELECT name FROM pc34_stroeme ORDER BY laenge ASC LIMIT 1; --Wie lautet der Name des kürzesten Stroms?
--SELECT name FROM pc34_stroeme WHERE muendet_in IN ('Schwarzes Meer'); --Welche Ströme münden in das Schwarze Meer?
--CREATE VIEW alpenlaender AS (SELECT name FROM pc34_laender WHERE id IN (SELECT id_land FROM pc34_rel_gebirge_laender WHERE id_gebirge IN (SELECT id FROM pc34_gebirge WHERE name = 'Alpen')));--In welchen Ländern befinden sich die Alpen? Erzeugen Sie für diese Antwort einen VIEW!
--SELECT AVG(einwohner) FROM pc34_laender WHERE id IN (SELECT id_land FROM pc34_rel_gebirge_laender WHERE id_gebirge IN (SELECT id FROM pc34_gebirge WHERE name = 'Alpen')); --Wie hoch ist die durchschnittliche Einwohneranzahl der Alpenländer?
--SELECT name, hauptstadt FROM pc34_laender WHERE id IN (SELECT id FROM pc34_laender WHERE (name = 'Spanien' OR name = 'Frankreich') AND 'true' = (SELECT hauptstadt FROM pc34_laender WHERE name = 'Spanien') = (SELECT hauptstadt FROM pc34_laender WHERE name = 'Frankreich')); --Besitzen Frankreich und Spanien dieselbe Hauptstadt?
--SELECT name FROM pc34_laender WHERE ID IN (SELECT id_land FROM pc34_rel_laender_stroeme WHERE id_strom = ((SELECT id FROM pc34_stroeme ORDER BY laenge DESC LIMIT 1))); --Durch welche Länder fließt der längste Strom?
--SELECT COUNT(name) FROM pc34_laender WHERE (id IN (SELECT id_land FROM pc34_rel_gebirge_laender WHERE id_gebirge = (SELECT id FROM pc34_gebirge ORDER BY hoehe DESC LIMIT 1)) AND id IN(SELECT id_land FROM pc34_rel_laender_stroeme WHERE id_strom = (SELECT id FROM pc34_stroeme ORDER BY laenge DESC LIMIT 1))); --Wie viele Länder gibt es, durch die der längste Strom fließt und sich gleichzeitig das höchste Gebirge befindet?

--UPDATE pc34_stroeme SET laenge = 1000; --Ändern Sie alle Längen der Ströme auf 1.000km.
--UPDATE pc34_laender SET einwohner = 15000000, flaeche=10000; --Ändern Sie die Einwohnerzahlen der Länder auf 15.000.000 und gleichzeitig die Flächen der Länder auf 10.000km2.
--UPDATE pc34_gebirge SET hoehe = (SELECT AVG(hoehe) FROM pc34_gebirge) WHERE name = 'Alpen'; --Ändern Sie die Höhe der Alpen auf die mittlere Höhe der Gebirge.
--UPDATE pc34_laender SET hauptstadt ='Paradise City' WHERE id BETWEEN 5 AND 15; --Ändern Sie den Hauptstadtnamen jener Länder auf Paradise City, deren ID zwischen 5 und 15 liegt.
--DELETE FROM pc34_stroeme; --Löschen Sie alle Ströme.
--DELETE FROM pc34_laender WHERE id IN (1,3,5); --Löschen Sie alle Länder mit ungerader ID.
--DROP VIEW alpenlaender; --Löschen Sie den VIEW.
--DROP TABLE pc34_laender, pc34_stroeme, pc34_gebirge, pc34_rel_gebirge_laender, pc34_rel_laender_stroeme; --Löschen Sie die restlichen Tabellen AUSSER geometry_columns und spacial_ref_sys! 


