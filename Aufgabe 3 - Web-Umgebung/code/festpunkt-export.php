<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" media="all" href="style.css">
		<title>Export >> Uebungsaufgabe #3 - LV Geoinformatik 2</title>
	</head>
	
	<body>
		<?php
		// Verbindungsdaten der postgreSQL Datenbank
		$host = "129.27.89.66";
		$port = "5432";
		$dbname = "lv_gi2_pc34_up";
		$user = "student";
		$password = "student";
		
		
		// Auslesen des Formulares
		$strRefSys = $_GET['strRefsys'];
		$strSep = $_GET['delimiter'];
		$arrAtt = $_GET['strAttributes'];
		
		// Initialisieren der Variablen
		$intAttCount = count($arrAtt);
		$strSQL = "SELECT ";
		$intCount = 0;
		$strBreak = "<br>";
		
		// Definieren des Trennzeichens
		switch ($strSep) {
			case 'Komma':
				$strSep = ",";
				break;
			
			case 'Semikolon':
				$strSep = ";";
				break;
			
			default:
				
				break;
		}
		
		
		while ($intAttCount - $intCount >= 0) { // Abarbeiten der ausgewählten Attribute und Schreiben des Queries und CSV Kopfreihe
			switch ($arrAtt[$intCount]) { 
				case 'fpName':
					$strSQL .= "fp_nummer";
					$strCSV .= "Name";
					$strCSV .= $strSep;
					break;
			
				case 'hoehe':
					$strSQL .= "hoehe";
					$strCSV .= "Hoehe";
					$strCSV .= $strSep;
					break;

				case 'fpTyp':
					$strSQL .= "fp_typ";
					$strCSV .= "Typ";
					$strCSV .= $strSep;
					break;

				case 'geom': // Erstellen des Geometrie Querie
					switch ($strRefSys) {
						case '32N':
							$strSQL .= "st_y(st_transform(geom, 32632)), st_x(st_transform(geom, 32632))";
							break;
						
						case '33N':
							$strSQL .= "st_y(st_transform(geom, 32633)), st_x(st_transform(geom, 32633))";
							break;
							
						case 'M28':
							$strSQL .= "st_y(st_transform(geom, 31251)), st_x(st_transform(geom, 31251))";
							break;
							
						case 'M31':
							$strSQL .= "st_y(st_transform(geom, 31252)), st_x(st_transform(geom, 31252))";
							break;
							
						case 'M34':
							$strSQL .= "st_y(st_transform(geom, 31253)), st_x(st_transform(geom, 31253))";
							break;
							
						case 'BMNM31':
							$strSQL .= "st_y(st_transform(geom, 31258)), st_x(st_transform(geom, 31258))";
							break;
							
						case 'BMNM34':
							$strSQL .= "st_y(st_transform(geom, 31259)), st_x(st_transform(geom, 31259))";
							break;
						
						case 'WGS':
							$strSQL .= "st_y(st_transform(geom, 4326)), st_x(st_transform(geom, 4326))";
							break;
						
						default:
						
							break;
					}	
					$strCSV .= "X-Wert".$strSep."Y-Wert".$strSep;
				break;

				default:
				break;
			}
			// Auslassen des Trennzeichens beim letzten Attribut damit SQL Querie passt
			if ($intAttCount - $intCount >= 2)
			{
				$strSQL .= ", ";
			}
			$intCount++;
		}
		
		// Finalisieren der Queries und CSV Kopfreihe
		$strCSV .= $strBreak;
		$strSQL .= " FROM a2_festpunkte;";
		
		// Querie durchführen
		$conn = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$password");
		$result = pg_query($conn, $strSQL);
		pg_close($conn);
		
		// CSV generieren aus Querie
		?> 
		<h1>CSV Export</h1>
		<div id="csv"><?php
		while($row = pg_fetch_row($result)) // Reihenweises Auslesen der Tabelle  
	    {
	    	for ($intCount=0; $intCount < count($row); $intCount++) { // Zuweisen der Attribute jeder Reihe an den CSV String 
				$strCSV .= $row[$intCount].$strSep;
			}
			$strCSV .= $strBreak; // Trennzeichen in CSV hinzufügen
    	}
		
		// CSV am Bildschirm ausgeben
		printf("%s", $strCSV);
		?> </div><?php
    	?>
	<a href="index.html">Zurueck zum Menu</a>
	</body> 
</html>

