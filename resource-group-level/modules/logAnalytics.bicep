param name string
param location string

resource workspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: name
  location: location
  properties: {
      retentionInDays: 30
      sku: {
        name: 'PerGB2018'
      }
      features: {
        enableLogAccessUsingOnlyResourcePermissions: true
      }
  }
}

output workspaceId string = workspace.id
