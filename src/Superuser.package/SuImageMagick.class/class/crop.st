instance creation
crop

	^ self new
		template: self binary, ' {input} -crop {width}x{height}+{xOffset}+{yOffset} {output}' "Adapted from https://superuser.com/a/1163824"
		yourself.