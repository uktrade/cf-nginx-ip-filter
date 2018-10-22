ARG NGINX_VER=mainline
FROM nginx:$NGINX_VER

RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup && \
    apt-get update && \
    apt-get install -y python3-pip jq && \
    rm -rf /var/lib/apt/lists/*

ENV port 8443
EXPOSE $port
WORKDIR /app
COPY . /app/
RUN pip3 install -r requirements.txt
RUN /app/.profile
RUN yasha /app/nginx.conf.j2
