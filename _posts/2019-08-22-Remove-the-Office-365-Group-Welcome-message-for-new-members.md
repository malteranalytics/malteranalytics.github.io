---
layout: post
title:  "Remove the Office 365 Group Welcome message for new members"
author: plamber
categories: [IT Pro, Governance, Groups ]
tags: [PowerShell, Governance, Groups, Office 365, Microsoft 365]
featured: false
---
Office 365 Unified Groups used by several Office 365 services (e.g. Yammer, Exchange, Teams, SharePoint) send a welcome e-mail to newly added users of that specific group. This might be a good thing in many situations from an end-user perspective. On the other hand, you might have the necessity to disable this welcome e-mail for newly added members on that specific group.

At the time of writing, the welcome e-mail is governed on the group level only. Newly created groups have the e-mail notification enabled by default. The setting can be changed with PowerShell and does not have an option to change the setting for newly created groups on a tenant level. 
You can perform the changes with a *Global Administrator* or *Exchange Online Administrator* after having successfully connected to Exchange Online. I created a [post](/Connect-to-Exchange-Online-through-PowerShell) that explains how to do this depending on if your account is secured with MFA (multi-factor authentication) or not.

### Disable/Enable the welcome message for an individual group
Before running the code below do not forget to [connect to Exchange Online first](/Connect-to-Exchange-Online-through-PowerShell). You can enable or disable the welcome message for newly added members for an individual group.

<script src="https://gist.github.com/plamber/fe85da05b6715e04771283b8bbf664cf.js?file=disableEnableSingleGroup.ps1"></script>

### Disable/Enable the welcome message for all existing groups
You could disable/enable this setting on the bulk by going over all Unified Groups in your tenant. Since the tenant default setting cannot be changed, newly created groups will still have the welcome e-mail enabled. You might consider running the script more often over time due to this.

<script src="https://gist.github.com/plamber/fe85da05b6715e04771283b8bbf664cf.js?file=disableEnableAllGroups.ps1"></script>
