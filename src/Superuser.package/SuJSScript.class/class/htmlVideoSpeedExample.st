examples
htmlVideoSpeedExample
	<gtExample>
	| result |
	result := self htmlVideoSpeed
		argumentAt: #videoSpeed put: 2.0;
		yourself.
	self assert: result string equals: 'var ta=document.getElementsByTagName(''video''); 
		for(var i=0;i<ta.length;i++) {ta[i].playbackRate=2.0};'.
	^ result