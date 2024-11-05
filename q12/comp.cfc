<cfcomponent>
    <cffunction name="testQuery" returnType="struct" access="public">
        <cfargument required="true" type="string" name="queryNum" default="1">
        <cfquery name="queryOutput" dataSource="test_sql_server">
            SELECT * FROM test_table;
        </cfquery>
        <cfreturn {queryOutput: queryOutput, nthName: queryOutput.firstname[queryNum]}>
    </cffunction>
</cfcomponent>