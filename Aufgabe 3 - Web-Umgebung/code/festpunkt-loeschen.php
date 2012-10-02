<html>
	
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" media="all" href="style.css">
		<title>Löschen >> Uebungsaufgabe #3 - LV Geoinformatik 2</title>
	</head>
	
	<body>
		<?php
		// Verbindungsdaten der postgreSQL Datenbank
		$host = "129.27.89.66";
		$port = "5432";
		$dbname = "lv_gi2_pc34_up";
		$user = "student";
		$password = "student";
		
		// Auslesen des Formulares in ein Array
		$strDelFP = $_GET['loeschen'];
					
		// Aufbauen der Datenbankverbindung und ausführen der Queries
		$conn = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$password");
		
		for ($intCount =0; count($strDelFP) > $intCount; $intCount++)
		{
			$strSQL = "DELETE FROM a2_festpunkte WHERE fp_nummer = '".$strDelFP[$intCount]."';";
			$result = pg_query($conn, $strSQL);
		}
		pg_close($conn); // Datenbankverbindung schliessen
		?>
		<h3>Löschen erfolgreich</h3>
		<ul>
			<li>zurück zu Festpunkte ansehen/löschen<form action="festpunkt-ansehen.php"><select name="strRefsysAn">
				<option value="32N">UTM 32 N</option>
				<option value="33N">UTM 33 N</option>
				<option value="M28">GK M28</option>
				<option value="M31">GK M31</option>
				<option value="M34">GK M34</option>
				<option value="BMNM31">BMNM31</option>
				<option value="BMNM34">BMNM34</option>
				<option value="WGS">GCS WGS84</option>
				</select>
				<input type="submit" value="Festpunkte ansehen/loeschen">
				</form></li>
			<li><a href="index.html">Zurueck zum Menu</a></li>
		</ul>
	</body> 
</html>

