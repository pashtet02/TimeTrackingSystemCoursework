<#import "parts/common.ftlh" as c>

<@c.page>
    <h2>List of all ${company.name}`s company employees</h2>
    <div class="mt-2">
        <table class="table table-striped">
            <thead class="thead-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">NickName</th>
                <th scope="col">Position</th>
                <th scope="col">Email</th>
                <th scope="col">First name</th>
                <th scope="col">Second Name</th>
                <th scope="col">Statistics</th>
                <th scope="col">Fire</th>
            </tr>
            </thead>
            <tbody>
            <#list employees as employee>
                <tr>
                    <th>${employee.id}</th>
                    <th>${employee.username}</th>
                    <th><#if employee.position??>${employee.position}</#if></th>
                    <th><#if employee.email??>${employee.email}</#if></th>
                    <th><#if employee.firstName??>${employee.firstName}</#if></th>
                    <th><#if employee.secondName??>${employee.secondName}</#if></th>
                    <th><a href="/company/statistics/${employee.id}">statistics</a></th>
                    <th><a href="/employer/fire/${employee.id}">Fire ${employee.firstName}</a></th>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
    <div class="card-columns">
        <#list employees as employee>
            <div class="card my-3">
                <#if employee.profilePhoto??>
                    <img src="/img/${employee.profilePhoto}" class="card-img-top">
                </#if>
                <div class="m-2">
                    <span>${employee.username}</span>
                    <span><#if employee.position??>${employee.position}</#if></span>
                    <span><#if employee.email??>${employee.email}</#if></span>
                    <span><#if employee.firstName??>${employee.firstName}</#if></span>
                    <span><#if employee.secondName??>${employee.secondName}</#if></span>
                </div>
                <div class="card-footer text-muted">
                    <a href="/company/statistics/${employee.id}">statistics</a>
                    <a href="/employer/fire/${employee.id}">Fire ${employee.firstName}</a>
                </div>
            </div>
        <#else>
            No employees
        </#list>
    </div>
</@c.page>