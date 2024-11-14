<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Coldfusion Task</title>
		<link href="../css/bootstrap.min.css" rel="stylesheet">
		<link href="css/styles.css" rel="stylesheet">
	</head>

    <body>
		<cfoutput>
			<div class="container mt-5">
				<form id="paraForm" name="paraForm" method="post">
					<div class="form-group">
						<label for="paraInput" class="form-label">Enter a paragraph: </label>
						<textarea class="form-control" id="paraInput" name="paraInput" rows="4" required></textarea>
						<button type="submit" id="submit" name="submit" class="btn btn-primary mt-3">Submit</button>
					</div>
				</form>

				<div class="text-primary-emphasis mt-3">
					<cfif StructKeyExists(form, "submit")>
						<cfset local.objCountWords = CreateObject('component', 'components.tagCloud')>
						<cfset local.structWordCount = local.objCountWords.countWords(form.paraInput)>
						<cfdump var = "#local.structWordCount#">

						<cfloop collection="#local.structWordCount#" item="word">
							<p style="font-size: #local.structWordCount[word]#em;">#word#</p>
						</cfloop>
					</cfif>
				</div>
			</div>
		</cfoutput>
		<script src="../js/bootstrap.bundle.min.js"></script>
	</body>
</html>