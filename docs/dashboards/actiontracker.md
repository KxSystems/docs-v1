### Virus Scanning

Files uploaded via the File Upload dashboard component or attachments uploaded via the ActionTracker may be screened for viruses.

There are two prerequisites for enabling virus scanning:

[1] ClamAV must be installed on the appserver box with up to date definitions.

[2] In delta.profile, enable virus scanning as follows: DELTAAPPSERVER_VIRUS_SCAN_ENABLED=true

<aside class="warning">The appserver must be restarted in order to pick up any changes to the above environment variable.</aside>

To verify whether virus scanning has been enabled, check the running tomcat process <i>(using ps -ef | grep tomcat)</i> and look for  <b>-DdeltaAppServerVirusScanEnabled=true</b> or <b>-DdeltaAppServerVirusScanEnabled=false.</b> With virus scanning enabled, uploaded files will automatically be scanned and if they don't pass the virus check the upload is aborted and an error will be reported on the dashboard. 
