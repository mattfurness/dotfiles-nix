''
  source ${builtins.fetchTarball {
    url = "https://github.com/imomaliev/tmux-bash-completion/archive/f5d53239f7658f8e8fbaf02535cc369009c436d6.tar.gz";
    sha256 = "0sq2g3w0h3mkfa6qwqdw93chb5f1hgkz5vdl8yw8mxwdqwhsdprr";
  }}/completions/tmux;
''
