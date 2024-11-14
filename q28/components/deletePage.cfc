<cfcomponent>
    <cffunction name="deletePage" returnType="boolean" returnFormat="json" access="remote">
        <cfargument required="true" type="string" name="pageid">
        <cfif StructKeyExists(session, "userRole") AND (session.userRole IS 'admin' OR session.userRole IS 'editor')>
            <cfquery name="deletePageQuery">
                DELETE FROM pages
                WHERE pageid=<cfqueryparam value="#arguments.pageid#" cfsqltype="cf_sql_varchar">;
            </cfquery>
            <cfreturn true>
        <cfelse>
            <cfreturn false>
        </cfif>
    </cffunction>
</cfcomponent>