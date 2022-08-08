<#import "parts/common.ftlh" as c>
<@c.page>
<form method="get" class="row row-cols-lg-auto g-3 align-items-center" action="/main">
    <div class="col-12">
        <div class="input-group">
            <span class="input-group-text" id="basic-addon1">#</span>
            <input type="text" name="filter" class="form-control" aria-describedby="basic-addon1" placeholder="Search by tag" value="${(message.text)!''}">
        </div>
    </div>
    <div class="col-12">
        <button class="btn btn-primary" type="submit">Search</button>
    </div>
    <div>
    </div>
</form>
    <#include "parts/messageEdit.ftlh" />
    <#include "parts/messageList.ftlh" />
</@c.page>