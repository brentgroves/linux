# **[Delete Submodule](https://www.atlassian.com/git/articles/core-concept-workflows-and-tips)**

How do I remove a submodule?
It is a fairly common need but has a slightly convoluted procedure. To remove a submodule you need to:

1. Delete the relevant line from the .gitmodules file.
2. Delete the relevant section from .git/config.
3. Run git rm --cached path_to_submodule (no trailing slash).

    ```bash
    git rm --cached inititives/inititive_60/iokr_guide
    git rm --cached inititives/inititive_50/publishing_guide
    git rm --cached inititives/inititive_90/okrs

    [submodule "inititives/inititive_60/iokr_guide"]
      path = inititives/inititive_60/iokr_guide
      url = git@bitbucket.org-brent_admin:linamar_structures/iokr_guide.git
    [submodule "inititives/inititive_50/publishing_guide"]
      path = inititives/inititive_50/publishing_guide
      url = git@bitbucket.org-brent_admin:linamar_structures/publishing_guide.git

    [submodule "inititives/inititive_90/okrs"]
      path = inititives/inititive_90/okrs
      url = git@bitbucket.org-brent_admin:linamar_structures/okrs.git

    ```

4. Commit and delete the now untracked submodule files.
