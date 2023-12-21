# TAKSERVER
## My CentOS7 Auto Installer
```bash
sudo yum install git && cd /tmp && git clone https://github.com/jpat-12/TAKSERVER-INSTALL.git && cd TAKSERVER-INSTALL && cd centos-install && sudo chmod +x depend-rpm.sh && ./depend-rpm.sh && sudo chmod +x centos.sh && clear && echo "run ./centos.sh to install takserver" && cd /home/atak/Downloads
```
### Package Creation & Push to Webserver
```bash
sudo yum install git && cd /tmp && git clone https://github.com/jpat-12/TAKSERVER-INSTALL.git && cd TAKSERVER-INSTALL/Package-Creation && sudo chmod +x setup.sh && sudo chmod +x variable.sh && sudo chmod +x create.sh && ./setup.sh
```

## RPM INSTALLER 
```bash
sudo yum install git && cd /tmp && git clone https://github.com/jpat-12/TAKSERVER-INSTALL.git && cd TAKSERVER-INSTALL && cd takserver-rpm-installer && sudo chmod +x installTakServer.sh && ./installTakServer.sh 
```

## DEB INSTALLER 
```bash
sudo yum install git && cd /tmp/ && git clone https://github.com/jpat-12/takserver-deb-installer.git && cd TAKSERVER-INSTALL && cd takserver-deb-installer && sudo chmod +x install-deb.sh && . install-deb.sh
```