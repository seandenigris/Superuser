as yet unclassified
runWith: arguments
	"arguments - must match template to format i.e. either an ordered collection for numbered arguments, or a dictionary for named arguments"
	| commandString |
	commandString := self template format: arguments.
	self class run: commandString.