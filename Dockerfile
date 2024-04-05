FROM node:18.16-bookworm

COPY ./ /opt/work_dir

RUN npm install

ENTRYPOINT [ "/usr/local/bin/npm", "start" ]
