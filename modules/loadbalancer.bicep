@description('Load Balancer Name')
param lbName string = 'lb-hands3'

@description('Subnet ID where the Load Balancer will be deployed')
param subnetId string

@description('Location')
param location string = resourceGroup().location

resource publicIP 'Microsoft.Network/publicIPAddresses@2023-04-01' = {
  name: '${lbName}-pip'
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
  }
}

resource loadBalancer 'Microsoft.Network/loadBalancers@2023-04-01' = {
  name: lbName
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    frontendIPConfigurations: [
      {
        name: 'LoadBalancerFrontEnd'
        properties: {
          publicIPAddress: {
            id: publicIP.id
          }
        }
      }
    ]
    backendAddressPools: [
      {
        name: 'BackendPool'
      }
    ]
    probes: [
      {
        name: 'tcpProbe'
        properties: {
          protocol: 'Tcp'
          port: 80
          intervalInSeconds: 5
          numberOfProbes: 2
        }
      }
    ]
    loadBalancingRules: [
      {
        name: 'http-rule'
        properties: {
          frontendIPConfiguration: {
            id: loadBalancer.properties.frontendIPConfigurations[0].id
          }
          backendAddressPool: {
            id: loadBalancer.properties.backendAddressPools[0].id
          }
          probe: {
            id: loadBalancer.properties.probes[0].id
          }
          protocol: 'Tcp'
          frontendPort: 80
          backendPort: 80
          enableFloatingIP: false
          idleTimeoutInMinutes: 4
          loadDistribution: 'Default'
        }
      }
    ]
  }
}

output backendPoolId string = loadBalancer.properties.backendAddressPools[0].id
output publicIp string = publicIP.properties.ipAddress
