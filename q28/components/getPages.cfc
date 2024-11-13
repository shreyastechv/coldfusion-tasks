<cfcomponent>
    <cffunction name="getPages" returnType="query" access="public">
        <cfquery name="getPagesQuery">
            select pageid, pagename, pagedescs from pages;
        </cfquery>
        <cfreturn getPagesQuery>
    </cffunction>
</cfcomponent>