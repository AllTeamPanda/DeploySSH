# Panda - UserBot

FROM pandauserbotfile/pandauserbot:python202

WORKDIR /home/pandauserbot/

# command to run on container start
CMD [ "bash", "termux_install.sh" ]
