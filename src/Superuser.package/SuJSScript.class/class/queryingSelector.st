instance creation
queryingSelector
	<description: '[Docs](https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelector)'>
	^ self new
		template: 'document.querySelector({selectors})';
		yourself