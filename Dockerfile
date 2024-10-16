FROM openjdk:17-jdk

ENV ANT_VERSION=1.10.12
ENV IVY_VERSION=2.5.2
ENV ANT_HOME=/usr/bin/ant
ENV PATH="$PATH:$ANT_HOME"

RUN apt-get update && \
    apt-get install -y wget && \
    wget https://downloads.apache.org//ant/binaries/apache-ant-${ANT_VERSION}-bin.zip && \
    apt-get install -y unzip && \
    unzip apache-ant-${ANT_VERSION}-bin.zip -d /usr/share && \
    rm apache-ant-${ANT_VERSION}-bin.zip && \
    wget https://repo1.maven.org/maven2/org/apache/ivy/ivy/${IVY_VERSION}/ivy-${IVY_VERSION}.jar -P /usr/share/ant/lib/ && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

CMD ["ant", "all"]
