param name string
param location string
param tenantId string
param objectId string

resource keyVault 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: name
  location: location
  properties: {
    sku: {
      name: 'standard'
      family: 'A'
    }
    tenantId: tenantId
    enableSoftDelete: true
    enablePurgeProtection: false
    enabledForDeployment: true
    enabledForTemplateDeployment: true
    accessPolicies: [
      {
        tenantId: tenantId
        objectId: objectId
        permissions: {
          keys: ['get', 'list', 'create', 'delete']
          secrets: ['get', 'list', 'set', 'delete']
        }
      }
    ]
  }
}

output keyVaultId string = keyVault.id
output keyVaultURI string = keyVault.properties.vaultUri
