#!/bin/zsh
##-------------------------------##
##  PURPLE GITHUB PULL TEMPLATE  ##
##     HomeBrew App Install      ##
##-------------------------------##
##-------------------------------##
##         SET VARIABLES         ##
LOGLOCAL=/Library/Logs/com.purplecomputing.mdm
mkdir -p $LOGLOCAL
exec &> $LOGLOCAL/InstallHomeBrewPowerShell.log
chmod 777 $LOGLOCAL/InstallHomeBrewPowerShell.log

consoleuser=$(/usr/bin/python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "
");')
##-------------------------------##
##       PREFLIGHT SCRIPT        ##
##-------------------------------##
# MAKE DIRECTORIES
mkdir -p /Library/Caches/com.purplecomputing.mdm
mkdir -p /Library/Caches/com.purplecomputing.mdm/Scripts/
# REMOVE APPS AND FILES
rm -rf /Library/Caches/com.purplecomputing.mdm/Scripts/InstallHomebrew.zsh
##-------------------------------##
##         START SCRIPT          ##
##-------------------------------##
echo Status: "Checking if Brew is Installed" >> /var/tmp/depnotify.log
# DOWNLOAD LATEST FILE
    curl -o /Library/Caches/com.purplecomputing.mdm/Scripts/InstallHomebrew.zsh https://raw.githubusercontent.com/PurpleComputing/brew-testing/main/install.zsh
    chmod +x /Library/Caches/com.purplecomputing.mdm/Scripts/InstallHomebrew.zsh
    cd /Applications
    /Library/Caches/com.purplecomputing.mdm/Scripts/InstallHomebrew.zsh
    sleep 3
    rm -rf /Library/Caches/com.purplecomputing.mdm/Scripts/InstallHomebrew.zsh
echo Status: "Brew is Installed" >> /var/tmp/depnotify.log
##-------------------------------##
##     INSTALL APP SCRIPT        ##
##-------------------------------##
#su -l "$consoleuser" -c /usr/local/bin/brew install --cask powershell
#su -l "$consoleuser" -c /usr/local/bin/pwsh -Command Install-Module -Name ExchangeOnlineManagement -Confirm
#su -l "$consoleuser" -c /usr/local/bin/pwsh -Command Install-Module -Name PSWSMan -Confirm
echo Status: "Launching Terminal" >> /var/tmp/depnotify.log
osascript -e 'tell app "Terminal"
    do script "brew install --cask powershell && pwsh -Command Install-Module -Name ExchangeOnlineManagement -Confirm && pwsh -Command Install-Module -Name PSWSMan -Confirm"
end tell'
# END SCRIPT WITH SUCCESS
exit 0
