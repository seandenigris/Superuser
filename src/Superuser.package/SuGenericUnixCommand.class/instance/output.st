accessing
output
	| rawOutput |
	rawOutput := self class resultOfCommand: self string.
	^ self outputDecoder cull: rawOutput