<#import "parts/common.ftlh" as c>

<@c.page>
<h2>Users list</h2>
<table>
    <thead>
    <tr>
        <th>UserName</th>
        <th>First Name</th>
        <th>Second Name</th>
    </tr>
    </thead>
    <tbody>
    <#list employees as employee>
    <tr>
        <th>${employee.username}</th>
        <th><#if employee.firstName??>${employee.firstName}</#if></th>
        <th><#if employee.secondName??>${employee.secondName}</#if></th>
        <th><form action="/employer/inviteEmployee/${employee.id}?companyName=<#if company.name??>${company.name}<#else>not-found</#if>" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div><input type="submit" value="Invite employee"/></div>
        </form></th>
    </tr>
    </#list>
    </tbody>
</table>
</@c.page>