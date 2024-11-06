<cfcomponent>
    <cffunction name="printDate" returnType="struct" access="public">

        <cfset local.result = structNew()>

        <cfset local.result["todaysDate"] = DateFormat(Now())>
        <cfset local.result["currMonthInNum"] = DateFormat(Now(), "m")>
        <cfset local.result["currMonthInWord"] = DateFormat(Now(), "mmmm")>

        <cfset daysAfterFriday = (DayOfWeek(Now()) + 1) % 7>
        <cfset local.result["lastFriday"] = DateFormat(DateAdd("d", -daysAfterFriday, Now()))>

        <cfset daysTillMonthEnd = DaysInMonth(Now()) - Day(Now())>
        <cfset local.result["lastDayOfMonth"] = DateFormat(DateAdd("d", daysTillMonthEnd, Now()))>

        <cfset local.result["prevDays"] = []>
        <cfloop index="i" from="1" to="5">
            <cfset ArrayAppend(local.result["prevDays"], DateAdd("d", -i, Now()))>
        </cfloop>

        <cfreturn local.result>
    </cffunction>
</cfcomponent>