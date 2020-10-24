as yet unclassified
isAdmin
	^ self groups anySatisfy: [ :e | e name = 'admin' ]