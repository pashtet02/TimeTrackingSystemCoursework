<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
    <#include "parts/security.ftlh">
<@c.page>
<#--<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="main">
            <input class="form-control col-sm-3" type="number" min="0" max="24" name="filterHours"
                   value="<#if filterHours??>${filterHours}</#if>">
            <button type="submit" class="btn btn-primary ml-2">Find by hours</button>
        </form>
    </div>
</div>-->

    <#if user.hasCompany() && addReport!true>
        <a class="btn btn-primary" data-toggle="collapse" href="#addReport" role="button" aria-expanded="false"
           aria-controls="collapseExample">
            Create new report
        </a>
    <div class="collapse" id="addReport">
        <div class="form-group mt-3">
            <form method="post" action="/main">
                <div class="form-group">
                    <input class="form-control" type="text" name="description" value="Regular activity" placeholder="Введіть опис">
                </div>
                <div class="form-group">
                    <input class="form-control" min="0" max="24" type="number" value="8" name="hours" placeholder="Введіть кількість годин">
                </div>
                <div class="form-group">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="isOvertime">
                        <label class="form-check-label" for="gridCheck">
                            Overtime?
                        </label>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label mr-1">Type: </label>
                    <select class="form-control-sm-2" name="reportType">
                        <option value="work">Work</option>
                        <option value="vacation">Vacation</option>
                        <option value="sickLeave">Sick leave</option>
                        <option value="other">Other</option>
                    </select>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button class="btn btn-primary" type="submit">Create</button>
            </form>
        </div>
    </div>
    </#if>
    <#if downloadReport!false>
        <#if reports?has_content><a class="btn btn-primary" href="/download/${reports[0].author.id}">Download reports</a></#if>
    </#if>
    <div class="mt-2">
    <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Creation Date</th>
            <th scope="col">Activity type</th>
            <th scope="col">Number of hours</th>
            <th scope="col">Description</th>
            <th scope="col">Overtime</th>
            <th scope="col">Author</th>
        </tr>
        </thead>
        <tbody>
        <#list reports as report>
            <tr>
                <th scope="row">${report.id}</th>
                <td>${report.createdAt}</td>
                <td>${report.reportType.name()}</td>
                <td>${report.hours}</td>
                <td>${report.description}</td>
                <td><#if report.overtime><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cloud" viewBox="0 0 16 16">
                        <path d="M4.406 3.342A5.53 5.53 0 0 1 8 2c2.69 0 4.923 2 5.166 4.579C14.758 6.804 16 8.137 16 9.773 16 11.569 14.502 13 12.687 13H3.781C1.708 13 0 11.366 0 9.318c0-1.763 1.266-3.223 2.942-3.593.143-.863.698-1.723 1.464-2.383zm.653.757c-.757.653-1.153 1.44-1.153 2.056v.448l-.445.049C2.064 6.805 1 7.952 1 9.318 1 10.785 2.23 12 3.781 12h8.906C13.98 12 15 10.988 15 9.773c0-1.216-1.02-2.228-2.313-2.228h-.5v-.5C12.188 4.825 10.328 3 8 3a4.53 4.53 0 0 0-2.941 1.1z"/>
                    </svg><#else><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-brightness-high" viewBox="0 0 16 16">
                        <path d="M8 11a3 3 0 1 1 0-6 3 3 0 0 1 0 6zm0 1a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"/>
                    </svg> </#if></td>
                <td>${report.author.username}</td>
            </tr>
        </#list>
        </tbody>
    </table>
    </div>
</@c.page>