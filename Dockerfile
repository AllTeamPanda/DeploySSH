# Panda - UserBot

FROM poocongonlen/poconguserbot:buster

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    npm i -g npm

RUN git clone -b PandaUserbot https://github.com/ilhammansiz/PandaX_Userbot /home/pandauserbot/ \
    && chmod 777 /home/pandauserbot \
    && mkdir /home/pandauserbot/bin/

WORKDIR /home/pandauserbot/


# command to run on container start
CMD [ "bash", "termux_install.sh" ]
