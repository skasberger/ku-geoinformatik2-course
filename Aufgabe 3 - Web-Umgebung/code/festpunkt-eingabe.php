<html>
	
	<head>
		<meta charset="utf-8">
		<title>Eingabe >> Uebungsaufgabe #3 - LV Geoinformatik 2</title>
	</head>
	
	<body>
		<?php
		// Verbindungsdaten der postgreSQL Datenbank
		$host = "129.27.89.66";
		$port = "5432";
		$dbname = "lv_gi2_pc34_up";
		$user = "student";
		$password = "student";
					
		// Auslesen des Forumulares mittels $_GET
		$strNameFP = $_GET["strNameFP"];			
		$intX = $_GET["intX_FP"];			
		$intY = $_GET["intY_FP"];			
		$intH = "NULL";			
		$intH = $_GET["intH_FP"];	
		$strFP_typ = $_GET["strFP_Typ"];
		$strRefSys = $_GET["strRefsys"];			
		
		// Vorbereiten des Querie => Geometrietransformation	
		$strGeom = "st_transform(st_geomfromtext('POINT(".$intX." ".$intY.")', ";
		
		switch ($strRefSys) { // SRID 
			case "32N":
				$strGeom .= "32632";
				break;
			case "33N":
				$strGeom .= "32633";
				break;
			case "M28":
				$strGeom .= "31281";
				break;
			case "M31":
				$strGeom .= "31282";
				break;
			case "M34":
				$strGeom .= "31283";
				break;
			case "BMNM31":
				$strGeom .= "31285";
				break;
			case "BMNM34":
				$strGeom .= "31286";
				break;
			case "WGS":
				$strGeom .= "4326";
				break;
		}

		$strGeom .= "), 32633)"; // abschliessen des Geometrie Querie
		
		// Erstellen des Queries
		$strSQL = "INSERT INTO a2_festpunkte(fp_nummer, hoehe, fp_typ, geom) VALUES ('".$strNameFP."', ".$intH.", '".$strFP_typ."', ".$strGeom.");"; 
			
		// Querie durchführen
		$conn = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$password");
		$result = pg_query($conn, $strSQL);
		
		// Eintragen des Bezirkes in die Festpunkt Tabelle
		$strSQL = "UPDATE a2_festpunkte SET bezirk = a2_bezirke.id FROM a2_bezirke WHERE st_contains(a2_bezirke.geom, a2_festpunkte.geom);";
		$result = pg_query($conn, $strSQL);
			
		pg_close($conn); // Schliessen der Datenbankverbindung
		?>
		<a href="festpunkt-eingabe.html">Zurueck zur Festpunkt eingabe</a>
	</body> 
</html>

