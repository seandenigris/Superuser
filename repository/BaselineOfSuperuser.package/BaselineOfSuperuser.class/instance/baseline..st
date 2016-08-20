baseline
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec 
			baseline: 'Soup' with: [
				spec
					repository: 'github://seandenigris/Soup-for-Pharo:master/repository' ];
			baseline: 'Magritte3' with: [
				spec
					repository: 'github://seandenigris/Magritte3:master/repository' ];
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: #'stable';
					loads: #(#Tests );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main/' ].
		spec 
			package: #Tempfile with: [
				spec repository: 'http://smalltalkhub.com/mc/SeanDeNigris/SeansPlayground/main/' ];
			package: #'Superuser' with: [
				spec requires: #(#Soup #PetitParser #Tempfile #Magritte3 ). ] ]