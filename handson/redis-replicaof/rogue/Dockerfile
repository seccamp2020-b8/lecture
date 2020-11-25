FROM redis:5.0

RUN apt-get -y update && apt-get -y install python3 git build-essential netcat vim \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/
WORKDIR /rogue/
COPY exp.so .
