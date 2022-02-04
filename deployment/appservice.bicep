@description('Unique WebApp Name.')
param webAppName string = uniqueString(resourceGroup().id)

@description('SKU of App Service Plan.')
param sku string = 'P3V2'

@description('The runtime stack of web app.')
param linuxFxVersion string = 'DOTNETCORE|3.1'

@description('External repository for the application.')
param repositoryUrl string = 'https://github.com/Azure-Samples/dotnet-core-api'

param branch string = 'master'
param location string

var appServicePlanName = toLower('AppServicePlan-${webAppName}')
var webSiteName = toLower('wapp-${webAppName}')

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName
  location: location
  properties: {
    reserved: true
  }
  sku: {
    name: sku
  }
  kind: 'linux'
}

resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: webSiteName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
  }
}

resource srcControls 'Microsoft.Web/sites/sourcecontrols@2021-01-01' = {
  name: '${appService.name}/web'
  properties: {
    repoUrl: repositoryUrl
    branch: branch
    isManualIntegration: true
  }
}
output serviceUrl string = 'https://${appService.properties.hostNames[0]}'
