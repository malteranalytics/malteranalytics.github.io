---
layout: post
title:  "How do I create a custom connector for Microsoft Flow and PowerApps?"
author: plamber
categories: [ Development, Developer, Microsoft Flow, PowerApps ]
tags: [Development, Custom Connectors, Microsoft Flow, PowerApps, Microsoft 365]
featured: false
series: CustomConnectorsFlowAndPowerApps
---
> With this blog series, I am to provide you examples on how to build your custom connectors for Microsoft Flow and PowerApps. You can find the official documentation provided by Microsoft [here](https://docs.microsoft.com/en-us/connectors/custom-connectors/).

> You can download the source code for this series directly from my [GitHub repository](https://github.com/plamber/powerplattformcustomconnectors/).

The [Microsoft Power Platform](https://powerplatform.microsoft.com/en-us/) aims to improve productivity across your business with an integrated application platform that combines Power BI, PowerApps, and Microsoft Flow. Targeting the citizen developers in an organization, people can analyze (with Power BI), act (with PowerApps), and automate (with Microsoft Flow) solutions with no or less code. 

## What are data connectors?
PowerApps and Microsoft Flow use data connectors to interact with third-party systems. Data connectors are API wrappers that tell PowerApps and Microsoft Flow how an API is secured and consumed. More [than 200+ connectors](https://docs.microsoft.com/en-us/connectors/custom-connectors/) are already available in this platform increasing the interaction capabilities for these solutions. 

In some situations, an integration with an existing API in the cloud or on-premise is not available. For such use cases, developers can start creating their custom connectors that can be shared with individuals, the whole organization, or the rest of the world.

![](../../assets/images/2019-10-21-16-33-30.png)

## What is the end-user experience?
Custom connectors in an organization are accessible by Flow users using the *Custom* tab when selecting an action.

![](../../assets/images/2019-10-24-06-44-56.png)

Depending on how you defined your custom connector, users might also have the possibility to specify the triggers that are running their Flows based on your logic. 

One of the main reasons for introducing custom connectors is to reduce the complexity for your users to use your own or third-party REST APIs directly from the Powerplatform.

## Key considerations
Custom connectors are *just* wrappers around REST APIs. These connectors help define how your users are going to consume the API without the requirement to know how to access your REST service. Your ultimate aim is to simplify the consumption of your endpoints by providing your users with an interface they already know.

#### Defintion
Custom connectors are created from scratch, using an OpenAPI v2 definition, or through a Postman collection.

#### Hosting
The API can be hosted anywhere, in the cloud or even on-premises using the [on-premise data gateway](https://docs.microsoft.com/en-us/power-bi/service-gateway-custom-connectors). It does not matter if you are choosing Azure.

#### Security
When considering security, custom connectors can be anonymous or secured using OAuth 2.0, Basic authentication, API Keys, and Windows-based authentication (with the on-premises data gateway). 

#### The anatomy
A custom connector consists of following main components:
- *Actions* are the activities in your platform that allow you to pull or push data from a service.
- *Triggers* are events that trigger the execution of flows. For example, execute all flows if something changes in your system. You can implement these using webhooks or polling techniques.

#### Key Questions before starting
Before starting, you need to ask yourself these questions:

> **Is there already a data connector available to my users?**
>
> No need to build your custom connector. Just use what already exists.

> **Can I use an already existing REST API or do I have to build/use my own?**
>
> This helps you decide if you have to create a REST API from scratch or not.

> **Where should my REST API be hosted?**
>
> You can choose the target platform for your API. Cloud or on-premises.

> **How do I secure my API?**
>
> You have different authentication techniques that can be implemented.

> **Do I have the right licenses to create custom connectors?**
>
> Depending on your Flow plan, you might only have the possibility to create one custom connector.