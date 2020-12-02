baseline
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec 
			baseline: 'Soup' with: [
				spec
					repository: 'github://seandenigris/Soup-for-Pharo' ];
			baseline: 'Magritte' with: [
				spec
					repository: 'github://seandenigris/Magritte' ];
			baseline: 'PetitParser2' with: [
				spec repository: 'github://seandenigris/PetitParser2' ].
		spec 
			baseline: 'Tempfile' with: [
				spec repository: 'github://seandenigris/TempfileSt' ];
			package: #'Superuser' with: [
				spec requires: #(#Soup #PetitParser2 #Tempfile #Magritte ). ] ]