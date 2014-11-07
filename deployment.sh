# shoulds only have to do this once...
sudo su

# all of this can be packed into your own local dev box so it doesn't have to happen each time
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
sudo dpkg -i erlang-solutions_1.0_all.deb
apt-get update
apt-get -y install erlang
apt-get -y install make
apt-get -y install git
apt-get -y install g++
apt-get -y install gcc
apt-get -y install zlibc

apt-get -y install openssl
apt-get -y install curl
apt-get -y install autoconf
apt-get -y install zip unzip
apt-get -y install xsltproc
apt-get -y install fop
apt-get -y install default-jdk
apt-get -y install libxml2-utils
apt-get -y install wx2.8-headers libwxbase2.8 libwxgtk2.8-0 libwxgtk2.8-dev libqt4-opengl-dev libgtk2.0-dev
apt-get -y install libncurses5-dev
apt-get -y install unixodbc-dev
apt-get -y install libssl-dev
apt-get -y install dos2unix

# /all of this can be packed into your own local dev box so it doesn't have to happen each time

# Optionally install your own erlang version
# OPT_VERSION="OTP-17.3.4"
# echo "Installing erlang version" $OPT_VERSION 
# wget -O $OPT_VERSION.zip https://github.com/erlang/otp/archive/$OPT_VERSION.zip --progress=bar:force
# unzip $OPT_VERSION.zip   
# cd otp-$OPT_VERSION
# export ERL_TOP=`pwd
# ./otp_build autoconf
# ./configure
# make
# make install

# copy over the certificates
cd ../../
mkdir certs
cd mongooseim
cp priv/* ../certs

# Go into mongoose, convert the line endings and build it
# if you want to recompile the code each time
# echo "Converting files"
# find ./ -type f -exec dos2unix {} \;
# echo "Making mongooseim"
# make
# echo "Making the mongooseim release"
# make rel

# Start it up and make test users
cd rel/mongooseim
echo "Starting mongooseim"
bin/mongooseim start
echo "Making users... elliot(1,2,3,4) localhost password"
bin/mongooseimctl register elliot1 localhost password
bin/mongooseimctl register elliot2 localhost password
bin/mongooseimctl register elliot3 localhost password
bin/mongooseimctl register elliot4 localhost password
bin/mongooseimctl register elliot5 localhost password
echo "Shutting down mongooseim"
bin/mongooseim stop
echo "All set, go in and start it up live!"
