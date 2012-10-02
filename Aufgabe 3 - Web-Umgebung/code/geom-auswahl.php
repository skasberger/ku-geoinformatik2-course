<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" media="all" href="style.css">
		<title>Details zu Festpunkt >> Uebungsaufgabe #3 - LV Geoinformatik 2</title>
	</head>
	<body>
		<h1>Details</h1>
		
		<?php
		// Verbindungsdaten der postgreSQL Datenbank
		$host = "129.27.89.66";
		$port = "5432";
		$dbname = "lv_gi2_pc34_up";
		$user = "student";
		$password = "student";
		
		// Auslesen des Formulares
		$intID = $_GET['id'];
		$strType = $_GET['typ'];

		// Verbindung zu Datenbank aufbauen
		$conn = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$password");

		switch ($strType) { // Querie zusammenstellen
			case 'Festpunkt':
				$strSQL = "SELECT fp_nummer, hoehe, fp_typ, (SELECT name FROM a2_bezirke WHERE a2_bezirke.id=a2_festpunkte.bezirk), st_x(geom), st_y(geom), st_x(st_transform(geom, 4326)), st_y(st_transform(geom, 4326)) FROM a2_festpunkte WHERE id=$intID;";
				break;
			
			case 'Bezirk':
				$strSQL = "SELECT name, st_x(st_centroid(geom)), st_y(st_centroid(geom)), st_x(st_transform(st_centroid(geom), 4326)), st_y(st_transform(st_centroid(geom), 4326)) FROM a2_bezirke WHERE id=$intID;";
				break;
			
			default:
				
				break;
		}
		
		// Querie durchführen
		$result = pg_query($conn, $strSQL);
		$row = pg_fetch_row($result);
		
		switch ($strType) {
			case 'Festpunkt':
				// Querie auswerten
				$strName = $row[0];
				$intH = $row[1];
				$strTyp = $row[2];
				$strBez = $row[3];
				$intX = $row[4];
				$intY = $row[5];
				$intXWGS = $row[6];
				$intYWGS = $row[7];
				?>
				<h3><?php echo "Festpunkt <strong>$strName</strong>"; ?></h3>
				<ul>
					<li>Höhe: 
						<?php 
						if (empty($intH)) {
							echo "Festpunkt hat keine Höhe";
						}
						else {
							echo "$intH";	
						}
						?>
					</li>
					<li>Typ: <?php echo "$strTyp"; ?></li>
					<li>Bezirk: <?php echo "$strBez"; ?></li>
					<li>X-Wert (UTM 33 N): <?php echo "$intX"; ?></li>
					<li>Y-Wert (UTM 33 N): <?php echo "$intY"; ?></li>
					<li>X-Wert (WGS84): <?php echo "$intXWGS"; ?></li>
					<li>Y-Wert (WGS84): <?php echo "$intYWGS"; ?></li>
				</ul>
				<?php
				break;
			
			case 'Bezirk':
				// Querie auswerten
				$strName = $row[0];
				$intX = $row[1];
				$intY = $row[2];
				$intXWGS = $row[3];
				$intYWGS = $row[4];
				echo "$strName, $intX, $strY";
											?>
				<h3><?php echo "Schwerpunkt von Bezirk <strong>$strName</strong>"; ?></h3>
				<ul>
					<li>X-Wert (UTM 33 N): <?php echo "$intX"; ?></li>
					<li>Y-Wert (UTM 33 N): <?php echo "$intY"; ?></li>
					<li>X-Wert (WGS84): <?php echo "$intXWGS"; ?></li>
					<li>Y-Wert (WGS84): <?php echo "$intYWGS"; ?></li>
				</ul>
				<?php
				break;
			
			default:
				
				break;
		}
		pg_close($conn);
		?>
		<form action="fp-umkreis.php">
			Anzeige der Festpunkte im Umkreis [km]: <input name="radius" type ="integer" size="3" maxlength="3">
			<input type="hidden" name="id" value=<?php echo "\"$intID\""; ?>>
			<input type="submit" value="Festpunkte auflisten">
		</form>
	<a href="map.php">Zurück zur Karte</a>
	</body>
</html>
