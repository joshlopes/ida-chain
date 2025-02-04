# You can find the new timestamped tags here: https://hub.docker.com/r/gitpod/workspace-base/tags
FROM gitpod/workspace-base:2022-05-20-05-44-40

# Change your version here
ENV GO_VERSION=1.17
ENV IGNITE_VERSION=0.21.2

# For ref, see: https://github.com/gitpod-io/workspace-images/blob/61df77aad71689504112e1087bb7e26d45a43d10/chunks/lang-go/Dockerfile#L10
ENV GOPATH=$HOME/go-packages
ENV GOROOT=$HOME/go
ENV PATH=$GOROOT/bin:$GOPATH/bin:$PATH
RUN curl -fsSL https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz | tar xzs     && printf '%s\n' 'export GOPATH=/workspace/go'                       'export PATH=$GOPATH/bin:$PATH' > $HOME/.bashrc.d/300-go

# Install ignite
RUN curl https://get.ignite.com/cli@v${IGNITE_VERSION}! | sudo bash

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash - \
    && sudo apt-get install -y nodejs
