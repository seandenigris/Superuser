Class {
	#name : #BaselineOfSuperuser,
	#superclass : #BaselineOf,
	#category : 'BaselineOfSuperuser'
}

{ #category : #accessing }
BaselineOfSuperuser class >> exampleSupportFolder [
	^ FileLocator localDirectory / 'iceberg' / 'seandenigris' / 'Superuser'/ 'example support'
]

{ #category : #baseline }
BaselineOfSuperuser >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			
			baseline: 'Magritte' with: [
				spec repository: 'github://seandenigris/Magritte' ];
			baseline: 'PetitParser2' with: [
				spec repository: 'github://seandenigris/PetitParser2' ];
			baseline: 'PharoEnhancements' with: [
				spec repository: 'github://seandenigris/Pharo-Enhancements' ];
			baseline: 'SimplePersistence' with: [
				spec repository: 'github://seandenigris/Simple-Persistence' ]; 
			baseline: 'Soup' with: [
				spec repository: 'github://seandenigris/Soup-for-Pharo' ];
			baseline: 'Tempfile' with: [
				spec repository: 'github://seandenigris/TempfileSt' ];
			package: #'Superuser' with: [
				spec requires: #(#Magritte #PetitParser2 #PharoEnhancements #SimplePersistence #Soup #Tempfile ). ] ].
				
	spec for: #GToolkit do: [ 
		spec package: 'Superuser-GToolkit' with: [ spec requires: #(Superuser) ] ]
]

{ #category : #accessing }
BaselineOfSuperuser >> customProjectAttributes [
	^ self isGTImage
			ifFalse: [ #(notGToolkit) ]
			ifTrue: [ #(GToolkit) ]
]

{ #category : #testing }
BaselineOfSuperuser >> isGTImage [
	^ RPackageOrganizer default packageNames anySatisfy: [ :pn | pn beginsWith: 'GToolkit-' ]
]
