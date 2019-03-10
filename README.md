## Working methodologies in the open source environment (mlmos)

### Homework 1

1. Steps:
   1. Make repo public (doesn't require usename and password authentication when cloned)
   2. If we want to run setup on a new machine:
      * copy _configNet_ function in bashrc
      * copy _cvm_ alias in bashrc
      * run commands: 
        * `wget https://github.com/ioanabirsan/mlmos/blob/master/homework1/bootstrap.service`
        * `wget https://github.com/ioanabirsan/mlmos/blob/master/homework1/preboot.properties`
        * `wget https://github.com/ioanabirsan/mlmos/blob/master/homework1/preboot.sh`
        * `wget https://github.com/ioanabirsan/mlmos/blob/master/homework1/setup.sh`
      * run `/.setup.sh` 

2. Resources:
   * [https://www.liberiangeek.net/2014/07/enable-ssh-key-logon-disable-password-password-less-logon-centos/](https://www.liberiangeek.net/2014/07/enable-ssh-key-logon-disable-password-password-less-logon-centos/)
   * [https://www.serverlab.ca/tutorials/linux/administration-linux/how-to-configure-centos-7-network-settings/](https://www.serverlab.ca/tutorials/linux/administration-linux/how-to-configure-centos-7-network-settings/)
   * [https://www.vmotionhost.com/client-area/knowledgebase.php?action=displayarticle&id=197](https://www.vmotionhost.com/client-area/knowledgebase.php?action=displayarticle&id=197)
   * [https://www.hostinger.com/tutorials/vps/how-to-disable-ssh-password-authentication-on-vps](https://www.hostinger.com/tutorials/vps/how-to-disable-ssh-password-authentication-on-vps)
   * [https://www.linode.com/docs/security/authentication/use-public-key-authentication-with-ssh/#connect-to-the-remote-server](https://www.linode.com/docs/security/authentication/use-public-key-authentication-with-ssh/#connect-to-the-remote-server)
   * [https://www.cyberciti.biz/faq/howto-turn-off-selinux/](https://www.cyberciti.biz/faq/howto-turn-off-selinux/)
   * [https://wiki.manjaro.org/index.php?title=Aliases_in_.bashrc](https://wiki.manjaro.org/index.php?title=Aliases_in_.bashrc)
   * [https://linuxconfig.org/howto-install-ifconfig-on-centos-7-linux](https://linuxconfig.org/howto-install-ifconfig-on-centos-7-linux)
   
