accessing
basicCommandString
	| preparedArguments |
	preparedArguments := self argumentSource copy.
	self argumentSource keysAndValuesDo: [ :k :v | preparedArguments at: k put: v suForCommand ].
	^ self template format: preparedArguments.