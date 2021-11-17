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
                <td><#if report.overtime><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-moon-stars" viewBox="0 0 16 16">
                        <path d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278zM4.858 1.311A7.269 7.269 0 0 0 1.025 7.71c0 4.02 3.279 7.276 7.319 7.276a7.316 7.316 0 0 0 5.205-2.162c-.337.042-.68.063-1.029.063-4.61 0-8.343-3.714-8.343-8.29 0-1.167.242-2.278.681-3.286z"/>
                        <path d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z"/>
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