using { testprojSrv } from '../srv/service.cds';

annotate testprojSrv.Doctors with @UI.HeaderInfo: { TypeName: 'Doctor', TypeNamePlural: 'Doctors', Title: { Value: doctorsID } };
annotate testprojSrv.Doctors with {
  ID @UI.Hidden @Common.Text: { $value: doctorsID, ![@UI.TextArrangement]: #TextOnly }
};
annotate testprojSrv.Doctors with @UI.Identification: [{ Value: doctorsID }];
annotate testprojSrv.Doctors with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate testprojSrv.Doctors with {
  doctorsID @title: 'ID';
  name @title: 'Name';
  specialty @title: 'Specialty'
};

annotate testprojSrv.Doctors with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: doctorsID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: specialty }
];

annotate testprojSrv.Doctors with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: doctorsID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: specialty }
  ]
};

annotate testprojSrv.Doctors with {
  prescriptions @Common.Label: 'Medicines'
};

annotate testprojSrv.Doctors with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name' }
];

annotate testprojSrv.Doctors with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate testprojSrv.Doctors with @UI.SelectionFields: [
  doctorsID
];

annotate testprojSrv.Medicines with @UI.HeaderInfo: { TypeName: 'Medicine', TypeNamePlural: 'Medicines', Title: { Value: medicinesID } };
annotate testprojSrv.Medicines with {
  ID @UI.Hidden @Common.Text: { $value: medicinesID, ![@UI.TextArrangement]: #TextOnly }
};
annotate testprojSrv.Medicines with @UI.Identification: [{ Value: medicinesID }];
annotate testprojSrv.Medicines with {
  doctor @Common.ValueList: {
    CollectionPath: 'Doctors',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: doctor_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'doctorsID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'specialty'
      },
    ],
  }
};
annotate testprojSrv.Medicines with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate testprojSrv.Medicines with {
  medicinesID @title: 'ID';
  name @title: 'Name';
  description @title: 'Description';
  price @title: 'Price';
  quantity @title: 'Quantity'
};

annotate testprojSrv.Medicines with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: medicinesID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Label: 'Doctor', Value: doctor_ID }
];

annotate testprojSrv.Medicines with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: medicinesID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Label: 'Doctor', Value: doctor_ID }
  ]
};

annotate testprojSrv.Medicines with {
  doctor @Common.Text: { $value: doctor.doctorsID, ![@UI.TextArrangement]: #TextOnly }
};

annotate testprojSrv.Medicines with {
  doctor @Common.Label: 'Doctor'
};

annotate testprojSrv.Medicines with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name' }
];

annotate testprojSrv.Medicines with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate testprojSrv.Medicines with @UI.SelectionFields: [
  doctor_ID
];

