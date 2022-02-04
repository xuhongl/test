# Deploy test environment

The test environment is comprised of a [dotnet core REST API](https://github.com/Azure-Samples/dotnet-core-api) hosted on an App Service plan. The API is served by an API Management service.

## **Prerequisites**

1. An Azure subscription
2. [Bicep cli](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/install)

## **Steps**

1. Create a resource group for your deployment: ``az group create --name MyLoadTestResourceGroup --location northeurope``
2. Launch Bicep script : ``az deployment group create --resource-group MyLoadTestResourceGroup --template-file main.bicep``