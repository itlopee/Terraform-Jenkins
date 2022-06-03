#!/bin/bash

TEMPLATE_USED="../../TEMPLATES/01-LoadBalancer"

CLIENT_ID_SHORT=$(( $(ls INFRASTRUCTURES | wc -l) + 1 ))
CLIENT_ID_LONG=$(printf "%06d" ${CLIENT_ID_SHORT})
CLIENT_FOLDER="INFRASTRUCTURES/${CLIENT_ID_LONG}"

echo "Client ID is : ${CLIENT_ID_LONG}"
echo "Going to deploy things..."
echo

#### Create Client Folder ####

echo -n "Creating Client Folder..."

if [ -d $CLIENT_FOLDER ]
then
	echo "[NOK]"
	echo "Folder already exists"
	exit 1
fi

mkdir $CLIENT_FOLDER
cd $CLIENT_FOLDER

cp ${TEMPLATE_USED}/00-provider.tf .
terraform init > /dev/null 2> /dev/null

if [ $? -eq 0 ]
then
	echo "[OK]"
else
	echo "[NOK]"
	echo "Failed to initialize terraform"
	exit 1
fi

#### Create Network Elements ####

echo -n "Creating Network Things..."

cp ${TEMPLATE_USED}/01-network.tf .

INFRA_NAME="INFRA_${CLIENT_ID_LONG}"

sed -i "s|<##INFRA_NAME##>|${INFRA_NAME}|g" 01-network.tf
sed -i "s|<##CLIENT_ID##>|${CLIENT_ID_SHORT}|g" 01-network.tf

terraform apply -auto-approve > /dev/null 2>&1

if [ $? -eq 0 ]
then
	echo "[OK]"
else
	echo "[NOK]"
	echo "Failed to apply Network"
	exit 1
fi

#### Create Security Groups ####

echo -n "Create Security Groups..."

cp ${TEMPLATE_USED}/flow_matrix .

../../generate_sg.sh

sed -i "s|<##INFRA_NAME##>|${INFRA_NAME}|g" 02-securitygroups.tf

terraform apply -auto-approve > /dev/null 2>&1

if [ $? -eq 0 ]
then
	echo "[OK]"
else
	echo "[NOK]"
	echo "Failed to apply Security Groups"
	exit 1
fi

#### Create Instances ####

echo -n "Create Instances..."

cp ${TEMPLATE_USED}/instances_matrix .

../../generate_instances.sh

sed -i "s|<##INFRA_NAME##>|${INFRA_NAME}|g" 03-instances.tf

terraform apply -auto-approve > /dev/null 2>&1

if [ $? -eq 0 ]
then
	echo "[OK]"
else
	echo "[NOK]"
	echo "Failed to apply Instances"
	exit 1
fi

#### END ####

echo
echo "Script ended without errors."
exit 0
