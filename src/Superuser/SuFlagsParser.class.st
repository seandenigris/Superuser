Class {
	#name : #SuFlagsParser,
	#superclass : #PP2CompositeNode,
	#category : #'Superuser-Core'
}

{ #category : #accessing }
SuFlagsParser >> start [
	| token argument shortFlag flag |
	token := (#letter asPParser, (#letter asPParser / $- asPParser) star) flatten.
	argument := $= asPParser, ((token / $| asPParser) plus flatten) ==> #second.
	shortFlag := ($- asPParser, #letter asPParser) ==> #second.
	
	flag := '--' asPParser, token, argument optional, ((', ' asPParser, shortFlag) optional), #space asPParser plus, #newline asPParser negate plus flatten, #newline asPParser.
	^ (flag ==> [ :n | 
		SuFlag new
			longForm: n second;
			argument: n third;
			shortForm: (n fourth ifNotNil: #second);
			description: n sixth ]) plus
]
