# Terraform Multi-Cloud Infrastructure (AWS • Azure • DigitalOcean)

**Pitch**: *I build infrastructure-as-code across multiple clouds.*  
This repo demonstrates a clean, reusable **Terraform modules** approach to provision similar stacks on **AWS**, **Azure**, and **DigitalOcean**, with example **staging** and **production** environments and an optional CI workflow.

## Highlights
- Reusable **modules** for each cloud (network + compute).
- Clear **envs/** for `staging` and `production` per cloud.
- Opinionated defaults + meaningful tagging.
- GitHub Actions workflow for **fmt/validate/plan** (matrix across envs).

```
.
├─ modules/
│  ├─ aws-network-ec2/         # VPC, subnet, SG, EC2
│  ├─ azure-rg-vm/             # RG, VNet, Subnet, NSG, NIC, Linux VM
│  └─ do-vpc-droplet/          # VPC + Droplet
└─ envs/
   ├─ aws/{staging,production}/
   ├─ azure/{staging,production}/
   └─ digitalocean/{staging,production}/
```

> State backends are **local by default** for simplicity. In real projects, use remote backends (S3+DynamoDB, Azure Storage, DO Spaces). Backend stanzas are provided as **commented templates**.

---

## Quick Start (example: AWS staging)

1) **Install** Terraform and cloud CLIs; authenticate:
```bash
export AWS_ACCESS_KEY_ID=...
export AWS_SECRET_ACCESS_KEY=...
export AWS_DEFAULT_REGION=us-east-1
```

2) **Initialize + plan**:
```bash
cd envs/aws/staging
terraform init
terraform plan -var="project=mc-demo" -var="public_key_path=~/.ssh/id_rsa.pub"
```

3) **Apply** (creates VPC + EC2 etc.):
```bash
terraform apply -auto-approve -var="project=mc-demo" -var="public_key_path=~/.ssh/id_rsa.pub"
```

4) **Outputs** will show public IPs / resource IDs.

Repeat for **Azure** and **DigitalOcean** (see env READMEs for provider auth).

---

## Provider Auth Cheatsheet

- **AWS**: env vars or `~/.aws/credentials`.
- **Azure**: set `AZURE_SUBSCRIPTION_ID`, `AZURE_TENANT_ID`, `AZURE_CLIENT_ID`, `AZURE_CLIENT_SECRET` *or* use `az login` + `use_azure_cli = true`.
- **DigitalOcean**: set `DIGITALOCEAN_TOKEN` and optionally ssh key **fingerprint** (or path to public key).

---

##  CI (GitHub Actions)
- Runs `terraform fmt -check`, `init`, `validate`, and `plan` across all envs.
- Requires repo secrets:
  - **AWS**: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_REGION`
  - **Azure**: `AZURE_CREDENTIALS` (JSON for azurerm *or* use env vars), example JSON in `ci/README.md`
  - **DigitalOcean**: `DIGITALOCEAN_TOKEN`

> You can restrict the matrix to only the clouds you use by editing the workflow list.

---

##  Makefile
Convenience commands to `init/plan/apply/destroy` for all envs or a single env.

---

##  Costs & Cleanup
Some resources have costs (VMs, public IPs). Use `terraform destroy` when done.

---

**Author:** Your Name — DevOps Engineer (AWS | Azure | DigitalOcean)
