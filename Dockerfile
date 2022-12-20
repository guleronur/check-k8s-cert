FROM ubuntu

RUN apt-get update -y

RUN apt-get install openssl -y

COPY . .

RUN mkdir /var/cert

RUN chmod +x /check-k8s-script.sh

ENTRYPOINT ["/check-k8s-script.sh"]