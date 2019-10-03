FROM ubuntu:18.04
ARG DEBIAN_FRONTEND=noninteractive

LABEL version="1.0"
LABEL author="Mauricio Nunes <mnunes@vialink.com.br>"

RUN apt-get update && apt-get install zsh wget curl git apt-utils vim-nox -y locales

RUN locale-gen en_US.UTF-8

RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

COPY etc/skel/.zshrc /root/.zshrc

RUN chsh -s $(which zsh)

ENTRYPOINT [ "/bin/zsh" ]