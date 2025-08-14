## install brew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

### add PATH
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.bash_profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

### verify

@Euraxluo ➜ /workspaces/letsmove/mover/euraxluo (main) $ brew doctor
Your system is ready to brew.



## install sui

brew install sui
