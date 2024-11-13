<cfcomponent>
    <cffunction name="validateUser" returnType="string" access="public">
        <cfargument required="true" type="string" name="username">
        <cfargument required="true" type="string" name="password">

        <cfquery name="getUserData" dataSource="test_sql_server">
            select pwd, role from users where username=<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">;
        </cfquery>

        <cfif getUserData.pwd IS "">
            <cfreturn "There is no user with username #form.username#.">
        <cfelse>
            <cfif getUserData.pwd IS arguments.password>
                <cfset session.userRole = getUserData.role>
                <cfif getUserData.role IS "user">
                    <cflocation url="index.cfm" addToken="no">
                <cfelse>
                    <cflocation url="admin.cfm" addToken="no">
                </cfif>
            <cfelse>
                <cfreturn "Wrong password for the user with username #form.username#.">
            </cfif>
        </cfif>
    </cffunction>
</cfcomponent>