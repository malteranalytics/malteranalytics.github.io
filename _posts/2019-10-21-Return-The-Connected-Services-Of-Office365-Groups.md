---
layout: post
title:  "Return the Office 365 Groups' connected services through PowerShell"
author: plamber
categories: [ Administration, IT Pro, Groups ]
tags: [Governance, Groups, Office 365, Microsoft 365]
featured: false
---
The introduction of [Office 365 Groups](https://docs.microsoft.com/en-us/office365/admin/create-groups/office-365-groups?view=o365-worldwide) is improving the way Microsoft 365 services are linked together and how the permissions are handled for them. On top of that, you get a consolidated way of handling the life cycle of such services. This consolidation is welcome, on the other hand, service owners want to get an overview of the Office 365 groups linked to their main services.

I started to receive requests such as:
> What are the Yammer groups linked with an Office 365 Group and their associated SharePoint Online site?

> What are the Teams connected with a group and what are the directly associated services to it?

Based on these requests, I started looking for some reporting capabilities or APIs to answer these questions. Unfortunately, I ended up finding the Azure Active Directory interface for groups when looking at group details. At the bottom of the page, it shows the section *Group links* providing exactly the information I needed.

![](../../assets/images/2019-10-21-10-22-46.png)

I was stuck and opened a premier case to understand the options at our disposal and how to collect this information through API. After a couple of days, I received the feedback that at this moment the only efficient way to get this information is by consuming the *Get-UnifiedGroup* PowerShell command provided by the Exchange Online Team. 
The results produced by this commandlet have to be interpreted with this logic:
- For Microsoft Teams or Yammer, the property is *ServiceEndpointUris*, if it is empty, this means group is not linked, if it is filled, the URI listed will indicates if it is Yammer or Teams. 
- For SharePoint Online, the property is *SharePointSiteUrl*, if it is empty, this means group is not linked.
- For Exchange Online, the property is *InboxUrl*, if it is empty, this means group is not linked.

I ended up writing a PowerShell script that is extending the objects returned by *Get-UnifiedGroup* with following properties:
- HasYammer: indicates if the group is linked with Yammer
- HasTeams: indicates if the group is linked with Teams
- HasSharePoint: indicates if the group is linked with SharePoint 
- HasMail: indicates if the group is linked with Exchange

<script src="https://gist.github.com/plamber/0ec71d9fd3415190f0a315f0ab17b973.js"></script>

<div class="alert warning">
    I am using the technique described <a href="https://www.nubo.eu/Connect-to-Exchange-Online-through-PowerShell">here</a> to connect to Exchange Online.
</div>


