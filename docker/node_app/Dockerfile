FROM node:9.4

COPY .npmrc ~/.npmrc
RUN npm config set registry https://registry.npm.taobao.org \
    && echo '127.0.0.1 devel.isophp.cn' |tee -a /etc/hosts
COPY ./application /project/application
WORKDIR /project/application/ManagerPlatform
RUN cd /project/application/ManagerPlatform \
    && rm -rf node_modules \
    && npm install

EXPOSE 8000
CMD ['npm', 'start']
