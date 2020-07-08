as yet unclassified
testAcceptance

	| options |
	options := SuRSyncHelpParser parse: self sampleOutput.
	self assert: options size equals: 42. 
	self assert: options first shortForm equals: '-v'.
	(options at: 34) inspect.
	(options at: 35) inspect.