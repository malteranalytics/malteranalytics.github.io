---
layout: post
title:  "Connect to SharePoint Online using PNP-PowerShell"
author: plamber
categories: [ IT Pro, SharePoint ]
tags: [PowerShell, SharePoint, Office 365, Microsoft 365]
featured: false
series: "ConnectToMicrosoft365"
---
The [PNP-PowerShell](https://github.com/SharePoint/PnP-PowerShell) is a library of PowerShell commands that allows you to perform complex provisioning and artifact management actions towards SharePoint. I see these commands as a valuable extension to the existing [SharePoint Online Management Shell](/Connect-to-SharePoint-Online-using-PowerShell).

Useful for the daily business and batch operations on multiple SharePoint Online sites or Office 365 Groups. If you want to use it you need to have the following prerequisites:

- Have the SharePoint Online or global administrator role on your tenant
- Install the PnP-PowerShell module

#### How do I install the PnP-PowerShell module?
If you have the latest PowerShell version installed, you can perform the installation procedure by using the *Install-Module* commandlet.

```powershell
Install-Module -Name SharePointPnPPowerShellOnline
```

You can validate the installation by running the *Get-Module* command. It will return all installed PNP-PowerShell versions on your machine.

```powershell
Get-Module -Name SharePointPnPPowerShellOnline -ListAvailable | Select Name,Version 
```

#### How do I update the PNP-PowerShell Module?
You can update the PowerShell module by using the Update-Module commandlet.

```powershell
Update-Module -Name SharePointPnPPowerShellOnline 
```

#### How do I uninstall this module?
The module can be uninstalled by using the *Uninstall-Module* command. It will uninstall the latest version of the module on your machine.

```powershell
Uninstall-Module -Name SharePointPnPPowerShellOnline 
```

#### How do I connect to SharePoint Online?
Before running any command against Office 365 assets, you have to authenticate yourself using the *Connect-PnPOnline* command. You can find a description of this command [here](https://docs.microsoft.com/en-us/powershell/module/sharepoint-pnp/connect-pnponline?view=sharepoint-ps).