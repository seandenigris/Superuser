as yet unclassified
testOptionNoShortForm

	| option |
	option := SuRSyncHelpParser new optionLine parse: self sampleOptionLineNoShortFlag.
	self assert: option shortForm equals: nil. 
	self assert: option longForm equals: '--super'.
	self assert: option description equals: 'receiver attempts super-user activities'.