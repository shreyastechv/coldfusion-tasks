<cfcomponent>
    <cffunction name="addPage" returnType="boolean" returnFormat="json" access="remote">
        <cfargument required="true" type="string" name="pageName">
        <cfargument required="true" type="string" name="pageDesc">

        <cfif StructKeyExists(session, "userRole") AND (session.userRole IS 'admin' OR session.userRole IS 'editor')>
            <cfquery name="checkPageQuery">
                SELECT pagename FROM pages WHERE pagename = <cfqueryparam value="#arguments.pageName#" cfsqltype="cf_sql_varchar">;
            </cfquery>

            <cfif checkPageQuery.RecordCount EQ 0>
                <cfquery name="addPageQuery">
                    INSERT INTO pages (pagename, pagedescs, _createdBy, _updatedBy) VALUES (<cfqueryparam value="#arguments.pageName#" cfsqltype="cf_sql_varchar">, <cfqueryparam value="#arguments.pageDesc#" cfsqltype="cf_sql_varchar">, <cfqueryparam value="#session.userName#" cfsqltype="cf_sql_varchar">, <cfqueryparam value="#session.userName#" cfsqltype="cf_sql_varchar">);
                </cfquery>
                <cfreturn true>
            <cfelse>
                <cfreturn false>
            </cfif>
        <cfelse>
            <cfreturn false>
        </cfif>
    </cffunction>

    <cffunction name="editPage" returnType="boolean" returnFormat="json" access="remote">
        <cfargument required="true" type="integer" name="pageId">
        <cfargument required="true" type="string" name="pageName">
        <cfargument required="true" type="string" name="pageDesc">

        <cfif StructKeyExists(session, "userRole") AND (session.userRole IS 'admin' OR session.userRole IS 'editor')>
            <cfquery name="editPageQuery">
                UPDATE pages
                SET pagename=<cfqueryparam value="#arguments.pageName#" cfsqltype="cf_sql_varchar">,
                pagedescs=<cfqueryparam value="#arguments.pageDesc#" cfsqltype="cf_sql_varchar">,
                _updatedBy=<cfqueryparam value="#session.userName#" cfsqltype="cf_sql_varchar">
                WHERE pageid=<cfqueryparam value="#arguments.pageId#" cfsqltype="cf_sql_integer">;
            </cfquery>
            <cfreturn true>
       <cfelse>
            <cfreturn false>
        </cfif>
    </cffunction>
</cfcomponent>