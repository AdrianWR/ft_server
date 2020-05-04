# ft_server
Simple webserver running from docker container

  This projects aims to run a basic website from a docker container, without needing to install a server on your machine system file. For the build, it was used the Debian Buster operational system, which is dowloaded from Docker Hub at build time. The following services are available on this website:

- NGINX Server
- MariaDB Server
- PHPMyAdmin
- Wordpress CMS

## Build Instructions
  
  A convenience script is supplied to run and rebuild the website container, which can be run with the following command:

    bash quickrun.sh

  The website can be accessed from `https://localhost` or `https://ftserver.com` URL's. Tests were done mainly in Mozilla Firefox and Google Chrome web browsers.
    
  A minor quality of life change is the insertion of an autoindex selection script on the container `tmp` directory. Therefore, one can select the autoindex option for this website with the following command. By default, autoindex is selected to `on`. The use of `.` is recommended, as it updates the `AUTOINDEX` environment variable on the container.

    . /tmp/autoindex.sh [ on | off ]
    
## Security Concerns
As this website supports SSL connection, it will automatically redirects its users to a HTTPS protocol website domain. At first, your web browser should launch a security warning regarding the certificate used to verify the security layer on this website. This is expected, as this webiste have a self-signed certificate. To trust the certificate, you can import the file `client/client.crt` to your host machine web browser, trusting from your web broswer _Preferences_ options.
