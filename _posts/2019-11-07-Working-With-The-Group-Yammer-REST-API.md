---
layout: post
title:  "Working with groups using the Yammer REST API and PowerShell"
author: plamber
categories: [ Development, PowerShell, Yammer ]
tags: [Yammer, Office 365, Microsoft 365]
featured: false
series: YammerRestApi
---
The Yammer REST API is well documented [here](https://developer.yammer.com/docs/). On the other hand, you might miss some documentation regarding some endpoints on that page. For example, there is no notion about how to interact with Yammer Groups. Fortunately, with a little bit of network tracing and by following the naming convention of the other endpoints, you might be able to identify how to interact with groups quite easily. This post summarizes how to access the groups endpoint.

<div class="alert success">
    You can generate the baerer token (access token) as described in <a href="/2019-09-01-Access-Yammer-API-Through-Rest">this</a> post. 
</div>

<div class="alert">
    Always consider the <a href="https://developer.yammer.com/docs/rest-api-rate-limits">REST API and Rate Limits</a> when accessing a Yammer network. 
</div>

## Retrieve the groups in a network
The snippet presented in this section is retrieving the list of groups in a network. You can then use this list and perform other operations.

<script src="https://gist.github.com/plamber/7186fad364fb671b7d6ebe06347ef68c.js?file=retrievegroups.ps1"></script>

## Retrieve a group by ID
The next snippet shows how to retrieve a single group by id instead of accessing it through the whole network.

<script src="https://gist.github.com/plamber/7186fad364fb671b7d6ebe06347ef68c.js?file=retrievegroupbyid.ps1"></script>

## Create a new group
The snippet presented below shows how to create a group by name. You can also specify additional paramters such as the privacy or group type. 

<script src="https://gist.github.com/plamber/7186fad364fb671b7d6ebe06347ef68c.js?file=creategroup.ps1"></script>

## Delete a group by ID
The snippet below shows how to delete a group by ID.

<div class="alert alert">
You need to be the administrator of that group or a verified admin that is member of that specific group. A verified admin can add him/herself by using the *group_memberships.json* endpoint. You will receive a 403 forbidden error message if you do not consider this.
</div>

<script src="https://gist.github.com/plamber/7186fad364fb671b7d6ebe06347ef68c.js?file=deletegroup.ps1"></script>
