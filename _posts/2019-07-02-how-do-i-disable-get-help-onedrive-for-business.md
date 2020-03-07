---
layout: post
title:  "How do I disable the 'Get Help' or 'Send Feedback' option in OneDrive?"
author: plamber
categories: [ IT Pro, Governance, OneDrive ]
tags: [Governance, OneDrive, Office 365, Microsoft 365]
---
Microsoft introduced a 'Get Help' and 'Send Feedback' option for OneDrive for Business. This is a useful way for users to contact directly Microsoft inside the application. With this setting, users generate support tickets for OneDrive for Business by selecting either Get Help or Send feedback.

{:.center}
![](../assets/images/2019-07-12-16-53-49img_.png)

This is a welcome service provided by Microsoft reducing the ticket load for local IT. On the other hand, some organizations want to control the ticket flow using their own internal processes. For these situations, the options might be misleading for the own user base. Therefore, Microsoft allows to disable both settings using a tenant configuration.

You can change the default value using the SharePoint Online PowerShell commandlets with a user having at least SharePoint Online Administrator permissions.

<script src="https://gist.github.com/plamber/052d18e22986c8ce8906fcbe19b8ed05.js"></script>



