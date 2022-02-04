@description('Location for Azure resources.')
param location string

param name string

resource loadTesting 'Microsoft.LoadTestService/loadTests@2021-12-01-preview' = {
  name: name
  location: location
}
