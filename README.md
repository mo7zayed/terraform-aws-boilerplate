# Terraform aws boilerplate

This project uses Terraform to spin up resources in AWS

## Getting started

### Install terraform

```bash
go install github.com/hashicorp/terraform@latest
```

### Setup the terraform cli

```
terraform login
terraform workspace select stg
```

### Initialize this terraform project

```bash
terraform init
```

### Run your first terraform plan

```
terraform plan
```

## Project structure

```
+-- config/             - global yaml driven configuration to promote reuse elsewhere in the code
+-- modules/            - all custom terraform modules that enable us to easily spin up our AWS infrastructure
|   +-- infrastructure/         - contains the main module that will create our infrastructure
|   +-- */              - other specific AWS resource modules
+-- config.tf          - terraform provider configuration
+-- variables.tf   - variables that are defined inside the terraform cloud workspace
+-- locals.tf           - local variables generated from the config/ yaml files
+-- main.tf             - the entrypoint to this terraform module
```
