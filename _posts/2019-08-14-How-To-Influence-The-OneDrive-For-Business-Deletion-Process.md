---
layout: post
title:  "How do I influence the OneDrive for Business deletion process?"
author: plamber
categories: [ Governance, OneDrive ]
tags: [PowerShell, OneDrive, Office 365, Microsoft 365]
featured: true
---
Users with a valid SharePoint Online license are eligible to get a dedicated OneDrive for Business site to store their contents. Just like a cloud-based personal hard drive. This OneDrive site will store all contents synchronized with the OneDrive for Business client or stored through other means to the OneDrive site.
 
At some point in time, the user might leave the company. Typically, such an event triggers the deletion of the user account in Office 365 either through a Microsoft 365 administrator or by the Active Directory synchronization process. After this event, the OneDrive for Business cleanup process kicks in for this user. It generally consists of following high-level steps:

* Account deletion is synchronized with the user profile store in SharePoint Online
* Regularly, a cleanup job is running in the background to verify these user profiles marked for deletion.
    * It will move the OneDrive site to the site collection recycle bin after the OneDrive retention period (default 30 days)
    * It will also look in the *My Site Cleanup* settings and verify if the *Enable access delegation* option is selected. If this is the case, the user's manager will be assigned as the site collection administrator for the OneDrive site and receive an e-mail notification explaining that the contents should be secured before the OneDrive retention period. The same e-mail will be sent out 14 days before the site is being moved to the site collection recycle bin. In case no manager is appointed, the *secondary owner* specified in the *My Site Cleanup* settings will be taken as a responsible person by this process. 
* A OneDrive site in the recycle bin has 93 days until it is permanently deleted. During this time, all hyperlinks to the site or documents will stop functioning. A SharePoint Online administrator can restore the site within these 93 days. 

### How do I change the default OneDrive retention period?
Go to the [StorageSettings](https://admin.onedrive.com/?v=StorageSettings) in the OneDrive for Business admin center and change the value from minimum 30 days to maximum 3650 days (10 years). 

You can also change this value using PowerShell by changing the *OrphanedPersonalSitesRetentionPeriod* parameter in the Set-SPOTenant commandlet. 

<script src="https://gist.github.com/plamber/7d82f1215ad6204eff16ac974184dd47.js"></script>

### Where do I change the My Site Cleanup settings?
You can change the *secondary owner* and the *Enable access delegation* option in the *My Site Settings* under the *User Profile* service settings. These are in the classic SharePoint admin site. You can directly access these pages by using this link *https://putYourTenantNameHere-admin.sharepoint.com/_layouts/15/Online/PersonalSites.aspx?PersonalSitesOverridden=1*.

#### Resources
- [OneDrive retention and deletion](https://docs.microsoft.com/en-us/onedrive/retention-and-deletion)
- [Set the OneDrive retention for deleted users](https://docs.microsoft.com/en-us/onedrive/set-retention)
- [Restore a deleted OneDrive](https://docs.microsoft.com/en-us/onedrive/restore-deleted-onedrive)