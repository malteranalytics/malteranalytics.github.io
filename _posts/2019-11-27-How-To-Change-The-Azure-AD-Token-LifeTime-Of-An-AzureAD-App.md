---
layout: post
title:  "Change the token lifetime of an Azure AD application"
author: plamber
categories: [ Development, AzureAD ]
tags: [Development, AzureAD]
featured: false
---
Azure AD allows to configure custom token lifetime policies for the access and refresh tokens. In your tenant you might have the token lifetime policy set to 1 hour for access tokens and 90 days for refresh tokens.

In some cases, you might want to change this policy for a dedicated Azure AD application. I received recently the requirement to reduce the token life time to 10 minutes and the refresh token to 30 minutes. I used the script below to perform this configuration.

<script src="https://gist.github.com/plamber/462cee58ff0f4a9968a7b2918bed707a.js"></script>
