#!/bin/bash

set -x

# Set the repository URL
REPO_URL="https://5OSTXRFW22Qy23175cROWtRHZVfNvEtovr0jdgclHgbLMIZ1xqS9JQQJ99BGACAAAAAAAAAAAAASAZDO3n1N@dev.azure.com/smrmaheshkumar/voting-app/_git/voting-app"

# Clone the git repository into the /tmp directory
git clone "$REPO_URL" /tmp/temp_repo

# Navigate into the cloned repository directory
cd /tmp/temp_repo

# Make changes to the Kubernetes manifest file(s)
# For example, let's say you want to change the image tag in a deployment.yaml file
sed -i "s|image:.*|image: maheshrepo.azurecr.io/$2:$3|g" k8s-specifications/$1-deployment.yaml

# Add the modified files
git add .

# Commit the changes
git commit -m "Update Kubernetes manifest"

# Push the changes back to the repository
git push

# Cleanup: remove the temporary directory
rm -rf /tmp/temp_repo
