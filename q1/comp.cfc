<cfcomponent>
    <cffunction name="checkNum" returnType="string" access="public">
        <cfargument required="true" type="integer" name="num">
        <cfif num IS 5>
            <cfreturn "Very good">
        <cfelseif num IS 4>
            <cfreturn "Good">
        <cfelseif num IS 3>
            <cfreturn "Fair">
        <cfelseif num IS 2>
            <cfreturn "OK">
        <cfelseif num IS 1>
            <cfreturn "OK">
        <cfelse>
            <cfreturn "Invalid input">
        </cfif>
    </cffunction>
</cfcomponent>