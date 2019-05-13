reload() {
    exec $SHELL -l
}

external_ip() {
    dig @resolver1.opendns.com ANY myip.opendns.com +short
}

internal_ip() {
    IP_ADDRESSES=($(hostname -I))
    echo "${IP_ADDRESSES[0]}"
}

iso_date() {
    date +"%F"
}

iso_time() {
    date +"%T"
}

iso_datetime() {
    echo "$(iso_date) $(iso_time)"
}

refresh_dotfiles() ( # subshell
    DOTFILES_ROOT="${HOME}/code/personal/dotfiles/"
    cd $DOTFILES_ROOT
    ./operator.sh deploy
    reload
)

build_qmk() ( # subshell
    QMK_ROOT="${HOME}/code/personal/qmk_firmware"
    DESTINATION='/mnt/ronin/Dropbox/'
    KEYBOARD_MODEL='ergodox_ez'
    KEYBOARD_MAP='nameless_hand'
    cd $QMK_ROOT
    make ${KEYBOARD_MODEL}:${KEYBOARD_MAP}
    cp ${QMK_ROOT}/${KEYBOARD_MODEL}_${KEYBOARD_MAP}.hex $DESTINATION
)

display_gpu() {
    id=$1
    name=`lspci -s $id | sed -E 's/^.+\: //'`
    driver=`lspci -vs $id | grep 'driver in use' | sed -E 's/^.+\: //'`
    echo -e "${name} (${id}/${white}${driver}${reset})"
}

list_gpus() {
    # video devices
    VIDEO_DEVICES=($(lspci | grep 'VGA' | sed -E 's/ .+$//'))

    for gpu_id in "${VIDEO_DEVICES[@]}";
    do
        display_gpu "${gpu_id}";
    done;
}

list_disks() {
    disks=(/dev/disk/by-label/*)
    for d in "${disks[@]}"; do
        echo "$d"
    done
}

ascii_logo() {
echo -e "
"

}
