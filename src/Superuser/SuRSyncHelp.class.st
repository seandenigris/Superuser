"
self new contents
"
Class {
	#name : #SuRSyncHelp,
	#superclass : #Object,
	#category : 'Superuser-Core'
}

{ #category : #'as yet unclassified' }
SuRSyncHelp >> contents [

	| tmpOutputFile |
	tmpOutputFile := FileLocator imageDirectory / ('tmp', DateAndTime now asString asLegalSelector).
	NBMacShell run: 'rsync -h > "', tmpOutputFile fullName, '"'.
	^ tmpOutputFile contents.
]

{ #category : #'as yet unclassified' }
SuRSyncHelp >> optionDescriptionLines [

	| headerStripped |
	headerStripped := self contents lines copyAfter: 'Options'.
	^ headerStripped copyUpTo: ''.
]

{ #category : #'as yet unclassified' }
SuRSyncHelp >> optionDescriptions [

	| lines matcher |
	lines := self optionDescriptionLines.
	matcher := RxMatcher forString: ' -(.), --([^ ]+) +(.+)'.
	lines collect: [ :e |
		(matcher matches: e) ifFalse: [ self error: 'uh oh' ].
		{ matcher subexpression: 2. matcher subexpression: 3. matcher subexpression: 4 } ]
]
