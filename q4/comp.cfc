<cfcomponent>
    <cffunction name="printDate" returnType="struct" access="public">

        <cfset result = structNew()>

        <cfset result["todaysDate"] = DateFormat(Now())>
        <cfset result["currMonthInNum"] = DateFormat(Now(), "m")>
        <cfset result["currMonthInWord"] = DateFormat(Now(), "mmmm")>

        <cfset daysAfterFriday = (DayOfWeek(Now()) + 1) % 7>
        <cfset result["lastFriday"] = DateFormat(DateAdd("d", -daysAfterFriday, Now()))>
        
        <cfset daysTillMonthEnd = DaysInMonth(Now()) - Day(Now())>
        <cfset result["lastDayOfMonth"] = DateFormat(DateAdd("d", daysTillMonthEnd, Now()))>

        <cfset result["weekClasses"] = ["sun", "mon", "tue", "wed", "thu", "fri", "sat"]>
        <cfset result["prevDays"] = []>
        <cfloop index="i" from="1" to="5">
            <cfset ArrayAppend(result["prevDays"], DateAdd("d", -i, Now()))>
        </cfloop>

        <cfreturn result>
    </cffunction>
</cfcomponent>