# Spring Boot Azure Infrastructure (Infrastructure as Code)

**Java | Spring Boot | Microsoft Azure | Bicep | Azure DevOps | CI/CD | Infrastructure as Code**

---

# Overview

This repository demonstrates how to deploy **production-ready infrastructure for a Spring Boot application on Microsoft Azure using Infrastructure as Code (IaC)**.

The project provisions Azure cloud resources using **Bicep templates** and automates deployment through **Azure DevOps pipelines**. This setup simulates a **real-world enterprise cloud architecture** used for backend applications built with Java and Spring Boot.

The objective of this project is to showcase **cloud-native backend development and DevOps practices** including automated deployments, modular infrastructure design, and scalable Azure environments.

---

# Architecture

Developer
↓
Code Commit
↓
Azure DevOps Pipeline Triggered
↓
Infrastructure Deployment using Bicep
↓
Azure Resources Provisioned

Azure Resources Created:

* Resource Group
* App Service Plan
* App Service
* Azure SQL Database
* Storage Account
* Key Vault
* Log Analytics Workspace
* Application Insights

Infrastructure deployment is structured in **two levels**:

**Subscription Level**
Creates the Azure Resource Group.

**Resource Group Level**
Deploys application infrastructure and supporting services.

---

# Tech Stack

## Backend

* Java
* Spring Boot

## Cloud Platform

* Microsoft Azure
* Azure App Service
* Azure SQL Database
* Azure Storage Account
* Azure Key Vault

## DevOps

* Azure DevOps Pipelines
* Infrastructure as Code (Bicep)

## Monitoring

* Azure Application Insights
* Azure Log Analytics

---

# Project Structure

```
springboot-azure-infra
│
├── azure-pipelines
│   ├── deploy-infra.yml
│   └── parameters/dev
│
├── subscription-level
│   └── rg.bicep
│
├── resource-group-level
│   └── modules
│       ├── appService.bicep
│       ├── appServicePlan.bicep
│       ├── storageAccount.bicep
│       ├── sqlDb.bicep
│       ├── keyVault.bicep
│       ├── appInsights.bicep
│       └── logAnalytics.bicep
│
└── README.md
```

---

# Infrastructure Modules

The infrastructure is built using **modular Bicep templates**.
Each module provisions a specific Azure service.

## Subscription Level

Creates the base **Resource Group**.

```
subscription-level/
   rg.bicep
```

Example:

```
targetScope = 'subscription'

param rgName string
param location string

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: location
}

output resourceGroupName string = rg.name
```

---

## Resource Group Level Modules

The following modules create Azure services required for a backend application.

```
resource-group-level/modules/
```

Modules included:

* **App Service Plan**
* **App Service**
* **Storage Account**
* **Azure SQL Database**
* **Azure Key Vault**
* **Application Insights**
* **Log Analytics Workspace**

This modular design improves **reusability and maintainability of infrastructure code**.

---

# CI/CD Pipeline

The infrastructure deployment is automated using **Azure DevOps pipelines**.

Pipeline configuration file:

```
azure-pipelines/deploy-infra.yml
```

Pipeline stages:

1. Validate Bicep templates
2. Authenticate with Azure
3. Deploy infrastructure to target environment
4. Output deployment results

This pipeline demonstrates **enterprise DevOps practices for automated cloud provisioning**.

---

# Deployment Process

Login to Azure:

```
az login
```

Deploy infrastructure at the subscription level:

```
az deployment sub create \
--location eastus \
--template-file subscription-level/rg.bicep \
--parameters rgName=my-resource-group location=eastus
```

This command provisions the Azure resource group and prepares the environment for application infrastructure.

---

# Skills Demonstrated

This project showcases expertise in:

* Java backend ecosystem
* Cloud infrastructure deployment on Microsoft Azure
* Infrastructure as Code using Bicep
* CI/CD automation using Azure DevOps
* Modular infrastructure architecture
* Cloud monitoring and logging
* Enterprise DevOps practices

---

# Why This Project Matters

Modern enterprise applications require **automated cloud infrastructure provisioning** to ensure consistent environments, faster deployments, and scalable systems.

This repository demonstrates how backend engineers can combine **Java development with cloud infrastructure and DevOps automation** to deliver reliable and production-ready environments.

---

# Future Improvements

Potential enhancements for this project include:

* Deploy containerized Spring Boot applications using Docker
* Integrate Azure Kubernetes Service (AKS)
* Implement automated testing within the pipeline
* Add monitoring dashboards for application metrics
* Support multi-environment deployments (Dev, QA, Prod)

---

# Author

**Abinaya Suryanarayanan**

Java Backend Developer | Spring Boot | Azure | Microservices | DevOps

GitHub:
https://github.com/suryanarayananabinaya-tech
