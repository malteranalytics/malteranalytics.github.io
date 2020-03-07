---
layout: post
title:  "How do I set my SharePoint Online site collection to read-only after a migration?"
author: plamber
categories: [IT Pro, Governance, SharePoint]
tags: [PowerShell, SharePoint, Office 365, Microsoft 365]
featured: false
---
Data consistency is key during the migration of contents between two SharePoint Online sites. You already agreed on the final migration slot with your stakeholders and you want to be sure that nobody is going to do changes after your migration without messing around with the SharePoint permissions?

The [SharePoint Online Management Shell](https://www.microsoft.com/en-us/download/details.aspx?id=35588) allows you to configure the *LockState* for your site. After migrations you want to set the site read-only without changing the site structure or SharePoint permissions at all. You can do this with following snippet.

<script src="https://gist.github.com/plamber/8293cef041907583b6a845c735ce99fd.js"></script>

Once the *LockState* is ste to *ReadOnly*, a message will appear on the site stating that the site is under maintenance. In my case, this was not working properly.

![](../../assets/images/2019-08-26-17-30-34.png)

You can also block the access to the site completely. For this scenario, you could use the *NoAccess* parameter instead of the *ReadOnly* parameter in the script above. For these types of sites, you can specify a global redirection to a dedicated page that you can specify with the *NoAccessRedirectUrl* parameter in the *Set-SPOtenant* command.

In case you have to rollback the changes, simply execute the above script with the *Unlock* parameter.