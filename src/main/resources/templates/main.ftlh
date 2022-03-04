<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>
<div>Messages list</div>
    <form method="post" enctype="multipart/form-data">
        <input type="text" name="text" placeholder="Input text">
        <input type="file" name="file">
        <input type="text" name="tag" placeholder="Input tag">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit">Add</button>
    </form>
<br>
<div>Search by tag</div>
<form method="get" action="/main">
    <input type="text" name="filter" value="${message?ifExists}">
    <button type="submit">Search</button>
</form>
    <#list messages as message>
    <div>
        <b>${message.id}</b>
        <span>${message.text}</span>
        <i>${message.tag}</i>
        <strong>${message.authorName}</strong>
        <div>
            <#if message.filename??>
                <img src="/img/${message.filename}" alt="">
            </#if>
        </div>
    </div>
    <#else>
    No messages
    </#list>
<div><@l.logout/></div>
<span><a href="/user">Userlist</a></span>
</@c.page>