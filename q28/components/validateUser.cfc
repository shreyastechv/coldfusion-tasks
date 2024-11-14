<cfcomponent>
    <cffunction name="validateUser" returnType="string" access="public">
        <cfargument required="true" type="string" name="username">
        <cfargument required="true" type="string" name="password">
        <cfset local.hashedPassword = Hash(password, "SHA-256")>

        <cfquery name="getUserData">
            select username, pwd, userRole from users where username=<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">;
        </cfquery>

        <cfif getUserData.RecordCount EQ 0>
            <cfset local.output = "There is no user with username #arguments.username#.">
        <cfelse>
            <cfif getUserData.pwd IS local.hashedPassword>
                <cfset session.userRole = getUserData.userRole>
                <cfset session.userName = getUserData.username>
                <cfif getUserData.userRole IS "user">
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