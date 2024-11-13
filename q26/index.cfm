<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Coldfusion Task</title>
		<link href="../css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<link href="css/styles.css" rel="stylesheet">
	</head>

    <body>
		<cfoutput>
			<div class="container mt-5">
				<div class="text-primary-emphasis mt-3">
					<cffile action="read" file="#expandPath("./words.txt")#" variable="local.myFile">
					<cfset local.objCountWords = CreateObject('component', 'components.tagCloud')>
					<cfset local.structWordCount = local.objCountWords.countWords(local.myFile)>
					<cfdump var = "#local.structWordCount#">

					<cfloop collection="#local.structWordCount#" item="word">
						<p style="font-size: #local.structWordCount[word]#em;">#word#</p>
					</cfloop>
				</div>
			</div>
		</cfoutput>
		<script src="../js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	</body>
</html>