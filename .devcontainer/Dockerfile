FROM ubuntu:20.04

WORKDIR /home/

COPY . .

ENV DEBIAN_FRONTEND=noninteractive 
RUN bash ./setup.sh

RUN echo '\n' >> "$HOME/.zshrc"