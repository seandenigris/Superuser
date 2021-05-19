generated-reduction actions
reduceActionForFlagForms2: nodes
	| result |
	result := SuHelpASFlagFormsNode new.
	result long: (nodes at: 1).
	^ result