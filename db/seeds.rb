# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
NUMBER_OF_FIRMS = 100
SOLICITORS_PER_FIRM = 25
NUMBER_OF_SOLICITORS = NUMBER_OF_FIRMS * SOLICITORS_PER_FIRM

srand(100)

solicitor_names =  Array.new(NUMBER_OF_SOLICITORS) { Faker::Name.name }.to_enum
solicitor_emails = solicitor_names.map { |name| Faker::Internet.safe_email name }.to_enum

1.upto(NUMBER_OF_FIRMS) do
  #Seed with 10 firms
  firm_name = Faker::Company.name
  firm_address = Faker::Address.street_address + ' ' +Faker::Address.country
  firm_postcode = ('A'..'Z').to_a.sample + ('A'..'Z').to_a.sample + ('1'..'9').to_a.sample + ' ' + ('1'..'9').to_a.sample + ('A'..'Z').to_a.sample + ('A'..'Z').to_a.sample
  firm_tel = ['0207 284 1111','0207 284 2222','0207 284 3333','0207 284 4444','0207 284 5555','0207 284 6666'].sample
  firm_email = Faker::Internet.email

  firm = Firm.where(email: firm_email ).first_or_create(
    name: firm_name,
    address: firm_address,
    postcode: firm_postcode,
    tel: firm_tel,
    email: firm_email)

  firm_id = firm.id
  1.upto(SOLICITORS_PER_FIRM) do
    solicitor_name = solicitor_names.next
    solicitor_address = Faker::Address.street_address + ' ' + Faker::Address.country
    solicitor_postcode = ('A'..'Z').to_a.sample + ('A'..'Z').to_a.sample + ('1'..'9').to_a.sample + ' ' + ('1'..'9').to_a.sample + ('A'..'Z').to_a.sample + ('A'..'Z').to_a.sample
    solicitor_tel = ['0207 284 1111','0207 284 2222','0207 284 3333','0207 284 4444','0207 284 5555','0207 284 6666'].sample
    solicitor_email = solicitor_emails.next

    Solicitor.where(email: solicitor_email ).first_or_create(
      name: solicitor_name,
      address: solicitor_address,
      postcode: solicitor_postcode,
      mobile: solicitor_tel,
      email: solicitor_email,
      firm_id: firm_id)
  end
end
