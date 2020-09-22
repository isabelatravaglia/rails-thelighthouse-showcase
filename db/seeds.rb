# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# services
# partners
# audiences
# partner_services
# audience_services

puts "Destroying records"

Service.destroy_all
Partner.destroy_all
Audience.destroy_all
PartnerService.destroy_all
AudienceService.destroy_all

puts "Creating Services"

coaching = Service.create(name: "Coaching", description: "O coaching é uma ferramenta que auxilia blablabla...")
mentoring = Service.create(name: "Mentoring", description: "O mentoring é uma ferramenta que auxilia blablabla...")
leadership = Service.create(name: "Treinamento de Liderança", description: "O treinamento de liderança auxilia blablabla...")

puts "Creating Partners"

grazi = Partner.create(first_name: "Graziele", last_name: "Neves", email: "grazi@discoverthelighthouse.com")
joao = Partner.create(first_name: "João", last_name: "Test", email: "joao@discoverthelighthouse.com")

puts "Creating Audiences"
recoloc = Audience.create(name: "Executivos em busca de recolocação profissional", description: "Executivos que buscam recolocação profissional", audience_type: "pessoa")
mentoria = Audience.create(name: "Executivos em busca de mentoring", description: "Executivos que buscam mentoring", audience_type: "pessoa")
company = Audience.create(name: "Empresa em busca de treinamento", description: "Empresas que querem treinar seus profissionais", audience_type: "empresa")

puts "Creating Partner Services"
PartnerService.create(partner: grazi, service: mentoring)
PartnerService.create(partner: grazi, service: leadership)
PartnerService.create(partner: grazi, service: coaching)
PartnerService.create(partner: joao, service: coaching)

puts "Creating Audience Services"
AudienceService.create(service: coaching, audience: recoloc)
AudienceService.create(service: coaching, audience: company)
AudienceService.create(service: leadership, audience: company)
AudienceService.create(service: mentoring, audience: mentoria)

