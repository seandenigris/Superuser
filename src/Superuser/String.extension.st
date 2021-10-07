Extension { #name : #String }

{ #category : #'*Superuser' }
String >> asSuCommand [

	^ SuGenericUnixCommand fromString: self.
]

{ #category : #'*Superuser' }
String >> suForCommand [

	^ self.
]
