set -a bass_files /etc/profile.d/*.sh ~/.config/fish/*.sh

if status is-interactive
    if not type -q bass
        echo "not found bass. install bass(config.fish)"
        exit 1
    end

    for file in $bass_files
        if not test -e $file
            echo "not found $file(config.fish)"
            exit 1
        end
        bass source $file
        if [ $status -ne 0 ]
            echo "failed to source $file(config.fish)"
            exit 1
        end
    end
  
end