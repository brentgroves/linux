# config files

## where

```bash
git config --list --show-origin
file:.git/config        submodule.active=.
file:.git/config        remote.origin.url=git@bitbucket.org-brent_admin:linamar_structures/iokr.git
file:.git/config        remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
file:.git/config        branch.main.remote=origin
file:.git/config        branch.main.vscode-merge-base=origin/main
file:.git/config        branch.main.merge=refs/heads/main
file:.git/config        submodule.inititives/inititive_50/publishing_guide.url=git@bitbucket.org-brent_admin:linamar_structures/publishing_guide.git
file:.git/config        submodule.inititives/inititive_60/iokr_guide.url=git@bitbucket.org-brent_admin:linamar_structures/iokr_guide.git
```

qqn
<https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/Where-system-global-and-local-Windows-Git-config-files-are-saved>

**![config files](https://itknowledgeexchange.techtarget.com/coffee-talk/files/2020/08/git-config-file-locations.png)**

<https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration>

Ubuntu Linux Git Config File Locations
Scope Location and Filename Filename Only
Global ~home/<username>/.gitconfig or ~root/.gitconfig .gitconfig
Local <git-repo>/.git/config config
Worktree <git-repo>/.git/config.worktree config.worktree

cat ~/.gitconfig
