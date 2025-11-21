targetScope = 'resourceGroup'

@description('Azure Region')
param location string = resourceGroup().location

@description('LogAnalytics workspace name')
param logAnalyticsName string

@description('Application Insights name')
param appInsightsName  string

@description('App Service Plan name')
param appServicePlanName string
@description('sku')
param sku string

@description('App Service name')
param appServiceName string

@description('KeyVault name')
param keyVaultName string
@description('Tenant ID for Key Vault access policies')
param tenantId string

@description('Storage account name')
param storageAccountName  string
@description('Storage sku name')
param storageSku string
@description('Storage kind name')
param storageKind string


// ========== LogAnalytics ==========
module logAnalytics 'modules/logAnalytics.bicep' = {
  name: 'logAnalytics'
  params: {
    name: logAnalyticsName
    location: location
  }
}

// ========== AppInsights ==========
module appInsights 'modules/appInsights.bicep' = {
  name: '${appInsightsName}-deployment'
  params: {
    name: appInsightsName
    location: location
    workspaceId: logAnalytics.outputs.workspaceId
  }
}

// ========== AppServicePlan ==========
module plan 'modules/appServicePlan.bicep' = {
  name: '${appServicePlanName}-deployment'
  params: {
    appServicePlanName: appServicePlanName
    location: location
    sku: sku
  }
}

// ========== AppService ==========
module appService 'modules/appService.bicep' = {
  name: '${appServiceName}-deployment'
  params: {
    appServiceName: appServiceName
    location: location
    appServicePlanId: plan.outputs.planId
    appInsightsKey: appInsights.outputs.instrumentationKey
  }
}

// ========== Storage ==========
module storage 'modules/storageAccount.bicep' = {
  name: '${storageAccountName}-deployment'
  params: {
    storageAccountName: storageAccountName
    location: location
    storageSku: storageSku
    storageKind: storageKind
  }
}

// ========== KeyVault ==========

module keyVault 'modules/keyVault.bicep' = {
  name: 'keyVault'
  params: {
    name: keyVaultName
    location: location
    tenantId: tenantId
  }
}

output appServiceUrl string = appService.outputs.webAppUrl
output appInsightsKey string = appInsights.outputs.instrumentationKey
output storageName string = storage.name
output keyVaultNameOut string = keyVault.name
