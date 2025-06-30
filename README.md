# 🧱 IaC Hands-on 2: Linux VM with Modular Azure Bicep

This project provisions a complete Azure environment using **modular Bicep templates** — designed as a hands-on exercise for learning Infrastructure as Code (IaC) practices.

---

## 🚀 What It Deploys

- ✅ Virtual Network + Subnet + Network Security Group (NSG)
- ✅ Static Public IP + Network Interface (NIC)
- ✅ Ubuntu 22.04 LTS Linux Virtual Machine
- ✅ Secure SSH access using a provided public key

---

## 📁 Project Structure

```
iac-hands-on-2/
├── main.bicep              # Orchestrates all module deployments
├── parameters.json         # Input parameters (e.g., SSH public key)
├── README.md               # Project documentation
└── modules/
    ├── network.bicep       # VNet, Subnet, NSG
    ├── nic.bicep           # Public IP and NIC
    └── vm.bicep            # Virtual Machine deployment
```

---

## 🧪 How to Deploy

Before you start:

- Ensure you have the Azure CLI installed and logged in (`az login`)
- Make sure your `parameters.json` file contains a valid SSH public key

Run this command from the root of the project:

```bash
az deployment group create \
  --resource-group rg-hands2 \
  --template-file main.bicep \
  --parameters @parameters.json
```
----
## 📤 Deployment Output

The deployment returns the VM’s public IP, like:
```bash
{
  "vmPublicIp": "59.122.XXX.XXX"
}
```
Use this to connect via SSH:
```bash
ssh yourusername@59.122.XXX.XXX
```
## 🔐 Security Considerations

* Password login is disabled  
* Only SSH public key authentication is allowed  
* Only TCP port 22 (SSH) is permitted in the NSG  
* Public IP is statically assigned for consistency  
---
## 🔐 Security note:
This project uses `parameters.json`, which is ignored by Git. Clone the example file below to provide your own inputs:
```bash
cp parameters.example.json parameters.json
```
---
## 🛠️ Tech Stack
* Azure Bicep (modular architecture)
* Azure CLI
* Ubuntu Server 22.04 LTS image
* SSH key authentication
---
## 📜 License
MIT License
