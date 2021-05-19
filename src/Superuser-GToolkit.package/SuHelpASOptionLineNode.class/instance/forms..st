generated
forms: aSuHelpASFlagFormsNode
	self forms notNil
		ifTrue: [ self forms parent: nil ].
	forms := aSuHelpASFlagFormsNode.
	self forms notNil
		ifTrue: [ self forms parent: self ]