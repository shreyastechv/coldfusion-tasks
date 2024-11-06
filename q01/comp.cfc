<cfcomponent>
    <cffunction name="checkNum" returnType="string" access="public">
        <cfargument required="true" type="integer" name="num">
        <cfset local.result = "">

        <cfif arguments.num IS 5>
            <cfset local.result = "Very good">
        <cfelseif arguments.num IS 4>
            <cfset local.result = "Good">
        <cfelseif arguments.num IS 3>
            <cfset local.result = "Fair">
        <cfelseif arguments.num IS 2>
            <cfset local.result = "OK">
        <cfelseif arguments.num IS 1>
            <cfset local.result = "OK">
        <cfelse>
            <cfset local.result = "Invalid input">
        </cfif>

        <cfreturn local.result>
    </cffunction>
</cfcomponent>