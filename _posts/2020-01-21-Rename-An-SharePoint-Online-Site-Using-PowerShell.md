---
layout: post
title:  "How do I rename a SharePoint Online site using PowerShell?"
author: plamber
categories: [ IT Pro, SharePoint ]
tags: [PowerShell, SharePoint, Office 365, Microsoft 365]
featured: false
---
A SharePoint Online administrator can change the SharePoint Online [site address](https://docs.microsoft.com/en-us/sharepoint/change-site-address). The interesting part of this feature is that in many situations Microsoft already considered how to limit the impact of such a change. Nevertheless, you should have a look into the [effects of changing a site address](https://docs.microsoft.com/en-us/sharepoint/change-site-address) before performing any operation. 

I created a sample script that shows you how to use PowerShell to perform a site change.

<script src="https://gist.github.com/plamber/111858beb76943a70a7588bee598460b.js"></script>

From the script, you can see that the operations are triggered by using the [Start-SPOSiteRename](https://docs.microsoft.com/en-us/powershell/module/sharepoint-online/start-spositerename?view=sharepoint-ps) command. This will queue a rename job that will be executed in the background. The command [Get-SPOSiteRenameState](https://docs.microsoft.com/en-us/powershell/module/sharepoint-online/Get-SPOSiteRenameState?view=sharepoint-ps) will return you the current status of the job. Once the job is marked as completed, you will have two sites in your tenant. You will have the site with the new URL and contents and a new site using the Template **Redirect#0**. This site will ensure that all requests pointing to the old URL will be redirected to the new URL. This site also ensures that nobody is able to request a new site with the old URL. 

In case you want to free up the old name, delete the site collection that has been created for redirection.