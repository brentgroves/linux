It's the first special case of parameter substitution in man bash:
${parameter:-word}
Use Default Values. If parameter is unset or null, the expansion of word is substituted. Otherwise, the value of parameter is substituted.

In the case you mentioned, either the user has provided arguments on the command line and they will be used, or the user is asked to input them on standard input afterwards.