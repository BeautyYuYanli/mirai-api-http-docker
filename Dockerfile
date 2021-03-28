FROM adoptopenjdk/openjdk14:alpine-jre
WORKDIR /app
RUN wget -qO- https://api.github.com/repos/iTXTech/mirai-console-loader/releases/latest | grep "browser_download_url" | cut -d : -f 2,3 | xargs wget && unzip -x mcl*.zip && rm mcl*.zip && chmod +x ./mcl
# COPY ./mcl_extract .
RUN ls
RUN ./mcl --update-package net.mamoe:mirai-api-http --channel stable --type plugin
RUN ./mcl --dry-run
