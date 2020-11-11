''
  source ${builtins.fetchTarball {
    url = "https://github.com/git/git/archive/2befe97201e1f3175cce557866c5822793624b5a.tar.gz";
    sha256 = "1mz0arnnd715jl891yg8hjplkm4hgn7pxhwfva5lbda801nps2r7";
  }}/contrib/completion/git-completion.bash;
''
