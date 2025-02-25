Class {
	#name : #SuSystemProfiler,
	#superclass : #SuGenericUnixCommand,
	#category : #'Superuser-Core'
}

{ #category : #'instance creation' }
SuSystemProfiler class >> acChargerWatts [

	^ self new
		template: self binary, ' -json SPPowerDataType';
		outputDecoder: [ :str | 
			| jsonDict chargerDict |
			jsonDict := STONJSON fromString: str.
			chargerDict := (jsonDict at: 'SPPowerDataType') detect: [ :aDict | 
				aDict 
					at: '_name' 
					ifPresent: [ :aName | aName = 'sppower_ac_charger_information' ] 
					ifAbsent: [ nil ] ].
			chargerDict 
				at: 'sppower_ac_charger_watts'
				ifPresent: #asNumber
				ifAbsent: [ 0 ] ];
		yourself.
		
	"CLI adapted from https://apple.stackexchange.com/a/16519"
]

{ #category : #accessing }
SuSystemProfiler class >> binaryName [
	^ 'system_profiler'
]

{ #category : #'instance creation' }
SuSystemProfiler class >> convertForOCR [

	^ self new
		template: self binary, ' -o {output} -dSAFER -dQUIET -sDEVICE=png16m -dINTERPOLATE -dNumRenderingThreads=8 -r300 -c 30000000 setvmthreshold -f {input}'
		yourself.
	
	"GS option explanations:
		-dSAFER \ # prevent unwanted file writing
		-dQUIET \ # suppress some console output
		-sDEVICE=png16m \ # Save in 24 bit color, -sDEVICE=pnggray -dTextAlphaBits=4 worked equally well; tiffg4 (from [GH](https://gist.github.com/henrik/1967035)) *is for B&W* and was awful on grayscale input, tiff12nc caused an error apparently because it's not compressed
		-dINTERPOLATE \ # Designed to improve the quality of images that have been upscaled from a smaller size
		-dNumRenderingThreads=8 \ #Gs recommends setting this option to the maximum number of available cores
		-r300 \ # Default of 72dpi is much too low for good results; 300dpi seems to be the consensus
		-c 30000000 setvmthreshold -f \ # Boost performance with 30MB extra RAM for complex PDFs"
]
