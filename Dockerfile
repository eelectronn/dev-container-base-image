FROM fedora:latest

RUN dnf update -y
RUN dnf upgrade -y

# Install basic tools
RUN dnf install -y curl git vim

# oh-my-zsh setup
RUN dnf install -y zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone --depth 1 -- https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
RUN git clone --depth 1 -- https://github.com/zdharma-continuum/fast-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
RUN git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $HOME/.oh-my-zsh/custom/plugins/zsh-autocomplete
ENV TERM=xterm-256color

# Starship setup
RUN \
curl -O https://starship.rs/install.sh && \
chmod +x install.sh && \
./install.sh --yes

RUN rm -rf /root/.config/starship.toml
RUN mkdir -p /root/.config
COPY starship.toml /root/.config/starship.toml

RUN rm -rf /root/.zshrc
COPY zshrc /root/.zshrc

