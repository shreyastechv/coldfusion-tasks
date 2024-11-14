<cfcomponent>
    <cffunction name="fetchRoles" returnType="query" access="public">
        <cfquery name="local.getRolesQuery">
            SELECT roleId, roleName
            FROM roles
        </cfquery>
        <cfreturn local.getRolesQuery>
    </cffunction>
</cfcomponent>