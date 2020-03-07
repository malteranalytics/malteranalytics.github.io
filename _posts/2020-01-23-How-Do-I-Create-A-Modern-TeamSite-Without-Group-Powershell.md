---
layout: post
title:  "How do I create an Office 365 modern site without Group in PowerShell?"
author: plamber
categories: [ IT Pro, SharePoint ]
tags: [PowerShell, SharePoint, Office 365, Microsoft 365]
featured: false
---
I created a script using the [SharePoint Online Management Shell](https://www.nubo.eu/Connect-to-SharePoint-Online-using-PowerShell/) to create a modern site without an Office 365 Group associated with it.

The script below is collecting some basic information about the site.

It creates a modern site without Office 365 Group by using the template value STS#3. The last command is going to set the external sharing with external identities without an anonymous link option.

<script src="https://gist.github.com/plamber/19eaad16742fa39567966ee86153c554.js"></script>

