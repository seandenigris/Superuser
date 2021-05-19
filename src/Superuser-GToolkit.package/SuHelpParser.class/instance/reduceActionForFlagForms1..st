generated-reduction actions
reduceActionForFlagForms1: nodes
	| result |
	result := SuHelpASFlagFormsNode new.
	result short: (nodes at: 1).
	result long: (nodes at: 3).
	^ result