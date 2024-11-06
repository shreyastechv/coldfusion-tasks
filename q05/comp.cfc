<cfcomponent>
    <cffunction name="DaysTillBday" returnType="string" access="private">
        <cfargument required="true" type="string" name="bday">

        <cfset thisYearBday = bday.setYear(Year(Now()))>
        <cfif DateCompare(thisYearBday, now()) EQ 1>
            <cfset nextBday = thisYearBday>
        <cfelse>
            <cfset nextBday = bday.setYear(Year(Now())+1)>
        </cfif>
        <cfreturn DateDiff("d", Now(), nextBday)+1>
    </cffunction>

    <cffunction name="checkDate" returnType="struct" access="public">
        <cfargument required="true" type="string" name="dob">
        <cfargument required="true" type="string" name="dobMom">

        <cfif DateCompare(dobMom, dob)>
            <cfset newStruct = structNew()>
            <cfset newStruct["age"] = DateDiff("yyyy", dob, Now())>
            <cfset ageMom = DateDiff("yyyy", dobMom, Now())>
            <cfset newStruct["momsAgeWhileDelivery"] = ageMom - newStruct["age"]>
            <cfset newStruct["daysTillBday"] = DaysTillBday(dob)>
            <cfset newStruct["daysTillBdayMom"] = DaysTillBday(dobMom)>
            <cfreturn newStruct>
        </cfif>
    </cffunction>
</cfcomponent>