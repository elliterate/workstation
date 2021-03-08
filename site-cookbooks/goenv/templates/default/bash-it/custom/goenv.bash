export GOENV_ROOT="<%= node['goenv']['dir'] %>"
export PATH="$GOENV_ROOT/bin:$PATH"

eval "$(goenv init -)"

export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
