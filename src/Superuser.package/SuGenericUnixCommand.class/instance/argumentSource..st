accessing
argumentSource: anObject
	"anObject - for the moment, anything acceptable to `String>>#format:` that maps all variables in my template to string replacements. In the future, we'd like to loosen this up to allow mapping to any object's fields"
	argumentSource := anObject