<cfcomponent>
    <cffunction name="makeStruct" returnType="struct" access="public">
        <cfargument required="true" type="string" name="text1">
        <cfargument required="true" type="string" name="text2">

        <cfif NOT StructKeyExists(session, "results")>
            <cfset session.results = StructNew()>
        </cfif>
        <cfset session.results[arguments.text1] = arguments.text2>

        <!--- Sorting --->
        <cfset local.sortedKeys = StructSort(session.results)>
        <cfset local.sortedStruct = StructNew()>
        <cfloop array="#sortedKeys#" item="key">
            <cfset local.sortedStruct[key] = session.results[key]>
        </cfloop>
        <cfreturn local.sortedStruct>
    </cffunction>
</cfcomponent>