---
layout: post
title:  "Get all Yammer messages through the Yammer REST API with PowerShell"
author: plamber
categories: [ Development, PowerShell, Yammer ]
tags: [Yammer, Office 365, Microsoft 365]
featured: false
series: YammerRestApi
---
The Yammer REST Api allows you to return messages through the interface described [here](https://developer.yammer.com/docs/messagesjson). A call to that API returns a batch of 20 messages that can be limited to fewer messages with the *limit* operation. The drawback is that you can't ask for the last 500 messages without making multiple calls to the API.

Therefore, I created a PowerShell snippet that is doing the necessary Yammer API calls to return you the exact number of messages you would like to have. You can use this snippet as example on how you might handle other similar operations. 

<div class="alert success">
    You can generate the baerer token (access token) as described in <a href="/2019-09-01-Access-Yammer-API-Through-Rest">this</a> post. 
</div>

<div class="alert">
    Always consider the <a href="https://developer.yammer.com/docs/rest-api-rate-limits">REST API and Rate Limits</a> when accessing a Yammer network. 
</div>

<script src="https://gist.github.com/plamber/7186fad364fb671b7d6ebe06347ef68c.js?file=getallmessages.ps1"></script>