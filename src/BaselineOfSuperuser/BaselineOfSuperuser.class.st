"
An attemple to make Unix commands more sane.

A few directions:
- wrap commands in high-level objects to reign in complexity
- command line autocomplete
- execute commands and scripts on any server
- self-documentation
- verify authenticity of servers/downloads
"
Class {
	#name : #BaselineOfSuperuser,
	#superclass : #BaselineOf,
	#category : #BaselineOfSuperuser
}

{ #category : #accessing }
BaselineOfSuperuser class >> exampleSupportFolder [
	^ FileLocator localDirectory / 'iceberg' / 'seandenigris' / 'Superuser'/ 'example support'
]

{ #category : #testing }
BaselineOfSuperuser class >> isDynabook [
	^ true
]

{ #category : #baseline }
BaselineOfSuperuser >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			
			baseline: 'Magritte' with: [
				spec repository: 'github://seandenigris/Magritte' ];
			baseline: 'PharoEnhancements' with: [
				spec repository: 'github://seandenigris/Pharo-Enhancements' ];
			baseline: 'SimplePersistence' with: [
				spec repository: 'github://seandenigris/Simple-Persistence' ]; 
			baseline: 'Soup' with: [
				spec repository: 'github://seandenigris/Soup' ];
			baseline: 'Tempfile' with: [
				spec repository: 'github://seandenigris/TempfileSt' ];
			package: #'Superuser' with: [
				spec requires: #(#Magritte #PharoEnhancements #SimplePersistence #Soup #Tempfile ). ] ].
				
	spec for: #GToolkit do: [ 
		spec package: 'Superuser-GToolkit' with: [ spec requires: #(Superuser) ] ].
		
	spec for: #notGToolkit do: [ 
		spec baseline: 'PetitParser2' with: [
			spec repository: 'github://seandenigris/PetitParser2' ].
		spec package: #Superuser with: [
			spec requires: #('PetitParser2'). ] ]
]

{ #category : #accessing }
BaselineOfSuperuser >> customProjectAttributes [
	^ self isGTImage
			ifFalse: [ #(notGToolkit) ]
			ifTrue: [ #(GToolkit) ]
]

{ #category : #testing }
BaselineOfSuperuser >> isGTImage [
	
	^ RPackageOrganizer default packageNames anySatisfy: [ :pn | pn beginsWith: 'Lepiter-' ].
	"Implementation note: used to check for GToolkit prefix, but P7 has a GToolkit-Examples package. Lepiter, OTOH, could only be loaded in a GT image"
]
