private
ensureArgumentSourceFor: key 
	| maxSize |
	argumentSource ifNotNil: [ ^ argumentSource ].
	maxSize := self template count: [ :c | c = ${ ].
	key isInteger ifTrue: [ 
		maxSize := maxSize max: key.
		argumentSource := OrderedCollection new: maxSize withAll: ''. 
		^ self ].
	key isSymbol ifTrue: [ 
		argumentSource := Dictionary new: maxSize. 
		^ self ].
	^ self error: 'Can''t use a ', key class, ' as key'.