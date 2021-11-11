<#import "parts/common.ftlh" as c>

<@c.page>
    <h2>Company Creator</h2>
    <form action="/company" method="post" enctype="multipart/form-data">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Company name:</label>
            <div class="col-sm-6">
                <input type="text" name="companyName" class="form-control" placeholder="Enter company name"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Company country:</label>
            <div class="col-sm-6">
                <input type="text" name="companyCountry" class="form-control" placeholder="Enter company country"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Company email:</label>
            <div class="col-sm-6">
                <input type="email" name="companyEmail" class="form-control" placeholder="Enter company email"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Company address:</label>
            <div class="col-sm-6">
                <input type="text" name="companyAddress" class="form-control" placeholder="Enter company address"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Company Website:</label>
            <div class="col-sm-6">
                <input type="text" name="companyWebSite" class="form-control" placeholder="Enter company web site"/>
            </div>
        </div>
        <div class="form-group">
            <div class="custom-file">
                <input type="file" name="image" id="customFile">
                <label class="custom-file-label" for="customFile">Choose company logo</label>
            </div>
        </div>
        <input type="hidden" value="${_csrf.token}" name="_csrf"/><br>
        <button class="btn btn-primary" type="submit">Create a company!</button>
    </form>
</@c.page>