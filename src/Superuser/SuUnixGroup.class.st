Class {
	#name : 'SuUnixGroup',
	#superclass : 'SuUnixUserEntity',
	#category : 'Superuser-Core',
	#package : 'Superuser',
	#tag : 'Core'
}

{ #category : 'as yet unclassified' }
SuUnixGroup >> sudoerIDString [
	^ '%#', self id
]

{ #category : 'as yet unclassified' }
SuUnixGroup >> sudoerNameString [
	^ '%', self name
]
