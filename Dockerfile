# Panda - UserBot

FROM ilhammansiz17/pandauserbot:docker-python

COPY . .

RUN bash Text.sh

# command to run on container start
CMD [ "bash", "termux_install.sh" ]
