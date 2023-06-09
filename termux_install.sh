## Running PandaUserbot

__ziplink () {
    local regex
    regex='(https?)://github.com/.+/.+'
    if [[ $PANDA_USERBOT_REPO == "PANDA_USERBOT" ]]
    then
        echo "aHR0cHM6Ly9naXRodWIuY29tL0FsbFRlYW1QYW5kYS9QYW5kYVhfVXNlcmJvdC9hcmNoaXZlL21haW4uemlw" | base64 -d
    elif [[ $PANDA_USERBOT_REPO == "UTAMA_USERBOT" ]]
    then
        echo "aHR0cHM6Ly9naXRodWIuY29tL0FsbFRlYW1QYW5kYS9QYW5kYVhfVXNlcmJvdC9hcmNoaXZlL21haW4uemlw" | base64 -d
    elif [[ $PANDA_USERBOT_REPO =~ $regex ]]
    then
        if [[ $PANDA_USERBOT_REPO_BRANCH ]]
        then
            echo "${PANDA_USERBOT_REPO}/archive/${PANDA_USERBOT_REPO_BRANCH}.zip"
        else
            echo "${PANDA_USERBOT_REPO}/archive/main.zip"
        fi
    else
        echo "aHR0cHM6Ly9naXRodWIuY29tL0FsbFRlYW1QYW5kYS9QYW5kYVhfVXNlcmJvdC9hcmNoaXZlL21haW4uemlw" | base64 -d
    fi
}

__repolink () {
    local regex
    local rlink
    regex='(https?)://github.com/.+/.+'
    if [[ $UPSTREAM_REPO == "PANDA_USERBOT" ]]
    then
        rlink=`echo "${UPSTREAM_REPO}"`
    else
        rlink=`echo "aHR0cHM6Ly9naXRodWIuY29tL0FsbFRlYW1QYW5kYS9QYW5kYVhfVXNlcmJvdA==" | base64 -d`
    fi
    echo "$rlink"
}


misc_install() {
    if [ $SETUP_PLAYWRIGHT ]
    then
        echo -e "Installing playwright."
        pip3 install playwright
        playwright install
    fi
    if [ $OKTETO_TOKEN ]; then
        echo -e "Installing Okteto-CLI... "
        curl https://get.okteto.com -sSfL | sh
    fi
}

_install_python_version() {
    python3${pVer%.*} -c "$1"
}

_install_deploy_git() {
    $(_install_python_version 'from git import Repo
import sys
OFFICIAL_UPSTREAM_REPO = "https://github.com/AllTeamPanda/DeploySSH"
ACTIVE_BRANCH_NAME = "master"
repo = Repo.init()
origin = repo.create_remote("temponame", OFFICIAL_UPSTREAM_REPO)
origin.fetch()
repo.create_head(ACTIVE_BRANCH_NAME, origin.refs[ACTIVE_BRANCH_NAME])
repo.heads[ACTIVE_BRANCH_NAME].checkout(True) ')
}

_start_install_git() {
    local repolink=$(__repolink)
    $(_run_python_code 'from git import Repo
import sys
OFFICIAL_UPSTREAM_REPO="'$repolink'"
ACTIVE_BRANCH_NAME = "'$UPSTREAM_REPO_BRANCH'" or "main"
repo = Repo.init()
origin = repo.create_remote("temponame", OFFICIAL_UPSTREAM_REPO)
origin.fetch()
repo.create_head(ACTIVE_BRANCH_NAME, origin.refs[ACTIVE_BRANCH_NAME])
repo.heads[ACTIVE_BRANCH_NAME].checkout(True) ')
}


_install_pandauserbot () {
    local zippath
    zippath="main.zip"
    echo "  Downloading source code ..."
    wget -q $(__ziplink) -O "$zippath"
    echo "  Unpacking Data ..."
    PANDA_USERBOTPATH=$(zipinfo -1 "$zippath" | grep -v "/.");
    unzip -qq "$zippath"
    echo "Done"
    echo "  Cleaning ..."
    rm -rf "$zippath"
    _install_deploy_git
    cd $PANDA_USERBOTPATH
    misc_install
    _start_install_git
    python3 ../setup/updater.py ../requirements.txt requirements.txt

    echo "Running PandaX_Userbot"
    echo "PROSES...... and Cloning...."
    python3 -m userbot
}

_install_pandauserbot
