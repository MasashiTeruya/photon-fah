FROM photon:3.0

RUN tdnf remove -y toybox
RUN tdnf install -y bzip2 tar
RUN curl -o fahclient_7.6.13-64bit-release.tar.bz2 https://download.foldingathome.org/releases/public/release/fahclient/centos-6.7-64bit/v7.6/fahclient_7.6.13-64bit-release.tar.bz2 && tar xf fahclient_7.6.13-64bit-release.tar.bz2
ENTRYPOINT ["fahclient_7.6.13-64bit-release/FAHClient", "--user=$FAH_USER", "--team=$FAH_TEAM",  "--passkey=$FAH_PASSKEY", "--gpu=false", "--smp=true"]
