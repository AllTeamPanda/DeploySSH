# Panda - UserBot

FROM pandauserbotfile/pandauserbot:docker-python202


# command to run on container start
CMD [ "bash", "termux_install.sh" ]
