generated-reduction actions
reduceActionForOptionList1: nodes
	| result |
	result := SuHelpASOptionListNode new.
	result addNodes: (nodes at: 1) to: result options.
	^ result