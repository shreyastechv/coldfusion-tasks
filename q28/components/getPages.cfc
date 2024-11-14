<cfcomponent>
    <cffunction name="getPages" returnType="query" access="public">
        <cfif StructKeyExists(session, "userRole") AND session.userRole IS "editor">
            <cfquery name="getPagesQuery">
                SELECT pageid, pagename, pagedescs
                FROM pages
                WHERE _createdBy = <cfqueryparam value="#session.username#" cfsqltype="cf_sql_varchar">;
            </cfquery>
        <cfelse>
            <cfquery name="getPagesQuery">
                SELECT pageid, pagename, pagedescs
                FROM pages;
            </cfquery>
        </cfif>
        <cfreturn getPagesQuery>
    </cffunction>

</cfcomponent>