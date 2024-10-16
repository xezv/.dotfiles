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
    bass source ~/.bashrc
  
end