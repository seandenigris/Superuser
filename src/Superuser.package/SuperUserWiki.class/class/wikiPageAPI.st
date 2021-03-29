wikiPages
wikiPageAPI
	"This method was automatically generated."
	<wikiPage: 'API'>
	^APWikiPage
		wiki: self
		name: 'API'
		text: 
'Commands are interesting because, while the result is always? interesting, in certain cases, there are other interesting levels and angles, like:
- What *would* be evaluated? This is especially useful for debugging and testing
- Where/how will it be evaluated? The "runner" - via command line, webpage injection, Applescript, or a combination e.g. injection via Applescript.

While it''s tempting to implement a command as a message e.g. ==videoSpeed: 2==, if any of the other aspects are interesting in the sending context, implementing it as a message that returns the command for further customization/query gains access to those areas at the small expense of one more message send in the simplest case e.g. ==run==.

The other interesting aspect is testing from the command and client sides. If I have a full test suite for the command, do I need to test everything again from the client? Is there a way to DRYly run the same tests for both? Or maybe it''s enough from the client to simply mention where the tests are? A thought just popped up RE arbitrary method metainfo (annotations?)'