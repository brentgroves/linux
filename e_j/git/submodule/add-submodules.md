# Add submodule

## references

- **[add submodules to github](https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/How-to-add-submodules-to-GitHub-repos)**

## **[Add a Submodule](https://gist.github.com/gitaarik/8735255#adding-a-submodule)**

You can add a submodule to a repository like this:

```bash
cd ~/src/repsys
git submodule add git@github.com:brentgroves/go_web_docker.git volumes/go/tutorials/docker/go_web_docker

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
