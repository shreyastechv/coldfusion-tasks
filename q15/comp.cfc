<cfcomponent>
    <cffunction name="multiply" returnType="string" access="public">
        <cfif  ArrayLen(arguments) IS 0>
            <cfset local.product = 0>
        <cfelse>
            <cfset local.product = 1>
        </cfif>
        <cfloop array="#arguments#" item="item">
            <cfset local.product *= item>
        </cfloop>
        <cfreturn local.product>
    </cffunction>
</cfcomponent>