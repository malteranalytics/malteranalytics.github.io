---
layout: post
title:  "Move SharePoint sites to a new location - Site Swap"
author: plamber
categories: [IT Pro, SharePoint]
tags: [PowerShell, SharePoint, Office 365, Microsoft 365]
featured: false
---
Microsoft introduced with the [SharePoint Online Management Shell](/2019-08-12-Connect-to-SharePoint-Online-using-PowerShell) version 16.0.8812.1200 the capability to swap SharePoint Online root site or */search* site in your tenant.

<div class="alert success">
   Tenants that were provisioned before April 2019 have only two ways to change the root site collection to a modern site. They can use the site swap feature presented in this post or enable the communication site feature. The latter feature is not available yet and will be useful for sites that already have contents. Microsoft will provide an update about this feature in the future.
</div>

Ensure that you have the latest version of the [SharePoint Online Management Shell](/2019-08-12-Connect-to-SharePoint-Online-using-PowerShell). The next code snippet shows how you could run the command.

<script src="https://gist.github.com/plamber/08db705a52fa98edf6c2d6e4942c7813.js"></script>

The script above will take the source site and store it either in the root site or */search* site of your tenant. The previous site in that location will be archived to the archive URL your are specifying. This allows you to rollback your changes if required.

### Some remarks
- The target site may return a *not found* (HTTP 404) error for a short period of time (up to about 5 minutes)
- Content will need to be recrawled to update the search index for the sites that have been swapped. This may take a period of time depending on various factors such as the amount of content in these sites. Anything dependent on the search index, may return incomplete results until the swapped sites have been recrawled.
- Anything dependent on *static* links (such as File Sync and OneNote files) will need to be manually corrected.

### Further resources
- [Modernize your root site](https://docs.microsoft.com/en-us/sharepoint/modern-root-site)
- [Invoke-SPOSiteSwap](https://docs.microsoft.com/en-us/powershell/module/sharepoint-online/invoke-spositeswap?view=sharepoint-ps)