Extension { #name : #String }

{ #category : #'*Superuser' }
String >> asSuCommand [

	^ SuGenericUnixCommand new
		template: self;
		yourself.
]

{ #category : #'*Superuser' }
String >> asSuEmailAddress [
	^ SuEmailAddress fromString: self
]

{ #category : #'*Superuser' }
String >> suForCommand [

	^ self.
]
