generated-reduction actions
reduceActionForOptionLine1: nodes
	| result |
	result := SuHelpASOptionLineNode new.
	result forms: (nodes at: 2).
	result desc: (nodes at: 3).
	^ result