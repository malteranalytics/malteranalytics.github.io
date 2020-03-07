---
layout: post
title:  "Get all Yammer users through the Yammer REST API with PowerShell"
author: plamber
categories: [ Development, PowerShell, Yammer ]
tags: [Yammer, Office 365, Microsoft 365]
featured: false
series: YammerRestApi
---
The Yammer REST Api allows you to return users through the interface described [here](https://developer.yammer.com/docs/). A call to that API returns a batch of 50 users. You need to call multiple times the API to get all your users from the directory if you have more than 50.

Therefore, I created a PowerShell snippet that is doing the necessary Yammer API calls to return you the complete list of users you have in your network. Please note that this script is not considering the <a href="https://developer.yammer.com/docs/rest-api-rate-limits">REST API and Rate Limits</a>.

<div class="alert success">
    You can generate the baerer token (access token) as described in <a href="/2019-09-01-Access-Yammer-API-Through-Rest">this</a> post. 
</div>

<div class="alert">
    Always consider the <a href="https://developer.yammer.com/docs/rest-api-rate-limits">REST API and Rate Limits</a> when accessing a Yammer network. 
</div>

<script src="https://gist.github.com/plamber/7186fad364fb671b7d6ebe06347ef68c.js?file=getallusers.ps1"></script>