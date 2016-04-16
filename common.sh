	eval ${UBOOT_TOOLCHAIN:+env PATH=$UBOOT_TOOLCHAIN:$PATH} ${CROSS_COMPILE}gcc --version | head -1 | tee -a $DEST/debug/install.log
	eval ${KERNEL_TOOLCHAIN:+env PATH=$KERNEL_TOOLCHAIN:$PATH} ${CROSS_COMPILE}gcc --version | head -1 | tee -a $DEST/debug/install.log
install_external_applications ()
{
display_alert "Installing extra applications and drivers" "" "info"
# cleanup for install_kernel and install_board_specific
umount $CACHEDIR/sdcard/tmp >/dev/null 2>&1
for plugin in $SRC/lib/extras/*.sh; do
	source $plugin
done
	make clean >/dev/null
	make ARCH=$ARCHITECTURE CC="${CROSS_COMPILE}gcc" KSRC="$SOURCES/$LINUXSOURCEDIR/" >> $DEST/debug/compilation.log 2>&1

	make ARCH=$ARCHITECTURE CC="${CROSS_COMPILE}gcc" KSRC="$SOURCES/$LINUXSOURCEDIR/" >> $DEST/debug/compilation.log 2>&1