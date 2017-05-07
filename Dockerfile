FROM python:2.7
MAINTAINER Sergio Rubio <sergio@rubio.im>
USER root
ENV HOME /root
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
ENV NVM_DIR "/root/.nvm"
ENV NODE_VERSION v7.10.0
ENV NODE_PATH $NVM_DIR/$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/$NODE_VERSION/bin:$PATH
RUN [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    nvm install $NODE_VERSION && \
    nvm alias $NODE_VERSION stable && \
    nvm use $NODE_VERSION && \
    npm install --global storjshare-daemon  --unsafe-perm
EXPOSE 4000
EXPOSE 4001
EXPOSE 4002
EXPOSE 4003
COPY start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
