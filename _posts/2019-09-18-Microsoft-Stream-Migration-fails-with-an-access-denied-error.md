---
layout: post
title:  "Office 365 Video self-service migration to Microsoft Stream fails with an access denied error"
author: plamber
categories: [ Administration, IT Pro, Stream ]
tags: [Stream, Office 365, Microsoft 365]
featured: false
---
Microsoft enabled for Office 365 Video admins and Office 365 global administrators the possibility to migrate all videos to Microsoft Stream since Sep 10, 2019. The process is described in detail [here](https://docs.microsoft.com/en-us/stream/migrate-from-office-365).

An Office 365 Video admin and Office 365 global administrator will see the banner in Office 365 Video allowing them to trigger the migration process.

![](../../assets/images/2019-09-18-13-29-50.png)

Unfortunately, some of you might receive an access denied error message.

<div class="alert warning">
   "This may not be for you. It looks you don't have permissions to this content".
</div>

![](../../assets/images/2019-09-18-13-30-52.png)

The problem is that your account has not been explicitly assigned as Office 365 Video and Microsoft Stream administrator. 

<div class="alert warning">
    You also have to assign explicit permissions if you are global administrator.
</div>

### The solution

If you want to fix this, simply assign your account explicit permissions on both platforms. Your Office 365 Video and Stream administrators should be able to do this or a global administrator. I know, you have to assign your account explicit permissions on both platforms.
- Go to your Office 365 Video Portal Settings (https://YourTenantName.sharepoint.com/portals/hub/_layouts/15/videoportalsettings.aspx) and assign your account permissions
- Go to your [Microsoft Stream Admin Portal](https://web.microsoftstream.com/admin?view=Administrators) and assign your account explicit permissions
- Logoff from Office 365 and Login again
- Go to your Office 365 Video Portal https://YourTenantName.sharepoint.com/portals/hub/ and start again the migration process

The process will start successfully by showing you the screen that follows.

![](../../assets/images/2019-09-18-13-34-00.png)