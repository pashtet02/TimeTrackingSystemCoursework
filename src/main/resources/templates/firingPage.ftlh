<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<#import "/spring.ftl" as spring/>

<@c.page>
    <h3><@spring.message "firingPage.header"/> ${employee.firstName} ${employee.secondName}</h3>

    <form action="/employer/fire/${employee.id}" method="post">
        <div><label><@spring.message "firingPage.reason"/> <input type="text" name="reason"/></label></div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div><input type="submit" value="<@spring.message "firingPage.fireButton"/>"/></div>
    </form>
</@c.page>