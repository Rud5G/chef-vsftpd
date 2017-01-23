# VSFTPD

## DESCRIPTION

Very Basic installation and configuration of vsftpd to support Secure (SSL) SFTP.

Uses pretty close to standard vsftpd.conf. Mainly turns on ssl and adds require_ssl_reuse=No.
Will use ssl certificates you specify in attributes and put into the files/default directory or files that are already installed on target server.


## REQUIREMENTS

Only tested on Ubuntu 14.04 and the vsftpd that comes from the standard apt sources at the time this cookbook was created. No attempt has been made to support other target platforms or versions of vsftpd.
