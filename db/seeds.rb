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
Article.destroy_all
ArticleCategory.destroy_all
ArticleCategorization.destroy_all

puts "Creating Services"


executive_coaching = Service.create(name: "Professional Coaching", nickname:"Coaching", description: "Processo poderoso de desenvolvimento que visa maximizar resultados, promover autoconhecimento e provocar mudanças comportamentais por meio de reflexão, desenvolvimento de competências e construção de planos de ação. Indicado para indivíduos que querem sair da zona de conforto e alcançar resultados com mais autonomia e confiança, potencializando forças e reduzindo crenças limitantes.
Além de um processo, coaching é parceria, portanto você terá um acompanhamento personalizado e focado nos seus objetivos e necessidades, alinhado ao que traz sentido para si.", tagline: "Alcance objetivos com autoconhecimento, autonomia e confiança.", hp_show: true, structure: "8 a 10 sessões de 1 hora, presencial ou online.", course: false)
executive_coaching_image_file = File.open(File.join(Rails.root,'app/assets/images/executive-coaching.jpg'))
executive_coaching.photo.attach(io: executive_coaching_image_file, filename: 'executive-coaching.jpg', content_type: 'image/jpg')


mentoring = Service.create(name: "Mentoria Executiva", nickname:"Mentoria", description: "Sessões onde a experiência e know-how do mentor auxiliarão o profissional a enxergar diferentes perspectivas, sair da zona de conforto e ganhar mais conhecimento e segurança, por meio de orientações, reflexões, insights e partilha de vivências profissionais. Indicado para profissionais que buscam ampliar visão, crescer profissionalmente, desenvolver liderança e capacidade de gestão, e aumentar a performance. Você terá acompanhamento e orientação personalizada e focada na sua necessidade e nos resultados que gostaria de obter. Tudo isso alinhado ao que traz sentido para si.", tagline: "Amplie a visão, tenha insights, conheça novas perperctivas e seja orientado por profissionais experientes.", structure: "8 a 10 sessões de 1 hora, presencial ou online.", hp_show: true, course: false)
mentoring_image_file = File.open(File.join(Rails.root,'app/assets/images/mentoring.jpg'))
mentoring.photo.attach(io: mentoring_image_file, filename: 'mentoring.jpg', content_type: 'image/jpg')

lideranca = Service.create(name: "Formação Liderança Inspiradora", nickname:"Liderança", description: "Liderança é um dos soft skills mais procurados atualmente pelas empresas. Um bom líder impacta diretamente nos resultados da companhia e tem papel fundamental na construção da cultura organizacional. Ele motiva as pessoas e extrai o melhor delas, contribui positivamente para os objetivos da empresa, além de criar um ambiente de trabalho produtivo, saudável e conectado com a missão da companhia. Desenvolver esta competência pode gerar saltos na sua carreira, além de impactar positivamente na vida de outras pessoas. Portanto, se o seu momento chegou e você não sabe por onde começar ou quer se desenvolver para ir mais longe, invista na formação de liderança inspiradora." , tagline: "Liderar é inspirar pessoas e ser lider é uma escolha. Prepare-se para inspirá-las!", hp_show: true, structure: "Presencial ou online, customizado de acordo com a necessidade da empresa ou do profissional.", course: true)
lideranca_image_file = File.open(File.join(Rails.root,'app/assets/images/lideranca.jpg'))
lideranca.photo.attach(io: lideranca_image_file, filename: 'lideranca.jpg', content_type: 'image/jpg')

proposito = Service.create(name: "\"THE\" Workshop - Orientação de Propósito",  nickname:"Propósito", description: "Através de uma linda e rica jornada de 12 horas, distribuidas em 3 dias, você terá a oportunidade de se conhecer mais profundamente, fazer descobertas, reflexões e se conectar ao que faz sentido pra sua vida. Descubra o que faz seu coração cantar! O \"THE\" Workshop é para aqueles que buscam autoconhecimento, conexão com a sua verdade e alinhamento entre talento e propósito." , structure: "Workshop online com atividades práticas e utilização de ferramentas, além de aplicação de técnicas de Coaching e PNL.", tagline: "Autoconhecimento, conexão e alinhamento entre talento e propósito.", hp_show: true, course: true)
proposito_image_file = File.open(File.join(Rails.root,'app/assets/images/proposito.jpg'))
# proposito_image_file = URI.open('https://images.unsplash.com/photo-1610123668028-25f5cd2a1460?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1956&q=80')
proposito.photo.attach(io: proposito_image_file, filename: 'proposito.jpg', content_type: 'image/jpg')

life_coaching = Service.create(name: "Life Coaching",  nickname: "Coaching", description: "O coaching é um processo poderoso de desenvolvimento e  autoconhecimento, que provoca mudanças comportamentais, levando o coachee à reflexão sobre questões importantes para si, potencializando forças e reduzindo crenças limitantes. Embarque neste delicioso processo de transformação pessoal e tenha mais segurança e autoconhecimento para alcançar os seus objetivos alinhando-se ao que faz sentido para si.", tagline: "Para aqueles que buscam autoconhecimento, conexão com a sua verdade e alinhamento entre talento e propósito.", structure: "8 a 10 sessões de 1 hora, presencial ou online.", hp_show: false, course: false)
life_coaching_image_file = File.open(File.join(Rails.root,'app/assets/images/life-coaching.jpg'))
life_coaching.photo.attach(io: life_coaching_image_file, filename: 'life-coaching.jpg', content_type: 'image/jpg')

carreira = Service.create(name: "Planejamento de Carreira", nickname:"Carreira", description: "O mundo está cheio de possibilidades maravilhosas, mas nem sempre é fácil saber qual caminho trilhar ou qual direção está mais alinhada ao que faz sentido para nós. É comum ter dúvidas no início ou em qualquer outro momento da trajetória profissional, por isso um plano de carreira individual estruturado, te  ajudará a ter mais clareza dos próximos passos. O programa de planejamento de carreira é um processo realizado por meio de metodologia própria e utilização de ferramentas, com o objetivo de gerar autoconhecimento, alinhamento entre talento e propósito e identificação do foco de carreira. Você terá acompanhamento e orientação personalizada, focada no seu objetivo de carreira e alinhado ao que faz sentido para si.", tagline: "Tenha clareza sobre os seus próximos passos de carreira.", hp_show: true, structure: "8 a 10 sessões de 1 hora, presencial ou online.", course: false)
carreira_image_file = File.open(File.join(Rails.root,'app/assets/images/carreira.jpg'))
carreira.photo.attach(io: carreira_image_file, filename: 'carreira.jpg', content_type: 'image/jpg')

mbti = Service.create(name: "Teste MBTI", nickname:"Testes de Perfil", description: "O MBTI é o instrumento mais utilizado no mundo para identificação do tipo psicológico das pessoas. Também amplamente utilizado como teste de personalidade, tem como base a teoria dos tipos psicológicos de Carl Jung. Devido a sua eficiência na classificação de comportamento, estilo, características no trabalho, entre outros, é recomendado para gestão de pessoas em geral, alinhamento entre lideranças, negociação de conflito e autoconhecimento. Além de muito útil para o desenvolvimento organizacional, também auxilia no autoconhecimento dos indivíduos, permitindo uma análise mais profunda da personalidade para o desenvolvimento de competências,  potencialização das forças e desenho de carreira." , tagline: "Autoconhecimento, testes de perfil e pistas para próximos passos de carreira.", hp_show: true, structure: "Aplicação e devolutiva online e presencial.", course: false)
mbti_image_file = File.open(File.join(Rails.root,'app/assets/images/mbti.jpg'))
mbti.photo.attach(io: mbti_image_file, filename: 'mbti.jpg', content_type: 'image/jpg')

firob = Service.create(name: "Teste Firo B", nickname:"Testes de Perfil", description: "Firo-B é um instrumento que avalia as relações interpessoais e ajuda as pessoas a compreenderem o seu comportamento e o comportamento dos outros. O resultado do instrumento possibilita o entendimento de como as necessidades de inclusão, controle e afeição podem determinar o modo como as pessoas interagem umas com as outras, seja no ambiente profissional ou em sua vida pessoal. Por meio deste instrumento é possível explorar as necessidades interpessoais dos indivíduos e das equipes e entender como essas necessidades influenciam os comportamentos relacionados à integração, comunicação, solução de problemas e tomada de decisão. Firo-B fornece insumos para o autodesenvolvimento e desenvolvimento de equipes, possibilitando o entendimento de estilos, pontos fortes e desafios, além de servir de ferramenta de auxilio à mudança comportamental." , tagline: "Autoconhecimento, testes de perfil e pistas para próximos passos de carreira.", hp_show: false, structure: "Aplicação e devolutiva online e presencial.", course: false)
firob_image_file = File.open(File.join(Rails.root,'app/assets/images/firob.jpg'))
firob.photo.attach(io: firob_image_file, filename: 'firob.jpg', content_type: 'image/jpg')

puts "Creating Partners"

grazi = Partner.create(first_name: "Graziele", last_name: "Neves", email: "grazi@discoverthelighthouse.com")
ricardo = Partner.create(first_name: "Ricardo", last_name: "Penna", email: "ricardo@discoverthelighthouse.com")

puts "Creating Audiences"
# recoloc = Audience.create(name: "Executivos em busca de recolocação profissional", description: "Executivos que buscam recolocação profissional", audience_type: "pessoa")
# mentoria = Audience.create(name: "Executivos em busca de mentoring", description: "Executivos que buscam mentoring", audience_type: "pessoa")
empresa = Audience.create(name: "Empresa em busca de treinamento", description: "Empresas que querem treinar seus profissionais", audience_type: "empresa")
pessoa = Audience.create(name: "Pessoa em busca de serviços de mentoring, coaching, etc.", description: "Pessoa em busca de serviços de mentoring, coaching, etc.", audience_type: "pessoa")

puts "Creating Partner Services"
PartnerService.create(partner: grazi, service: mentoring)
PartnerService.create(partner: ricardo, service: mentoring)
PartnerService.create(partner: grazi, service: lideranca)
PartnerService.create(partner: grazi, service: executive_coaching)
PartnerService.create(partner: grazi, service: proposito)
PartnerService.create(partner: grazi, service: carreira)
PartnerService.create(partner: grazi, service: mbti)
PartnerService.create(partner: grazi, service: firob)
PartnerService.create(partner: ricardo, service: life_coaching)
PartnerService.create(partner: grazi, service: life_coaching)

puts "Creating Audience Services"
AudienceService.create(service: executive_coaching, audience: empresa)
AudienceService.create(service: executive_coaching, audience: pessoa)
AudienceService.create(service: life_coaching, audience: pessoa)
AudienceService.create(service: lideranca, audience: empresa)
AudienceService.create(service: lideranca, audience: pessoa)
# AudienceService.create(service: proposito, audience: empresa)
AudienceService.create(service: proposito, audience: pessoa)
AudienceService.create(service: carreira, audience: pessoa)
AudienceService.create(service: carreira, audience: empresa)
AudienceService.create(service: mentoring, audience: pessoa)
AudienceService.create(service: mentoring, audience: empresa)
AudienceService.create(service: mbti, audience: empresa)
AudienceService.create(service: mbti, audience: pessoa)
AudienceService.create(service: firob, audience: empresa)
# AudienceService.create(service: firob, audience: pessoa)

# Creating articles and article categories
article_1 = Article.create(title: "Como encontrar um trabalho com propósito", body: "Da revolução industrial aos dias atuais, a relação entre o homem e o trabalho mudou drasticamente. Contudo, não precisamos ir até o século XVIII e retroceder anos na história para ilustrar algumas destas transformações. Se fizermos uma rápida comparação entre os nossos avós e a geração Z, por exemplo, teremos um “recorte” significativo da mudança comportamental, de mindset e da ressignificação que o trabalho teve entre estas as gerações. O trabalho deixou de ser apenas um meio de sustentação da família e sinônimo de dignidade, passando a ser sinônimo de realização e sucesso, e agora , novamente, transforma-se e passa a ser visto como instrumento que pode nos proporcionar  a oportunidade de gerar impacto positivo nas pessoas, no ambiente, no mundo. Ou seja, um trabalho que traga senso de propósito, que esteja conectado com algo bem maior do que somente gerar resultado financeiro através do esforço.
  A crise trazida pela pandemia COVID-19 trouxe impactos inesperados e sem precedentes em todas as áreas, fazendo com que muitos de nós ressignificassem a forma de viver e de se relacionar com as coisas  e pessoas. O trabalho não ficaria fora disso, uma vez que, quando empregados, dedicamos a maior parte do nosso dia às atividades laborais. Rapidamente, quase que “à fórceps”, funcionários e empresas tiveram de se adaptar ao novo cenário, e o que antes era apontado como um movimento trazido pela geração Z –  a busca por trabalhos com significância e impacto positivo, passou a ganhar amplitude e se tornar o principal objetivo de pessoas de diversas gerações  que, movidas pelo desejo de fazer a diferença por meio do trabalho, priorizam satisfação profissional e realização a salários altos para desenvolver algo com qual não se identificam.
  Mas afinal, o que seria um trabalho com significância ou propósito?
  Propósito é algo extremamente pessoal, que reside na interseção entre nossas competências, talentos, necessidades e as necessidades do mundo Porém, não há como falar de propósito sem passar pelos nossos sistemas de valores. Ter alinhamento entre o que fazemos e os nossos motores internos é condição primordial para vivermos com propósito. Neste contexto, um trabalho com propósito estaria ligado diretamente ao sistema de valores de cada um,  exercido por meio das competências e habilidades do indivíduo e gerando feitos  positivos no meio no qual ele está inserido (comunidade, cidade, pais, meio-ambiente). 
  Trabalhar com algo que acreditamos ser significativo para nós e que gera impacto positivo nos outros faz com que nos tornemos mais engajados e dedicados, aumentando a satisfação e o sentido de realização. A pandemia nos  fez encarar o fato de que não temos controle sobre muitos aspectos das nossas vidas  . Logo, trabalhar em empresas e negócios em que acreditamos e vemos relevância faz com que nos sintamos valorizados e nos faz perceber que o nosso trabalho tem importância. Tudo isso aumenta o sentido de pertencimento e visão de que podemos fazer a diferença mesmo em menor escala. Todos ganham com isso: o funcionário, o negócio, a empresa e o meio.
  Como encontrar um trabalho significativo e alinhado ao meu  propósito?
  1.	Pense sobre os seus motores internos: suas paixões, interesses, valores e o que verdadeiramente te move. Tenha uma clara visão sobre o que é inegociável para você.
  2.	Busque empresas, e não por cargos e funções! Faça uma lista das empresas que você admira e que acredita estarem alinhadas a valores semelhantes aos seus.
  3.	Pesquise sobre as empresas: busque referências e informações sobre a cultura interna, sobre seus líderes, seu posicionamento e sua imagem no mercado. Se possível, conecte-se com funcionários e ex-funcionários, e use ferramentas como  o Glass Door e  redes sociais. 
  4.	Por que estas empresas te contratariam?,  
  5.	Conte sua história demonstrando como seus valores se alinham aos da empresa e explicando como você poderia fazer a diferença.
  6.	Quem não é visto, não é lembrado! Atualize o seu currículo e perfil nas redes sociais, principalmente no Linkedin e reflita: você se contrataria? Você está conseguindo contar a sua história e se destacar para as empresas  que te interessam? 
  7.	Personalize! “One size doesn´t fit all” - Adapte seu CV para cada vaga que se candidatar, ele precisa alinhar as suas competências e objetivos às exigências da vaga em questão.
  8.	Siga as suas empresas nas redes sociais, acompanhe as notícias, leia os artigos, participe de webinars, mostre-se presente e interessado.
  9.	Relacionamento é alma do negócio  – use o seu network para se manter conectado com as empresas, com os headhunters e com as pessoas que podem te ajudar a chegar até as empresas que te interessam. Convide pessoas que façam sentido para sua busca. 
  
  Encontrar um trabalho que esteja alinhado ao que faz sentido para nós  nem sempre é fácil e exige autoconhecimento e dedicação. Se você precisa de mais clareza nos próximos passos, mas não sabe por onde começar, nós podemos te orientar. 
  ", partner: Partner.first)

  article_2 = Article.create(title: "Planejamento de Carreira", body: "A crise trazida pela pandemia COVID-19 trouxe impactos inesperados e sem precedentes em todas as áreas, fazendo com que muitos de nós ressignificassem a forma de viver e de se relacionar com as coisas  e pessoas. O trabalho não ficaria fora disso, uma vez que, quando empregados, dedicamos a maior parte do nosso dia às atividades laborais. Rapidamente, quase que “à fórceps”, funcionários e empresas tiveram de se adaptar ao novo cenário, e o que antes era apontado como um movimento trazido pela geração Z –  a busca por trabalhos com significância e impacto positivo, passou a ganhar amplitude e se tornar o principal objetivo de pessoas de diversas gerações  que, movidas pelo desejo de fazer a diferença por meio do trabalho, priorizam satisfação profissional e realização a salários altos para desenvolver algo com qual não se identificam.", partner: Partner.first)

  article_3 = Article.create(title: "Inteligência Emocional", body: "Trabalhar com algo que acreditamos ser significativo para nós e que gera impacto positivo nos outros faz com que nos tornemos mais engajados e dedicados, aumentando a satisfação e o sentido de realização. A pandemia nos  fez encarar o fato de que não temos controle sobre muitos aspectos das nossas vidas. Logo, trabalhar em empresas e negócios em que acreditamos e vemos relevância faz com que nos sintamos valorizados e nos faz perceber que o nosso trabalho tem importância. Tudo isso aumenta o sentido de pertencimento e visão de que podemos fazer a diferença mesmo em menor escala. Todos ganham com isso: o funcionário, o negócio, a empresa e o meio.", partner: Partner.last)

  article_category_1 = ArticleCategory.create(name: "Carreira")
  article_category_2 = ArticleCategory.create(name: "Propósito")
  article_category_3 = ArticleCategory.create(name: "Mudança")

  ArticleCategorization.create(article: article_1, article_category: article_category_1)
  ArticleCategorization.create(article: article_1, article_category: article_category_2)
  ArticleCategorization.create(article: article_2, article_category: article_category_3)
  ArticleCategorization.create(article: article_2, article_category: article_category_1)
  ArticleCategorization.create(article: article_3, article_category: article_category_1)

