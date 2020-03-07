---
layout: post
title:  "Manage the group memberships using the Yammer REST API and PowerShell"
author: plamber
categories: [ Development, PowerShell, Yammer ]
tags: [Yammer, Office 365, Microsoft 365]
featured: false
series: YammerRestApi
---
This post will show how to use the Yammer REST API for managing the group memberships of a group. You can find the documentation of the Yammer REST API [here](https://developer.yammer.com/docs/).

<div class="alert success">
    You can generate the baerer token (access token) as described in <a href="/2019-09-01-Access-Yammer-API-Through-Rest">this</a> post. 
</div>

<div class="alert">
    Always consider the <a href="https://developer.yammer.com/docs/rest-api-rate-limits">REST API and Rate Limits</a> when accessing a Yammer network. 
</div>

### Add a member to a group
<p>You can use the snippet below to add a new member to a group. The group id can be retrieved using the techniques explained in a <a href="/2019-09-04-Working-With-The-Group-Yammer-REST-API">previous post</a>.</p>

<script src="https://gist.github.com/plamber/7186fad364fb671b7d6ebe06347ef68c.js?file=joingroup.ps1"></script>

### Leave a group
You can leave a group by using the script below.

<script src="https://gist.github.com/plamber/7186fad364fb671b7d6ebe06347ef68c.js?file=leavegroup.ps1"></script>