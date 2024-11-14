<cfcomponent>
    <cffunction name="createUser" returnType="string" access="public">
        <cfargument required="true" type="string" name="username">
        <cfargument required="true" type="string" name="password">
        <cfargument required="true" type="string" name="confirmPassword">
        <cfset local.hashedPassword = Hash(password, "SHA-256")>
        <cfset local.message = "">

        <cfif Find(" ", arguments.username)>
            <cfreturn "Username should not contain any spaces.">
        </cfif>

        <cfquery name="checkUser">
            SELECT username FROM users WHERE username=<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">;
        </cfquery>

        <cfif checkUser.RecordCount EQ 0>
            <cfquery name="addUser">
                INSERT INTO users
                (userName, pwd, userRole)
                VALUES (
                    <cfqueryparam value="#Replace(arguments.username," ","", "all")#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#local.hashedPassword#" cfsqltype="cf_sql_varchar">,
                    'editor'
                );
            </cfquery>
            <cfset local.message = "Account created successfully. Login to continue.">
        <cfelse>
            <cfset local.message = "Username already taken.">
        </cfif>

        <cfreturn local.message>
    </cffunction>
</cfcomponent>