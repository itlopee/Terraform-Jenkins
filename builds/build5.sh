#### destroy Instance ####
cd TEMPLATES/01-LoadBalancer
mv instance_template instance.tf
terraform destroy -auto-approve