param name string
param location string
param sku string
param skuCapacity int = 1

resource plan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: sku
    tier: 'Basic'
    capacity: skuCapacity
  }
}

output planId string = plan.id
