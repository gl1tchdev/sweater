<#include "security.ftlh">
<#import "login.ftlh" as l>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand ms-3" href="#">SWEATER</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav me-auto">
      <li class="nav-item">
        <a class="nav-link" href="#">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/main">Messages</a>
      </li>
      <#if isAdmin>
        <li class="nav-item">
            <a class="nav-link" href="/user">User list</a>
        </li>
      </#if>
      <#if known>
        <li class="nav-item">
            <a class="nav-link" href="/user/profile">Profile</a>
        </li>
      </#if>
    </ul>
        <#if known>
            <span class="navbar-text me-3">${name}</span>
            <div class="me-3"><@l.logout/></div>
        <#else>
        <a href="/login" class="btn btn-primary me-3"/>Login</a>
        </#if>
    </ul>
  </div>
</nav>