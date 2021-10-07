"
I merge mp3s. 

Under the hood, I wrap the fork of the command line utility by Darren Mulholland, which seems to be more actively maintained. Documentation on the CLI  *here>https://www.dmulholl.com/dev/mp3cat.html*.
!Installation
The quickest way is to grab a *release binary>https://github.com/dmulholl/mp3cat/releases* from the GH repo. Just install the binary (probably to ==/usr/local/bin==).

1. There is also the Tom Clegg version, which seems to have an incompatible API, but can be installed on Mac via Homebrew. 
"
Class {
	#name : #SuMp3cat,
	#superclass : #SuGenericUnixCommand,
	#instVars : [
		'source',
		'target',
		'output',
		'input'
	],
	#category : 'Superuser-Core'
}

{ #category : #examples }
SuMp3cat class >> exampleFiles [
	<gtExample>
	| result |
	result := self new
		input: { FileLocator home / 'input1.mp3'. FileLocator home / 'input2.mp3' };
		yourself.
	self assert: (result output isKindOf: Tempfile).
	^ result
]

{ #category : #examples }
SuMp3cat class >> exampleFolder [
	<gtExample>
	| result |
	result := self new
		input: FileLocator home;
		yourself.
	self assert: (result output isKindOf: Tempfile).
	^ result
]

{ #category : #accessing }
SuMp3cat >> basicCommandString [
	| varClose variable tokens desc |
	desc := self magritteDescription.
	varClose := $\ asPParser not, $} asPParser.
	variable := $\ asPParser not, ${ asPParser, varClose negate plus flatten, varClose ==> [ :nodes |
		| varName fieldDesc |
		varName := nodes third asSymbol.
		fieldDesc := desc detect: [ :e | e name = varName ].
		fieldDesc suEncoder cull: (fieldDesc read: self) ].
	tokens := variable sea star parse: self template.
	^ String streamContents: [ :s | tokens do: [ :e | s << e ] ]
]

{ #category : #accessing }
SuMp3cat >> initialize [
	super initialize.
	template := 'mp3cat {input} --out {output}'.
]

{ #category : #accessing }
SuMp3cat >> input [
	^ self maLazyInstVarUsing: self inputDescription
]

{ #category : #accessing }
SuMp3cat >> input: anAbstractFileReference [
	input := anAbstractFileReference
]

{ #category : #'magritte-accessing' }
SuMp3cat >> inputDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		accessor: #input;
		classes: { FileLocator. FileReference. Tempfile };
		suEncoder: [ :col | self inputToString: col ];
		required: true;
		yourself
]

{ #category : #'magritte-accessing' }
SuMp3cat >> inputToString: anObject [
	| isFile |
	isFile := (anObject isKindOf: Collection) not.
	^ (isFile and: [ anObject isDirectory ])
			ifTrue: [ ' -dir ', anObject suForCommand ]
			ifFalse: [ anObject suForCommand ]	
]

{ #category : #accessing }
SuMp3cat >> output [
	^ self maLazyInstVarUsing: self outputDescription
]

{ #category : #accessing }
SuMp3cat >> output: anAbstractFileReference [
	output := anAbstractFileReference
]

{ #category : #'magritte-accessing' }
SuMp3cat >> outputDescription [
	<magritteDescription>
	^ MAFileDescription new
		accessor: #output;
		default: Tempfile new;
		yourself
]
