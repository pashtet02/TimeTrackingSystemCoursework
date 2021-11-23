<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<#import "/spring.ftl" as spring/>

<@c.page>
    <h2><@spring.message "companyPage.createCompany"/></h2>
    <form action="/company" method="post" enctype="multipart/form-data">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"><@spring.message "companyPage.companyName"/></label>
            <div class="col-sm-6">
                <input type="text" name="companyName" class="form-control" placeholder="<@spring.message "companyPage.companyNamePlaceHolder"/>"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"><@spring.message "companyPage.companyCountry"/></label>
            <div class="col-sm-6">
                <input type="text" name="companyCountry" class="form-control" placeholder="<@spring.message "companyPage.companyCountryPlaceHolder"/>"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"><@spring.message "companyPage.companyEmail"/></label>
            <div class="col-sm-6">
                <input type="email" name="companyEmail" class="form-control" placeholder="<@spring.message "companyPage.companyEmailPlaceHolder"/>"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"><@spring.message "companyPage.companyAddress"/></label>
            <div class="col-sm-6">
                <input type="text" name="companyAddress" class="form-control" placeholder="<@spring.message "companyPage.companyAddressPlaceholder"/>"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"><@spring.message "companyPage.companyWebSite"/></label>
            <div class="col-sm-6">
                <input type="text" name="companyWebSite" class="form-control" placeholder="<@spring.message "companyPage.companyWebSitePlaceholder"/>"/>
            </div>
        </div>
        <div class="form-group">
            <div class="custom-file">
                <input type="file" name="image" id="customFile">
                <label class="custom-file-label" for="customFile"><@spring.message "companyPage.chooseLogo"/></label>
            </div>
        </div>
        <input type="hidden" value="${_csrf.token}" name="_csrf"/><br>
        <button class="btn btn-primary" type="submit"><@spring.message "companyPage.createCompanyButton"/></button>
    </form>
</@c.page>