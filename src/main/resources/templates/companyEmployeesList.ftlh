<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<#import "/spring.ftl" as spring/>

<@c.page>
    <h2>${company.name}<@spring.message "companyEmployees.headerTail"/></h2>
    <div class="card-columns">
        <#list employees as employee>
            <div class="card my-3">
                <#if employee.image??>
                    <img src="/img/${employee.image}" class="card-img-top" height="240">
                <#else>
                    <img src="https://png.pngitem.com/pimgs/s/517-5177724_vector-transparent-stock-icon-svg-profile-user-profile.png"
                         class="card-img-top" width="70" height="240">
                </#if>
                <div class="m-2">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><@spring.message "companyEmployees.username"/> ${employee.username}</li>
                        <#if employee.position??><li class="list-group-item"><@spring.message "companyEmployees.position"/> ${employee.position}</li></#if>
                        <#if employee.email??><li class="list-group-item"><@spring.message "companyEmployees.email"/> ${employee.email}</li></#if>
                        <#if employee.firstName??><li class="list-group-item"><@spring.message "companyEmployees.firstName"/> ${employee.firstName}</li></#if>
                        <#if employee.secondName??><li class="list-group-item"><@spring.message "companyEmployees.secondName"/> ${employee.secondName}</li></#if>
                    </ul>
                </div>
                <#if isEmployer>
                <div class="card-footer text-muted">
                    <a class="btn btn-info" href="/company/statistics/${employee.id}"><@spring.message "companyEmployees.statistics"/></a>
                    <a class="btn btn-danger" href="/employer/fire/${employee.id}"><@spring.message "companyEmployees.fireButton"/> ${employee.firstName}</a>
                </div>
                </#if>
            </div>
        <#else>
            <@spring.message "companyEmployees.noEmployees"/>
        </#list>
    </div>
</@c.page>