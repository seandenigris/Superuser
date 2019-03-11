baseline
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec 
			baseline: 'Soup' with: [
				spec
					repository: 'github://seandenigris/Soup-for-Pharo:master/repository' ];
			baseline: 'Magritte' with: [
				spec
					repository: 'github://seandenigris/Magritte' ];
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: #'stable';
					loads: #(#Tests );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main/' ].
		spec 
			baseline: 'Tempfile' with: [
				spec repository: 'github://seandenigris/TempfileSt' ];
			package: #'Superuser' with: [
				spec requires: #(#Soup #PetitParser #Tempfile #Magritte ). ] ]