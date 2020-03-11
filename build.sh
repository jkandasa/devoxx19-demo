
BASE_DIR="/storage/work/projects/jaeger/tmp/devoxx19-demo"
CONTAINER_PREFIX="quay.io/jkandasa/devoxx"


# applications
for app in order account inventory
do
version=$(date +%F --utc)
app_name="service-mesh-${app}"
image="${CONTAINER_PREFIX}-${app}:${version}"

cd "${BASE_DIR}/${app_name}/"
./mvnw clean package -DskipTests
podman build -f src/main/docker/Dockerfile.jvm -t "${image}" .
#podman push "${image}"
done