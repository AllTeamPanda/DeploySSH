# Panda - UserBot

FROM pandauserbotfile/pandauserbot:docker-repo

COPY . .

RUN bash Text.sh


# command to run on container start
CMD [ "bash", "termux_install.sh" ]
