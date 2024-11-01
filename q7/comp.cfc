<cfcomponent>
    <cffunction name="checkNum" returnType="struct" access="public">
        <cfargument required="true" type="string" name="text1">
        <cfargument required="true" type="string" name="text2">
        <cfset newStruct = structNew()>
        <cfset newStruct[text1] = [text2]>
        <cfreturn newStruct>
    </cffunction>
</cfcomponent>