targetScope = 'subscription'

@description('Name of the resource group to create')
param rgName string

@description('Azure region for the RG')
param location string

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: location
}

output resourceGroupName string = rg.name
