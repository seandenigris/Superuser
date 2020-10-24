accessing
argumentSource
	^ argumentSource ifNil: [ ^ #() ]
	"nil is perfectly acceptable to format:, but passing an empty collection prevents nil checks elsewhere e.g. argument escaping"