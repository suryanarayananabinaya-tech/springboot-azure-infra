param name string
param location string
param skuName string
param skuCapacity int = 1

resource plan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: name
  location: location
  sku: {
    name: skuName
    tier: 'Free'
    capacity: skuCapacity
  }
}

output planId string = plan.id
