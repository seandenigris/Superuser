as yet unclassified
openShell

	| entryCompletion |
	entryCompletion := EntryCompletion new
		dataSourceBlock: [ :e |
			Transcript show: 'source'; cr.
			 #('rsync') ];
		yourself.
	^ TextInputFieldModel new
		entryCompletion: entryCompletion;
		openWithSpec.