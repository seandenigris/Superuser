"
I model an email address with an optional name (as supplied e.g. by an email client or server).
"
Class {
	#name : #SuEmailAddress,
	#superclass : #Object,
	#instVars : [
		'addressString',
		'name'
	],
	#category : #Superuser
}

{ #category : #'instance creation' }
SuEmailAddress class >> fromString: aString [ 

	^ self parser parse: aString
]

{ #category : #parsing }
SuEmailAddress class >> grammar [

	| email word firstName fullName lastName reversedName emailOnly nameAndEmail nameNode |
	email := ($> asPParser | #space asPParser) negate plus flatten.							
	word := ($, asPParser | $\ asPParser | $< asPParser | #space asPParser) negate
			plus flatten.
	firstName := lastName := word.
	fullName := (firstName separatedBy: #space asPParser) flatten.
	reversedName := ($\ asPParser optional, $" asPParser , lastName , ', ' asPParser , firstName
			, $\ asPParser optional, $" asPParser) ==> [ :nodes | nodes fifth , ' ' , nodes third ].
	nameNode := fullName | reversedName.
	emailOnly := email end ==> [ :eml | { nil. eml } ].
	nameAndEmail := (nameNode , #space asPParser , $< asPParser , email , $> asPParser) ==> [ :nodes | { nodes first. nodes fourth} ].
	^ emailOnly | nameAndEmail
]

{ #category : #parsing }
SuEmailAddress class >> parser [
	
	^ self grammar ==> [ :nodes |
		self new
			name: nodes first;
			addressString: nodes second;
			yourself ]
]

{ #category : #accessing }
SuEmailAddress >> addressString [
	^ addressString
]

{ #category : #accessing }
SuEmailAddress >> addressString: anObject [
	addressString := anObject
]

{ #category : #accessing }
SuEmailAddress >> domain [
	^ addressString copyAfter: $@
]

{ #category : #accessing }
SuEmailAddress >> name [
	^ name
]

{ #category : #accessing }
SuEmailAddress >> name: anObject [
	name := anObject
]
