<cfcomponent>
    <cffunction name="addUserData" returnType="void" access="remote">
        <cfargument required="true" type="string" name="userEmail">
        <cfargument required="true" type="string" name="userFirstName">

        <cfquery name="addUserQuery" datasource="test_sql_server">
            INSERT INTO q24_table (email, firstname) VALUES (<cfqueryparam value="#arguments.userEmail#" cfsqltype="cf_sql_varchar">, <cfqueryparam value="#arguments.userFirstName#" cfsqltype="cf_sql_varchar">);
        </cfquery>
    </cffunction>

    <cffunction name="isEmailPresent" returnType="boolean" returnFormat="json" access="remote">
        <cfargument required="true" type="string" name="userEmail">

        <cfquery name="emailQuery" datasource="test_sql_server">
            SELECT email FROM q24_table WHERE email=<cfqueryparam value="#arguments.userEmail#" cfsqltype="cf_sql_varchar">;
        </cfquery>

        <cfreturn emailQuery.recordCount>
    </cffunction>
</cfcomponent>