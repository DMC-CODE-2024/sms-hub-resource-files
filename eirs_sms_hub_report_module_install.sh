#!/bin/bash
#set -x

#take back up of existing release
tar -xzvf sms_hub_report_1.0.0.tar.gz >>sms_hub_report_1.0.0_untar_log.txt
mkdir -p ${APP_HOME}/sms_hub_module/sms_hub_report
mkdir -p ${LOG_HOME}/sms_hub_module/sms_hub_report


mv sms_hub_report_1.0.0/sms_hub_report_1.0.0.jar ${RELEASE_HOME}/binary/
#mv national_whitelist_edr_1.0.0/log4j2.xml ${RELEASE_HOME}/global_config
mv sms_hub_report_1.0.0/*  ${APP_HOME}/sms_hub_module/sms_hub_report/

cd ${APP_HOME}/sms_hub_module/sms_hub_report
ln -sf ${RELEASE_HOME}/binary/sms_hub_report_1.0.0.jar sms_hub_report.jar
ln -sf ${RELEASE_HOME}/global_config/log4j2.xml log4j2.xml

chmod +x *.sh


echo "++++++++++++Application Installation completed+++++++++++"

