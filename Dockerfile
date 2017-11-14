FROM anaconda3

RUN sudo apt-get update && \
  apt-get install -y vim

# Define volume that will be mounted
VOLUME ["/src"]

# Get Vundle
RUN git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Get dotfiles
RUN git clone https://github.com/awtotty/dotfiles.git && \
  mv dotfiles/.vimrc ~/.vimrc && \
  rmdir dotfiles

# Make Docker use a nonroot user
  RUN useradd -ms /bin/bash awt
  RUN chown -R awt:awt /src /opt /usr
  ENV HOME /home/awt

# Set the working directory
WORKDIR  /src

CMD /bin/bash
