<cfcomponent>
    <cffunction name="testQuery" returnType="struct" access="public">
        <cfargument required="false" type="string" name="queryNum" default="1">
        <cfquery name="queryOutput" dataSource="test_sql_server">
            SELECT * FROM test_table;
        </cfquery>
        <cfreturn {qOut: queryOutput, nthName: queryOutput.firstname[arguments.queryNum]}>
    </cffunction>
</cfcomponent>