private
argumentSource: anObject
	"It is usually preferrable to set arguments via #argumentAt:put:, which will automatically handle creating and maintaining the appropriate collection for the arguments.
	
	anObject
		- Accepted input: for the moment, anything acceptable to `String>>#format:` that maps all variables in my template to string replacements. In the future, we'd like to loosen this up to allow mapping to any object's fields
		- Escaping: for types commonly passed as arguments, automatic escaping is be available. See implementors of #suForCommand"
	argumentSource := anObject