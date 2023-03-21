
-------------------------------------------------- Atividade 2 - Curso SouCode On - Banco de Dados Não Relacional - MongoDB -----------------------------------------------


-- 1

use soul_atv2
db.aluno.insertMany(
[
{_id:1, nome:"Pablo", sobrenome:"Henrique", nasc: 1993},
{_id:2, nome:"Breno", sobrenome:"Amin", nasc: 1994},
{_id:3, nome:"Raul", sobrenome:"Silva", nasc: 1998},
{_id:4, nome:"Carmem", sobrenome:"Matos", nasc: 1954},
{_id:5, nome:"Isaias", sobrenome:"Anacleto", nasc: 1950},
{_id:6, nome:"Yona", sobrenome:"Araujo", nasc: 1989, status: "Reprovado", nota: 5.2},
{_id:7, nome:"Ana", sobrenome:"Caroline", nasc: 1994, status: "Reprovado", nota: 5.0},
{_id:8, nome:"Mauricio", sobrenome:"De Almeida", nasc: 1994, status: "Reprovado", nota:5.9},
{_id:9, nome:"Savia", sobrenome:"Vitoria", nasc: 1994, status: "Reprovado", nota: 5.7},
{_id:10, nome:"Roberto", sobrenome:"Fernandes", nasc: 1993, status: "Aprovado", nota:5.0}
]
)


-- 2 

db.aluno.find()


db.aluno.find({nome:"Pablo", nasc:1993})


db.aluno.find({$or:[{nome:"Raul"}, {status:"Reprovado"}]})


-- 3 

db.aluno.find({"nome":"Mauricio", "status":"Reprovado"}, {_id:0, nome:1, status:1})
db.aluno.find({"nome":"Yona", "nasc":1989}, {_id:0, nome:1, nasc:1})



-- 4 

db.aluno.find().limit(6)

db.aluno.find().pretty().skip(4)


-- 5 

db.aluno.update(
{_id:(6)},
{
$set:{"status":"Aprovado"}
}
)

db.aluno.update(
{_id:(8)},
{
$set:{"sobrenome":"Almeida"}
}
)


-- 6 

db.aluno.save({
"_id" : (1),
	"nome" : "Pablo",
	"sobrenome" : "Henrique",
	"nasc" : 1993,
	"status" : "Aprovado",
	"nota": 8.2
})

db.aluno.save({
"_id" : (2),
	"nome" : "Breno",
	"sobrenome" : "Amin",
	"nasc" : 1994,
	"status" : "Aprovado",
	"nota": 9.8
})

db.aluno.save({
"_id" : (4),
	"nome" : "Carmem",
	"sobrenome" : "Matos",
	"nasc" : 1954,
	"status" : "Aprovado",
	"nota": 8.5
})

db.aluno.save({
"_id" : (6),
	"nome" : "Yona",
	"sobrenome" : "Araujo",
	"nasc" : 1989,
	"status" : "Aprovado",
	"nota": 8.6
})

db.aluno.save({
"_id" : (8),
	"nome" : "Mauricio",
	"sobrenome" : "Almeida",
	"nasc" : 1994,
	"status" : "Aprovado",
	"nota": 9.0
})


-- 7 

db.aluno.aggregate([{$group:{_id:"$type", Total:{$sum:1}}}])


-- 8 

db.aluno.find({}, {"nome":1, _id:0}).sort({"nome":1})





