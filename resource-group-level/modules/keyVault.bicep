param name string
param location string
param tenantId string

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
    accessPolicies: []
  }
}

output keyVaultId string = keyVault.id
output keyVaultURI string = keyVault.properties.vaultUri
