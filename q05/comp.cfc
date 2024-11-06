<cfcomponent>
    <cffunction name="DaysTillBday" returnType="string" access="private">
        <cfargument required="true" type="string" name="bday">

        <cfset local.thisYearBday = arguments.bday.setYear(Year(Now()))>
        <cfif DateCompare(local.thisYearBday, now()) EQ 1>
            <cfset local.nextBday = local.thisYearBday>
        <cfelse>
            <cfset local.nextBday = arguments.bday.setYear(Year(Now())+1)>
        </cfif>
        <cfreturn DateDiff("d", Now(), local.nextBday)+1>
    </cffunction>

    <cffunction name="checkDate" returnType="struct" access="public">
        <cfargument required="true" type="string" name="dob">
        <cfargument required="true" type="string" name="dobMom">

        <cfif DateCompare(arguments.dobMom, arguments.dob)>
            <cfset local.newStruct = structNew()>
            <cfset local.newStruct["age"] = DateDiff("yyyy", arguments.dob, Now())>
            <cfset local.ageMom = DateDiff("yyyy", arguments.dobMom, Now())>
            <cfset local.newStruct["momsAgeWhileDelivery"] = local.ageMom - local.newStruct["age"]>
            <cfset local.newStruct["daysTillBday"] = DaysTillBday(arguments.dob)>
            <cfset local.newStruct["daysTillBdayMom"] = DaysTillBday(arguments.dobMom)>
            <cfreturn local.newStruct>
        </cfif>
    </cffunction>
</cfcomponent>