---
layout: post
title:  "Groupified SharePoint Online site being deleted without a properly associated group"
author: plamber
categories: [IT Pro, Governance, SharePoint]
tags: [PowerShell, SharePoint, Office 365, Microsoft 365]
featured: false
---
Our tenant uses Office 365 Unified Groups and their expiration policies that you can configure at tenant level [under this link](https://portal.azure.com/#blade/Microsoft_AAD_IAM/GroupsManagementMenuBlade/Lifecycle).
We configured it to expire after a specific period. Renewal notifications are emailed to group owners 30 days, 15 days, and one day before group expiration. If a group is not renewed, it is deleted along with its associated content from sources such as Outlook, SharePoint, Teams, and PowerBI.

<div class="alert success">
    Microsoft is going to introduce activity-based group expiration policies in Q1 2020. This will considerably reduce cases of users forgetting to extend a site while they are actively using it.
</div>

### An interesting anomaly with group expirations
We received complaints from a group of users complaining that their SharePoint Online site disappeared without prior notice. We fixed this problem by restoring the SharePoint Online site. We haven't performed additional checks because in many situations owners just missed the expiration notifications for their group.

A month later, the same group of users came back to us stating that their site disappeared again. We performed the restore but started to dig deeper into the case to see what might be the root cause by verifying the Office 365 audit logs.

![](../../assets/images/2019-08-28-14-41-33.png)

The *AAD to SharePoint Sync* user deleted twice the site in a month. This user is responsible for cleanup SharePoint Online sites after an Office 365 group has been deleted. Usually, once a group is being deleted, the associated site is marked to be deleted and then processed by a timer job at Microsoft.

At first sight, it looked that something is handled improperly by the life cycle management of group expirations. Therefore, we had to ensure that our site is a group. We did it by executing the following PowerShell script.

<script src="https://gist.github.com/plamber/1fe2f8f55a792965c833d2077d9b8d03.js"></script>

The output of the script returns the template that should contain the word *GROUP*, the GroupId, and the Owner of that site (which is the Group). 
Interestingly, everything was returned correctly except the GroupId. This GroupId was set to an empty GUID (*00000000-0000-0000-0000-000000000000*).

<div class="alert success">
A SharePoint Online site has an empty GroupId when a SharePoint Online restoring process is not able to restore the associated Office 365 Unified Group with that id. 
</div>

Our users haven't noticed any issues before since they were not using the group capabilities at all and started changing the permissions of the SharePoint Online site differently.

We opened a ticket at Microsoft and found out that SharePoint Online sites with an empty group id are currently being deleted from the timer job since they are not properly configured as a group. Unfortunately, this was not what we wanted to see.

### The solution
If you have a SharePoint site that is falling into this pattern, you have to associate it again to an Office 365 Unified Group. The easiest way to do this is by the following steps:
- append to your site collection URL */_layouts/creategroup.aspx?mode=connectgroup*. You will be redirected to a page that looks like this:
![](../../assets/images/2019-08-28-15-42-50.png)
- follow the steps to create a unified group and associate it with your site
- verify with the PowerShell script above if the GroupId property of your site collection changed to a non-empty GroupId

### The next steps
I asked Microsoft to open a change request for this behavior. Sites in this state shouldn't be deleted without proper mitigation from a SharePoint Online administrator. This case shows that the SharePoint site could still contain relevant information even if the group settings are no more properly configured. I will keep you updated.