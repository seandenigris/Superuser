accessing
argumentSource
	| pageRangeString |
	"Page range is optional, but format: doesn't handle optional variables, so we add the right thing here either way"
	pageRangeString := self argumentSource
		at: #pageRange
		ifPresent: [ :int | '[' , (int start - 1) asString, '-' , (int end - 1) asString, ']' "adapted from https://stackoverflow.com/a/12614851" ]
		ifAbsent: [ '' ].
	^ self argumentSource copy
		at: #pageRange put: pageRangeString;
		yourself