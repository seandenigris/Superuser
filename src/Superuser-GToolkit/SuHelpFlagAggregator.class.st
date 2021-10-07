Class {
	#name : #SuHelpFlagAggregator,
	#superclass : #SuHelpASOptionListNodeVisitor,
	#instVars : [
		'options'
	],
	#category : 'Superuser-GToolkit'
}

{ #category : #example }
SuHelpFlagAggregator class >> exampleNoArguments [
	<gtExample>
	| flags |
	flags := SuHelpFlagAggregator new accept: SuHelpParser exampleOptionsSection.
	self assert: flags isNotEmpty.
	^ flags
]

{ #category : #generated }
SuHelpFlagAggregator >> options [
	^ options ifNil: [ options := OrderedCollection new ]
]

{ #category : #generated }
SuHelpFlagAggregator >> visitOptionLine: anOptionLine [
	| option |
	option := SuFlag new
		description: anOptionLine desc value;
		yourself.
	anOptionLine forms long ifNotNil: [ :f | option longForm: f value ].
	anOptionLine forms short ifNotNil: [ :f | option shortForm: f value ].
	self options add: option
]

{ #category : #generated }
SuHelpFlagAggregator >> visitOptionList: anOptionList [
	self visitSmaCCParseNode: anOptionList.
	^ self options
]
