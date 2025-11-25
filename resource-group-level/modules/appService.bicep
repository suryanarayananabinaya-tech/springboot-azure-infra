param appServiceName string
param location string
param appServicePlanId string
param appInsightsConnectionString string
param appInsightsKey string

resource webApp 'Microsoft.Web/sites@2022-09-01' = {
  name: appServiceName
  location: location
  properties: {
    serverFarmId: appServicePlanId
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: appInsightsConnectionString
        }
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: appInsightsKey
        }
      ]
    }
  }
}

output webAppUrl string = 'https://${webApp.name}.azurewebsites.net'
