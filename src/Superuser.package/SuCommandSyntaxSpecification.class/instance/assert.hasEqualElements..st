asserting
assert: actualCollection hasEqualElements: expectedCollection

	self
		assert: (actualCollection hasEqualElements: expectedCollection)
		description: [ | actualDescription |
			actualDescription := actualCollection printString allButFirst: 'an OrderedCollection' size.
			'Expected ', expectedCollection printString allButFirst, ' but got ', actualDescription ].