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

        <!--- Sort struct --->
        <cfset local.sortedWordCount = StructToSorted(local.wordCount, function(value1, value2, key1, key2) {
            if (value1 != value2) {
                return value2 - value1;
            }
            else if (len(key1) != len(key2)) {
                return len(key2) - len(key1);
            }
            else {
                return compare(key2, key1);
            }
        })>

        <cfreturn local.sortedWordCount>
    </cffunction>

    <cffunction name="selectColor" returnType="string" access="public">
        <cfargument name="justANumber" type="string" required="true">

        <cfset local.hue = arguments.justANumber * 137.508>
        <cfreturn "hsl(#hue#,50%,75%)">
    </cffunction>
</cfcomponent>