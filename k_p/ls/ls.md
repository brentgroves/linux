# **[ls](https://monovm.com/blog/ls-command-in-linux-with-examples/)**

How to Read ls Output Columns?
The ls command is used to list files in the Linux terminal, displaying them in columns. The output of the ls command consists of various ls columns, which can be initially confusing, but with a little practice, it is easy to read and understand the information presented in these ls output columns.

Here is an example of the output of the ls command:

-rw-r--r-- 1 root root 0 Apr 12 13:14 file1.txt

-rw-r--r-- 1 root root 0 Apr 12 13:15 file2.txt

drwxr-xr-x 2 root root 4096 Apr 12 13:16 dir1/

The first column shows the permissions for the file.
The second column shows the number of links to the file.
The third column shows the owner of the file.
The fourth column shows the group that owns the file.
The fifth column shows the size of the file in bytes.
The sixth column showed when the file was last modified.
The seventh column shows the name of the file or directory.

```bash
ls -ld /var/opt/mssql
drwxrwxrwx 6 root root 4096 Jul  5 20:27 /var/opt/mssql
```
