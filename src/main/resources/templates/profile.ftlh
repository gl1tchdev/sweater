<#import "parts/common.ftlh" as c>
<@c.page>
<h5>${username}</h5>
${message?ifExists}
<form method="post">

    <div class="form-group">
        <label for="exampleInputPassword1"> Password: </label>
        <div class="col-sm-6">
            <input class="form-control" type="password" name="password" placeholder="Password"/>
        </div>
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1"> Email: </label>
        <div class="col-sm-6">
            <input class="form-control" type="email" name="email" placeholder="somemails@example.com" value="${email!''}"/>
        </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button type="submit" class="btn btn-primary">Save</button>
</form>
</@c.page>

