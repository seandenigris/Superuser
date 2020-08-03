*Superuser
isMD5Equal: aReference
	^ self md5 = aReference md5
	
	"Implementation note: While not as portable, the current implementation was profiled as 438 times faster than this Smalltalk version (although it seemed maybe the primitive wasn't available):
```smalltalk
	| sourceHash targetHash |
	sourceHash := self binaryReadStreamDo: [ :str | MD5 hashStream: str ].
	targetHash := aReference binaryReadStreamDo: [ :str | MD5 hashStream: str ].
	^ sourceHash = targetHash.
```
"