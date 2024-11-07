<cfcomponent>
    <cffunction name="validateUser" returnType="string" access="public">
        <cfargument required="true" type="string" name="username">
        <cfargument required="true" type="string" name="password">

        <cfif arguments.username IS "user101" AND arguments.password IS "password">
            <cfset session.loggedIn = true>
            <cflocation url="welcome.cfm" addToken="no">
        </cfif>
    </cffunction>
</cfcomponent>