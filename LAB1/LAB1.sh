echo "\n"
echo "Session Stats: "
echo "------------------------------"
echo "Current User: $(whoami)"
date +'Current Date: %m/%d/%Y (%A)'
date +'Current Time: %H:%M:%S'
echo "Current Directory: $(pwd)"
echo "Current Amount Of Procceses: $(ps -e | wc -l | sed 's/^[ \t]*//')"
echo "Current UpTime Info: $(uptime)"
echo "------------------------------"
echo $COLUMNS
echo "\n"
