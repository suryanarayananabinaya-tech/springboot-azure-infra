param appServicePlanName string
param location string
param sku string

resource plan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: sku
    tier: 'Basic'
  }
}

output planId string = plan.id
