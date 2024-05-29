namespace testproj;

entity Doctors {
  key ID: UUID;
  doctorsID: Integer @assert.unique @mandatory;
  name: String(100);
  specialty: String(50);
  prescriptions: Association to many Medicines on prescriptions.doctor = $self;
}

entity Medicines {
  key ID: UUID;
  medicinesID: Integer @assert.unique @mandatory;
  name: String(100);
  description: String(500);
  price: Decimal(10,2);
  quantity: Integer;
  doctor: Association to Doctors;
}

