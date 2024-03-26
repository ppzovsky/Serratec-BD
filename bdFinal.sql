--create database projetoteste;

create table campanha(
	campanhaID serial primary key,
	nome varchar(50),
	data_inicio date,
	data_final date
);

create table funcionario(
    funcionarioID serial primary key,
    nome varchar(50),
    cpf char(11)  
);

alter table funcionario 
add column participou boolean;

create table quizzes(
    quizID serial primary key, 
    tema varchar(50),
    titulo varchar(50), 
    descricao varchar(200),
    data_inicio date,
    prazo timestamp 
);

alter table quizzes alter column prazo type date;

alter table quizzes
add column campanhaID int default null,
add constraint fk_campanhaID foreign key(campanhaID) references campanha(campanhaID); 

create table participantes (
    ID serial primary key,
    quizID int,
    funcionarioID int,
    data_participacao timestamp default current_timestamp,
    foreign key (funcionarioID) references funcionario(funcionarioID),
    foreign key (quizID) references quizzes(quizID)
);

alter table participantes 
add column acertos int;

create table pergunta(
    perguntaID serial PRIMARY KEY,
    texto_pergunta varchar(100),
    texto_resposta varchar(100),
    opcao char  
);

alter table pergunta alter column texto_resposta type text;
alter table pergunta alter column texto_pergunta type text;

alter table pergunta
add column quizID int default null,
add constraint fk_quizID foreign key(quizID) references quizzes(quizId);

insert into funcionario(
    nome,
    cpf
)
values(

	'Lucas Boeck', '13245567800'),
	('Fernando Silva','19966677722'),	
	('Gabriel Barbosa','19288766599'),
	('Bruno Henrique', '56787643212'),
	('Luiz Mata Porco', '34567890125'),
	('Alexandre Silveira', '44567833400'),
	('Flavinho do Pneu', '33245678923'),
	('Deyde Silva', '23456712239'),
	('Isadora do Santos Pinto', '34567890123'),
	('Luiz Miele', '45577722211'
);

update funcionario 
set participou = true 
where funcionarioid%2=0; --popular de forma mais rapida

update funcionario 
set participou = false 
where funcionarioid%2=1; --popular de forma mais rapida

insert into funcionario (nome,cpf,participou)values('Fernandinho Pilintra','18974419054',true);

insert into campanha(
     nome,
     data_inicio,
	 data_final 
)
    
values(
	'Mecânica Simas Nitro', '2024-03-26', '2024-04-26'
);


insert into quizzes (
    tema,
    titulo, 
    descricao,
    data_inicio,
    prazo
)  
values(
	'Dia da mulher', 
	'Mulheres Fortes', 
	'Um quiz para conscientizar sobre a importância da mulher',
	'2024-03-27',
	'2024-04-24'
	);

insert into quizzes (
    tema,
    titulo, 
    descricao,
    data_inicio,
    prazo
 )   
values(
	'Funcionarios PCD', 
	'Quiz PCD: Seus direitos no mercado de trabalho', 
	'Teste seus conhecimentos sobre os direitos das pessoas com deficiência (PCD) no mercado de trabalho e aprenda como garantir a inclusão e a igualdade de oportunidades',
	'2024-04-24',
	'2024-04-30'
);

ALTER TABLE pergunta
ADD COLUMN opcao_A text,
ADD COLUMN opcao_B text,
ADD COLUMN opcao_C text,
ADD COLUMN opcao_D text;

ALTER TABLE pergunta
RENAME COLUMN opcao TO opcao_correta;

ALTER TABLE pergunta
RENAME COLUMN texto_resposta TO texto_resposta_correta;

insert into pergunta (
	texto_pergunta, 
	texto_resposta_correta, 
	opcao_correta, 
	quizID,
	opcao_A,
	opcao_B,
	opcao_C,
	opcao_D
) 
values
(
	'Qual a data comemorativa do Dia Internacional da Mulher?',
	'08 de março',
	'b',
	1,
	'1º de março',
	'8 de março',
	'15 de março',
	'22 de março'
	 
),
(
   'Qual o tema central do Dia Internacional da Mulher em 2024?',
   'Geração Igualdade: por um mundo com direitos iguais para mulheres e meninas',
   'b',
    1,
	'Igualdade de gênero para um futuro sustentável',
	'Quebrando as barreiras para a igualdade de gênero',
    'Mulheres líderes: por um futuro igualitário em um mundo COVID-19',
    'Geração Igualdade: por um mundo com direitos iguais para mulheres e meninas'
),
(
    'Qual a origem do Dia Internacional da Mulher?',
    'Greve das operárias têxteis de Nova York em 1857',
    'b',
	 1,
	 'Greve das operárias têxteis de Nova York em 1857',
	 'Marcha das Mulheres em Paris em 1910',
	 'Conferência Mundial da Mulher em Pequim em 1995',
	 'Criação da ONU Mulheres em 2010'
),
(
    'Qual o principal objetivo do Dia Internacional da Mulher?',
    'Celebrar conquistas, promover igualdade e conscientizar sobre desafios.',
    'd',
	 1,
	 'Celebrar as conquistas das mulheres',
	 'Refletir sobre os desafios da igualdade de gênero',
	 'Mobilizar a sociedade para a luta pelos direitos das mulheres',
	 'Todas as alternativas acima'
),
(
    'Qual a primeira mulher a ser eleita presidente no Brasil?',
    'Dilma Rousseff',
    'c',
	 1,
	'Dilma Rousseff',
	'Dilma Vana',
	'Dilma Silva',
	'Dilma Santos'
),
(
    'Qual a principal conquista das mulheres na luta pela igualdade de gênero?',
    'Direito ao voto',
    'd',
	 1,
	'Direito ao voto',
	'Direito à educação',
	'Direito ao trabalho',
	'Todas as alternativas acima'
),
(
    'Quem foi a primeira mulher a receber o Prêmio Nobel de Física?',
    'Marie Curie',
    'd',
 	 1,
 	'Marie Curie',
	'Marie Curie Skłodowska',
	'Marie Curie-Skłodowska',
	'Maria Skłodowska Curie'
),
(
    'Qual a importância da representatividade feminina em diferentes áreas da sociedade?',
    'Inspiração para outras mulheres',
    'd',
	 1,
	'Combate ao machismo e à misoginia',
	'Inspiração para outras mulheres',
	'Quebra de estereótipos',
	'Todas as alternativas acima'
),
(
    'Qual a data de criação da ONU Mulheres?',
    '2 de julho de 2010',
    'd',
	 1,
	'1975',
	'1985',
	'1995',
	'2005'
),
(
    'Qual o lema da campanha da ONU Mulheres para o Dia Internacional da Mulher em 2024?',
    'Geração Igualdade: por um mundo com direitos iguais para mulheres e meninas',
    'd',
	 1,
	'Igualdade de gênero: por um futuro sustentável',
	'Quebrando as barreiras para a igualdade de gênero',
	'Mulheres líderes: por um futuro igualitário em um mundo COVID-19',
	'Geração Igualdade: por um mundo com direitos iguais para mulheres e meninas'
);


insert into pergunta (
	texto_pergunta, 
	texto_resposta_correta, 
	opcao_correta, 
	quizID,
	opcao_A,
	opcao_B,
	opcao_C,
	opcao_D
) 
values
(
    'O que a sigla PCD significa?',
    'Pessoa com Deficiência',
    'a',
    2,
    'Pessoa com Deficiência',
	'Pessoa com Capacidades Diferentes',
	'Pessoa com Necessidades Especiais',
	'Pessoa com Desvantagem Física'
),
(
    'Qual a lei que garante a reserva de cotas para pessoas com deficiência no mercado de trabalho?',
    'Lei de Cotas para PCD (Lei nº 8.213/91)',
    'c',
    2,
    'Lei de Acessibilidade',
	'Lei de Cotas para PCD',
	'Lei de Inclusão Social',
	'Lei de Benefícios para PCD'
),
(
    'Qual a porcentagem de vagas para PcD em empresas com mais de 100 funcionários?',
    '2%',
    'b',
    2,
    '1%',
	'2%',
	'3%',
	'4%'
),
(
    'O que é considerado deficiência para fins de reserva de cotas?',
    'Toda restrição física, mental, intelectual ou sensorial de longo prazo',
    'd',
    2,
    'Deficiência física',
	'Deficiência auditiva',
	'Deficiência visual',
	'Todas as alternativas acima'
),
(
    'Qual o prazo para a empresa se adequar à reserva de cotas para pessoas com deficiência?',
    '90 dias',
    'c',
    2,
    '30 dias',
	'60 dias',
	'90 dias',
	'120 dias'
),
(
    'Quais os benefícios de contratar pessoas com deficiência?',
    'Melhoria do clima organizacional',
    'd',
    2,
    'Aumento da diversidade e inclusão',
	'Melhoria do clima organizacional',
	'Aumento da produtividade',
	'Todas as alternativas acima'
),
(
    'Qual o papel do RH na inclusão de pessoas com deficiência no mercado de trabalho?',
    'Em acessibilidade, recrutamento e combate ao preconceito são essenciais.',
    'a',
    2,
    'Divulgar as vagas para PCD',
	'Adaptar o processo seletivo',
	'Promover a acessibilidade no ambiente de trabalho',
	'Todas as alternativas acima'
),
(
    'Quais os desafios enfrentados pelas pessoas com deficiência no mercado de trabalho?',
    'Discriminação, falta de acessibilidade e preconceito são os maiores desafios.',
    'c',
    2,
    'Discriminação',
	'Preconceito',
	'Falta de acessibilidade',
	'Todas as alternativas acima'
),
(
    'Como as empresas podem garantir a inclusão de pessoas com deficiência?',
    'Acessibilidade, treinamento, adaptação e combate ao preconceito são essenciais.',
    'd',
    2,
    'Investir em treinamento para os colaboradores',
	'Adaptar o ambiente de trabalho',
	'Oferecer oportunidades de desenvolvimento profissional',
	'Todas as alternativas acima'

),
(
    'Quais os direitos das pessoas com deficiência no mercado de trabalho?',
    'Salário igualitário, jornada especial, benefícios e acessibilidade são seus direitos.',
    'b',
    2,
    'Salário igualitário',
	'Jornada de trabalho especial',
	'Benefícios previdenciários',
	'Todas as alternativas acima'
);



update quizzes 
set campanhaID = 1
where quizID<3; -- adicionado chave estrangeira referenciando quiz a sua campanha 



insert into participantes (
	quizid,
	funcionarioid,
	data_participacao,
	acertos
)
values 
(
	1,
	2,
	CURRENT_TIMESTAMP,
	9
	
),
(
	1,
	4,
	CURRENT_TIMESTAMP,
	3
	
),
(
	2,
	6,
	CURRENT_TIMESTAMP,
	6
	
),
(
	2,
	8,
	CURRENT_TIMESTAMP,
	10	
),
(
	1,
	10,
	CURRENT_TIMESTAMP,
	10	
),
(
	1,
	11,
	CURRENT_TIMESTAMP,
	8	
);


--insert into participantes (funcionarioid) 
--select  funcionarioid from funcionario 
--where participou = true;


select * from participantes;
select * from campanha;
select * from funcionario;
select * from pergunta;
select * from quizzes;




-- Consultar os funcionários que participaram de uma determinada campanha de quiz e sua pontuação.
SELECT funcionario.nome, participantes.quizid, participantes.acertos
FROM funcionario
INNER JOIN participantes ON funcionario.funcionarioid  = participantes.funcionarioid;


-- Consultar os funcionários que obtiveram a maior pontuação.
SELECT funcionario.nome, participantes.acertos
FROM funcionario
INNER JOIN participantes ON funcionario.funcionarioid  = participantes.funcionarioid
WHERE acertos = (
    SELECT MAX(acertos)
    FROM participantes
);


