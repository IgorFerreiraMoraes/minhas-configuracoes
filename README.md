# Meu Setup Linux
Este repositório contém um conjunto de scripts que automatizam a configuração do meu ambiente pessoal no [Fedora Silverblue](https://fedoraproject.org/atomic-desktops/silverblue/) com [GNOME](https://www.gnome.org/). Eles foram feitos fornecer uma maneira rápida de preparar uma nova instação para o meu uso diário, desde a configuração do sistema até a instalação de aplicativos e a criação de ambientes de desenvolvimento.

## O Que É Feito
- Configuração do Sistema: Atualiza pacotes já instalados, remove softwares padrão não desejados, ajusta repositórios.

- Instalação de Programas: Instala os meus aplicativos essenciais, incluindo ferramentas de produtividade, software de criação e design, e utilidades do sistema, usando principalmente [Flatpak](https://flatpak.org/).

- Ambiente de Desenvolvimento: Configura um contêiner [Toolbx](https://containertoolbx.org/) com ferramentas para desenvolvimento, como Git, Neovim e Node.js.

- Personalização e Temas: Aplica as minhas preferências ao GNOME, com extensões, [Pacote de Ícones](https://github.com/IgorFerreiraMoraes/Mignon-icon-theme), e temas para terminal e navegador.

## Como Usar
Como mencionado, essas configurações são "sob medida" para a forma que eu uso o computador. Outro aviso é para lerem os scripts antes de executá-los para entender todas as alterações que eles farão, rodar arquivos aleatórios da internet tem riscos.

1. Clone este repositório para sua máquina com Fedora Silverblue: `git clone https://github.com/IgorFerreiraMoraes/minhas-configuracoes.git`

2. Dê permissão ao script: `chmod +x ./apply_configs.sh`

3. Execute o script plicipal: `./apply_configs.sh`
