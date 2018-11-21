# Terraform plan and apply script
#!/bin/bash

terraform init



terraform plan -out=plan.out
plan_status=$?
if [ $plan_status -eq 1 ]; then
	echo "Terraform plan failed. Exiting..."
	exit 1
fi

#terraform apply plan.out
#apply_status=$?
#if [ $apply_status -eq 1 ]; then
#	echo "Terraform apply failed. Destroying terraform.."
#	terraform destroy
#	exit 1
#fi


