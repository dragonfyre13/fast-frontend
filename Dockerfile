# For a prod image, follow something like this, remove the prestart.sh file and remove the CMD line (defaults to /start.sh)
# https://sveltesociety.dev/recipes/publishing-and-deploying/dockerize-a-svelte-app/
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8
RUN echo "deb https://deb.nodesource.com/node_12.x buster main" > /etc/apt/sources.list.d/nodesource.list && \
    wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list && \
    wget -qO- https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    apt-get update && \
    apt-get install -yqq nodejs yarn
COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir --upgrade -r /app/requirements.txt
COPY ./app /app
WORKDIR /app/frontend
RUN npm install
RUN mv /app /app_initialize
COPY ./start-check.sh /start-check.sh
EXPOSE 80
CMD /start-check.sh