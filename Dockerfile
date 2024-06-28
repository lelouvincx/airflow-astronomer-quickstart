FROM apache/airflow:2.9.2

ENV AIRFLOW_HOME=/opt/airflow

USER root
RUN apt-get update \
  && apt-get install vim unzip git gcc g++ -y \
  && rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt

USER airflow
RUN pip install --no-cache-dir -r requirements.txt

# Ref: https://airflow.apache.org/docs/docker-stack/recipes.html

SHELL ["/bin/bash", "-o", "pipefail", "-e", "-u", "-x", "-c"]

USER root

WORKDIR $AIRFLOW_HOME

COPY scripts/ scripts/
RUN chmod +x scripts/entrypoint.sh

USER $AIRFLOW_UID
