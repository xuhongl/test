# Run a load test on your APIM service and identify bottlenecks

This tutorial walks you through load testing a sample API exposed by Azure API Management (APIM) to identify performance bottlenecks.
The load testing tool will simulate a pre defined API traffic to exercice the APIM service and API backend.
Based on the results, you will be able to validate the right sizing and configuration of your APIM service and API backend.

You will be guided through the following steps:
* Set up a sample API hosted on Azure App Service and an Azure API Management service that will surface this API.
* Run load tests against this architecture using different configurations and scenarios.
* Use the test results to identify performance bottlenecks.
* Re-run the load test to verify performance improvements after making configuration changes to APIM.
* Clean up resources.

## Load Test architecture
Load tests are described through a pair of JMX and YAML files. They are generated by Jmeter and VS Code ALT extension, then uploaded to Azure Load Test service to exercise APIM and App Service backend.

![Load Test architecture diagram](/assets/diagrams/load-test-architecture.png)

## Requirements and prerequisites

In order to run the load testing scenarios you will need access to the following tools and services:


-   Tools and dependencies for Manual Testing
    -   Option 1, use our VS Code Devcontainer/Codespaces definition
        -   [Github codespace](https://github.com/features/codespaces) enabled in your Github Profile. Once you have that enabled, you can access the Codespace configured in this Repository with all dependencies and VSCode extensiones installed.
    -   Option 2, install all this dependencies locally:
        -   [Jmeter](https://jmeter.apache.org/)
        -   [Bicep](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/install)
        -   [Azure Cli](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

-   Services for automated testing
    -   [Azure subscription access](https://ms.portal.azure.com/#blade/Microsoft_Azure_Billing/SubscriptionsBlade), in order to deploy an Azure Api Management Instance, API Services(App Services, Azure Functions, Azure Kubernetes Services, etc.), and the Azure Load Testing Service
    -   Access to [Github Actions](https://github.com/features/actions) in a Github Repo
    -   Access to [Azure Devops Organization](https://azure.microsoft.com/en-us/services/devops/)

## Deploy Test environment 
1. Follow this [tutorial](/tutorial/testenv-deploy.md) to deploy the test environment using [Bicep](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview) templates.

## Run Load tests

### Run load tests manually

1. [Using Github Codespaces](/tutorial/run-tests-github-codespaces.md)
2. [Using Github Codespaces + Azure Load Testing Service](/tutorial/run-tests-github-codespaces-azure-load-testing.md)
3. [Using local compute + VSCode Follow this](/tutorial/run-tests-manually.md) to run the load tests using the [VS Code Azure Load Test extension](https://github.com/microsoft/azureloadtest#installation).


### Run automated load tests
1. [Github Actions](/tutorial/run-tests-github-actions.md)
2. [Azure Devops](/tutorial/run-tests-azure-devops.md)

