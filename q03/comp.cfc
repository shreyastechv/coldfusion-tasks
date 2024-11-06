<cfcomponent>
    <cffunction name="checkNum" returnType="string" access="public">
        <cfargument required="true" type="string" name="numbers">
        <cfset local.newArray = ArrayNew(1)>
        <cfloop list="#arguments.numbers#" item="num">
            <cfif num % 3 IS NOT 0>
                <cfcontinue>
            </cfif>
            <cfset ArrayAppend(local.newArray, num)>
        </cfloop>
        <cfif ArrayIsEmpty(local.newArray)>
            <cfset local.result = "There is no multiple of 3 in given numbers.">
        <cfelse>
            <cfset local.result = ArrayToList(local.newArray)>
        </cfif>
        <cfreturn local.result>
    </cffunction>
</cfcomponent>