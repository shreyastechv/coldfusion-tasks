<cfcomponent>
    <cffunction name="validateUser" returnType="string" access="public">
        <cfargument required="true" type="string" name="username">
        <cfargument required="true" type="string" name="password">
        <cfset local.hashedPassword = Hash(password, "SHA-256")>

        <cfquery name="getUserData">
            SELECT u.username, u.pwd, r.roleName FROM users u INNER JOIN roles r on u.roleId = r.roleId WHERE username=<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">;
        </cfquery>

        <cfif getUserData.RecordCount EQ 0>
            <cfset local.output = "There is no user with username #arguments.username#.">
        <cfelse>
            <cfif getUserData.pwd IS local.hashedPassword>
                <cfset session.userRole = getUserData.roleName>
                <cfset session.userName = getUserData.username>
                <cfif getUserData.roleName IS "user">
                    <cflocation url="index.cfm" addToken="no">
                <cfelse>
                    <cflocation url="admin.cfm" addToken="no">
                </cfif>
            <cfelse>
                <cfset local.output = "Wrong password.">
            </cfif>
        </cfif>
        <cfreturn local.output>
    </cffunction>
</cfcomponent>