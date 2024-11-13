<cfcomponent>
    <cffunction name="logOut" returnType="boolean" returnFormat="json" access="remote">
        <cfif StructKeyExists(session, "userRole")>
            <cfset StructDelete(session, "userRole")>
            <cfreturn true>
        <cfelse>
            <cfreturn false>
        </cfif>
    </cffunction>
</cfcomponent>