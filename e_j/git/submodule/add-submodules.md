# Add submodule

## references

- **[add submodules to github](https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/How-to-add-submodules-to-GitHub-repos)**

## **[Add a Submodule](https://gist.github.com/gitaarik/8735255#adding-a-submodule)**

## Q&As

1. For git submodule add does the target directory need to exist prior to running.

No, the target directory does not need to exist prior to running git submodule add [1]. Git handles the creation of the directory for you automatically.
When you execute the command, Git performs the following steps:
Clones the repository: It clones the specified repository URL into the specified path.
Creates the directory: If the directory path doesn't exist, Git creates it.
Records the submodule: It adds an entry to the .gitmodules file and stages the new submodule for commit in the main repository.
For example, running git submodule add github.com my/target/directory will create the my/target/directory path if it doesn't already exist and place the submodule's content inside it.

You can add a submodule to a repository like this:

```bash
cd ~/src/repsys
git submodule add git@github.com:brentgroves/go_web_docker.git volumes/go/tutorials/docker/go_web_docker
cd ~/src/iokrs
git submodule add git@bitbucket.org-brent_admin:linamar_structures/iokr_guide.git teams/team_20/goals/goal_10/key_results/kr_10/initiatives/init_10/iokr_guide

git submodule add git@bitbucket.org-brent_admin:linamar_structures/publishing_guide.git teams/team_20/goals/goal_10/key_results/kr_10/initiatives/init_20/publishing_guide

git submodule add git@bitbucket.org-brent_admin:linamar_structures/okrs.git teams/team_20/goals/goal_10/key_results/kr_10/initiatives/init_30/okrs.git

# volumes/go/tutorials/docker/go_web_docker is going to be a file containing the repo info
git status
git add -A
git commit -m "added submodule"
git push

cd ~/src/liokr
git submodule add git@github.com:brentgroves/linux.git linux

# linux is going to be a file containing the repo info
git status
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   .gitmodules
        new file:   linux
git add -A
git commit -m "added submodule"
[main dfba186] added submodule
 2 files changed, 4 insertions(+)
 create mode 100644 .gitmodules
 create mode 160000 linux
git push -u origin main        
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 22 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 374 bytes | 374.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0), pack-reused 0
To bitbucket.org-brent_admin:liokr/liokr.git
   42d68e7..dfba186  main -> main
branch 'main' set up to track 'origin/main'.

cd ~/gitlab/liokr
git submodule add git@github.com:brentgroves/linux.git linux

git add -A
git commit -m "added submodule"
[main dfba186] added submodule
 2 files changed, 4 insertions(+)
 create mode 100644 .gitmodules
 create mode 160000 linux
git push -u origin main        

```
