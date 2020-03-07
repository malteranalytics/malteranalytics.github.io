---
layout: post
title:  "Return all Office 365 Groups without owners"
author: plamber
categories: [ Administration, IT Pro, Groups ]
tags: [Governance, Groups, Office 365, Microsoft 365]
featured: false
---
[Office 365 Groups](https://docs.microsoft.com/en-us/office365/admin/create-groups/office-365-groups?view=o365-worldwide) are a great way to give a group of people access to a collection of collaboration resources. This feature is extensively used for Office 365 resources such as Outlook, Yammer, Teams, and SharePoint Online.

With an increase of Office 365 Groups usage in a tenant, administrators and users need a way to clean up unused groups. The [Office 365 Group Expiration Policy](https://docs.microsoft.com/en-us/office365/admin/create-groups/office-365-groups-expiration-policy?view=o365-worldwide
) helps to achieve this goal by soft-deleting expired groups based on the expiration policy specified by an administrator.

The expiration policy works very well as long there is at least a group owner responding to the expiration notifications. In some situations, Office 365 Groups become over time groups without owners (e.g. due to a person leaving the company). This might lead to unwanted behaviors if nobody responds to group expiration notifications for a specific group.

Therefore, it is key to handle the use case of Microsoft 365 Groups without owners. Microsoft provides the option to specify an e-mail contact for groups without owners. This might be an appropriate solution for small customers with a few groups. It might become problematic for bigger customers with thousands of groups and users. An automated approach to handle these cases might be more appropriate for these cases.

No matter what policies you are going to implement, we have to identify the groups without owners first. In this code snippet, I am going to use a combination of [Pnp-Powershell](/Connect-to-SharePoint-Online-using-PNP-PowerShell) and the Graph API groups endpoint to retrieve the desired results. I have picked this path for two reasons:
- Have an easy way to retrieve the authentication token against the Graph API
- Perform a single query to get the desired results. I picked the Graph API endpoint instead of a combination of commandlets wit PNP-PowerShell such as [Get-PnpUnifiedGroup](https://docs.microsoft.com/en-us/powershell/module/sharepoint-pnp/get-pnpunifiedgroup?view=sharepoint-ps)

<script src="https://gist.github.com/plamber/9adcfdb62fc07fca4be7e78a44da6ab4.js"></script>


