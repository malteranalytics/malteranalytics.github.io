---
layout: post
title:  "Disable the list view threshold for a list or library?"
author: plamber
categories: [ Governance, SharePoint ]
tags: [PowerShell, SharePoint]
featured: false
---
The list view threshold is configured for SharePoint on-premises (and online) to ensure that users are not performing unnecessary expensive query operations on your SharePoint enviornment. Microsoft provides many suggestions on how to tackle large lists and improve the performance of these lists like in the article <a href="https://technet.microsoft.com/en-us/library/cc262813(v=office.14).aspx">here</a>. Since SharePoint 2013 the Search became one of the solutions to tackle queries over large lists. You will certainly find other articles in the web that suggest how you can avoid these thresholds.

Nevertheless, you will encounter the situation where large lists can't be avoided and you have to disable or increase the list view threshold for a short period of time. The limit of 5.000 items per query might be low in some situations for end users. The 20.000 item limit for site collection admins and auditors might also not always help. Farm administrators can change these values.

<div class="alert alert warning">
    You can influence these settings as farm administrator only on-premises. Furthermore, consider changing the values only temporarily and with least impact to your farm.
</div>

## The solution
Farm administrators can change the List View Threshold value in two different locations in a farm. It can either be done on web application level or single list or library level. Changing it on web application level will impact all site collections, lists and libraries, in that web application. This can be done in the central administration. 

- Navigate to the central admin
- Go to *Manage Web Applications* and select the desired web application
- In the ribbon locate *General Settings* -> *Resource Throttling*
- A dialog will open and you can specify the *List view threshold* for your users or *List view threshold for auditors and administrators* depending who you want to address

On the other hand, you should consider making the change only on single list or libraries to keep the impact in your farm lower. This can be done with PowerShell as shown in the next snippet. The script is disabling the throttling mechanism for the desired list in the desired web. Simply replace the $false parameter with $true to enable it again.

<script src="https://gist.github.com/plamber/814e1844b78b5edca89c02d1229d515b.js"></script>
