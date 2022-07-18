"
A RSync is xxxxxxxxx.

"
Class {
	#name : #SuRm,
	#superclass : #SuUnixCommand,
	#category : 'Superuser-Core'
}

{ #category : #accessing }
SuRm class >> binaryName [

	^ '/bin/rm' asFileReference.
]

{ #category : #accessing }
SuRm class >> shortHelp [

	^ 'rm - unlink file'.
]

{ #category : #'as yet unclassified' }
SuRm class >> syntax [

	| flags syntax |
	flags := {
		SuFlag new
			shortForm: '-d';
			description: 'Attempt to remove directories as well as other types of
	                 files'.
		SuFlag new
			shortForm: '-f';
			description: 'Attempt to remove the files without prompting for confirmation, regardless of the file''s permissions.  If the file does not exist, do not display a diagnostic message or modify the exit status to reflect an error.  The -f option overrides any previous -i options.' }.
			
	syntax := SuCommandSyntax new
		binary: '/bin/rm' asFileReference.
	flags do: [ :flag | syntax addFlag: flag ].
	^ syntax.
]
