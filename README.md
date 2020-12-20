## Required softwares
```
sudo pacman -S termite xclip gvim numlockx redshift mysql-python python-mysql-connector uget qbittorrent nodejs npm flameshot fzf gdb valgrind openssh nitrogen gcc5 firefox pavucontrol pulseaudio mpv tmux

sudo pacman -R libre-still gimp hplip

yay -S google-chrome jre8 spotify insomnia sublime-text-dev xcwd-git slack-desktop polybar --noconfirm  

```
## Setup java

```
archlinux-java status
sudo archlinux-java set java-8-jre/jre
```

## Setup configs
```
git config --global user.email "nurullah201@gmail.com"
git config --global user.name "nurulmac11"
ssh-keygen -t rsa -b 4096 -C "nurullah201@gmail.com"
xclip -sel clip < ~/.ssh/id_rsa.pub
https://github.com/settings/keys

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git@github.com:nurulmac11/Dot-files.git
cp /home/$USER/dotfiles/.bashrc ~/
cp /home/$USER/dotfiles/.vimrc ~/


cp -r /home/$USER/Dot-files/termite ~/.config/
cp /home/$USER/dotfiles/.conkyrc ~/
cp /home/$USER/dotfiles/tmux.conf ~/.tmux.conf
cp /home/$USER/dotfiles/i3/config ~/.i3/
cp -r /home/$USER/dotfiles/polybar ~/.config/polybar
i3-msg reload
```


## Time Fix
```
timedatectl set-local-rtc 1 --adjust-system-clock
```


## Font setup

    wget https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete%20Mono.ttf
    mv Sauce\ Code\ Pro\ Nerd\ Font\ Complete\ Mono.ttf  ~/.fonts/Sauce\ Code\ Pro\ Nerd\ Font\ Complete\ Mono.ttf
    sudo fc-cache -fv

## LAMP Setup
```
sudo pacman -Syu apache mariadb mariadb-clients libmariadbclient php php-apache phpmyadmin
sudo systemctl enable httpd
sudo systemctl start httpd
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl start mysqld.service
sudo systemctl enable mysqld.service
sudo mysql_secure_installation

sudo mkdir /var/log/php
sudo chown http /var/log/php

sudo vim /etc/httpd/conf/httpd.conf 
ADD 
# Dynamic Shared Object (DSO) Support
LoadModule php7_module modules/libphp7.so
AddHandler php7-script php

# Supplemental configuration
# PHP 7
Include conf/extra/php7_module.conf

# Located in the <IfModule mime_module>
AddType application/x-httpd-php .php
AddType application/x-httpd-php-source .phps
-----------
CHANGE
#LoadModule mpm_event_module modules/mod_mpm_event.so
LoadModule mpm_prefork_module modules/mod_mpm_prefork.so
------

sudo vim /etc/php/php.ini
CHANGE
extension=mysqli
------

sudo vim /etc/httpd/conf/extra/phpmyadmin.conf
CREATE
Alias /phpmyadmin "/usr/share/webapps/phpMyAdmin"
<Directory "/usr/share/webapps/phpMyAdmin">
  DirectoryIndex index.php
  AllowOverride All
  Options FollowSymlinks
  Require all granted
</Directory>
-------

sudo vim /etc/httpd/conf/httpd.conf
ADD
Include conf/extra/phpmyadmin.conf
------
sudo mkdir /usr/share/phpmyadmin/
sudo mkdir /usr/share/phpmyadmin/temp
sudo chmod 777 /usr/share/phpmyadmin/temp
sudo vim /etc/webapps/phpmyadmin/config.inc.php
CHANGE
$cfg['blowfish_secret'] = '22d4463e5a7f6a39644ec4dd24494513'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */
$cfg['TempDir'] = '/usr/share/phpmyadmin/temp';
-------


sudo systemctl restart httpd.service
```
