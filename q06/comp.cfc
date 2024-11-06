<cfcomponent>
    <cffunction name="makeStruct" returnType="struct" access="public">
        <cfargument required="true" type="string" name="text1">
        <cfargument required="true" type="string" name="text2">

        <cfset newStruct = structNew()>
        <cfset newStruct[arguments.text1] = arguments.text2>
        <cfreturn newStruct>

    </cffunction>
</cfcomponent>