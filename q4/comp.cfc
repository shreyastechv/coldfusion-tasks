<cfcomponent>
    <cffunction name="printDate" returnType="string" access="public">
        <cfset result = "Todays Date: " & DateFormat(Now())>
        <cfset result = result & "<br>Current Month in numeric: " & DateFormat(Now(), "m")>
        <cfset result = result & "<br>Current Month in word: " & DateFormat(Now(), "mmmm")>

        <cfset daysAfterFriday = (DayOfWeek(Now()) + 1) % 7>
        <cfset lastFriday = DateFormat(DateAdd("d", -daysAfterFriday, Now()))>
        <cfset result = result & "<br>Last Friday date: " & lastFriday>

        <cfset daysTillMonthEnd = DaysInMonth(Now()) - Day(Now())>
        <cfset lastDayOfMonth = DateFormat(DateAdd("d", daysTillMonthEnd, Now()))>
        <cfset result = result & "<br>Last day of month: " & lastDayOfMonth>

        <cfset result = result & "<br>Last five days:<br>">
        <cfset weekClasses = ["sun", "mon", "tue", "wed", "thu", "fri", "sat"]>
        <cfloop index="i" from="1" to="5">
            <cfset prevDay = DateAdd("d", -i, Now())>
            <cfset formattedPrevDay = DateFormat(prevDay, "dd-mmm-yyyy - dddd")>
            <cfset weekClass = weekClasses[DayOfWeek(prevDay)]>
            <cfset result = result & "<p class=" & weekClass & ">" & formattedPrevDay & "</p>">
        </cfloop>

        <cfreturn result>
    </cffunction>
</cfcomponent>