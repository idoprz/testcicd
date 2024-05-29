using { testproj as my } from '../db/schema.cds';

@path: '/service/testproj'
@requires: 'authenticated-user'
service testprojSrv {
  @odata.draft.enabled
  entity Doctors as projection on my.Doctors;
  @odata.draft.enabled
  entity Medicines as projection on my.Medicines;
}