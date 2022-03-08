# Variables for common values
$resourceGroup = "azureworkshop-kre"
$location = "westeurope"
$vmName = "frontend001"

# Create user object
$cred = Get-Credential -Message "Enter a username and password for the virtual machine."

# Create a resource group
New-AzResourceGroup -Name $resourceGroup -Location $location

# Create a virtual network
$vnetFrontend = New-Vnet(10.0.1.0/24, 'FrontEnd')
$vnetBackend = New-Vnet(10.0.2.0/24, 'BackEnd')
$vnetCorpnet = New-Vnet(10.0.0.0/24, 'CorpNet')

# Create a public IP address and specify a DNS name
$pip = New-AzPublicIpAddress -ResourceGroupName $resourceGroup -Location $location `
  -Name "mypublicdns$(Get-Random)" -AllocationMethod Static -IdleTimeoutInMinutes 4

# Create an inbound network security group rule for port 3389
$nsgRuleRDP = New-AzNetworkSecurityRuleConfig -Name myNetworkSecurityGroupRuleRDP  -Protocol Tcp `
  -Direction Inbound -Priority 1000 -SourceAddressPrefix * -SourcePortRange * -DestinationAddressPrefix * `
  -DestinationPortRange 3389 -Access Allow

# Create a network security group
$nsg = New-AzNetworkSecurityGroup -ResourceGroupName $resourceGroup -Location $location `
  -Name myNetworkSecurityGroup -SecurityRules $nsgRuleRDP

# Create a virtual network card and associate with public IP address and NSG
$nic = New-AzNetworkInterface -Name myNic -ResourceGroupName $resourceGroup -Location $location `
  -SubnetId $vnet.Subnets[0].Id -PublicIpAddressId $pip.Id -NetworkSecurityGroupId $nsg.Id

# Create a virtual machine configuration
$vmConfig = New-AzVMConfig -VMName $vmName -VMSize Standard_D1 | `
Set-AzVMOperatingSystem -Windows -ComputerName $vmName -Credential $cred | `
Set-AzVMSourceImage -PublisherName MicrosoftWindowsServer -Offer WindowsServer -Skus 2016-Datacenter -Version latest | `
Add-AzVMNetworkInterface -Id $nic.Id

# Create a virtual machine
New-AzVM -ResourceGroupName $resourceGroup -Location $location -VM $vmConfig

function New-Vnet {
    param (
        $ipaddress,
        $name
    )
    process {
        # Create a subnet configuration
        $subnetConfig = New-AzVirtualNetworkSubnetConfig -Name $name -AddressPrefix $ipaddress
        # Create a vnet
        $vnet = New-AzVirtualNetwork -ResourceGroupName $resourceGroup -Location $location `
                    -Name $name -AddressPrefix $ipaddress -Subnet $subnetConfig
        return $vnet;
    }
}