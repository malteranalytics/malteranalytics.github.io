---
layout: post
title:  "Feedback matters: Restrict permissions to app-only Azure AD applications consuming Office 365 services on resource level"
author: plamber
categories: [ UserVoice, Development, AAD, SharePoint ]
tags: [AAD, SharePoint, Office 365, Microsoft 365]
featured: false
---
I submitted a request at the [Microsoft Graph uservoice](https://microsoftgraph.uservoice.com/forums/920506-microsoft-graph-feature-requests/suggestions/37796059-restrict-permissions-to-app-only-azure-ad-applicat) regarding some improvements of the way app-only permissions are handled in Office 365 on May 31st. In a short timeframe this suggestion became the top2 request for Microsoft Graph. Just 24 days after my request, the product group team told us that they are working on the solution to this problem. 

#### Why does this matter? ####
Feedback is taken seriously by Microsoft. User voice is the perfect way to communicate missing Microsoft 365 features no matter how big your company is. If this is a feature requested by many other users, Microsoft will start considering the implementation for that feature.
Therefore, if you are missing some key features that are improtant to your business, do not hesitate to check user voice. Maybe somebody already made a similar request, so give them your vote. If the request has not been made yet, create a new request by yourself. Also ask the community to support you in your idea. This will help to push the request accordingly.

#### What has been requested in your concrete case? ####
Large organization starts leveraging the Graph API to provide integrations between its third-party applications and Office 365. In such companies, it is common to delegate the development of integrations from the central IT organization to other business units. 
The current app-only permission privileges are not appropriate for such types of setups since there is currently no way to limit the permissions for that app to a specific resource in Office 365. This makes such use cases impossible to implement.

As an example, we could consider SharePoint Online. Whenever a business unit has to develop a daemon tool that exchanges data between their third party system and a SharePoint Online resource (a subset of site collections, an individual site, even a list), this cannot be done without granting them access to all SharePoint resources of that organization. This is because app-only permissions for an application are considered as an *all or nothing* type of permission for that application.

You could take a similar example with Exchange Online resources. Also in that specific case, there is no way to limit the permissions to individual mailboxes.

These are the ways to implement such type of scenarios: 
* Fallback to the *classic* API and authentication model (in SharePoint addin development). This has the drawback of not leveraging the Graph API. Furthermore, this type of application is unaware of conditional access mechanisms, making it a possible security thread for such organizations. 
* Create a cloud identity and an application with delegated permissions. Grant to this cloud identity the necessary rights to the desired resource and then authenticate against the environment with username, password + app. This has the disadvantage of higher complexity and the need to use cloud identities since federated identities are not working in such a scenario. The usage of a service account is also not ideal

It would be awesome to obtain a way to limit such types of applications on the resource level. In theory, you could also only request an *admin consent* in case an application really requires access to all SharePoint Online resources. For such types of scenarios, admin consent is not necessarily required as long we are ensuring the application has access to specific resources only.

#### What has happened so far? ####
* 31st May 2019: submission
* 24th June 2019: Microsoft responds that they are working on it 
