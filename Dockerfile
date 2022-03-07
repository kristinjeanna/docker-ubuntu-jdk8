ARG JAVA_VERSION=8u322b06
ARG JAVA_VERSION_URL=jdk8u322-b06
ARG JAVA_SYMLINK_NAME=jdk-8
ARG JAVA_SHA256_CHECKSUM=3d62362a78c9412766471b05253507a4cfc212daea5cdf122860173ce902400e

# =============================================================================
# ========== Download JDK
# =============================================================================
FROM kristinjeanna/ubuntu:latest AS jdk-downloader

USER root

# JDK8 args
ARG JAVA_VERSION
ARG JAVA_VERSION_URL
ARG JAVA_RELEASE_URL=https://github.com/adoptium/temurin8-binaries/releases/download/${JAVA_VERSION_URL}
ARG JAVA_FILENAME=OpenJDK8U-jdk_x64_linux_hotspot_${JAVA_VERSION}.tar.gz
ARG JAVA_EXTRACT_DIR=jdk${JAVA_VERSION}
ARG JAVA_SHA256_CHECKSUM
ARG JAVA_SYMLINK_NAME

# download JDK8, verify hash, and extract
RUN mkdir /opt/${JAVA_EXTRACT_DIR} && \
	cd /opt && \
	apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y wget && \
	wget ${JAVA_RELEASE_URL}/${JAVA_FILENAME} && \
	echo "${JAVA_SHA256_CHECKSUM} ${JAVA_FILENAME}" | sha256sum -c - && \
	tar -xzv -C ${JAVA_EXTRACT_DIR} -f ${JAVA_FILENAME} --strip-components=1 && \
	ln -s ${JAVA_EXTRACT_DIR} ${JAVA_SYMLINK_NAME} && \
	rm ${JAVA_FILENAME}

# =============================================================================
# ========== Assemble the final docker image
# =============================================================================
FROM kristinjeanna/ubuntu:latest AS final

ARG JAVA_VERSION
ARG JAVA_SYMLINK_NAME

LABEL "java.version"="${JAVA_VERSION}"

ENV JDK_HOME=/opt/${JAVA_SYMLINK_NAME}
ENV JAVA_HOME=${JDK_HOME}/jre
ENV PATH=${JAVA_HOME}/bin:${JDK_HOME}/bin:${PATH}

# copy the downloaded Java JDK
COPY --from=jdk-downloader /opt /opt

CMD ["bash"]
