@AbapCatalog.sqlViewName: 'ZBTPIUCUST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer CDS View'

define view zbtp_i_u_customer
  as select from /dmo/customer
  association [1] to I_Country as _Country 
    on $projection.CountryCode = _Country.Country
{
  key customer_id   as CustomerId,
      first_name    as FirstName,
      last_name     as LastName,
      title         as Title,
      street        as Street,
      postal_code   as PostalCode,
      city          as City,
      country_code  as CountryCode,
      phone_number  as PhoneNumber,
      email_address as EmailAddress,

      /* Association */
      _Country
}
