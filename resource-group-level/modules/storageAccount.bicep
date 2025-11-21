param storageAccountName string
param location string
param sku string
param kind string

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: sku
  }
  kind: kind
  properties: {}
}

output storageId string = storageAccount.id
