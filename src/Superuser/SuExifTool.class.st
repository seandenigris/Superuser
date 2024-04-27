"
#Installation
- Downloads from https://exiftool.org
- Mac - can install with Homebrew `brew install exiftool`
"
Class {
	#name : #SuExifTool,
	#superclass : #SuGenericUnixCommand,
	#category : #Superuser
}

{ #category : #accessing }
SuExifTool class >> binaryName [

	^ 'exiftool'
]

{ #category : #'exif reader' }
SuExifTool class >> exifForFile: aFileReference [

	^ self new
		template: self binary, ' -json {inputFile}';
		argumentAt: #inputFile put: aFileReference;
		outputDecoder: [ :jsonString |
			| anArray |
			anArray := NeoJSONReader fromString: jsonString.
			anArray first ];
		run
]

{ #category : #accessing }
SuExifTool class >> removeAllMetadataFrom: file [

	^ self new
		template: self binary, '= -all= {file}';
		argumentAt: #file put: file;
		run
]

{ #category : #accessing }
SuExifTool class >> restoreSafeMetadataTo: file [

	| backupFile |
	backupFile := file parent / file base, (file extension, '_original').
	
	^ self new
		template: self binary, ' -overwrite_original -tagsfromfile {backupFile} -exposuretime -aperturevalue -flash -iso -lens -focallength -orientation -datetimeoriginal {file}';
		argumentAt: #backupFile put: backupFile;
		argumentAt: #file put: file;
		run
]

{ #category : #accessing }
SuExifTool class >> scrubMetadataFrom: file [

	self removeAllMetadataFrom: file.
	self restoreSafeMetadataTo: file.
]
