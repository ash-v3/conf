function mntd
    if not test -d "/mnt/$argv[1]"
        sudo mkdir "/mnt/$argv[1]"
    end

    sudo mount "/dev/$argv[1]" "/mnt/$argv[1]"
end
