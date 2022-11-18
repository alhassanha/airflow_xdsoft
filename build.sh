export DOCKER_BUILDKIT=1
export AIRFLOW_VERSION=2.2.4

docker build . \
    --pull \
    --build-arg PYTHON_BASE_IMAGE="python:3.7-slim-bullseye" \
    --build-arg AIRFLOW_INSTALLATION_METHOD="." \
    --build-arg AIRFLOW_SOURCES_FROM="." \
    --build-arg AIRFLOW_SOURCES_TO="/opt/airflow" \
    --build-arg AIRFLOW_SOURCES_WWW_FROM="airflow/www" \
    --build-arg AIRFLOW_SOURCES_WWW_TO="/opt/airflow/airflow/www" \
    --build-arg AIRFLOW_CONSTRAINTS_LOCATION="/docker-context-files/constraints-source-providers-3.7.txt" \
    --build-arg INSTALL_PROVIDERS_FROM_SOURCES="true" \
    --build-arg ADDITIONAL_AIRFLOW_EXTRAS="slack,jdbc" \
    --build-arg ADDITIONAL_DEV_APT_DEPS="gcc g++" \
    --build-arg ADDITIONAL_RUNTIME_APT_DEPS="default-jre-headless" \
    --tag "airflow_xdsoft:0.0.9"
