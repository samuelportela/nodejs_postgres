FROM node:7
RUN mkdir /test
ADD . /test
WORKDIR /test

RUN npm config set strict-ssl false
RUN npm config set registry http://registry.npmjs.org
RUN npm config set maxsockets 3

ENV http_proxy "http://10.0.2.2:3128"
ENV https_proxy "http://10.0.2.2:3128"
RUN npm install
ENV http_proxy ""
ENV https_proxy ""

EXPOSE 3000
CMD ["npm", "start"]