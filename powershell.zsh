##  PURPLE GITHUB PULL TEMPLATE  ##
##        HomeBrew Install       ##
##-------------------------------##
##-------------------------------##
##         SET VARIABLES         ##
LOGLOCAL=/Library/Logs/com.purplecomputing.mdm
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
# DOWNLOAD LATEST FILE
curl -o /Library/Caches/com.purplecomputing.mdm/Scripts/InstallHomebrew.zsh https://raw.githubusercontent.com/kandji-inc/support/main/Scripts/InstallHomebrew.zsh
# GIVE EXECUTE PERMISSIONS
chmod +x /Library/Caches/com.purplecomputing.mdm/Scripts/InstallHomebrew.zsh
cd /Applications
# RUN AS CURRENT USER
/Library/Caches/com.purplecomputing.mdm/Scripts/InstallHomebrew.zsh
sleep 3
##-------------------------------##
##      POSTFLIGHT SCRIPT        ##
##-------------------------------##
rm -rf /Library/Caches/com.purplecomputing.mdm/Scripts/InstallHomebrew.zsh
osascript -e 'tell app "Terminal"
    do script "brew install --cask powershell && pwsh -Command Install-Module -Name ExchangeOnlineManagement -Confirm && pwsh -Command Install-Module -Name PSWSMan -Confirm"
end tell'
# END SCRIPT WITH SUCCESS
exit 0
