# **[Copy dir contents](https://askubuntu.com/questions/86822/how-can-i-copy-the-contents-of-a-folder-to-another-folder-in-a-different-directo)**

How can I copy the contents of a folder to another folder in a different directory using terminal?

You can copy the content of a folder /source to another existing folder /dest with the command

```bash
cp -a /source/. /dest/
```

The -a option is an improved recursive option, that preserve all file attributes, and also preserve symlinks.

The . at end of the source path is a specific cp syntax that allow to copy all files and folders, included hidden ones.
