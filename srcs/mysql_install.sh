apt-key adv --keyserver pgp.mit.edu --recv-keys 5072E1F5
echo "deb http://repo.mysql.com/apt/debian/ buster mysql-5.7" > /etc/apt/sources.list.d/mysql.list
echo "mysql-community-server mysql-community-server/root-pass password ${1:-''}" | debconf-set-selections
echo "mysql-community-server mysql-community-server/re-root-pass password ${1:-''}" | debconf-set-selections
apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-community-server
