"
I am an """"experimental"""" spike, exploring SmaCC to parse Unixy things.
"
Class {
	#name : #SuHelpParser,
	#superclass : #SmaCCParser,
	#category : 'Superuser-GToolkit'
}

{ #category : #'generated-accessing' }
SuHelpParser class >> cacheId [
	^'2020-09-21T23:12:29.043612-04:00'
]

{ #category : #generated }
SuHelpParser class >> definitionComment [
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
]

{ #category : #examples }
SuHelpParser class >> exampleOptionsSection [
	<gtExample>
	^ self parse: '  -h, --help            Show minimal help message.
  --help-extra          Show extra help for advanced users.
  --help-psm            Show page segmentation modes.
  --help-oem            Show OCR Engine modes.
  -v, --version         Show version information.
  --list-langs          List available languages for tesseract engine.
  --print-parameters    Print tesseract parameters.'
]

{ #category : #accessing }
SuHelpParser class >> grammar [
	^ GtSmaCCGrammar onParser: self
]

{ #category : #examples }
SuHelpParser class >> longFlag [
	<gtExample>
	^ self simulateRule: '<longFlag>' parse: '--help'
]

{ #category : #generated }
SuHelpParser class >> reduceTable [
^#(
	#(10 0 #nil 245761 false ) 
	#(7 1 #reduceActionForOptionList1: 184321 false ) 
	#(8 1 #reduceActionForOptionLine__option___1: 197633 false ) 
	#(8 2 #reduceActionForOptionLine__option___2: 197634 false ) 
	#(11 1 #reduceActionForFlagForms2: 315394 false ) 
	#(10 2 #liftFirstValue: 245762 false ) 
	#(9 3 #reduceActionForOptionLine1: 228353 false ) 
	#(11 3 #reduceActionForFlagForms1: 315393 false )
	).
]

{ #category : #'generated-accessing' }
SuHelpParser class >> scannerClass [
	^SuHelpScanner
]

{ #category : #examples }
SuHelpParser class >> shortFlag [
	<gtExample>
	^ self simulateRule: '<shortFlag>' parse: '-h'
]

{ #category : #generated }
SuHelpParser class >> startingStateForOptionList [
	^ 1
]

{ #category : #generated }
SuHelpParser class >> symbolNames [
	^ #('","' '<shortFlag>' '<longFlag>' '<whitespace>' '<description>' 'B e g i n' 'OptionList' 'OptionLine ''option'' +' 'OptionLine' '<whitespace>*' 'FlagForms' 'E O F' 'error')
]

{ #category : #generated }
SuHelpParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SuHelpASOptionListNode #SuHelpASOptionListNode #OrderedCollection #SuHelpASOptionLineNode nil #SuHelpASFlagFormsNode #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
SuHelpParser class >> transitionTable [
^#(
#[1 0 6 0 2 0 6 0 3 0 6 0 4 0 9 0 7 0 13 0 8 0 17 0 9 0 21 0 10] 
#[0 0 0 0 12] 
#[1 0 6 0 2 0 6 0 3 0 6 0 4 0 25 0 9 0 21 0 10 0 10 0 12] 
#[0 0 14 0 2 0 3 0 4 0 12] 
#[1 0 29 0 2 0 33 0 3 0 37 0 4 0 41 0 11] 
#[0 0 18 0 2 0 3 0 4 0 12] 
#[0 0 45 0 1] 
#[0 0 22 0 5] 
#[0 0 26 0 2 0 3 0 4] 
#[0 0 49 0 5] 
#[0 0 53 0 3] 
#[0 0 30 0 2 0 3 0 4 0 12] 
#[0 0 34 0 5]
	).
]

{ #category : #'generated-reduction actions' }
SuHelpParser >> reduceActionForFlagForms1: nodes [
	| result |
	result := SuHelpASFlagFormsNode new.
	result short: (nodes at: 1).
	result long: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SuHelpParser >> reduceActionForFlagForms2: nodes [
	| result |
	result := SuHelpASFlagFormsNode new.
	result long: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SuHelpParser >> reduceActionForOptionLine1: nodes [
	| result |
	result := SuHelpASOptionLineNode new.
	result forms: (nodes at: 2).
	result desc: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SuHelpParser >> reduceActionForOptionLine__option___1: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
SuHelpParser >> reduceActionForOptionLine__option___2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
SuHelpParser >> reduceActionForOptionList1: nodes [
	| result |
	result := SuHelpASOptionListNode new.
	result addNodes: (nodes at: 1) to: result options.
	^ result
]
