<#import "parts/common.ftlh" as c>
<@c.page>
    <h3>Fire a ${employee.firstName} ${employee.secondName}</h3>

    <form action="/employer/fire/${employee.id}" method="post">
        <div><label>Firing reason: <input type="text" name="reason"/></label></div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div><input type="submit" value="Fire from a company!"/></div>
    </form>
</@c.page>