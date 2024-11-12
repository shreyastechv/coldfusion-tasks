<cfcomponent>
    <cffunction name="countWords" returnType="struct" access="public">
        <cfargument name="paragraph" type="string" required="true">

        <cfset local.formattedParagraph = Replace(arguments.paragraph, ".", "", "all")>
        <cfset local.formattedParagraph = Replace(local.formattedParagraph, ",", "", "all")>
        <cfset local.wordCount = StructNew("ordered")>

        <cfloop list="#local.formattedParagraph#" delimiters=" " item="word">
            <cfquery name="wordCheck" datasource="test_sql_server">
                SELECT COUNT(*) AS numberOfRows FROM tags WHERE word=(<cfqueryparam value="#word#" cfsqltype="cf_sql_varchar">);
            </cfquery>
            <cfif wordCheck.numberOfRows IS 0>
                <cfquery name="wordAdd" datasource="test_sql_server">
                    INSERT INTO tags (word) VALUES (<cfqueryparam value="#word#" cfsqltype="cf_sql_varchar">);
                </cfquery>
            </cfif>

            <cfif IsNumeric(word)>
                <cfcontinue>
            </cfif>

            <cfif Len(word) GTE 3>
                <cfif StructKeyExists(wordCount, "#word#")>
                    <cfset wordCount[word] += 1>
                <cfelse>
                    <cfset wordCount[word] = 1>
                </cfif>
            </cfif>
        </cfloop>

        <cfset sortedKeys = StructSort(wordCount, "numeric", "desc")>
        <cfset sortedWordCount = StructNew("ordered")>
        <cfloop array="#sortedKeys#" item="key">
            <cfset sortedWordCount[key] = wordCount[key]>
        </cfloop>
        <cfreturn sortedWordCount>
    </cffunction>
</cfcomponent>