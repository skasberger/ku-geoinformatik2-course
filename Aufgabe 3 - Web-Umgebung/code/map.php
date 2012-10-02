<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" media="all" href="map.css">
		<title>Festpunkt Karte >> Uebungsaufgabe #3 - LV Geoinformatik 2</title>
	</head>
	<body>
		<h1>Festpunkt-Karte Land Steiermark</h1>
		
		<?php
		// Verbindungsdaten der postgreSQL Datenbank
		$host = "129.27.89.66";
		$port = "5432";
		$dbname = "lv_gi2_pc34_up";
		$user = "student";
		$password = "student";
		
		// Definieren der räumlichen und graphischen Koordinaten 
		$intDBMinX = "374678";
		$intDBMaxX = "605195";
		$intDBDX = $intDBMaxX - $intDBMinX;
		$intDBMinY = "5158780";
		$intDBMaxY = "5300747";
		$intDBDY = $intDBMaxY - $intDBMinY;
		$intPicX = "1600";
		$intPicY = "985";
		$intScaleFacX = $intDBDX / $intPicX;
		$intScaleFacY = $intDBDY / $intPicY;
		
		
		// Queries erstellen
		$strSQLBez = "SELECT id, name, st_x(st_centroid(geom)), st_y(st_centroid(geom)) FROM a2_bezirke;";
		$strSQLFP = "SELECT id, fp_nummer, st_x(geom), st_y(geom) FROM a2_festpunkte WHERE bezirk > 0;";
		
		// Queries durchführen
		$conn = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$password");
		$resultBez = pg_query($conn, $strSQLBez);
		$resultFP = pg_query($conn, $strSQLFP);
		pg_close($conn);
		?>
		
		<!-- Karte mit Festpunkten und Bezirk-Schwerpunkte zeichnen --> 
		<img src="steiermark.png" usemap="#festpunkte" alt="Karte Steiermark mit Festpunkten">
		<map name="festpunkte">
			<?php 
			// Bezirke eintragen			
			while($rowBez = pg_fetch_row($resultBez)) {
				// Reihenweises auslesen des Arrays
				$intID = $rowBez[0];
				$strName = $rowBez[1];
				$intX = round(($rowBez[2] - $intDBMinX) / $intScaleFacX, 0);
				$intY = round(($intDBMaxY - $rowBez[3]) / $intScaleFacY, 0);
				
				// dynamisches erstellen der sensitiven Zonen 
				echo "<area shape=\"circle\" coords=\"$intX, $intY, 15\" href=\"geom-auswahl.php?id=$intID&typ=Bezirk\" title=\"Festpunkt $strName\" alt=\"$strName\">\n";
			}
			
			// Festpunkte eintragen
			while($rowFP = pg_fetch_row($resultFP)) {
				// Reihenweises auslesen des Arrays 
				$intID = $rowFP[0];
				$strName = $rowFP[1];
				$intX = round(($rowFP[2] - $intDBMinX) / $intScaleFacX, 0);
				$intY = round(($intDBMaxY - $rowFP[3]) / $intScaleFacY, 0);
				
				// dynamisches erstellen der sensitiven Zonen 
				echo "<area shape=\"circle\" coords=\"$intX, $intY,15\" href=\"geom-auswahl.php?id=$intID&typ=Festpunkt\" title=\"Bezirk $strName\" alt=\"$strName\">\n";
			}
			?>
		</map>
		
	<a href="index.html">Zurück zum Menu</a>
	</body>
</html>
