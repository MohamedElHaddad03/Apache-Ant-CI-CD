FROM alpine:latest

ARG ANT_VERSION=1.10.14
ARG IVY_VERSION=2.5.2
ENV ANT_HOME=/usr/share/ant
ENV PATH="$PATH:$ANT_HOME/bin"

RUN apk add --no-cache wget unzip openjdk17 && \
    wget https://downloads.apache.org/ant/binaries/apache-ant-${ANT_VERSION}-bin.zip && \
    unzip apache-ant-${ANT_VERSION}-bin.zip -d /usr/share/ && \
    mv /usr/share/apache-ant-${ANT_VERSION} $ANT_HOME && \
    rm apache-ant-${ANT_VERSION}-bin.zip && \
    mkdir -p /usr/share/ant/lib && \
    wget https://repo1.maven.org/maven2/org/apache/ivy/ivy/${IVY_VERSION}/ivy-${IVY_VERSION}.jar -P /usr/share/ant/lib/

RUN ls -l $ANT_HOME/bin

WORKDIR /app

COPY . .

ENTRYPOINT ["ant"]
CMD ["all"]
