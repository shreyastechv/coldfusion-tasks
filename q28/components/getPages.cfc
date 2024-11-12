<cfcomponent>
    <cffunction name="getPages" returnType="query" access="public">
        <cfquery name="getPagesQuery" dataSource="test_sql_server">
            select pageid, pagename, pagedescs from pages;
        </cfquery>
        <cfreturn getPagesQuery>
    </cffunction>
</cfcomponent>