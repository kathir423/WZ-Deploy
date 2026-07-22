FROM starleech/wzmlx:v3

WORKDIR /usr/src/app

RUN chmod 777 /usr/src/app

# Remove the existing virtual environment and create a new one
RUN rm -rf .venv && \
    uv venv --system-site-packages

COPY requirements.txt .

RUN uv pip install --python .venv/bin/python --no-cache-dir -r requirements.txt

COPY . .

RUN chmod +x start.sh

CMD ["bash", "start.sh"]
