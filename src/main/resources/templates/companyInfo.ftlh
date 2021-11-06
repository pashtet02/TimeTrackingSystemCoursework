<#import "parts/common.ftlh" as c>

<@c.page>
    <h2>Company info</h2>
    <#if company??>
        <label>Name: ${company.name}</label>
        <label>Country: ${company.country}</label>
        <label>Image:  <img src="/img/${company.image}" alt="company image"/></label>
        <label>Director: ${company.director.firstName} ${company.director.secondName}</label><br>
        <a href="/company/employees?companyId=${company.id}">Company employees</a>
    <#else>
        <label>You don`t have a company yet! <a href="/company/create">Create a company!</a></label>
    </#if>
</@c.page>