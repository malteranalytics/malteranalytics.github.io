---
layout: post
title:  "Connect to Exchange Online through PowerShell"
author: plamber
categories: [ IT Pro, Exchange ]
tags: [PowerShell, Exchange, Office 365, Microsoft 365]
featured: false
series: "ConnectToMicrosoft365"
---
Exchange Online PowerShell allows you to manage your Exchange Online settings from the command line. As a SharePoint administrator, I usually need the commands that allow me to manager Office 365 Unified Groups and settings.

### How do I connect to Exchange Online without MFA?
The connection to Exchange Online can be performed by a Global Administrator, Exchange Online administrator, Service Desk administrator with a different set of permissions. If your administrative accounts are not secured with MFA (multi-factor authentication), you could start an Exchange Online session with the following code snippet.

<script src="https://gist.github.com/plamber/5e478f0ae5975df2cfb1dc1e8c2f51e2.js?file=withoutmfa.ps1"></script>

### How do I connect to Exchange Online with MFA?
As a good administrator, we know that our administrative accounts should be properly secured with MFA (no pun intended :)). Unfortunately, the PowerShell snippet above does not support multi-factor authentication. Luckily there is a dedicated *Exchange Online PowerShell Module* that supports multi-factor authentication. You can access the latest version of the module by following these steps:
- go to https://admin.portal.com
- go to the Exchange Online admin portal and click on the *Hybrid* menu
- click on *configure* to download the click-once application required to get the necessary PowerShell module
- connect through the *Connect-EXOPSSession* command in that module

![](../../assets/images/2019-08-22-14-54-27.png)

### Can I run the Exchange Online PowerShell Module in a separate PowerShell session?
For most of you going to the admin portal every time you want to start a new Exchange Online Powershell session might be annoying. There is a way, to run the Exchange Online PowerShell Module once downloaded with the steps above with this code snippet.

<script src="https://gist.github.com/plamber/5e478f0ae5975df2cfb1dc1e8c2f51e2.js?file=withmfa.ps1"></script>