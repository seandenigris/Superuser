Class {
	#name : #SuRSync,
	#superclass : #SuUnixCommand,
	#category : 'Superuser-Core'
}

{ #category : #accessing }
SuRSync class >> binary [

	^ '/usr/bin/rsync' asFileReference.
]

{ #category : #accessing }
SuRSync class >> shortHelp [

	^ 'rsync is a file transfer program capable of efficient remote update
via a fast differencing algorithm.'.
]

{ #category : #accessing }
SuRSync class >> syntax [

	| flags result |
	"Implementation note: flags are alphabetized by short form, to adhere to the Smalltalk principle of typing extra characters for the sake of clarity"
	flags := { 
		SuFlag new
			longForm: '--archive';
			shortForm: '-a';
			"equivalent: 'rlptgoD';"
			description: 'archive mode; equals -rlptgoD (no -H,-A,-X)'.
		SuFlag new
			longForm: '--compress';
			shortForm: '-z';
			description: 'compress file data during the transfer'.
		SuFlag new
			longForm: '--info';
			"options: #('progress2 - total transfer progress, including % progress and transfer speed');
			versionCompatibility: '>= 3.1.0';"
			description: 'fine-grained informational verbosity'.
		SuFlag new
			longForm: '--quiet';
			shortForm: '-q';
			description: 'suppress non-error messages'.
		SuFlag new
			longForm: '--verbose';
			shortForm: '-v';
			description: 'increase verbosity'.
		SuFlag new
			longForm: '--xattrs';
			shortForm: '-X';
			description: 'preserve extended attributes'.
	}.
	result := SuCommandSyntax new
		binary: self binary;
		yourself.
	flags do: [ :f | f addFlag: f ].
	"result addArgument: (SuArgument new type: AbstractFileReference) description: 'if directory without trailing slash, copy contents to destination/source/..., if trailing slash, copy contents directly into destination/..."
	^ result
]
