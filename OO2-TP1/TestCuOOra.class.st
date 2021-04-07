Class {
	#name : #TestCuOOra,
	#superclass : #TestCase,
	#instVars : [
		'cuOOra'
	],
	#category : #'OO2-TP1-Model'
}

{ #category : #running }
TestCuOOra >> setUp [
   cuOOra := CuOOra new.
]

{ #category : #testing }
TestCuOOra >> testAgregarTopico [
	| topic |
	topic := Topico conNombre: 'Futbol' yDesc: 'Se habla de partidos de champions'.
	cuOOra agregarTopico: topic.
	self assert: (cuOOra topicos includes: topic).
]

{ #category : #testing }
TestCuOOra >> testAgregarUsuario [
	|user1 user2|
	
	user1 := Usuario conNombre: 'Pedro' yContraseña: 'pass1'.
	user2 := Usuario conNombre: 'Juan' yContraseña: 'pass2'.
	cuOOra agregarUsuario: user1 ; agregarUsuario: user2.
	self assert: (cuOOra usuarios includes:user1 ; includes:user2).
	
]

{ #category : #testing }
TestCuOOra >> testObtenerPreguntasDeTopico [
	
	|topic topic2 user1 preg1 preg2 auxCollection auxCollection2|
	"auxCollection va a contener los topicos creados, para despues comprobar si la pregunta1
	esta relacionada a los topicos creados (topic y topic2)
	auxCollection 2 va a contener las preguntas 1 y 2 (preg1 y preg2) para despues comprobar
	si el mensaje '#obtenerPreguntasDeTopico' devuelve la coleccion deseada (auxCollection2)"
	
	topic := Topico conNombre: 'Futbol' yDesc: 'Se habla de partidos de champions'.
	topic2 := Topico conNombre: 'Deporte' yDesc: 'Se habla de deportes'.
	cuOOra agregarTopico: topic ; agregarTopico: topic2.
	auxCollection := OrderedCollection new.
	auxCollection add:topic ; add:topic2.
	user1 := Usuario conNombre: 'Pedro' yContraseña: 'pass1'.
	cuOOra agregarUsuario: user1.
	preg1 := Pregunta conTitulo: 'Messi salva la seleccion' yTexto: 'El jugador del barcelona
	Liones Messi le metio 5 goles a brasiluski' relacionadoA: auxCollection.
	preg2:= Pregunta conTitulo: 'Messi salva al barcelona' yTexto: 'El jugador del barcelona
	Liones Messi le metio 5 goles a madrid' relacionadoA: auxCollection.
	user1 agregarPregunta: preg1.
	user1 agregarPregunta: preg2.
	auxCollection2 := OrderedCollection new.
	auxCollection2 add: preg1 ; add: preg2.
	self assert: (cuOOra obtenerPreguntasDeTopico: topic ) equals: auxCollection2.

	

]