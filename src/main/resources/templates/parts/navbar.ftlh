<#include "security.ftlh">
<#import "login.ftlh" as l>
<#import "/spring.ftl" as spring/>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">Timer</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/main"><@spring.message "navbar.main"/></a>
            </li>
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/user"><@spring.message "navbar.users"/></a>
                </li>
            </#if>
            <#if isEmployer>
                <li class="nav-item">
                    <a class="nav-link" href="/employer/invite"><@spring.message "navbar.inviteEmployee"/></a>
                </li>
            </#if>
            <#if isEmployer || hasCompany>
            <li class="nav-item">
                <a class="nav-link" href="/company"><@spring.message "navbar.companyPage"/></a>
            </li>
            </#if>
            <#if user??>
                <li class="nav-item">
                    <a class="nav-link" href="/user/profile"><@spring.message "navbar.profile"/></a>
                </li>
            </#if>
        </ul>

        <div class="navbar-text mr-3">${name}</div>
        <@l.logout/>
    </div>
</nav>