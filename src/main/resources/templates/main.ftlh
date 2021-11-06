<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>
    <div>
        <@l.logout/>
    </div>
<div>
    <form method="post" action="/main" enctype="multipart/form-data">
        <input type="datetime-local" name="createdAt" placeholder="Введіть дату" />
        <input type="number" name="hours" placeholder="Введіть кількість годин">
        <input type="file" name="file">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit">Додати</button>
    </form>
</div>
<div>Список репортів</div>
<form method="get" action="main">
    <input type="number" min="0" max="24" name="filterHours" value="<#if filterHours??>${filterHours}</#if>">
    <button type="submit">Знайти по годинах</button>
</form>
<#list reports as report>
<div>
    <b>${report.id}</b>
    <span>${report.createdAt}</span>
    <strong>${report.author.username}</strong>
    <i>${report.hours}</i>
</div>
    <#else> No reports
</#list>
</@c.page>