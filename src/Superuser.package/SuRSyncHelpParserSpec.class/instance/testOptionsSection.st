as yet unclassified
testOptionsSection

	| options |
	options := SuRSyncHelpParser new optionsSection parse: self sampleOptionsSection.
	self assert: options size equals: 2. 
	self assert: options second longForm equals: '--quiet'.