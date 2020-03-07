---
layout: post
title:  "Connect to SharePoint Online using PowerShell"
author: plamber
categories: [ IT Pro, SharePoint ]
tags: [PowerShell, SharePoint, Office 365, Microsoft 365]
featured: false
series: "ConnectToMicrosoft365"
---
The SharePoint Online Management Shell is a Windows PowerShell module that can be installed on your Windows client or server. It is a set of commandlets that help you manage SharePoint Online users, sites, and site collections. Useful for the daily business and batch operations on multiple SharePoint Online sites. If you want to use it you need to have the following prerequisites:

- Have the SharePoint Online or global administrator role on your tenant
- Install the SharePoint Online Management Shell module

#### How do I install the SharePoint Online Management Shell module?
You can download the latest package from [this website](https://www.powershellgallery.com/packages/Microsoft.Online.SharePoint.PowerShell). 

If you have the latest PowerShell version installed, you can perform the installation procedure by using the *Install-Module* commandlet.

```powershell
Install-Module -Name Microsoft.Online.SharePoint.PowerShell 
```

You can validate the installation by running the *Get-Module* command. It will return all installed SharePoint Online Management Module versions on your machine.

```powershell
Get-Module -Name Microsoft.Online.SharePoint.PowerShell -ListAvailable | Select Name,Version 
```

#### How do I update the SharePoint Online Management Module?
The cloud is evolving, so their management modules. It is a good practice to update the PowerShell module to the latest version regularly on your machine. You can do this by using the Update-Module commandlet.

```powershell
Update-Module -Name Microsoft.Online.SharePoint.PowerShell 
```

#### How do I uninstall this module?
The module can be uninstalled by using the *Uninstall-Module* command. It will uninstall the latest version of the module on your machine.

```powershell
Uninstall-Module -Name Microsoft.Online.SharePoint.PowerShell 
```

#### How do I connect to SharePoint Online?
Before running any command against SharePoint Online site collections, you have to authenticate yourself using the *Connect-SPOService* command. If your account is secured with MFA (multi-factor authentication), the easiest way to connect is by using the sequence below.

```powershell
$tenant = "putYourTenantNameHere"
$spoAdminUrl = "https://$tenant-admin.sharepoint.com"

Connect-SPOService -Url $spoAdminUrl

# now execute your commands against SharePoint Online 
```

You can also use the variant below. Be aware, that it will not function for MFA secured accounts.

```powershell
$tenant = "putYourTenantNameHere"
$spoAdminUrl = "https://$tenant-admin.sharepoint.com"
$adminUPN = "putHereYourAdminUPN"

$adminCredentials = Get-Credential -UserName $adminUPN
Connect-SPOService -Url $spoAdminUrl -Credential $adminCredentials

# now execute your commands against SharePoint Online 
```
