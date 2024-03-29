Trait {
	#name : #TSuHelpASOptionListNodeVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #'Superuser-GToolkit'
}

{ #category : #generated }
TSuHelpASOptionListNodeVisitor >> visitFlagForms: aFlagForms [
	^ self visitOptionList: aFlagForms
]

{ #category : #generated }
TSuHelpASOptionListNodeVisitor >> visitOptionLine: anOptionLine [
	^ self visitOptionList: anOptionLine
]

{ #category : #generated }
TSuHelpASOptionListNodeVisitor >> visitOptionList: anOptionList [
	^ self visitSmaCCParseNode: anOptionList
]
