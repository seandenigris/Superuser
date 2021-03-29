accessing
htmlVideoSpeed
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