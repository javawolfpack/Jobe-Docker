FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y php5 libapache2-mod-php5 php5-mcrypt php5-mysql php5-cli octave nodejs git python3 build-essential openjdk-7-jre openjdk-7-jdk python3-pip
RUN pip3 install pylint
RUN pylint --reports=no --generate-rcfile > /etc/pylintrc
ADD ./jobe /var/www/html/jobe/
WORKDIR /var/www/html/jobe/
RUN /usr/sbin/apache2ctl start && ./install
