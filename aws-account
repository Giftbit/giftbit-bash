#!/bin/bash

function verify_aws_account() {
    local AWS_ACCOUNT=$1
    echo "Verifying AWS account..."
    local CURRENT_AWS_ACCOUNT=$(aws sts get-caller-identity --query "Account" --output text)
    if [ "$CURRENT_AWS_ACCOUNT" != "$AWS_ACCOUNT" ]; then
        echo "Current AWS account ($CURRENT_AWS_ACCOUNT) does not match expected account ($AWS_ACCOUNT)"
        return 1  # Return non-zero (false)
    fi
    echo "AWS account verified: $AWS_ACCOUNT"
    return 0  # Return zero (true)
}
export -f verify_aws_account
