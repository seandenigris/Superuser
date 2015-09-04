baseline
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec 
			project: 'Soup' with: [
				spec
					className: #ConfigurationOfSoup;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/PharoExtras/Soup/main/' ];
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
				spec requires: #(#Soup #PetitParser #Tempfile ). ] ]