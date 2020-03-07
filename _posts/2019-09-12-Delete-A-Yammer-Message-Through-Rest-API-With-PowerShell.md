---
layout: post
title:  "Delete a Yammer message through the Yammer REST API with PowerShell"
author: plamber
categories: [ Development, PowerShell, Yammer ]
tags: [Yammer, Office 365, Microsoft 365]
featured: false
series: YammerRestApi
---
You can delete a message through API as described [here](https://developer.yammer.com/docs/messagesid). The snippet below shows how you can do it through PowerShell. You simply need a bearer token and the message id to delete.

<div class="alert success">
    You can generate the baerer token (access token) as described in <a href="/2019-09-01-Access-Yammer-API-Through-Rest">this</a> post. 
</div>

<div class="alert">
    Always consider the <a href="https://developer.yammer.com/docs/rest-api-rate-limits">REST API and Rate Limits</a> when accessing a Yammer network. 
</div>

To remove a message, you must either 
- have posted the message yourself
- be an administrator of the group the message was posted to or
- be an admin of the network the message is in

<script src="https://gist.github.com/plamber/7186fad364fb671b7d6ebe06347ef68c.js?file=deletemessage.ps1"></script>