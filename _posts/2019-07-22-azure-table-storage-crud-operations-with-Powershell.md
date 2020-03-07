---
layout: post
title:  "Azure Table Storage CRUD operations with PowerShell"
author: plamber
categories: [ Development, Azure ]
tags: [PowerShell, Table Storage, Azure]
featured: false
---
In the past months I worked on several projects that automated the data collection of local IT assets. During this time, we decided to use the [Azure Table Storage](https://azure.microsoft.com/en-us/services/storage/tables/) service for storing data.

During this time, there was no easy way for me to perform CRUD operations with PowerShell. Meanwhile, you will be able to use the official Microsoft project [Az.Storage](https://github.com/Azure/azure-powershell). Nevertheless, I wanted to share the module that we are currently successfully using in our projects. I conveniently stored the project for you under [this Github repository](https://github.com/plamber/aztablestorage).

# Usage
Find here a summary how you can use this Module.

- Get the AZTableModule.psm1 and store it to your desired location
- Get your Azure Storage name and key. You will need it in the script

<script src="https://gist.github.com/plamber/fbe1585c2d41dfb94f1ca9bbfbd8a69e.js"></script>