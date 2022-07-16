# Panda - UserBot

FROM python:3.9
WORKDIR /app
ENV PYTHONUNBUFFERED=1
COPY . .
RUN bash Text.sh

# command to run on container start
ENTRYPOINT [ "bash", "termux_install.sh" ]
