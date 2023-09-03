ARG VARIANT="3.11-bookworm"
FROM python:${VARIANT} AS app-dev-base

ARG POETRY_VERSION=1.6.1

ENV POETRY_VIRTUALENVS_IN_PROJECT=false \
    POETRY_NO_INTERACTION=true

RUN pip install --upgrade pip && \
    pip install poetry==${POETRY_VERSION}

WORKDIR /workspaces/container-app-example-python

FROM app-dev-base AS app-dev-dependencies

COPY pyproject.toml ./

RUN poetry install --no-interaction --no-ansi --with=dev
