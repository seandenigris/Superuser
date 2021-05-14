!Optional Arguments
I utilize Pharo's ${method:String>>#format:}$, which requires all templated variables be supplied. One way to handle optional arguments is to override ${method:SuGenericUnixCommand>>#prepareArguments:}$ to supply default values for optional arguments. Here is an example:${method:SuImageMagick>>#prepareArguments:|expanded=true|label=an example}$
!Output
Instead of ''running'' a command, you can get its ''output''. Here's an example that also shows how to decode boring string output into a real, live object: ${example:SuGenericUnixCommand class>>#exampleOutputDecoder}$
!Shell Syntax, Esoteric
$! - last started background process in this shell
() - run group of commands in subshell
{} - run group of commands in current shell; must have semi-colon after last command & spaces inside braces