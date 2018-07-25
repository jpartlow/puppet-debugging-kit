export OS_AUTH_URL=https://puppet.platform9.net/keystone/v3
export OS_IDENTITY_API_VERSION=3
export OS_REGION_NAME="Portland"
export OS_USERNAME="joshua.partlow@puppet.com"
echo 'platform9 password: '
read -sr password
export OS_PASSWORD=$password
export OS_PROJECT_NAME="Joshua Partlow"
export OS_USER_DOMAIN_NAME="Default"
export OS_PROJECT_DOMAIN_ID=${OS_USER_DOMAIN_NAME:-"default"}
