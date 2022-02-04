@description('The email address of the publisher of the APIM resource.')
@minLength(1)
param publisherEmail string

@description('Company name of the publisher of the APIM resource.')
@minLength(1)
param publisherName string

@description('The SKU of the APIM resource.')
param skuName string

@description('The instance size of the APIM resource.')
param capacity int

@description('Location for Azure resources.')
param location string

// param serviceUrl string

@description('Name for Azure resources.')
param name string

resource apimservice 'Microsoft.ApiManagement/service@2020-12-01' = {
  name: name
  location: location
  sku:{
    capacity: capacity
    name: skuName
  }
  properties:{
    publisherEmail: publisherEmail
    publisherName: publisherName
  }

  resource testapi1 'apis' = {
    name:'test1'
    properties:{         
      path:'test1'
      description:'Baseline test HTTP (no backend)'
      apiType:'http'
      protocols: [
        'http'
      ]
      displayName:'Test API #1'
      subscriptionRequired:false
      isCurrent:true
    }
    resource getoperation 'operations' = {
      name: 'get'
      properties: {
        displayName: 'Get'
        method: 'GET'
        urlTemplate: '/'
      }
    }
    resource policy 'policies' = {
      name:'policy'
      properties:{
        format:'xml'
        value:'''
        <policies>
          <inbound>
            <return-response>
              <set-status code="200" />
              <set-body>Hello from return-response policy</set-body>
            </return-response>
            <base />
          </inbound>
          <backend>
              <base />
          </backend>
          <outbound>
              <base />
          </outbound>
          <on-error>
              <base />
          </on-error>
        </policies>
        '''
      }
    }
  }    
  
  resource testapi2 'apis' = {
    name:'test2'
    properties:{         
      path:'test2'
      description:'Baseline test HTTPS (no backend)'
      apiType:'http'
      protocols: [
        'https'
      ]
      displayName:'Test API #2'
      subscriptionRequired:false
      isCurrent:true
    }
    resource getoperation 'operations' = {
      name: 'get'
      properties: {
        displayName: 'Get'
        method: 'GET'
        urlTemplate: '/'
      }
    }
    resource policy 'policies' = {
      name:'policy'
      properties:{
        format:'xml'
        value:'''
        <policies>
          <inbound>
            <return-response>
              <set-status code="200" />
              <set-body>Hello from return-response policy</set-body>
            </return-response>
            <base />
          </inbound>
          <backend>
              <base />
          </backend>
          <outbound>
              <base />
          </outbound>
          <on-error>
              <base />
          </on-error>
        </policies>
        '''
      }
    }
  }
}
