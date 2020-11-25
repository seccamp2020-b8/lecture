FROM debian:jessie

# install dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    wget curl openjdk-7-jre-headless && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# configure vuln application
RUN wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.2.tar.gz && \
    tar xfz elasticsearch-1.4.2.tar.gz && \
    mv elasticsearch-1.4.2 elasticsearch

EXPOSE 9200

RUN echo 'flag{e14st1cse4rch_cve_2015_1427}' > /flag.txt

CMD ["./elasticsearch/bin/elasticsearch"]
