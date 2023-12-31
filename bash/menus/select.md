https://www.gnu.org/software/bash/manual/bash.html#Pipelines

select
The select construct allows the easy generation of menus. It has almost the same syntax as the for command:

select name [in words …]; do commands; done
The list of words following in is expanded, generating a list of items. The set of expanded words is printed on the standard error output stream, each preceded by a number. If the ‘in words’ is omitted, the positional parameters are printed, as if ‘in "$@"’ had been specified. The PS3 prompt is then displayed and a line is read from the standard input. If the line consists of a number corresponding to one of the displayed words, then the value of name is set to that word. If the line is empty, the words and prompt are displayed again. If EOF is read, the select command completes. Any other value read causes name to be set to null. The line read is saved in the variable REPLY.

The commands are executed after each selection until a break command is executed, at which point the select command completes.

Here is an example that allows the user to pick a filename from the current directory, and displays the name and index of the file selected.

select fname in *;
do
	echo you picked $fname \($REPLY\)
	break;
done