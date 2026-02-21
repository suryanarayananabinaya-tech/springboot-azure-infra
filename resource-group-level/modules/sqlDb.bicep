param location string
param sqlServerName string
param sqlDbName string

param sqlAdminLogin string
@secure()
param sqlAdminPassword string

@description('Allow Azure services (App Service, Functions, etc.)')
param allowAzureServices bool = true

@description('Optional: single client IP to allow, e.g. 203.0.113.10. Empty = skip.')
param clientIp string = ''

var uniqueSqlServerName = '${sqlServerName}-${uniqueString(resourceGroup().id)}'

resource sqlServer 'Microsoft.Sql/servers@2022-05-01-preview' = {
  name: uniqueSqlServerName
  location: location
  properties: {
    administratorLogin: sqlAdminLogin
    administratorLoginPassword: sqlAdminPassword
    version: '12.0'
    publicNetworkAccess: 'Enabled'
    minimalTlsVersion: '1.2'
  }
}

resource sqlDb 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  parent: sqlServer
  name: sqlDbName
  location: location
  sku: {
    name: 'Basic'
    tier: 'Basic'
    capacity: 5
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 2147483648
  }
}

resource allowAzure 'Microsoft.Sql/servers/firewallRules@2022-05-01-preview' = if (allowAzureServices) {
  parent: sqlServer
  name: 'AllowAzureServices'
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}

resource allowClientIp 'Microsoft.Sql/servers/firewallRules@2022-05-01-preview' = if (clientIp != '') {
  parent: sqlServer
  name: 'AllowClientIp'
  properties: {
    startIpAddress: clientIp
    endIpAddress: clientIp
  }
}

output sqlServerFqdn string = '${uniqueSqlServerName}.database.windows.net'
output sqlDatabaseName string = sqlDbName
