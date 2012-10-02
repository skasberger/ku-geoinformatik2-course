<html>
	
	<head>
		<title>Beispiel Stefan Kasberger</title>
	</head>
	
	<body>
		<?php
			$intVal1 = $_GET["intVal1"];
			$intVal2 = $_GET["intVal2"];
			$strOp = $_GET["op"];
			
			switch ($strOp) {
				case "a":
				$intResult = $intVal1 + $intVal2;
				echo "Wert 1 + Wert 2 = $intResult";
				break;
				case "s":
				$intResult = $intVal1 - $intVal2;
				echo "Wert 1 - Wert 2 = $intResult";
				break;
				case "mu":
				$intResult = $intVal1 * $intVal2;
				echo "Wert 1 * Wert 2 = $intResult";
				break;
				case "d":
				$intResult = $intVal1 / $intVal2;
				echo "Wert 1 / Wert 2 = $intResult";
				break;
				case "mo":
				$intResult = $intVal1 % $intVal2;
				echo "Wert 1 modulo Wert 2 = $intResult";
				break;
			}
		?>	
	</body>
</html>

