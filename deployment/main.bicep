param location string = resourceGroup().location // Location for all resources

param apimdevName string
param apimbasicName string
param apimstdName string
param apimpremName string
param loadtestName string


module apimDeveloper 'apim-developer.bicep' = {
  name: 'apimDeveloper'
  params: {
    name: apimdevName
    location: location
  }
}

module loadTesting 'load-testing.bicep' = {  
  name: 'loadTesting'
  params: {
    name: loadtestName    
    location: location
  }
}
