Class {
	#name : #SuTOMLGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'line',
		'comment',
		'header',
		'data',
		'association',
		'space',
		'string',
		'associationValue',
		'number',
		'booolean'
	],
	#category : #'Superuser-Core'
}

{ #category : #examples }
SuTOMLGrammar class >> example [
	<gtExample>
	
	^ self
		given: [ 'name = "Tom Preston-Werner"
		
dob = 1979 # First class dates
']
		when: [ :input | 
			self parse: input ]
		then: []
]

{ #category : #accessing }
SuTOMLGrammar >> association [

	^ ((#digit asPParser / #letter asPParser), $= asPParser negate plus) flatten trim, $= asPParser, space plus, associationValue.
]

{ #category : #accessing }
SuTOMLGrammar >> associationValue [

	^ string / number /booolean
]

{ #category : #accessing }
SuTOMLGrammar >> booolean [

	^ 'true' asPParser ==> [ true ] / 'false' asPParser  ==> [ false ]
]

{ #category : #accessing }
SuTOMLGrammar >> comment [

	^ $# asPParser, #newline asPParser negate plus flatten ==> #second
]

{ #category : #accessing }
SuTOMLGrammar >> data [

	^ association / header.
]

{ #category : #accessing }
SuTOMLGrammar >> header [

	^ $[ asPParser, $] asPParser negate plus flatten, $] asPParser ==> #second
]

{ #category : #accessing }
SuTOMLGrammar >> line [

	^ data optional, space star, comment optional ==> [ :n | { n first. n last } ]
]

{ #category : #accessing }
SuTOMLGrammar >> number [

	^ #digit asPParser plus flatten
]

{ #category : #accessing }
SuTOMLGrammar >> space [

	^ Character space asPParser / Character tab asPParser
]

{ #category : #accessing }
SuTOMLGrammar >> start [
	^ line, (#newline asPParser plus, line ==> #second) star
]

{ #category : #accessing }
SuTOMLGrammar >> string [

	^ $" asPParser, $" asPParser negate star flatten, $" asPParser
]
