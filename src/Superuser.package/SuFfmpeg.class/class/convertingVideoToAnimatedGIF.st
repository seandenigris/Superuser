instance creation
convertingVideoToAnimatedGIF
	^ self new
		template: 'ffmpeg -i {inputFile} -vf "fps=10,scale={gifWidth}:-1:flags=lanczos" -c:v pam -f image2pipe - | convert -delay 10 - -loop 0 -layers optimize {outputFile}'; "Adapted from *https://superuser.com/a/556031*"
		argumentAt: #outputFile put: (Tempfile withSuffix: '.gif');
		yourself.
	