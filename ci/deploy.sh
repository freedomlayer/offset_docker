# See: https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -eux -o pipefail

# Get current directory, 
# see: https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself
CUR_DIR=`dirname $(readlink -f $0)`

VERSION="v$(cat $CUR_DIR/../VERSION | tr -d '\n')"
# Dockerhub login:
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
# Tag docker images:
docker tag offset_index $DOCKER_USERNAME/offset_index:latest
docker tag offset_index $DOCKER_USERNAME/offset_index:$VERSION
docker tag offset_node $DOCKER_USERNAME/offset_node:latest
docker tag offset_node $DOCKER_USERNAME/offset_node:$VERSION
docker tag offset_relay $DOCKER_USERNAME/offset_relay:latest
docker tag offset_relay $DOCKER_USERNAME/offset_relay:$VERSION
# Push docker images:
docker push $DOCKER_USERNAME/offset_index:latest
docker push $DOCKER_USERNAME/offset_index:$VERSION
docker push $DOCKER_USERNAME/offset_node:latest
docker push $DOCKER_USERNAME/offset_node:$VERSION
docker push $DOCKER_USERNAME/offset_relay:latest
docker push $DOCKER_USERNAME/offset_relay:$VERSION
