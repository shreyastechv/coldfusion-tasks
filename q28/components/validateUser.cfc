<cfcomponent>
    <cffunction name="validateUser" returnType="string" access="public">
        <cfargument required="true" type="string" name="username">
        <cfargument required="true" type="string" name="password">

        <cfquery name="getUserData" dataSource="test_sql_server">
            select pwd, role from users where username=<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">;
        </cfquery>

        <cfif getUserData.pwd IS "">
            <cfreturn "nouser">
        <cfelse>
            <cfif getUserData.pwd IS arguments.password>
                <cfset session.userRole = getUserData.role>
                <cfreturn "good">
            <cfelse>
                <cfreturn "badpass">
            </cfif>
        </cfif>
    </cffunction>
</cfcomponent>