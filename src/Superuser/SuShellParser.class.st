"
self openShell
"
Class {
	#name : #SuShellParser,
	#superclass : #Object,
	#category : 'Superuser-Tutor'
}

{ #category : #'as yet unclassified' }
SuShellParser class >> openShell [

	| entryCompletion |
	entryCompletion := EntryCompletion new
		dataSourceBlock: [ :e |
			Transcript show: 'source'; cr.
			 #('rsync') ];
		yourself.
	^ TextInputFieldModel new
		entryCompletion: entryCompletion;
		openWithSpec.
]
