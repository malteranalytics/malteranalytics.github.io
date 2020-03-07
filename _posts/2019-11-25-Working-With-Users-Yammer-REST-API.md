---
layout: post
title:  "Working with users using the Yammer REST API and PowerShell"
author: plamber
categories: [ Development, PowerShell, Yammer ]
tags: [Yammer, Office 365, Microsoft 365]
featured: false
series: YammerRestApi
---
In this post I would like to go through some of the endpoints in the [Yammer REST API](https://developer.yammer.com/docs/) handling user profiles in a network. 

<div class="alert success">
    You can generate the baerer token (access token) as described in <a href="/2019-09-01-Access-Yammer-API-Through-Rest">this</a> post. 
</div>

<div class="alert">
    Always consider the <a href="https://developer.yammer.com/docs/rest-api-rate-limits">REST API and Rate Limits</a> when accessing a Yammer network. 
</div>

### Retrieve the users in a network
The snippet presented in this section is retrieving the list of users in a network. By default the list returns batches of 50 users. You can find other parameters under the official [documentation](https://developer.yammer.com/docs/usersjson). The default sorting is alphabetically, but you might want to sort by messages or followers with the sort_by query string. If you have more than 50 users, you might want to use the the page parameter to get different batches. 

<div class="alert success">
    Check my blogpost to see how to get all users with a PowerShell commandlet <a href="/Get-All-Yammer-Users-Through-Rest-API-With-PowerShell">here</a>. 
</div>

<script src="https://gist.github.com/plamber/7186fad364fb671b7d6ebe06347ef68c.js?file=getusers.ps1"></script>

### Retrieve a user by ID
The next snippet shows how to retrieve a single user by id instead of accessing it through the whole network.

<script src="https://gist.github.com/plamber/7186fad364fb671b7d6ebe06347ef68c.js?file=retrieveuserbyid.ps1"></script>

### Retrieve a user by email
Retrieving a user by ID might not always be the option for you. Therefore, Yammer also provides you an endpoint to get the user by e-mail address.

<script src="https://gist.github.com/plamber/7186fad364fb671b7d6ebe06347ef68c.js?file=retrieveuserbymail.ps1"></script>


### Create a new user
With the snippet below you are going to create a user profile for a specific user. The service will return a StatusCode 201 if successful. If a user already exist in the network, you will get back a 400 bad request.

<script src="https://gist.github.com/plamber/7186fad364fb671b7d6ebe06347ef68c.js?file=createuser.ps1"></script>

### Delete a user by ID
The snippet below shows how to delete a user by ID. By specifying the delete=true parameter in the url, you are going to permanently delete the user. Otherwise, the user is just going to be suspended.

<script src="https://gist.github.com/plamber/7186fad364fb671b7d6ebe06347ef68c.js?file=deleteuserbyid.ps1"></script>
