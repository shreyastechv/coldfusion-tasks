<cfcomponent>
    <cfset This.sessionManagement="Yes">

    <cffunction name="onSessionStart" returnType="void">
        <cfset StructDelete(Form, "text1")>
        <cfset StructDelete(Form, "text2")>
        <cfset Session.results = StructNew()>
    </cffunction>
</cfcomponent>