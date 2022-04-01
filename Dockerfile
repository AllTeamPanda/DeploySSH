# Panda - UserBot

FROM ilhammansiz17/pandauserbot:docker-python

COPY . .

RUN git clone -b PandaUserbot https://github.com/ilhammansiz/PandaX_Userbot
  
RUN bash Text.sh

# command to run on container start
CMD [ "bash", "termux_install.sh" ]
