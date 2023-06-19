#O ARGUMENTO -e SERVE PARA QUE O ECHO ACEITE CARACTERES ESPECIAIS COMO \n (newline) and \t (tab) inside of the input string E OS COMANDOS DE COLORIZAÇAO.

#TEM QUE VER UM JEITO DE ADICIONAR O ZSHRC TANTO PRO ROOT COMO PRO USUARIO QUE CHAMOU O SCRIPT

#TIRAR O SUDO DE TODOS OS COMANDOS E COLOCAR UMA MENSAGEM PARA EXECUTAR COMO ROOT

#VERIFICAR SE QUANDO FAZ ASSIM ELE DEIXA A CUSTOMIZAÇAO PARA O ROOT E PARA O USER

#fAZER UM README EXPLICANDO O QUE ESTE SCRIPT FAZ

# Colocar um menu inicial explicando o que faz e o que instala, perguntando se o usuario aceita

# Ver o que mais da pra colocar aqui de persolalizaçao!!!!!

##########################################################


#!/bin/bash
BLUE='\033[0;34m'
WHITE='\033[0;37m'
RED='\033[0;31m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'

BOLD='\033[1;33'

GREENBOLD='\033[1;32m'

#change permissions for this file
#chmod +x customize.sh

#run script
#./customize.sh

# Fail on any command. (o que significa isso???)
set -eux pipefail

#Update repos and system
sudo apt update -y #&& sudo apt full-upgrade -y

#Entering root mode
#sudo su

#Install programs

echo -e "${GREENBOLD}Installig Wget, Git and Curl${WHITE}"
sudo apt install wget git curl -y

echo -e "${GREENBOLD}Installig VirtualBox${WHITE}"
sudo apt install virtualbox -y

echo -e "${GREENBOLD}Installig Gparted${WHITE}"
sudo apt install gparted -y

echo -e "${GREENBOLD}Installig Libre Office Apps${WHITE}"
sudo apt install libreoffice-writer libreoffice-calc libreoffice-impress -y

echo -e "${GREENBOLD}Installig WPS Office Apps${WHITE}"
sudo snap install wps-office

echo -e "${GREENBOLD}Installig Development Tools: Pycharm Professional, Intellij Idea Ultimate, CLion and PHPStorm${WHITE}"
sudo snap install pycharm-professional --classic
sudo snap install intellij-idea-ultimate --classic
sudo snap install clion --classic
sudo snap install phpstorm --classic

#Clean instalations
echo -e "${GREENBOLD}Cleaning...${WHITE}"
sudo apt autoremove -y && sudo apt autoclean -y

#Install ZSH
echo -e "${GREENBOLD}Installig ZSH${WHITE}"
sudo apt install zsh -y

#Daqu pra baixo tem QUE EXECUTAR TANTO NO USUARIO NORMAL QUANTO NO ROOT

#Download ZSHRC
echo -e "${GREENBOLD}Downloading ZSHRC with Kali Kinux Customization${WHITE}"
 wget -P $(pwd) https://gist.githubusercontent.com/Anon-Exploiter/4e12193df0099183d18720c6471d571a/raw/5ffe8b5f2f20baf60a92b80283d4adf0d4c3ae20/.zshrc #Depois redirecionar isso aqui pro meu github

# Replace the configs with the downloaded one.
echo -e "${GREENBOLD}Creating Config file${WHITE}"
sudo cat $(pwd)/.zshrc > ~/.zshrc

# Switch the shell. (tem que fazer a mesma coisa para o root?)
echo -e "${GREENBOLD}Switching the Shell to ZSH${WHITE}"
chsh -s $(which zsh)

#Install autocomplete and autosuggestions in ZSH
echo -e "${GREENBOLD}Installing ZSH autocomplete and autosuggestions${WHITE}"
sudo apt install zsh-autosuggestions
#sudo apt install zsh-autocomplete #nao funciona, tem que clonar

#Insert Alias
echo -e "${GREENBOLD}Creating custom Aliases${WHITE}"
echo "#Personal Aliases" >> ~/.zshrc
echo "alias cls='clear'" >> ~/.zshrc

exec zsh


#########ROOT ZSH CUSTOMIZATION################

# Replace the configs with the downloaded one.
echo -e "${GREENBOLD}Creating Config file${WHITE}"
sudo cat $(pwd)/.zshrc > ~/.zshrc

# Switch the shell. (tem que fazer a mesma coisa para o root?)
echo -e "${GREENBOLD}Switching the Shell to ZSH${WHITE}"
chsh -s $(which zsh)

echo "O zsh esta configurado como shell padrao para este usuario e para o Root. Ao reiniciar a sessao o shell entrara automaticamente no zshell com as configuraç~oes instaladas "










