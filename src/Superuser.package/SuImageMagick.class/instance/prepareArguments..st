accessing
prepareArguments: aCollection
	| pageRangeString |
	"Page range is optional, but format: doesn't handle optional variables, so we add the right thing here either way"
	pageRangeString := aCollection
		at: #pageRange
		ifPresent: [ :int | '[' , (int first - 1) asString, '-' , (int last - 1) asString, ']' "adapted from https://stackoverflow.com/a/12614851" ]
		ifAbsent: [ '' ].
	aCollection
		at: #pageRange put: pageRangeString;
		yourself.
	super prepareArguments: aCollection