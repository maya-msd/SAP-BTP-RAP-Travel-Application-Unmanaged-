@AbapCatalog.sqlViewName: 'ZBTPIUAGENCY'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Agency CDS View'

define view zbtp_i_u_Agency
  as select from /dmo/agency
  association [1] to I_Country as _Country 
    on $projection.CountryCode = _Country.Country
{
  key agency_id     as AgencyID,
      name          as Name,
      street        as Street,
      postal_code   as PostalCode,
      city          as City,
      country_code  as CountryCode,
      phone_number  as PhoneNumber,
      email_address as EmailAddress,
      web_address   as WebAddress,

      /* Association */
      _Country
}
