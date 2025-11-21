param storageAccountName string
param location string
param storageSku string
param storageKind string

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageSku
  }
  kind: storageKind
}

output storageId string = storageAccount.id
