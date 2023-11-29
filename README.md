#  Deploy MZ

In this lab you will import all json configurations with [monaco v2](https://www.dynatrace.com/support/help/manage/configuration-as-code) : 
    

## Step 1 : clone this git  

    cd
    git clone https://github.com/dynatrace-ace-services/dynatrace-lab
    echo "the lab is copy here "`pwd`"/dynatrace-lab"
    

## Step 2 : install monaco V2

    cd;cd dynatrace-lab/
    curl -L https://github.com/Dynatrace/dynatrace-configuration-as-code/releases/latest/download/monaco-linux-amd64 -o monaco
    chmod +x monaco
    echo "monaco v2 is installed on your host"
    
## Step 3 : my first deployment with monaco v2 
use this script to configure the variables on linux environment   

    cd;cd dynatrace-lab
    bash deploy_config.sh

![image](https://user-images.githubusercontent.com/40337213/234709653-0d377eea-7bf7-4bac-b49c-bf5b19414a89.png)

    - Set the variables
    - Run monaco backup
    - Run monaco deploy
    - Validate new configuration in Dynatrace UI
    (optional run monaco delete)
    
./monaco deploy manifest.yaml  

![image](https://user-images.githubusercontent.com/40337213/234711096-84d29528-21ba-4e4a-8f91-7af592f81e2e.png)
