FROM ghcr.io/promisc/ct-ng:6737cfaa as builder-stage-1

WORKDIR /home/builder

COPY --chown=builder:builder arm-linux-gnueabihf_coretex-a8_kernel-3.2.101_glibc-2.19_gcc-9.4.0 /home/builder/ctng-config

RUN mkdir ctng-armhf \
    && cd ctng-armhf \
    && cp /home/builder/ctng-config ./.config \
    && sed -i 's,CT_LOG_PROGRESS_BAR=y,CT_LOG_PROGRESS_BAR=n,' ./.config \
    && ct-ng build \
    && cd .. \
    && rm -rf ctng-armhf

FROM ubuntu:20.04 as builder-stage-2
RUN adduser --disabled-password --gecos '' builder
USER builder
WORKDIR /home/builder
COPY --from=builder-stage-1 /home/builder/x-tools /home/builder/x-tools
ENV PATH=${PATH}:/home/builder/x-tools/arm-linux-gnueabihf/bin
