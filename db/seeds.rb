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


executive_coaching = Service.create(name: "Executive Coaching", nickname:"Coaching", description: "Processo poderoso de desenvolvimento que visa maximizar resultados, promover autoconhecimento e provocar mudanças comportamentais por meio de orientação, desenvolvimento de competências e construção de planos de ação  - levando o coachee a reflexão sobre questões importantes para si, potencializando forças e reduzindo crenças limitantes. Indicado para indivíduos que querem sair da zona de conforto, aumentar a performance e alcançar resultados com mais autonomia e confiança. 
Além de um processo, o Coaching é parceria, portanto você terá um acompanhamento personalizado e focado nos seus objetivos e necessidades, ou seja, alinhado ao que traz sentido para si.", tagline: "Alcance seus objetivos com mais autoconhecimento, autonomia e confiança.", hp_show: true, structure: "6 a 8 sessões de 1 hora, presencial ou online.")
executive_coaching_image_file = File.open(File.join(Rails.root,'app/assets/images/life-coaching.jpg'))
executive_coaching.photo.attach(io: executive_coaching_image_file, filename: 'life-coaching.jpg', content_type: 'image/jpg')


mentoring = Service.create(name: "Mentoria Executiva", nickname:"Mentoria", description: "Sessões onde a experiência e know-how do mentor em gestão e liderança de equipes auxiliará o profissional a enxergar diferentes perspectivas, sair da zona de conforto e ganhar mais conhecimento e segurança, por meio de orientações reflexões, insights e partilha de vivências profissionais. Indicado para profissionais que buscam ampliar visão, crescer profissionalmente, desenvolver liderança, e capacidade de gestão, bem como aumentar a performance. Você terá acompanhamento e orientação personalizada e focada na sua necessidade e nos resultados que gostaria de obter. Tudo isso alinhado ao que traz sentido para si.", tagline: "Amplie a visão, tenha insights, conheça novas perperctivas, drible desafios e conte com o conhecimento de profissionais experientes na orientação.", structure: "6 a 8 sessões de 1 hora, presencial ou online.", hp_show: true)
mentoring_image_file = File.open(File.join(Rails.root,'app/assets/images/mentoring.jpg'))
mentoring.photo.attach(io: mentoring_image_file, filename: 'mentoring.jpg', content_type: 'image/jpg')

lideranca = Service.create(name: "Formação Liderança Inspiradora", nickname:"Liderança", description: "Liderança é um dos softs skills mais procurados atualmente pelas empresas. Um bom líder impacta diretamente nos resultados da companhia e tem papel fundamental na construção da cultura organizacional. Ele motiva as pessoas e extrai o melhor delas, contribui positivamente para os objetivos da empresa, além de criar um ambiente de trabalho produtivo, saudável e conectado com a missão da companhia. Desenvolver esta competência pode gerar saltos na sua carreira, além de impactar positivamente na vida de outras pessoas. Portanto, se o seu momento chegou e você não sabe por onde começar ou quer se desenvolver para ir mais longe, invista na formação de liderança inspiradora." , tagline: "Liderar é inspirar pessoas e ser lider é uma escolha.", hp_show: true, structure: "Presencial ou online, customizado de acordo com a necessidade da empresa ou do proissional – de 4 a 12 horas.")
lideranca_image_file = File.open(File.join(Rails.root,'app/assets/images/lideranca.jpg'))
lideranca.photo.attach(io: lideranca_image_file, filename: 'lideranca.jpg', content_type: 'image/jpg')

proposito = Service.create(name: "\"The\" Workshop - Orientação de Propósito",  nickname:"Propósito", description: "No \"The\" Workshop te ajudaremos a se orientar para o que te traz sentido! Através de uma linda e rica jornada de 12 horas, distribuidas em 3 dias, você terá a oportunidade de se conhecer mais profundamente, fazer descobertas e reflexões e se alinhar com o que faz sentido pra sua vida." , structure: "Workshop online com atividades práticas e utilização de ferramentas, além de aplicação de técnicas de Coaching e PNL.", tagline: "Para aqueles que buscam autoconhecimento, conexão com a sua verdade e alinhamento entre talento e propósito.", hp_show: true)
proposito_image_file = File.open(File.join(Rails.root,'app/assets/images/proposito.jpg'))
# proposito_image_file = URI.open('https://images.unsplash.com/photo-1610123668028-25f5cd2a1460?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1956&q=80')
proposito.photo.attach(io: proposito_image_file, filename: 'proposito.jpg', content_type: 'image/jpg')

life_coaching = Service.create(name: "Life Coaching",  nickname: "Coaching", description: "Já o Life Coaching é um processo poderoso de desenvolvimento e  autoconhecimento, que provoca mudanças comportamentais, levando o coachee à reflexão sobre questões importantes para si, potencializando forças e reduzindo crenças limitantes. Embarque nesta delicioso processo de transformação pessoal e tenha mais segurança e autoconhecimento para alcançar os seus objetivos pessoais e profissionais, alinhando-se ao que faz sentido para si.", tagline: "Para aqueles que buscam autoconhecimento, conexão com a sua verdade e alinhamento entre talento e propósito.", structure: "6 a 8 sessões de 1 hora, presencial ou online.", hp_show: false)
life_coaching_image_file = File.open(File.join(Rails.root,'app/assets/images/proposito.jpg'))
life_coaching.photo.attach(io: life_coaching_image_file, filename: 'proposito.jpg', content_type: 'image/jpg')

carreira = Service.create(name: "Planejamento de Carreira", nickname:"Carreira", description: "O mundo está cheio de possibilidades maravilhosas, mas nem sempre é fácil saber qual caminho trilhar ou qual direção está mais alinhada ao que faz sentido para nós. é comum ter dúvidas no ínicio ou em qualquer outro momento da trajetória profissional, por isso um plano de carreira individual estruturado, te  ajudará a ter mais clareza dos próximos passos.
O programa de planejamento de carreira é um processo realizado por meio de metodologia própria e utilização de ferramentas com o objetivo de gerar autoconhecimento, alinhamento entre talento e propósito e identificação do foco de carreira. Você terá acompanhamento e orientação personalizada, focada no seu objetivo de carreira e alinhado ao que faz sentido para você.
Nosso processo visa proporcionar mais segurança e autonomia ao profissional, para que este melhore a gestão de sua carreira e tenha clareza dos próximos passos, e que, a qualquer tempo, possa direcioná-la a partir de um foco que faça sentido para si." , tagline: "Tenha clareza dos seus próximos passos de carreira, alnhe-se ao que faz sentido para si.", hp_show: true, structure: "6 a 8 sessões de 1 hora, presencial ou online.")
carreira_image_file = File.open(File.join(Rails.root,'app/assets/images/carreira.jpg'))
carreira.photo.attach(io: carreira_image_file, filename: 'carreira.jpg', content_type: 'image/jpg')

autoconhecimento = Service.create(name: "Testes de Perfil", nickname:"Autoconhecimento", description: "Aplicação e devolutiva do teste de personalidade MBTI (Myers-Briggs Type Indicator) e do Firo B. Ambos testes proporcionam análise de perfil por meio da identificação de talentos, necessidades e tendências comportamentais; auxílio na adequação do talento a carreira; identificação de características de liderança, padrões de comunicação e seus impactos; levantamento de campos de força e áreas de stress." , tagline: "Para aqueles que buscam autoconhecimento, identificação da carreira ideal ou necessitam de mais informações para desenhar futuros passos profissionais.", hp_show: true, structure: "2 encontros de 1 hora e meia cada.")
autoconhecimento_image_file = File.open(File.join(Rails.root,'app/assets/images/autoconhecimento.jpg'))
autoconhecimento.photo.attach(io: autoconhecimento_image_file, filename: 'autoconhecimento.jpg', content_type: 'image/jpg')

puts "Creating Partners"

grazi = Partner.create(first_name: "Graziele", last_name: "Neves", email: "grazi@discoverthelighthouse.com")
joao = Partner.create(first_name: "João", last_name: "Test", email: "joao@discoverthelighthouse.com")

puts "Creating Audiences"
# recoloc = Audience.create(name: "Executivos em busca de recolocação profissional", description: "Executivos que buscam recolocação profissional", audience_type: "pessoa")
# mentoria = Audience.create(name: "Executivos em busca de mentoring", description: "Executivos que buscam mentoring", audience_type: "pessoa")
empresa = Audience.create(name: "Empresa em busca de treinamento", description: "Empresas que querem treinar seus profissionais", audience_type: "empresa")
pessoa = Audience.create(name: "Pessoa em busca de serviços de mentoring, coaching, etc.", description: "Pessoa em busca de serviços de mentoring, coaching, etc.", audience_type: "pessoa")

puts "Creating Partner Services"
PartnerService.create(partner: grazi, service: mentoring)
PartnerService.create(partner: grazi, service: lideranca)
PartnerService.create(partner: grazi, service: executive_coaching)
PartnerService.create(partner: grazi, service: proposito)
PartnerService.create(partner: grazi, service: carreira)
PartnerService.create(partner: grazi, service: autoconhecimento)
PartnerService.create(partner: joao, service: life_coaching)
PartnerService.create(partner: grazi, service: life_coaching)

puts "Creating Audience Services"
AudienceService.create(service: executive_coaching, audience: empresa)
AudienceService.create(service: executive_coaching, audience: pessoa)
AudienceService.create(service: life_coaching, audience: pessoa)
AudienceService.create(service: lideranca, audience: empresa)
AudienceService.create(service: lideranca, audience: pessoa)
AudienceService.create(service: proposito, audience: empresa)
AudienceService.create(service: proposito, audience: pessoa)
AudienceService.create(service: carreira, audience: pessoa)
AudienceService.create(service: carreira, audience: empresa)
AudienceService.create(service: autoconhecimento, audience: pessoa)
AudienceService.create(service: autoconhecimento, audience: empresa)
AudienceService.create(service: mentoring, audience: pessoa)
AudienceService.create(service: mentoring, audience: empresa)

