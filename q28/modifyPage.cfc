<cfcomponent>
    <cffunction name="addPage" returnType="boolean" returnFormat="json" access="remote">
        <cfargument required="true" type="string" name="pageName">
        <cfargument required="true" type="string" name="pageDesc">

        <cfif StructKeyExists(session, "userRole") AND (session.userRole IS 'admin' OR session.userRole IS 'editor')>
            <cfquery name="addPageQuery" dataSource="test_sql_server">
                INSERT INTO pages (pagename, pagedescs) VALUES (<cfqueryparam value="#arguments.pageName#" cfsqltype="cf_sql_varchar">, <cfqueryparam value="#arguments.pageDesc#" cfsqltype="cf_sql_varchar">);
            </cfquery>
            <cfreturn true>
        <cfelse>
            <cfreturn false>
        </cfif>
    </cffunction>

    <cffunction name="editPage" returnType="void" access="remote">
        <cfargument required="true" type="string" name="pageName">
        <cfargument required="true" type="string" name="pageDesc">

        <cfif StructKeyExists(session, "userRole") AND (session.userRole IS 'admin' OR session.userRole IS 'editor')>
            <cfquery name="addPageQuery" dataSource="test_sql_server">
                INSERT INTO pages (pagename, pagedescs) VALUES (<cfqueryparam value="#arguments.pageName#" cfsqltype="cf_sql_varchar">, <cfqueryparam value="#arguments.pageDesc#" cfsqltype="cf_sql_varchar">);
            </cfquery>
        </cfif>
    </cffunction>
</cfcomponent>