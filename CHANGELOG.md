# 📜 CHANGELOG

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)  
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.0.0] - 2025-06-30

### Added
- Initial modular project structure using Azure Bicep
- `main.bicep` to orchestrate infrastructure deployment
- Modules: `network.bicep`, `nic.bicep`, `vm.bicep`
- Parameterization with `parameters.json` and example file
- Public IP as output for SSH access
- Project documentation in `README.md`
- `.gitignore` and secure handling of sensitive data

---

## [Unreleased]

### Planned
- GitHub Actions: Bicep lint/build + automated deployment
- Lab 3 branch with Load Balancer + multiple VMs
