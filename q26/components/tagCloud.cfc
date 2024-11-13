<cfcomponent>
    <cffunction name="countWords" returnType="struct" access="public">
        <cfargument name="paragraph" type="string" required="true">

        <cfset local.formattedParagraph = Replace(arguments.paragraph, ".", "", "all")>
        <cfset local.formattedParagraph = Replace(local.formattedParagraph, ",", "", "all")>
        <cfset local.wordCount = StructNew("ordered")>

        <cfloop list="#local.formattedParagraph#" delimiters=" " item="word">
            <cfif IsNumeric(word)>
                <cfcontinue>
            </cfif>

            <cfquery name="wordCheck" datasource="test_sql_server">
                SELECT COUNT(word) AS numberOfRows FROM tags WHERE word=(<cfqueryparam value="#word#" cfsqltype="cf_sql_varchar">);
            </cfquery>
            <cfif wordCheck.numberOfRows IS 0>
                <cfquery name="wordAdd" datasource="test_sql_server">
                    INSERT INTO tags (word) VALUES (<cfqueryparam value="#word#" cfsqltype="cf_sql_varchar">);
                </cfquery>
            </cfif>

            <cfif Len(word) GTE 3>
                <cfif StructKeyExists(local.wordCount, "#word#")>
                    <cfset local.wordCount[word] += 1>
                <cfelse>
                    <cfset local.wordCount[word] = 1>
                </cfif>
            </cfif>
        </cfloop>

        <cfset local.sortedKeys = StructSort(local.wordCount, "numeric", "desc")>
        <cfset local.sortedWordCount = StructNew("ordered")>
        <cfloop array="#local.sortedKeys#" item="key">
            <cfset local.sortedWordCount[key] = local.wordCount[key]>
        </cfloop>
        <cfreturn local.sortedWordCount>
    </cffunction>
</cfcomponent>