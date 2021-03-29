private
basicCommandString
	| preparedArguments |
	preparedArguments := self argumentSource copy.
	self prepareArguments: preparedArguments.
	^ self template format: preparedArguments