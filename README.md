<!-- Terraform & Jenkins  -->

## Requirements

AWS CREDENTIALS.
GIThub CREDENTIALS.

## Providers

TEMPLATES/01-LoadBalancer/00-Provider.tf.

## Modules
TEMPLATES/01-LoadBalancer/00-Provider.tf.
TEMPLATES/01-LoadBalancer/01-network.tf.

## Resources
CI/ Jenkins-piplines 
flow_matrix.
instance_matrix.
Scripts.

## Project  Description & Contents 

- Déploiement d'infrastructures sur AWS ( Network : Vpc, EC2 instances , Security groups) avec Terraform et une intégration Jenkins.

- Le Déploiement se fera d'une façon templatisée (modulisée) afin de limiter la dépendance à terraform et pouvoir déployer la même infra n fois.

- Le Versionning du Projet se fera sur Github --> https://github.com/itlopee/Terraform-Jenkins.git

- La partie CI se fera avec Jenkins 

## How to Use the Project
- Installer le plug-in Terraform :
 Accédez à Gérer Jenkins > Gérer les plugins > Disponibles > recherchez Terraform.
- Configurer Terraform :
Accédez à Gérer Jenkins> Configuration globale de l'outil> Il affichera Terraform dans la liste.
- Créer le projet :
1 - Ouvrir Jenkins-> Nouvel élément . Entrez un nom de tâche Choisissez Pipeline > Cliquez sur OK.
2 - Pipeline > 2 options pour Jenkinsfile.
3 - Pipeline prend en charge la récupération du script DSL (Domain Specific Language) à partir du SCM. Généralement appelé Jenkinsfile et situé à la racine du projet.

    - Sélectionnez "Script de pipeline de SCM" dans la définition.
    - Sélectionnez Git comme SCM
    - URL Git vers le dépôt : https://github.com/itlopee/Terraform-Jenkins.git
    Identifiants : via jenkins credentials (ssh key)
    - Branches à construire :$branch





<!-- END_TF_DOCS -->