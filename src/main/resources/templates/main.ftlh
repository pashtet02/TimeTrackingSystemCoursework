<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
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
    <a class="btn btn-primary" data-toggle="collapse" href="#addReport" role="button" aria-expanded="false"
       aria-controls="collapseExample">
        Create new report
    </a>
    <div class="collapse" id="addReport">
        <div class="form-group mt-3">
            <form method="post" action="/main">
                <div class="form-group">
                    <input class="form-control" type="text" name="description" placeholder="Введіть опис">
                </div>
                <div class="form-group">
                    <input class="form-control" type="number" name="hours" placeholder="Введіть кількість годин">
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
                <td><#if report.overtime>OVERTIME</#if></td>
                <td>${report.author.username}</td>
            </tr>
        </#list>
        </tbody>
    </table>
    </div>
</@c.page>