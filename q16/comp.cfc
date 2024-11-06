<cfcomponent>
    <cffunction name="printNumbers" returnType="array" access="public">
        <cfargument required="true" type="string" name="rows">
        <cfargument required="true" type="string" name="columns">

        <cfset local.array = ArrayNew(2)>
        <cfset local.value = 1>

        <cfloop from="1" to="#arguments.rows#" index="m">
            <cfloop from="1" to="#arguments.columns#" index="n">
                <cfset local.array[n][m] = local.value>
                <cfset local.value += 1>
            </cfloop>
        </cfloop>

        <cfreturn local.array>
    </cffunction>
</cfcomponent>