# ------------------------------------------------------
# Backup existing dotfiles
# ------------------------------------------------------
_writeLogHeader "Backup"

datets=$(date '+%Y%m%d%H%M%S')

_create_backup() {
    if [ ! -z "$(ls -A $backup_directory)" ] ;then
        rsync -a $backup_directory/ $archive_directory/$datets/
        _writeLogTerminal 1 "Current backup archived in $archive_directory/$datets"
    fi
    if [ -d ~/$dot_folder ]; then
        rsync -a ~/$dot_folder $backup_directory/
        _writeLogTerminal 1 "Backup of $HOME/$dot_folder created in $backup_directory"
    fi
    if ! test -L ~/.bashrc ;then
        cp ~/.bashrc $backup_directory
        _writeLogTerminal 1 "Backup of $HOME/.bashrc created in $backup_directory"
    fi
    if ! test -L ~/.zshrc ;then
        cp ~/.zshrc $backup_directory
        _writeLogTerminal 1 "Backup of $HOME/.zshrc created in $backup_directory"
    fi
    if [ ! -d $backup_directory/config ] ;then
        mkdir $backup_directory/config
    fi
    if ! test -L ~/.config/qtile && [ -d ~/.config/qtile ] ;then
        cp -r ~/.config/qtile $backup_directory/config
        _writeLogTerminal 1 "Backup of $HOME/.config/qtile created in $backup_directory/config/"
    fi
    if ! test -L ~/.config/hypr && [ -d ~/.config/hypr ] ;then
        cp -r ~/.config/hypr $backup_directory/config
        _writeLogTerminal 1 "Backup of $HOME/.config/hypr created in $backup_directory/config/"
    fi
    if ! test -L ~/.config/ml4w-hyprland-settings && [ -d ~/.config/ml4w-hyprland-settings ] ;then
        cp -r ~/.config/ml4w-hyprland-settings $backup_directory/config
        _writeLogTerminal 1 "Backup of $HOME/.config/ml4w-hyprland-settings created in $backup_directory/config/"
    fi
    if ! test -L ~/.config/qtile && [ -d ~/.config/rofi ] ;then
        cp -r ~/.config/rofi $backup_directory/config
        _writeLogTerminal 1 "Backup of $HOME/.config/rofi created in $backup_directory/config/"
    fi
    if ! test -L ~/.config/wal && [ -d ~/.config/wal ] ;then
        cp -r ~/.config/wal $backup_directory/config
        _writeLogTerminal 1 "Backup of $HOME/.config/wal created in $backup_directory/config/"
    fi
    if ! test -L ~/.config/waybar && [ -d ~/.config/waybar ] ;then
        cp -r ~/.config/waybar $backup_directory/config
        _writeLogTerminal 1 "Backup of $HOME/.config/waybar created in $backup_directory/config/"
    fi
    if ! test -L ~/.config/waypaper && [ -d ~/.config/waypaper ] ;then
        cp -r ~/.config/waypaper $backup_directory/config
        _writeLogTerminal 1 "Backup of $HOME/.config/waypaper created in $backup_directory/config/"
    fi
    if ! test -L ~/.config/wlogout && [ -d ~/.config/wlogout ] ;then
        cp -r ~/.config/wlogout $backup_directory/config
        _writeLogTerminal 1 "Backup of $HOME/.config/wlogout created in $backup_directory/config/"
    fi
    if ! test -L ~/.config/alacritty && [ -d ~/.config/alacritty ] ;then
        cp -r ~/.config/alacritty $backup_directory/config
        _writeLogTerminal 1 "Backup of $HOME/.config/alacritty created in $backup_directory/config/"
    fi
    if ! test -L ~/.config/kitty && [ -d ~/.config/kitty ] ;then
        cp -r ~/.config/kitty $backup_directory/config
        _writeLogTerminal 1 "Backup of $HOME/.config/kitty created in $backup_directory/config/"
    fi
    if ! test -L ~/.config/picom && [ -d ~/.config/picom ] ;then
        cp -r ~/.config/picom $backup_directory/config
        _writeLogTerminal 1 "Backup of $HOME/.config/picom created in $backup_directory/config/"
    fi
    if ! test -L ~/.config/nvim && [ -d ~/.config/nvim ] ;then
        cp -r ~/.config/nvim $backup_directory/config
        _writeLogTerminal 1 "Backup of $HOME/.config/nvim created in $backup_directory/config/"
    fi
    if ! test -L ~/.config/vim && [ -d ~/.config/vim ] ;then
        cp -r ~/.config/vim $backup_directory/config
        _writeLogTerminal 1 "Backup of $HOME/.config/vim created in $backup_directory/config/"
    fi
    if ! test -L ~/.config/dunst && [ -d ~/.config/dunst ] ;then
        cp -r ~/.config/dunst $backup_directory/config
        _writeLogTerminal 1 "Backup of $HOME/.config/dunst created in $backup_directory/config/"
    fi
    if ! test -L ~/.config/swappy && [ -d ~/.config/swappy ] ;then
        cp -r ~/.config/swappy $backup_directory/config
        _writeLogTerminal 1 "Backup of $HOME/.config/swappy created in $backup_directory/config/"
    fi        
}

# Create Backup File Structure
if [ ! -d $ml4w_directory ] ;then
    mkdir $ml4w_directory
    _writeLogTerminal 1 "$ml4w_directory folder created."
fi
if [ ! -d $backup_directory ]; then
    mkdir $backup_directory
    _writeLogTerminal 1 "$backup_directory created"
fi
if [ ! -d $archive_directory ]; then
    mkdir $archive_directory
    _writeLogTerminal 1 "$archive_directory created"
fi

# Backup Existing Dotfiles

if [ -d ~/$dot_folder ] || ! test -L ~/.bashrc || [ -d ~/.config/hypr ] || [ -d ~/.config/qtile ]; then

    _writeHeader "Backup"

    _writeMessage "The script has detected the following files and folders for a backup:"

    if [ -d ~/$dot_folder ]; then
        _writeMessage "   - $HOME/$dot_folder"
    fi
    if ! test -L ~/.bashrc ;then
        _writeMessage "   - $HOME/.bashrc"
    fi
    if ! test -L ~/.zshrc ;then
        _writeMessage "   - $HOME/.zshrc"
    fi
    if ! test -L ~/.config/qtile && [ -d ~/.config/qtile ] ;then
        _writeMessage "   - $HOME/.config/qtile/"
    fi
    if ! test -L ~/.config/hypr && [ -d ~/.config/hypr ] ;then
        _writeMessage "   - $HOME/.config/hypr/"
    fi
    if ! test -L ~/.config/ml4w-hyprland-settings && [ -d ~/.config/ml4w-hyprland-settings ] ;then
        _writeMessage "   - $HOME/.config/ml4w-hyprland-settings/"
    fi
    if ! test -L ~/.config/rofi && [ -d ~/.config/rofi ] ;then
        _writeMessage "   - $HOME/.config/rofi/"
    fi
    if ! test -L ~/.config/wal && [ -d ~/.config/wal ] ;then
        _writeMessage "   - $HOME/.config/wal/"
    fi
    if ! test -L ~/.config/waybar && [ -d ~/.config/waybar ] ;then
        _writeMessage "   - $HOME/.config/waybar/"
    fi
    if ! test -L ~/.config/wlogout && [ -d ~/.config/wlogout ] ;then
        _writeMessage "   - $HOME/.config/wlogout/"
    fi
    if ! test -L ~/.config/alacritty && [ -d ~/.config/alacritty ] ;then
        _writeMessage "   - $HOME/.config/alacritty/"
    fi
    if ! test -L ~/.config/picom && [ -d ~/.config/picom ] ;then
        _writeMessage "   - $HOME/.config/picom/"
    fi
    if ! test -L ~/.config/nvim && [ -d ~/.config/nvim ] ;then
        _writeMessage "   - $HOME/.config/nvim/"
    fi
    if ! test -L ~/.config/vim && [ -d ~/.config/vim ] ;then
        _writeMessage "   - $HOME/.config/vim/"
    fi
    if ! test -L ~/.config/dunst && [ -d ~/.config/dunst ] ;then
        _writeMessage "   - $HOME/.config/dunst/"
    fi
    if ! test -L ~/.config/swappy && [ -d ~/.config/swappy ] ;then
        _writeMessage "   - $HOME/.config/swappy/"
    fi
    echo 
    # Start Backup
    if [ -z $automation_backup ] ;then
        if gum confirm "Do you want to create a backup?" ;then
            _create_backup
        elif [ $? -eq 130 ]; then
            exit 130
        else
            _writeSkipped
        fi
    else
        if [[ "$automation_backup" = true ]] ;then
            _create_backup
        fi
    fi
else
    _writeLogTerminal 0 "Nothing to backup"
fi
echo