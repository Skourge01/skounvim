#!/bin/bash 
# instala as dependencias necessarias para rodar a config do neovim perfeitamente 
check_git() {
    if command -v git &> /dev/null; then 
        echo "Git instalado."
    else 
        echo "Git não instalado, instalando"
        sudo pacman -S git base-devel 
    fi  
}
check_neovim(){
    if command -v neovim &> /dev/null; then 
        echo "Neovim ja instalado"
    else 
        echo "Instalando o neovim" 
        sudo pacman -S neovim
    fi 
}
check_nodejs(){
    if command -v nodejs &> /dev/null; then 
        echo "Nodejs localizado"
    else
        echo "Não ha nodejs, instalando.."
        sudo pacman -S nodejs
    fi 
}
check_neovim 
check_git 
echo "Instalando as dependencias.." 
check_dependencies() {
    git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}
check_dependences
check_nodejs