namespace :utils do
  desc "Popular banco de dados."
  task seed: :environment do  
    puts "gerando os contatos (Contacts)..."
      100.times do |i|
          Contact.create!(
              name: Faker::Name.name,
              email: Faker::Internet.email,
              kind: Kind.all.sample, #pega uma amostra de tipo
              rmk: LeroleroGenerator.sentence([1,2,3,4,5].sample)
              # rmk: Faker::Lorem.paragraph([1,2,3,4,5].sample)
          )
      end      
    puts "gerando os contatos (Contacts)...[OK]"
     
    puts "gerando os endereços (Addresses)..."
      Contact.all.each do |_contact|
        Address.create!(
          street:  Faker::Address.street_address,
          city: Faker::Address.city,
          state: Faker::Address.state_abbr,
          contact: _contact
        )
      end      
    puts "gerando os endereços (Addresses)...[OK]"


    puts "gerando os telefones (Phones)..."
      Contact.all.each do |_contact|
        Random.rand(1..5).times do |i|
          Phone.create!(
            phone:  Faker::PhoneNumber.phone_number,
            contact: _contact
          )
        end    
      end      
    puts "gerando os telefones (Phones)...[OK]"
  end
end
