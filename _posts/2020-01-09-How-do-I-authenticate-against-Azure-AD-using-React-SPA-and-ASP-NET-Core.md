---
layout: post
title:  "How do I authenticate against Azure AD using React, MSAL.JS and ASP.NET Core 3.0?"
author: plamber
categories: [ Development, AzureAD ]
tags: [Development, AzureAD, React, ASPNET.CORE]
featured: false
---
Microsoft is evolving the Azure Active Directory (v1.0) endpoints into the new Microsoft identity platform (v2.0). You should give it a try and consider a move to this new platform. [This article](https://docs.microsoft.com/en-us/azure/active-directory/develop/azure-ad-endpoint-comparison) if you are interested to understand more and identify the main reasons for performing the switch.

From a software development perspective, you used ADAL (Azure Active Directory Library) to help you get authenticated against the old Azure Active Directory (v1.0) services. If you want to integrate your application with the Microsoft identity platform (v2.0), you can use MSAL (Microsoft Authentication Library) instead. An overview of MSAL is given [here](https://docs.microsoft.com/en-us/azure/active-directory/develop/msal-overview). 

## The scenario
I wanted to implement both, an ASP.NET Core project to act as an API backend, and a standard CRA React project to act as a UI, but with the convenience of hosting both in a single app project that can be built and published as a single unit. 
The authentication has to be handled on the client-side forcing the user to authenticate once accessing any page. Once authenticated, I wanted to provide simple user information about the logged-in user using Microsoft Graph.

You can find the results of this project in [this GitHub](https://github.com/plamber/MSAL-Authenticationsamples/tree/master/MSAL-Authenticationsamples/AAD-React-AspNetCore). I used the existing [React project template with ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/client-side/spa/react?view=aspnetcore-3.1&tabs=visual-studio) as a foundation for my project.

## What is the website doing?
The users are immediately forced to authenticate themselves once accessing the website. MSAL.JS is used to handle the whole authentication flow. For this, an Azure AD application was registered on the target tenant. 

Once authenticated, the user sees basic information about him/her on the upper-right corner. This information is coming from the authentication token provided by Azure AD. If you just want to authenticate the user using Azure AD, we are already done. 

I also added a section that shows how to get the basic information about the user using Microsoft Graph. This is handled by the page *Get Graph data* and the Microsoft Graph JavaScript libraries included in the project.

![](../assets/images/2020-01-09-09-30-33.png)

At this stage, there is no further interaction with ASP.NET Core. I am not consuming any secured API on our back-end. This will be handled in a future post.

## How do I get started?
- fork/clone [this GitHub repository](https://github.com/plamber/MSAL-Authenticationsamples/)
- open the project under MSAL-Authenticationsamples/AAD-React-AspNetCore

If you just want to test it without additional hassle, just run the project. I already configured a multi-tenant application in my test tenant that allows you to authenticate against Azure AD. 

Follow the steps below if you want to have your dedicated Azure AD application.

### I want to use my dedicated Azure AD application
If you want to use your dedicated Azure AD application, follow these basic steps. You need to ensure that you are properly configuring a new application in Azure AD. Once configured, you need to change the configuration of the application in the code.

#### Register your app
- Go to the [App Registration in Azure AD](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/RegisteredApps)
- Press *New registration*
- Specify a name and choose the desired account types (Single tenant, Multitenant) and then press *Register*
- Copy the *Application (client) ID* (**yourClientID**) and *Directory (tenant) ID* (**yourTenantID**)
- Go to *Authentication*
  - Under *Redirect URIs* create two entries: https://localhost:44321/signin-oidc, https://localhost:44366/
  - Under *Implicit grant* select *Access tokens* and *ID tokens* 

#### Change the configuration in Visual Studio to use your created application
- Go under *ClientApp* -> *src* -> *msal* -> *MsalConfig.js*
  - Replace the *clientId* value with **yourClientID**
  - In case you configured a single tenant application, replace *common* in the *authority* value with **youTenantID**
    
## Key aspects in the code
The app is using the [React project template with ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/client-side/spa/react?view=aspnetcore-3.1&tabs=visual-studio) as a basis. I just removed the unnecessary *Weather* controllers and added some minor things.

### Install the required client-side libraries
I used NPM to install the necessary client-side libraries. *msal* is used to get MSAL.JS while *@microsoft/microsoft-graph-client* is used for the Microsoft Graph integration part.

In *package.json* you should find these entries.

```
"@microsoft/microsoft-graph-client": "^2.0.0",
"msal": "^1.2.0",
```

### Forcing the authentication in React
One of my requirements was to force the authentication whenever a user is accessing a page. To implement this, I found it convenient to use the React [Higher-Order Component pattern](https://reactjs.org/docs/higher-order-components.html) to encapsulate the MSAL.JS authentication logic. The *MsalAuthProvider.js* is responsible for this part. The authentication is handled by the logic below. If a user is not authenticated, authenticate him/her using the Azure AD settings in our config.

``` javascript
async componentWillMount() {
    msalAuth.handleRedirectCallback(() => {
        let userAccount = msalAuth.getAccount();

        this.setState({
            isAuthenticated: true,
            user: userAccount
        });
    }, (authErr, accountState) => {  // on fail
        console.log(authErr);

        this.setState({
            hasError: true,
            errorMessage: authErr.errorMessage
        });
    });

    if (msalAuth.isCallback(window.location.hash)) {
        this.setState({
            auth: {
                renewIframe: true
            }
        });
        return;
    }

    let userAccount = msalAuth.getAccount();
    if (!userAccount) {
        msalAuth.loginRedirect({});
        return;
    } else {
        this.setState({
            isAuthenticated: true,
            user: userAccount
        });
    }
}
```

This function is used in the *App.js* file to wire-up the authentication and associate it with the main React app using the High-Order Component pattern.

```
class RootApp extends Component {
    render() {
        return (
            <Layout {...this.props} >
                <Route exact path='/' component={Home} />
                <Route exact path='/graph-data' component={GraphData} />
            </Layout>
        );
    }
}
export const App = withAuth(RootApp);
```

The *GraphData.js* file is handling the creation of the Graph client and the retrieval of the graph information of the user. You can find under *GraphService.js* the part of the code which is requesting a new token for the Graph request.

```
const accessTokenRequest = {
    scopes: ["user.read"]
}
var accessToken = null;
try {
    accessToken = await msalAuth.acquireTokenSilent(accessTokenRequest);
}
catch (error) {
    console.log("AquireTokenSilent failure");
    accessToken = await msalAuth.acquireTokenPopup(accessTokenRequest);
}

if (accessToken) {
    var user = await getUserDetails(accessToken);
```

Go and change the *MsalConfig.js* if you want to manipulate the authentication settings for MSAL.JS. You can find the configuration options of MSAL.JS under [this link](https://docs.microsoft.com/en-us/azure/active-directory/develop/msal-js-initializing-client-applications). 

### Summarizing
With [this GitHub project](https://github.com/plamber/MSAL-Authenticationsamples/tree/master/MSAL-Authenticationsamples/AAD-React-AspNetCore) I am showing you how to authenticate against Azure AD using React and ASP.NET core. I will improve the current code and provide more samples on that repository. 

Happy coding.
