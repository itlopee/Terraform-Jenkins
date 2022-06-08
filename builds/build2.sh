#### Mise en place de l'environnement Terraform ####
git clone https://github.com/itlopee/Terraform-Jenkins.git
cd  TEMPLATES/01-LoadBalancer
. ~/.envars
sed -i "s|<##ACCESS_KEY##>|${ACCESS_KEY}|g" provider.tf
sed -i "s|<##SECRET_KEY##>|${SECRET_KEY}|g" provider.tf
terraform init