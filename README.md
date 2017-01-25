# VSFTPD

## DESCRIPTION

Very Basic installation and configuration of vsftpd with virtual users to support Secure (SSL) SFTP.


## REQUIREMENTS

Only tested on Ubuntu 14.04 and the vsftpd that comes from the standard apt sources at the time this cookbook was created. No attempt has been made to support other target platforms or versions of vsftpd.



## Usage

create the password file with:

    $ echo "username" >> /etc/vsftpd/logins.txt
    
    $ echo "password" |mkpasswd -s -m sha-512 >> /etc/vsftpd/logins.txt

    $ db_load -T -t hash -f /etc/vsftpd/logins.txt /etc/vsftpd/login.db
    
    $ mkdir /home/ftpsite/users/username
    
    $ service vsftpd restart
    
    
    