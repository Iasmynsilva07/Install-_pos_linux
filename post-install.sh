#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
RED='\033[0;31m'
NC='\033[0m' 

clear
echo -e "${BLUE}==============================================${NC}"
echo -e "${BLUE}    Script de Pós-Instalação para Linux!      ${NC}"
echo -e "${BLUE}==============================================${NC}"
sleep 1

echo -e "${YELLOW}Atualizando o sistema...${NC}"
sleep 1
sudo apt update && sudo apt upgrade -y
echo -e "${GREEN}Sistema atualizado com sucesso!${NC}"
echo ""

sleep 1
echo -e "${YELLOW}Instalando pacotes essenciais...${NC}"
sleep 1
sudo apt install -y git curl vim wget htop unzip build-essential
echo -e "${GREEN}Pacotes essenciais instalados!${NC}"
echo ""

read -p "$(echo -e ${YELLOW}Deseja instalar o Docker e Docker Compose? \[s/n\]:${NC} )" install_docker
if [[ "$install_docker" == "s" || "$install_docker" == "S" ]]; then
    echo -e "${YELLOW}Instalando Docker...${NC}"
    sleep 1
    sudo apt install -y docker.io docker-compose
    sudo systemctl enable docker
    sudo systemctl start docker
    echo -e "${GREEN}Docker instalado e iniciado!${NC}"
else
    echo -e "${RED}Pulando instalação do Docker.${NC}"
fi
echo ""

read -p "$(echo -e ${YELLOW}Deseja instalar o Oh My Zsh? \[s/n\]:${NC} )" install_zsh
if [[ "$install_zsh" == "s" || "$install_zsh" == "S" ]]; then
    echo -e "${YELLOW}Instalando Zsh e Oh My Zsh...${NC}"
    sleep 1
    sudo apt install -y zsh fonts-powerline
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo -e "${GREEN}Zsh e Oh My Zsh instalados com sucesso!${NC}"
else
    echo -e "${RED}Pulando instalação do Oh My Zsh.${NC}"
fi
echo ""

echo -e "${BLUE}==============================================${NC}"
echo -e "${GREEN}        Script finalizado com sucesso!        ${NC}"
echo -e "${BLUE}==============================================${NC}"
echo -e "${YELLOW}Recomenda-se reiniciar a máquina para aplicar todas as atualizações.${NC}"

