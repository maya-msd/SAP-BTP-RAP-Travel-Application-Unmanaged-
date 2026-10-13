@AbapCatalog.sqlViewName: 'ZBTPIUTRAVEL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Root Consumption CDS View'

define root view zbtp_i_u_Travel
  as select from /dmo/travel
  association [1] to zbtp_i_u_Agency   as _Agency   
    on $projection.AgencyId = _Agency.AgencyID
  association [1] to zbtp_i_u_customer as _Customer 
    on $projection.CustomerId = _Customer.CustomerId
  association [1] to I_Currency        as _Currency 
    on $projection.CurrencyCode = _Currency.Currency
{
  key travel_id     as TravelId,
      agency_id     as AgencyId,
      customer_id   as CustomerId,
      begin_date    as BeginDate,
      end_date      as EndDate,
      booking_fee   as BookingFee,
      total_price   as TotalPrice,
      currency_code as CurrencyCode,
      description   as Description,
      status        as Status,

      /* Exposed Associations */
      _Agency,
      _Currency,
      _Customer
}
