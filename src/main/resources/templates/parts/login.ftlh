<#macro login path isRegisterForm>
<form action="${path}" method="post">
    <div class="form-group">
        <label for="exampleInputEmail1"> Username : </label>
        <div class="col-sm-6">
            <input class="form-control" type="text" name="username" placeholder="Username"/>
        </div>
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1"> Password: </label>
        <div class="col-sm-6">
            <input class="form-control" type="password" name="password" placeholder="Password"/>
        </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <#if !isRegisterForm> <a href="/registration">Register</a></#if>
    <button type="submit" class="btn btn-primary"><#if isRegisterForm>Create<#else>Sign In</#if></button>
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button type="submit" class="btn btn-primary">Log out</button>
</form>
</#macro>