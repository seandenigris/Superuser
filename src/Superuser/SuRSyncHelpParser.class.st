"
self parse: '
Options
'
"
Class {
	#name : #SuRSyncHelpParser,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'optionsHeader',
		'optionLine',
		'optionsSection'
	],
	#category : #'Superuser-Core'
}

{ #category : #accessing }
SuRSyncHelpParser >> optionLine [

	| shortForm longForm description |
	shortForm := #space asPParser, $, asPParser negate plus flatten, $, asPParser ==> #second.
	#space asPParser times: 5.
	longForm := #space asPParser negate plus flatten.
	description := #newline asPParser negate plus flatten.
	^ optionLine := shortForm optional, #space asPParser plus, longForm, #space asPParser plus, description ==> [ :nodes |
		SuFlag new
			shortForm: nodes first;
			longForm: nodes third;
			description: nodes fifth;
			yourself ].
]

{ #category : #accessing }
SuRSyncHelpParser >> optionsHeader [

	^ optionsHeader := #newline asPParser, 'Options' asPParser, #newline asPParser.
]

{ #category : #accessing }
SuRSyncHelpParser >> optionsSection [

	^ optionsSection := optionsHeader flatten, optionLine plus, #newline asPParser ==> #second.
]

{ #category : #'as yet unclassified' }
SuRSyncHelpParser >> start [

	^ optionsHeader negate star, optionsSection ==> #second.
]
