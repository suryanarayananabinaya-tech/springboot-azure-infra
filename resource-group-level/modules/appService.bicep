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
      linuxFxVersion: 'JAVA|17'        // Runtime Stack: Java 17 on Linux
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: appInsightsConnectionString
        }
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: appInsightsKey
        }
        {
          name: 'WEBSITES_PORT'
          value: '8080'                // Required for Spring Boot
        }
        {
          name: 'JAVA_VERSION'
          value: '17'                  // Optional but recommended
        }
      ]
    }
  }
}

output webAppUrl string = 'https://${webApp.name}.azurewebsites.net'
