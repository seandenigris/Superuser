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
	#category : 'Superuser-Core'
}

{ #category : #'as yet unclassified' }
SuRSyncHelpParser >> optionLine [

	| shortForm longForm description |
	shortForm := #space asParser, $, asParser negate plus flatten, $, asParser ==> #second.
	#space asParser times: 5.
	longForm := #space asParser negate plus flatten.
	description := #lf asParser negate plus flatten.
	^ optionLine := shortForm optional, #space asParser plus, longForm, #space asParser plus, description ==> [ :nodes |
		SuFlag new
			shortForm: nodes first;
			longForm: nodes third;
			description: nodes fifth;
			yourself ].
]

{ #category : #'as yet unclassified' }
SuRSyncHelpParser >> optionsHeader [

	^ optionsHeader := #lf asParser, 'Options' asParser, #lf asParser.
]

{ #category : #'as yet unclassified' }
SuRSyncHelpParser >> optionsSection [

	^ optionsSection := optionsHeader flatten, optionLine plus, #lf asParser ==> #second.
]

{ #category : #'as yet unclassified' }
SuRSyncHelpParser >> start [

	^ optionsHeader negate star, optionsSection ==> #second.
]
