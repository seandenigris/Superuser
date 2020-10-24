instance creation
current
	| username |
	username := self shell outputOf: 'whoami'.
	^ self new
		name: username;
		yourself.