#!/sbin/sh
#
# /system/addon.d/95-AudioFX.sh
#

. /tmp/backuptool.functions

list_files() {
cat <<EOF
priv-app/AudioFX.apk
vendor/lib/soundfx/libqcbassboost.so
vendor/lib/soundfx/libqcreverb.so
vendor/lib/soundfx/libqcvirt.so
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/$FILE
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/$FILE $R
    done
    rm /system/app/DSPManager.apk
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac
