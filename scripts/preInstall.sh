#set env vars
set -o allexport; source .env; set +o allexport;

SECRET_KEY=${SECRET_KEY:-`openssl rand -hex 32`}

cat << EOT >> ./.env

SECRET_KEY=${SECRET_KEY}
EOT

cat <<EOT > ./servers.json
{
    "Servers": {
        "1": {
            "Name": "local",
            "Group": "Servers",
            "Host": "172.17.0.1",
            "Port": 61925,
            "MaintenanceDB": "postgres",
            "SSLMode": "prefer",
            "Username": "postgres",
            "PassFile": "/pgpass"
        }
    }
}
EOT
