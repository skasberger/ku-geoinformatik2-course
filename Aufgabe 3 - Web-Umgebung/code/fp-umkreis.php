<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" media="all" href="style.css">
		<title>Details zu Festpunkt >> Uebungsaufgabe #3 - LV Geoinformatik 2</title>
	</head>
	<body>
		<?php
		$host = "129.27.89.66";
		$port = "5432";
		$dbname = "lv_gi2_pc34_up";
		$user = "student";
		$password = "student";
		
		// Variablen Übergabe
		$intID = $_GET['id'];
		$intRadius = $_GET['radius'];
		
		$intRadiusm = $intRadius * 1000;  
		
		// ausgewählten Festpunkt abfragen
		$strSQL = "SELECT id, fp_nummer, hoehe, fp_typ, (SELECT name FROM a2_bezirke WHERE a2_bezirke.id=a2_festpunkte.bezirk), st_x(geom), st_y(geom), st_x(st_transform(geom, 4326)), st_y(st_transform(geom, 4326)) FROM a2_festpunkte WHERE id=$intID;";
		$conn = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$password");
		$resultIDid = pg_query($conn, $strSQL);
		$rowIDid = pg_fetch_row($resultIDid);
		
		// Variablen zuweisen
		$intIDid = $rowIDid[0];
		$strName = $rowIDid[1];
		$intH = $rowIDid[2];
		$strTyp = $rowIDid[3];
		$strBez = $rowIDid[4];
		$intX = $rowIDid[5];
		$intY = $rowIDid[6];
		$intXWGS = $rowIDid[7];
		$intYWGS = $rowIDid[8];
		?>
		
		<div id="festpunkt">
		<?php // ausgewählten Festpunkt ausgeben 
		?>
		<div id=<?php echo "$intIDid"; ?>>
			<?php echo "<h1><a href=\"geom-auswahl.php?id=$intIDN&typ=Festpunkt\">Festpunkt <strong>$strName</strong></a></h1>"; ?>
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
		</div>	
		<?php
		
		// Querie Festpunkte Umkreis erstellen
		$strSQL = "SELECT id FROM a2_festpunkte WHERE st_contains(st_buffer((SELECT geom FROM a2_festpunkte WHERE id=$intID), $intRadiusm), geom);";
		
		// Queries durchführen
		$resultIDO = pg_query($conn, $strSQL);
		
		echo "<h1>Festpunkte im Umkreis von $intRadius km</h1>";
		
		while($rowIDO = pg_fetch_row($resultIDO)) // Dynamisches erstellen auslesen der Festpunkt-ID's
		{
			$intIDO = $rowIDO[0];
			if ($intIDO != $intID) {
				$strSQL = "SELECT id, fp_nummer, hoehe, fp_typ, (SELECT name FROM a2_bezirke WHERE a2_bezirke.id=a2_festpunkte.bezirk), st_x(geom), st_y(geom), st_x(st_transform(geom, 4326)), st_y(st_transform(geom, 4326)) FROM a2_festpunkte WHERE id=$intIDO;";
				$resultIDN = pg_query($conn, $strSQL);
				$rowIDN = pg_fetch_row($resultIDN);
			
				$intIDN = $rowIDN[0];
				$strName = $rowIDN[1];
				$intH = $rowIDN[2];
				$strTyp = $rowIDN[3];
				$strBez = $rowIDN[4];
				$intX = $rowIDN[5];
				$intY = $rowIDN[6];
				$intXWGS = $rowIDN[7];
				$intYWGS = $rowIDN[8];
				?>
				<div id=<?php echo "$intIDN"; ?> class="umkreis">
					<?php echo "<h3><a href=\"geom-auswahl.php?id=$intIDN&typ=Festpunkt\">Festpunkt <strong>$strName</strong></a></h3>"; ?>
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
				</div>	
			<?php
			}
		}
		?>	
		</div>
		
		<?php
		pg_close($conn);
		?>
	<a href="map.php">Zurück zur Karte</a>
	</body>
</html>
