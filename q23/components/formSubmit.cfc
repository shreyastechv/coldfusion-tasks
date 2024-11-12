<cfcomponent>
    <cffunction name="submitForm" returnType="string" access="public">
        <cfargument name="jobRole" type="string" required="true">
        <cfargument name="relocateChoice" type="string" required="true">
        <cfargument name="startDate" type="string" required="true">
        <cfargument name="websiteUrl" type="string" required="true">
        <cfargument name="resume" type="string" required="true">
        <cfargument name="salaryReq" type="string" required="true">
        <cfargument name="firstName" type="string" required="true">
        <cfargument name="lastName" type="string" required="true">
        <cfargument name="mail" type="string" required="true">
        <cfargument name="phone1" type="string" required="true">
        <cfargument name="phone2" type="string" required="true">
        <cfargument name="phone3" type="string" required="true">

        <cfquery name="uploadData" datasource="test_sql_server">
            INSERT INTO employementApplication
            (jobRole, relocateChoice, startDate, websiteUrl, resumeFile, salary, firstName, lastName, mail, phone)
            VALUES (
                <cfqueryparam value="#arguments.jobRole#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.relocateChoice#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.startDate#" cfsqltype="cf_sql_date">,
                <cfqueryparam value="#arguments.websiteUrl#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.resume#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.salaryReq#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.firstName#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.lastName#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.mail#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.phone1&arguments.phone2&arguments.phone3#" cfsqltype="cf_sql_char">
            );
            SELECT jobRole FROM employementApplication WHERE mail=<cfqueryparam value="#arguments.mail#" cfsqltype="cf_sql_varchar">;
        </cfquery>
        <cfreturn uploadData.RecordCount IS NOT 0>
    </cffunction>
</cfcomponent>