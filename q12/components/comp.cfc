<cfcomponent>
    <cffunction name="testQuery" returnType="struct" access="public">
        <cfargument required="false" type="string" name="queryNum" default="1">
        <cfquery name="local.queryOutput" dataSource="test_sql_server">
            SELECT firstname, lastname FROM test_table;
        </cfquery>
        <cfreturn {qOut: local.queryOutput, nthName: local.queryOutput.firstname[arguments.queryNum]}>
    </cffunction>
</cfcomponent>