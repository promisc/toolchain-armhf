# toolchain-armhf

Create a toolchain using `ct-ng` with the aim of creating a [many-linux](https://github.com/pypa/manylinux) build system for different architectures. This is then used as a base to build Frida components for example.

# ARM Coretex A8 EABI Hardware Float configs
Using crosstool-NG version 1.24.0.504_6737cfa
## gLibc 2.19
File `arm-linux-gnueabihf_coretex-a8_kernel-3.2.101_glibc-2.19_gcc-9.4.0`.

Option          | Setting
----------------|------------------------------
`ct-ng` sample  | `arm-coretex_a8-linux-gnueabi`
triple/tuple    | `arm-linux-gnueabihf` (`CT_OMIT_TARGET_VENDOR=y`)
Kernel          | 3.2.101
gLibc           | 2.19
GCC             | 9.4.0
binutils        | 2.37

## gLibc 2.17
File `arm-linux-gnueabihf_coretex-a8_kernel-3.2.101_glibc-2.17_gcc-9.4.0`.

Option          | Setting
----------------|------------------------------
`ct-ng` sample  | `arm-coretex_a8-linux-gnueabi`
triple/tuple    | `arm-linux-gnueabihf` (`CT_OMIT_TARGET_VENDOR=y`)
Kernel          | 3.2.101
gLibc           | 2.17
GCC             | 9.4.0
binutils        | 2.37

# Customising configs

```bash
mkdir new-config
chmod a+w new-config
cp arm-linux-gnueabihf_coretex-a8_kernel-3.2.101_glibc-2.19_gcc-9.4.0 new-config/
docker run -ti --rm -v $PWD/new-config:/data ghcr.io/promisc/ct-ng:6737cfaa
# builder@ccff3feec490:~$ cp /data/arm-linux-gnueabihf_coretex-a8_kernel-3.2.101_glibc-2.19_gcc-9.4.0 ./.config
# builder@ccff3feec490:~$ ct-ng menuconfig
# builder@ccff3feec490:~$ cp .config /data/arm-linux-gnueabihf_coretex-a8_kernel-3.2.101_glibc-2.17_gcc-9.4.0 
# builder@ccff3feec490:~$ exit
cp new-config/arm-linux-gnueabihf_coretex-a8_kernel-3.2.101_glibc-2.17_gcc-9.4.0 ./
rm -rf new-config
```
