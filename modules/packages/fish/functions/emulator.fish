function emulator
  QT_QPA_PLATFORM=xcb \
  LIBGL_DRI3_DISABLE=1 \
  NIX_ANDROID_EMULATOR_FLAGS="-gpu host -accel on -memory 4096 -cores 4 -no-metrics -qemu -device virtio-keyboard-pci" \
  steam-run run-test-emulator
  #-no-snapshot
end
