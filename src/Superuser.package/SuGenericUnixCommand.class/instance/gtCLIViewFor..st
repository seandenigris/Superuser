accessing
gtCLIViewFor: aView
	<gtView>
	^ aView text 
		title: 'CLI';
		text: self string