"
# Class-side Creation Methods
This piecemeal approach could explode interface, requiring a real composable model, but works for now for a few common cases
"
Class {
	#name : #SuJSScript,
	#superclass : #SuRunnable,
	#category : 'Superuser-Core'
}

{ #category : #'instance creation' }
SuJSScript class >> clickQueriedElement [
	<description: '[Docs](https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelector)'>
	^ self new
		template: 'document.querySelector({selectors}).parentElement.click()';
		yourself
]

{ #category : #'instance creation' }
SuJSScript class >> htmlVideoSpeed [
	<apiDocumentation>
	<description: 'Set the speed of all HTML5 ==<video>== elements. 1 is regular speed. See the ==playbackRate== property *docs >https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/playbackRate* for more info.'>
	"Arguments:
		videoSpeed -> aNumber"
	^ self new
		template: 'var ta=document.getElementsByTagName(''video''); 
		for(var i=0;i<ta.length;i++) \{ta[i].playbackRate={videoSpeed}\};';
		yourself.
		
	"! Implementation note
Adapted from *this Quora answer>https://www.quora.com/Is-there-any-way-to-watch-Facebook-videos-at-double-the-speed*. There is a slight variation recommended *on SO>https://stackoverflow.com/a/44158819/424245* using querySelectorAll instead of getElementsByTagName if this ever must be revisited."
]

{ #category : #examples }
SuJSScript class >> htmlVideoSpeedExample [
	<gtExample>
	| result |
	result := self htmlVideoSpeed
		argumentAt: #videoSpeed put: 2.0;
		yourself.
	self assert: result string equals: 'var ta=document.getElementsByTagName(''video''); 
		for(var i=0;i<ta.length;i++) {ta[i].playbackRate=2.0};'.
	^ result
]

{ #category : #'instance creation' }
SuJSScript class >> queryingSelector [
	<description: '[Docs](https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelector)'>
	^ self new
		template: 'document.querySelector({selectors})';
		yourself
]
