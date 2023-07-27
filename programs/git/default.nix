{ ... }:
{
  programs.git = {
    enable = true;
    userName = "mattfurness";
    userEmail = "matt.furness@gmail.com";
    aliases = {
      a = "add";
      amend = "commit --amend";
      cm = "commit --message";
      cp = "cherry-pick";
      co = "checkout";
      cob = "checkout -b";
      d = "diff";
      ds = "diff --staged";
      fixup = "commit --fixup";
      l = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset%n' --abbrev-commit --date=relative --branches --all";
      p = "push";
      pf = "push --force-with-lease";
      s = "status";
    };
    extraConfig = {
      init.defaultBranch = "main";
      diff.tool = "bc3";
      difftool.bc3.trustExitCode = true;
      difftool.prompt = false;
      merge.tool = "bc3";
      mergetool.bc3.trustExitCode = true;
      mergetool = {
        prompt = false;
        keepBackup = false;
      };
      core = {
        editor = "vim";
        pager = "delta";
      };
      delta = {
        navigate = true;
        side-by-side = true;
        syntax-theme = "base16-256";
        true-color = "always";
      };
      interactive.diffFilter = "delta --color-only";
      rebase.autosquash = true;
      pull.rebase = true;
      push.autoSetupRemote = true;
    };
    ignores = [
      "tags"
      ".idea"
    ];
  };
}
