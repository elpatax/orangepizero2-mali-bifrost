apt-get update
apt-get upgrade
dpkg --install linux-headers-legacy-sun50iw9_2.1.0_arm64.deb
tar -xzf BX301A01B-SW-99002-r16p0-01rel0.tgz
make -C /usr/src/linux-headers-$(uname -r)/ M=${PWD}/BX301A01B-SW-99002-r16p0-01rel0/driver/product/kernel/drivers/gpu/arm/midgard/ CONFIG_MALI_MIDGARD=m CONFIG_MALI_GATOR_SUPPORT=y CONFIG_MALI_MIDGARD_DVFS=y CONFIG_MALI_EXPERT=y CONFIG_MALI_PLATFORM_FAKE=y CONFIG_MALI_PLATFORM_THIRDPARTY=y CONFIG_MALI_PLATFORM_THIRDPARTY_NAME=devicetree modules
mkdir -p /lib/modules/$(uname -r)/extras
cp BX301A01B-SW-99002-r16p0-01rel0/driver/product/kernel/drivers/gpu/arm/midgard/mali_kbase.ko /lib/modules/$(uname -r)/extras/
depmod -a
modprobe mali_kbase
dpkg --install malig31-fbdev-opencl-odroid_20200503-r12p0-1_arm64.deb
apt-get install clinfo ocl-icd-opencl-dev ocl-icd-libopencl1 cmake
git clone https://github.com/ekondis/mixbench
cd mixbench
mkdir build
cd build
cmake ../mixbench-opencl -DOpenCL_LIBRARY=/usr/lib/aarch64-linux-gnu/libOpenCL.so
make
./mixbench-ocl-alt
clinfo

