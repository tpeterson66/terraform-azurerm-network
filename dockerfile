FROM ubuntu:latest
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget -y
RUN wget -O spacelift https://downloads.spacelift.io/spacelift-launcher-x86_64
RUN chmod +x spacelift
CMD [ "./spacelift" ]