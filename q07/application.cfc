<cfcomponent>
    <cfset this.sessionManagement="Yes">

    <cffunction name="onSessionStart" returnType="void">
        <cfset StructDelete(Form, "text1")>
        <cfset StructDelete(Form, "text2")>
        <cfset session.results = StructNew()>
    </cffunction>

</cfcomponent>