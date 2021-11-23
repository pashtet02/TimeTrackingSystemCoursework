<#import "parts/common.ftlh" as c>
<#import "/spring.ftl" as spring/>

<@c.page>
    <h2><@spring.message "userEdit.header"/></h2>
    <form action="/user" method="post">
        <input type="text" name="username" value="${user.username}">
        <#list roles as role>
            <div>
                <label><input type="checkbox"
                              name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
            </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit"><@spring.message "userEdit.saveButton"/></button>
    </form>
</@c.page>