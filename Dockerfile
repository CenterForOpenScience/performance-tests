FROM openjdk:11-jre

ARG JMETER_VERSION="5.5"
ARG JMETER_PMANAGER_VERSION="1.8"
ARG CMDRUNNER_VERSION="2.3"
ARG JMETER_HOME="/opt/jmeter"
ARG JMETER_PLUGINS_PATH="/opt/jmeter/lib/ext"

RUN wget -O apache-jmeter-${JMETER_VERSION}.tgz "https://www.apache.org/dyn/mirrors/mirrors.cgi?action=download&filename=jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz" \
  && ls -lah\
  && tar -xvzf apache-jmeter-${JMETER_VERSION}.tgz \
  && rm apache-jmeter-${JMETER_VERSION}.tgz \
  && mv apache-jmeter-${JMETER_VERSION} ${JMETER_HOME}

# Uncomment some JVM Options
RUN sed -i '/VERBOSE_GC="-Xlog:gc/s/^#//g' /opt/jmeter/bin/jmeter

# Install plugins
RUN wget https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-manager/${JMETER_PMANAGER_VERSION}/jmeter-plugins-manager-${JMETER_PMANAGER_VERSION}.jar \
  && mv ./jmeter-plugins-manager-${JMETER_PMANAGER_VERSION}.jar ${JMETER_HOME}/lib/ext

RUN wget https://repo1.maven.org/maven2/kg/apc/cmdrunner/${CMDRUNNER_VERSION}/cmdrunner-${CMDRUNNER_VERSION}.jar \
  && mv ./cmdrunner-${CMDRUNNER_VERSION}.jar ${JMETER_HOME}/lib

RUN java -cp ${JMETER_HOME}/lib/ext/jmeter-plugins-manager-${JMETER_PMANAGER_VERSION}.jar org.jmeterplugins.repository.PluginManagerCMDInstaller \
  && ${JMETER_HOME}/bin/PluginsManagerCMD.sh install-all-except 

RUN apt-get update && apt-get install -y git vim

ENV JMETER_HOME ${JMETER_HOME}
ENV PATH ${JMETER_HOME}/bin:$PATH

WORKDIR ${JMETER_HOME}

COPY entrypoint.sh /
RUN ["chmod","+x","/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
