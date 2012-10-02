<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" media="all" href="style.css">
		<title>Festpunkt ansehen / loeschen >> Uebungsaufgabe #3 - LV Geoinformatik 2</title>
	</head>
	<body>
		<h1>Festpunkte ansehen / loeschen</h1>

		<?php
		// Verbindungsdaten der postgreSQL Datenbank
		$host = "CLEAN";
		$port = "CLEAN";
		$dbname = "CLEAN";
		$user = "CLEAN";
		$password = "CLEAN";
		$strRefSysAn = $_GET['strRefsysAn'];
		
		// Querie zusammenstellen			
		switch ($strRefSysAn) { 
			case '32N':
				$intSRID = '32632';
				break;
			
			case '33N':
				$intSRID = '32633';
				break;
			
			case 'M28':
				$intSRID = '31281';
				break;
			
			case 'M31':
				$intSRID = '31282';
				break;
			
			case 'M34':
				$intSRID = '31283';
				break;
			
			case 'BMNM31':
				$intSRID = '31285';
				break;
			
			case 'BMNM34':
				$intSRID = '31286';
				break;
			
			case 'WGS':
				$intSRID = '4326';
				break;
			
			default:
				
				break;
		}
		
		$strSQL .= "SELECT fp_nummer, hoehe, fp_typ, st_y(st_transform(geom, ".$intSRID.")), st_x(st_transform(geom, ".$intSRID.")) FROM a2_festpunkte;"; // Querie finalisieren
		
		// Querie durchführen
		$conn = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$password");
		$result = pg_query($conn, $strSQL);
		pg_close($conn);
		
		// Querie auswerten und in Tabelle dynamisch Darstellen und Formular für Löschen hinzufügen
		?>
		<form action="festpunkt-loeschen.php">
		<table border=1 cellpadding=3 title="Tabelle Festpunkte">
		<colgroup align="center">
		<thead><tr><th>Name<th>Höhe<th>Typ<th>Y-Wert, SRID=<?php echo $intSRID; ?><th>X-Wert, SRID=<?php echo $intSRID; ?></thead>
		<tbody>
		<?php

		while($row = pg_fetch_row($result)) // Dynamisches erstellen der Tabelle mit Checkboxes für Löschen Formular
		{
			?>
			<tr><td><?php echo "$row[0]";?><td><?php echo "$row[1]";?><td><?php echo "$row[2]";?><td><?php echo "$row[3]";?><td><?php echo "$row[4]";?><td><?php echo "$row[5]";?><input type="checkbox" name="loeschen[]" value="<?php echo "$row[0]"; ?>">
			<?php
		}

		?>
		</tbody>
		<br><input type="submit" value="Festpunkte loeschen"><br>
		</table>
		</form>
		
		<a href="index.html">Zurück zum Menu</a>
	</body>
</html>
