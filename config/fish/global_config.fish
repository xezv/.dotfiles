if status is-interactive
    # BASH
    # (Login Shell)
    # 1. /etc/profile
    # 2. ~/.bash_profile or ~/.bash_login or ~/.profile -> ~/.bashrc(indirectly)
    # (Non-login Shell or Interactive Shell)
    # 1. /etc/bash.bashrc
    # 2. ~/.bashrc
    # Logout
    # 1. ~/.bash_logout

    # FISH
    # 1. /etc/fish/config.fish
    # 2. ~/.config/fish/config.fish

    # if not status is-login
        # return
    # end

    bass source /etc/profile

    for file in /etc/profile.d/*.sh
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