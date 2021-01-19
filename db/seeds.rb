# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying records"

Service.destroy_all
Partner.destroy_all
Audience.destroy_all
PartnerService.destroy_all
AudienceService.destroy_all

puts "Creating Services"


coaching = Service.create(name: "Coaching", description: "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Rerum id delectus sed placeat? Nisi modi tempora delectus veritatis? Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab recusandae debitis velit tempore voluptates repellat nemo iste libero temporibus quo expedita, veritatis. Modi. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab recusandae debitis velit tempore voluptates repellat nemo iste libero temporibus quo expedita, veritatis. Modi. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab recusandae debitis velit tempore voluptates repellat nemo iste libero temporibus quo expedita, veritatis. Modi.", tagline: "Maximize seus resultados")
coaching_image_file = URI.open('https://images.unsplash.com/photo-1490111718993-d98654ce6cf7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80')
coaching.photo.attach(io: coaching_image_file, filename: 'coaching.jpg', content_type: 'image/jpg')


mentoring = Service.create(name: "Mentoring", description: "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Rerum id delectus sed placeat? Nisi modi tempora delectus veritatis? Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab recusandae debitis velit tempore voluptates repellat nemo iste libero temporibus quo expedita, veritatis. Modi. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab recusandae debitis velit tempore voluptates repellat nemo iste libero temporibus quo expedita, veritatis. Modi. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab recusandae debitis velit tempore voluptates repellat nemo iste libero temporibus quo expedita, veritatis. Modi.", tagline: "Maximize seus resultados")
mentoring_image_file = URI.open('https://images.unsplash.com/photo-1524178232363-1fb2b075b655?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80')
mentoring.photo.attach(io: mentoring_image_file, filename: 'mentoring.jpg', content_type: 'image/jpg')


leadership = Service.create(name: "Treinamento de Liderança", description: "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Rerum id delectus sed placeat? Nisi modi tempora delectus veritatis? Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab recusandae debitis velit tempore voluptates repellat nemo iste libero temporibus quo expedita, veritatis. Modi. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab recusandae debitis velit tempore voluptates repellat nemo iste libero temporibus quo expedita, veritatis. Modi. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab recusandae debitis velit tempore voluptates repellat nemo iste libero temporibus quo expedita, veritatis. Modi." , tagline: "Maximize seus resultados")
leadership_image_file = URI.open('https://images.unsplash.com/photo-1474631245212-32dc3c8310c6?ixlib=rb-1.2.1&auto=format&fit=crop&w=1981&q=80
')
leadership.photo.attach(io: leadership_image_file, filename: 'leadership.jpg', content_type: 'image/jpg')

proposito = Service.create(name: "Orientação de Propósito", description: "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Rerum id delectus sed placeat? Nisi modi tempora delectus veritatis? Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab recusandae debitis velit tempore voluptates repellat nemo iste libero temporibus quo expedita, veritatis. Modi. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab recusandae debitis velit tempore voluptates repellat nemo iste libero temporibus quo expedita, veritatis. Modi. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab recusandae debitis velit tempore voluptates repellat nemo iste libero temporibus quo expedita, veritatis. Modi." , tagline: "Maximize seus resultados")
proposito_image_file = URI.open('https://images.unsplash.com/photo-1610123668028-25f5cd2a1460?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1956&q=80')
proposito.photo.attach(io: proposito_image_file, filename: 'proposito.jpg', content_type: 'image/jpg')

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
PartnerService.create(partner: grazi, service: proposito)
PartnerService.create(partner: joao, service: coaching)

puts "Creating Audience Services"
AudienceService.create(service: coaching, audience: recoloc)
AudienceService.create(service: coaching, audience: company)
AudienceService.create(service: leadership, audience: company)
AudienceService.create(service: mentoring, audience: mentoria)

