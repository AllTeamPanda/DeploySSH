# Panda - UserBot

FROM pandauserbotfile/pandauserbot:python202

COPY . .
RUN bash pakage.sh

# command to run on container start
ENTRYPOINT [ "bash", "termux_install.sh" ]
