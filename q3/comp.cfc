<cfcomponent>
    <cffunction name="checkNum" returnType="string" access="public">
        <cfargument required="true" type="string" name="numbers">
        <cfset array = ListToArray(numbers)>
        <cfset newArray = ArrayNew(1)>
        <cfloop index="i" from="1" to="#arrayLen(array)#">
            <cfif array[i] % 3 IS NOT 0>
                <cfcontinue>
            </cfif>
            <cfset ArrayAppend(newArray, array[i])>
        </cfloop>
        <cfif ArrayIsEmpty(newArray)>
            <cfset result = "There is no multiple of 3 in given numbers.">
        <cfelse>
            <cfset result = ArrayToList(newArray)>
        </cfif>
        <cfreturn result>
    </cffunction>
</cfcomponent>