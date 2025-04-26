assumeRole() {
	echo "Assuming role..."
	CRED=$(aws sts assume-role --role-arn "arn:aws:iam::938897780349:role/EKS_Admin" --role-session-name EKS-session --duration-seconds 28800 | jq '.Credentials')
	ACCESSKEY=$(echo $CRED | jq -r '.AccessKeyId')
	SECRET=$(echo $CRED | jq -r '.SecretAccessKey')
	SESSIONTOKEN=$(echo $CRED | jq -r '.SessionToken')
	TEST='123'

    echo "Setting up aws config"
	aws configure set aws_session_token $SESSIONTOKEN --profile ar
	aws configure set aws_access_key_id $ACCESSKEY --profile ar
	aws configure set aws_secret_access_key $SECRET --profile ar
	echo "Updating kubeconfig"
	aws eks update-kubeconfig --region ap-southeast-1 --name choco-up-staging --profile ar
	aws eks update-kubeconfig --region ap-southeast-1 --name choco-up-production --profile ar
        kubectl config use-context staging
}

alias kcproduction="kubectl config use-context production"
alias kcs="kubectl config use-context staging"
alias ku="kubectl config set-context --current=true --namespace=uat"
alias kp="kubectl config set-context --current=true --namespace=production"
