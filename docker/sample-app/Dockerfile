FROM python:3.12.8-bookworm

# uv をグローバルにインストール
# https://docs.astral.sh/uv/guides/integration/docker/#installing-uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

RUN mkdir -p /opt/app
COPY sample-app/pyproject.toml sample-app/uv.lock /opt/app/

# venvの作成ディレクトリの指定とpythonパスの追加
ENV UV_PROJECT_ENVIRONMENT="/opt/.venv"
ENV PATH="/opt/.venv/bin:$PATH"

RUN --mount=type=cache,target=/root/.cache/uv \
    cd /opt/app && uv sync --frozen

COPY sample-app /opt/app

WORKDIR /opt/app

CMD ["uv", "run", "uvicorn", "main:app", "--reload", "--port", "8000", "--host", "0.0.0.0"]