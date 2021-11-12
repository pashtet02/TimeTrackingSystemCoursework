<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">


<@c.page>
    <h5>${username}</h5>
    ${message!}
    <form method="post" enctype="multipart/form-data">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Password:</label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" placeholder="Password" />
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Email:</label>
            <div class="col-sm-6">
                <input type="email" name="email" class="form-control" placeholder="some@some.com" value="${email!''}" />
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Photo:</label>
            <div class="custom-file col-sm-6">
                <input type="file" name="image" id="customFile">
                <label class="custom-file-label" for="customFile">Choose profile photo</label>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" type="submit">Save</button>
    </form>
</@c.page>