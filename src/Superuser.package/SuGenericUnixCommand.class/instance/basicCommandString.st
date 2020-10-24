accessing
basicCommandString
	| preparedArguments |
	preparedArguments := self argumentSource class new: self argumentSource size.
	self argumentSource keysAndValuesDo: [ :k :v | preparedArguments at: k put: v suForCommand ].
	^ self template format: preparedArguments.