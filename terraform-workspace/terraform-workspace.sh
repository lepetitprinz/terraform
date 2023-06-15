#!/bin/bash

terraform workspace -h

# Show the current workspace
terraform workspace show

# Create a new space - dev
terraform workspace new dev

# Create a new space -prd
terraform workspace new prd

# Show the all workspaces
terraform workspace list

# Change the workspace
terraform workspace select dev
