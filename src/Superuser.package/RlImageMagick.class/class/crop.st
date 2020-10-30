instance creation
crop

	^ self new
		template: self binary, ' {input} -crop {width}x{height}+{xOffset}{yOffset} {output}'
		yourself.