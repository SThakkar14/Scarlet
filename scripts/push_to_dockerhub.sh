parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
cd "$parent_path"

source ../creds/docker.cfg
docker login --password="$docker_password" --username="$docker_username"
image_name=$docker_username/scarlet
docker rmi --force $image_name
docker build -t $image_name ..
docker push $image_name