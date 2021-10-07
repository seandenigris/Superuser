Class {
	#name : #SuUnixUser,
	#superclass : #SuUnixUserEntity,
	#category : 'Superuser-Unix'
}

{ #category : #'instance creation' }
SuUnixUser class >> current [
	| username |
	username := self shell outputOf: 'whoami'.
	^ self new
		name: username;
		yourself.
]

{ #category : #'as yet unclassified' }
SuUnixUser class >> exampleAdmin [
	^ SuUnixUser new
		name: 'admin';
		yourself.
]

{ #category : #accessing }
SuUnixUser class >> shell [
	^ Smalltalk tools shell new
]

{ #category : #'as yet unclassified' }
SuUnixUser >> canSudo [
	^ (self shell outputOf: 'sudo -nv 2>&1') includesSubstring: 'Sorry'
	"Adapted from https://superuser.com/a/1281228"
]

{ #category : #accessing }
SuUnixUser >> groups [
	| groupsString groupNames |
	"Adapted from https://apple.stackexchange.com/a/179531"
	groupsString := self class shell outputOf: 'id -Gn ' , self name.
	groupNames := groupsString splitOn: Character space.
	^ groupNames
		collect: [ :e | 
			SuUnixGroup new
				name: e;
				yourself ]
]

{ #category : #'as yet unclassified' }
SuUnixUser >> isAdmin [
	^ self groups anySatisfy: [ :e | e name = 'admin' ]
]

{ #category : #'as yet unclassified' }
SuUnixUser >> sudoerIDString [
	^ '#', self id
]

{ #category : #'as yet unclassified' }
SuUnixUser >> sudoerNameString [
	^ self name
]
