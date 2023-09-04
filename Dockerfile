FROM python:3.11-bookworm

WORKDIR /usr/src/app

RUN pip install --no-cache-dir poetry
COPY pyproject.toml poetry.lock ./
RUN poetry config virtualenvs.create false && poetry install --without dev

COPY main.py ./main.py

CMD [ "uvicorn", "main:app", "--reload" "--port" "8080" ]
