sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'testproj/Doctors/test/integration/FirstJourney',
		'testproj/Doctors/test/integration/pages/DoctorsList',
		'testproj/Doctors/test/integration/pages/DoctorsObjectPage'
    ],
    function(JourneyRunner, opaJourney, DoctorsList, DoctorsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('testproj/Doctors') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheDoctorsList: DoctorsList,
					onTheDoctorsObjectPage: DoctorsObjectPage
                }
            },
            opaJourney.run
        );
    }
);