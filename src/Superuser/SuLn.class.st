Class {
	#name : #SuLn,
	#superclass : #SuGenericUnixCommand,
	#instVars : [
		'source',
		'link',
		'original'
	],
	#category : 'Superuser-Core'
}

{ #category : #examples }
SuLn class >> example [
	<gtExample>
	| original link result |
	original := Tempfile new ensureCreateFile.
	link := Tempfile new ensureCreateDirectory.
	result := SuLn new
		original: original;
		link: link;
		yourself.
	result run.
	self assert: (link / original base) exists.
]

{ #category : #accessing }
SuLn >> argumentSource [
	^ {
		#link -> self link.
		#original -> self original } asDictionary
]

{ #category : #accessing }
SuLn >> initialize [
	super initialize.
	template := 'ln -s {original} {link}'.
]

{ #category : #accessing }
SuLn >> link [
	^ self maLazyInstVarUsing: self linkDescription
]

{ #category : #accessing }
SuLn >> link: file [
	link := file
]

{ #category : #'magritte-accessing' }
SuLn >> linkDescription [
	<magritteDescription>
	^ MAFileDescription new
		accessor: #link;
		required: true;
		comment: 'If set to an existing directory, link will be placed in it with same name as original';
		yourself
]

{ #category : #accessing }
SuLn >> original [
	^ self maLazyInstVarUsing: self originalDescription
]

{ #category : #accessing }
SuLn >> original: file [
	original := file
]

{ #category : #'magritte-accessing' }
SuLn >> originalDescription [
	<magritteDescription>
	^ MAFileDescription new
		accessor: #original;
		required: true;
		yourself
]
