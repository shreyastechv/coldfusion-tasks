<cfcomponent>
    <cffunction name="getCookieCount" returnType="numeric" access="public">
        <cfif NOT StructKeyExists(cookie, "visitsCounter")>
            <cfcookie name="visitsCounter" value=0>
        </cfif>
        <cfset cookie.visitsCounter += 1>
        <cfreturn cookie.visitsCounter>
    </cffunction>
</cfcomponent>