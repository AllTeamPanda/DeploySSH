# Panda - UserBot

FROM ilhammansiz17/pandauserbot:docker-userbot

RUN git clone -b PandaUserbot https://github.com/ilhammansiz/PandaX_Userbot
    
WORKDIR /app/

# command to run on container start
CMD [ "bash", "termux_install.sh" ]
