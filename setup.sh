#!/bin/bash
set -e

# Download and extract Hadoop
wget https://downloads.apache.org/hadoop/common/hadoop-3.3.4/hadoop-3.3.4.tar.gz
tar -C /opt/spark/work-dir -xvzf hadoop-3.3.4.tar.gz
rm hadoop-3.3.4.tar.gz

# Set HADOOP_HOME and JAVA_HOME
echo "HADOOP_HOME=/opt/spark/work-dir/hadoop-3.3.4" >> /opt/spark/work-dir/hadoop-3.3.4/etc/hadoop/hadoop-env.sh
echo "JAVA_HOME=/opt/java/openjdk" >> /opt/spark/work-dir/hadoop-3.3.4/etc/hadoop/hadoop-env.sh

# Install SSH client and server
apt-get update
apt-get install -y openssh-client openssh-server
apt-get install -y python3 default-jre python3-pip nano
pip3 install matplotlib pandas seaborn
pip3 install jupyter

# Setup SSH keys for passwordless login
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

# Start SSH service
service ssh start

# Set Hadoop environment variables
echo 'export HDFS_NAMENODE_USER="root"' >> /opt/spark/work-dir/hadoop-3.3.4/etc/hadoop/hadoop-env.sh
echo 'export HDFS_DATANODE_USER="root"' >> /opt/spark/work-dir/hadoop-3.3.4/etc/hadoop/hadoop-env.sh
echo 'export HDFS_SECONDARYNAMENODE_USER="root"' >> /opt/spark/work-dir/hadoop-3.3.4/etc/hadoop/hadoop-env.sh
echo 'export YARN_RESOURCEMANAGER_USER="root"' >> /opt/spark/work-dir/hadoop-3.3.4/etc/hadoop/hadoop-env.sh
echo 'export YARN_NODEMANAGER_USER="root"' >> /opt/spark/work-dir/hadoop-3.3.4/etc/hadoop/hadoop-env.sh
