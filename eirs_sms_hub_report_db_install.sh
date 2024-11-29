#!/bin/bash
. ~/.bash_profile

source ${commonConfigurationFile} 2>/dev/null

dbPassword=$(java -jar  ${pass_dypt} spring.datasource.password)

conn="mysql -h${dbIp} -P${dbPort} -u${dbUsername} -p${dbPassword} ${appdbName}"

`${conn} <<EOFMYSQL
INSERT IGNORE INTO sys_param (DESCRIPTION,tag,VALUE,feature_name,user_type,modified_by) VALUES ('Agg Username','agg_username','dmc_sms@mekongnet','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (DESCRIPTION,tag,VALUE,feature_name,user_type,modified_by) VALUES ('Agg Password','agg_password','f9433f4b6beb35ac8fabb9321cf579f3','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (DESCRIPTION,tag,VALUE,feature_name,user_type,modified_by) VALUES ('Agg Report last run time','agg_report_last_run_time','20-nov-2023','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (DESCRIPTION,tag,VALUE,feature_name,user_type,modified_by) VALUES ('Agg type','default_agg_type','Aggregator','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (DESCRIPTION,tag,VALUE,feature_name,user_type,modified_by) VALUES ('Agg URL','agg_url','https://api.mekongsms.com/api/sendsms.aspx','SMS Notification','system','system');
INSERT IGNORE INTO sys_param (DESCRIPTION,tag,VALUE,feature_name,user_type,modified_by) VALUES ('Agg Report URL','agg_report_url','https://api.mekongsms.com/api/DeliveryDownload.aspx','SMS Notification','system','system');

EOFMYSQL`



echo "********************Thank You DB Process is completed now*****************"
