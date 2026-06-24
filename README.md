GitHub Actions CI/CD with Terraform

Project Overview:

This repository demonstrates how to automate Terraform workflows using GitHub Actions. It includes three workflows: CI, CD, and manual operations. The project uses a remote backend for storing Terraform state, which ensures consistency and safety when running Terraform in GitHub Actions.

Remote Backend:

The remote backend is an AWS S3 bucket that stores the Terraform state file.
GitHub Actions runners are temporary and cannot safely store local state. By using a remote backend, the state file is preserved across workflow runs, allowing multiple team members to collaborate and ensuring that infrastructure changes are tracked consistently.

Backend configuration is defined in backend.tf and points to the manually created S3 bucket. This setup prevents the risk of losing local state and ensures that every run of Terraform in GitHub Actions uses the same state file.

Workflows:

CI Workflow (terraform-ci.yml):
The CI workflow runs on pull requests to the master branch and can also be triggered manually.
It performs the following steps:

Checks Terraform formatting

Initializes Terraform with the remote backend

Validates the Terraform code

Generates a Terraform plan

This workflow does not apply infrastructure. It is used to verify that changes are valid before merging.

CD Workflow (terraform-cd.yml):
The CD workflow runs on pushes to the master branch and can also be triggered manually.
It performs the following steps:

Initializes Terraform with the remote backend

Validates the Terraform code

Generates and saves a Terraform plan

Applies the saved plan to provision infrastructure

This workflow uses a GitHub environment named dev. Infrastructure is only applied after code is merged into master or when the workflow is triggered manually.

Manual Operations Workflow (terraform-manual-operations.yml):
The manual workflow allows you to run Terraform apply or destroy operations manually.
It accepts an input that lets you choose between apply and destroy.
It has two separate jobs:

Apply job runs only when apply is selected

Destroy job runs only when destroy is selected

Destroy operations are protected by environment approval and cannot run automatically. This ensures that destructive actions are performed safely and intentionally.

Required Secrets:
The following GitHub Secrets must be configured in the repository:

AWS_ACCESS_KEY_ID

AWS_SECRET_ACCESS_KEY

AWS_REGION

These secrets are used by the workflows to authenticate with AWS. They must be added under GitHub repository settings in Settings → Secrets and variables → Actions. Secrets are referenced securely in the workflows and are never hardcoded.

How to Use the Workflows:
CI workflow: Open a pull request to master. The workflow will run automatically and show the Terraform plan.

CD workflow: Merge changes into master or trigger the workflow manually. The workflow will apply infrastructure changes.

Manual workflow: Trigger manually from the Actions tab. Choose apply or destroy. Destroy requires approval in the protected environment.

Safe Destroy:

Destroy operations are restricted to manual execution only. They require environment approval to prevent accidental deletion of infrastructure. This ensures that destructive actions are deliberate and controlled.