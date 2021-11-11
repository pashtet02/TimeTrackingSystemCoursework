<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
    <h2>${company.name}`s employees list</h2>
    <div class="card-columns">
        <#list employees as employee>
            <div class="card my-3">
                <#if employee.profilePhoto??>
                    <img src="/img/${employee.profilePhoto}" class="card-img-top">
                </#if>
                <div class="m-2">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Username: ${employee.username}</li>
                        <#if employee.position??><li class="list-group-item">Position ${employee.position}</li></#if>
                        <#if employee.email??><li class="list-group-item">Email: ${employee.email}</li></#if>
                        <#if employee.firstName??><li class="list-group-item">First name: ${employee.firstName}</li></#if>
                        <#if employee.secondName??><li class="list-group-item">Second Name: ${employee.secondName}</li></#if>
                    </ul>
                </div>
                <#if isEmployer>
                <div class="card-footer text-muted">
                    <a class="btn btn-info" href="/company/statistics/${employee.id}">Statistics</a>
                    <a class="btn btn-danger" href="/employer/fire/${employee.id}">Fire ${employee.firstName}</a>
                </div>
                </#if>
            </div>
        <#else>
            No employees
        </#list>
    </div>
</@c.page>