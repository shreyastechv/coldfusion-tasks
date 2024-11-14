<cfcomponent>
    <cffunction name="multiply" returnType="string" access="public">
        <cfset local.product = 1>
        <cfloop array="#arguments#" item="num">
            <cfset local.product = local.product * num>
        </cfloop>
        <cfreturn local.product>
    </cffunction>
</cfcomponent>