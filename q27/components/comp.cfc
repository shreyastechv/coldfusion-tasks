<cfcomponent>
    <cffunction name="validateUser" returnType="string" access="public">
        <cfargument required="true" type="string" name="username">
        <cfargument required="true" type="string" name="password">

        <cfquery name="getPassword" dataSource="test_sql_server">
            select password from q27_table where username=<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">;
        </cfquery>

        <cfif getPassword.password IS "">
            <cfreturn "There is no user with username #arguments.username#.">
        <cfelse>
            <cfif getPassword.password IS arguments.password>
                <cfset session.loggedIn = true>
                <cflocation url="./welcome.cfm" addToken="no">
            <cfelse>
                <cfreturn "Wrong password for the user with username #form.username#">
            </cfif>
        </cfif>
    </cffunction>
</cfcomponent>