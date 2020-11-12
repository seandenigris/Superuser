!Optional Arguments
I utilize Pharo's ${method:String>>#format:}$, which requires all templated variables be supplied. One way to handle optional arguments is to override ${method:SuGenericUnixCommand>>#argumentSource}$ to supply default values for optional arguments. Here is an example:${method:SuImageMagick>>#argumentSource|expanded=true|label=an example}$
!Shell Syntax, Esoteric
$! - last started background process in this shell
() - run group of commands in subshell
{} - run group of commands in current shell; must have semi-colon after last command & spaces inside braces