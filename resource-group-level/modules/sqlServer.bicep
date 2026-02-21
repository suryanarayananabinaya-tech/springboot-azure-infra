param sqlServerName string
param location string
param administratorLogin string
@secure()
param administratorLoginPassword string
param databaseName string
param databaseSkuName string = 'Basic'
param databaseSkuTier string = 'Basic'
param maxSizeBytes int = 2147483648

resource sqlServer 'Microsoft.Sql/servers@2022-05-01-preview' = {
  name: sqlServerName
  location: location
  properties: {
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
    version: '12.0'
    publicNetworkAccess: 'Enabled'
  }
}

resource sqlDatabase 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  name: databaseName
  parent: sqlServer
  location: location
  sku: {
    name: databaseSkuName
    tier: databaseSkuTier
  }
  properties: {
    maxSizeBytes: maxSizeBytes
    collation: 'SQL_Latin1_General_CP1_CI_AS'
  }
}

output sqlServerId string = sqlServer.id
output sqlDatabaseId string = sqlDatabase.id
