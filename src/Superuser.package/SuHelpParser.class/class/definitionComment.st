generated
definitionComment
"%root OptionList;
%prefix SuHelpAS;
%suffix Node;

<shortFlag>        :       -\w ;
<longFlag>        :       --\S+ ;
<whitespace>    :       \s+;
<description> : [\w]+[^\r\n]*;

OptionList : OptionLine 'option' + {{}};
	
OptionLine
    : <whitespace>* FlagForms 'forms' <description> 'desc' {{}}
        ;
FlagForms
	: <shortFlag> 'short' "","" <longFlag> 'long' {{}}
	| <longFlag> 'long' {{}};"