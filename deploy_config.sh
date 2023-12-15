#!/bin/bash
. ./env.sh
info=''

if [[ ! -f project/config.yml.ref ]]; then
  mv project/config.yml project/config.yml.ref
  mv delete.yaml delete.yaml.ref
fi
    
sed "s/config-id/$Client/g" project/config.yml.ref > project/config.yml
sed "s/config-id/$Client/g" delete.yaml.ref > delete.yaml

while [ "$APPLY" !=  "Y" ]
do
        clear
        echo "bash my_first_deployment_with_monaco_v2.sh"
        echo ""
        echo "Set variables"
        echo "0) export DT_TENANT_URL="$DT_TENANT_URL
        echo "1) export DT_API_TOKEN="${DT_API_TOKEN:0:32}"*****"
        echo "2) export Client="$Client
        echo " #####################"
        echo "Run monaco"
        echo "A) Backup json config> ./monaco download manifest -e MyEnv"
        echo "B) Deploy json config> ./monaco deploy manifest"
        echo "C) Delete json config> ./monaco delete"
        echo " #####################"
        echo "Q) Quit or run monaco manually"
        echo "## info => "$info 
        sleep 0.2
        read  -p "Input Selection (0, 1, 2 or A, B, C, Q ): " reponse

        case "$reponse" in
                "0") read  -p "0) export DT_TENANT_URL=https://" value
                     sed -i 's/DT_TENANT_URL=.*$/DT_TENANT_URL=\"https\:\/\/'$value'\"/g' ./env.sh;. ./env.sh
                     export info="DT_TENANT_URL has been set for the manifest.yaml - example : https://abcdd.live.dynatrace.com.com"
                ;;
                "1") read  -p "1) export DT_API_TOKEN=" value
                     sed -i s/DT_API_TOKEN=.*$/DT_API_TOKEN=\"$value\"/g ./env.sh;. ./env.sh
                     export info="DT_API_TOKEN has been set for the manifest.yaml - example : dt.ABCDEFGH.0123456789"
                ;;
                "2") read  -p "2) export Client=" value
                     sed -i s/Client=.*$/Client=\"$value\"/g ./env.sh;. ./env.sh
                     sed "s/config-id/$Client/g" project/config.yml.ref > project/config.yml
                     sed "s/config-id/$Client/g" delete.yaml.ref > delete.yaml
                     export info="Client is used by ManagementZone the file project/config.yml has a unique id: "$Client
                ;;
                #############################################################
                "A") read  -p "A) ./monaco download manifest -e MyEnv  [Y/N]" value
                   if [[ ${value^} = Y ]]; then
                     echo
                     echo "./monaco download manifest.yaml -e MyEnv"
                     ./monaco download manifest.yaml -e MyEnv
                     export info="all json config has been downloaded on the local host with monaco v2"
                     read  -p "Press any key to continue " pressanycase
                   fi
                ;;
                "B") read  -p "B) ./monaco deploy manifest  [Y/N]" value
                   if [[ "$value" = "Y" ]] || [[ "$value" = "y" ]]; then
                      echo
                      echo "./monaco deploy manifest.yaml"
                      ./monaco deploy manifest.yaml
                      export info=$Client" config has been deployed on your tenant "$DT_TENANT_URL
                      read  -p "Press any key to continue " pressanycase
                   fi
                ;;
                "C") read  -p "C) ./monaco delete  [Y/N]" value
                   if [[ "$value" = "Y" ]] || [[ "$value" = "y" ]]; then
                      echo
                      echo "./monaco delete"
                      ./monaco delete
                      export info=$Client" config has been deleted on your tenant "$DT_TENANT_URL
                      read  -p "Press any key to continue " pressanycase
                   fi
                ;;
                "Q") APPLY="Y"
                        echo
                        echo "if you want to run monaco manually:"
                        echo " - export the variables on local session:      . env.sh"
                        echo " - deploy json configurations with monaco:     ./monaco deploy manifest.yaml"
                        echo " - backup json configurations with monaco:     ./monaco download manifest.yaml -e MyEnv"
                        echo " - (optional) delete config with monaco:       ./monaco delete"
                        echo
                        echo "if you want to sse monaco configuration files:"
                        echo " - cat manifest.yaml"
                        echo " - more project/config.yml"
                        echo " - ls -lrt project"
                        echo " - cat delete.yaml"
                        echo
                        echo "if you want to validate the result on dynatrace UI : "
                        echo " - management-zone: $DT_TENANT_URL/ui/settings/builtin:management-zones"
						echo
                ;;
        esac
done
