as yet unclassified
testOptionShortForm

	| option |
	option := SuRSyncHelpParser new optionLine parse: self sampleOptionLineShortFlag.
	self assert: option shortForm equals: '-O'. 
	self assert: option longForm equals: '--omit-dir-times'.
	self assert: option description equals: 'omit directories when preserving times'.