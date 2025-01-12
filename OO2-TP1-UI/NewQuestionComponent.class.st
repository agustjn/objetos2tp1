Class {
	#name : #NewQuestionComponent,
	#superclass : #WebComponent,
	#instVars : [
		'tituloText',
		'descText',
		'topicoText'
	],
	#category : #'OO2-TP1-UI'
}

{ #category : #'private ' }
NewQuestionComponent >> cancelar [
	^ self 
]

{ #category : #'private ' }
NewQuestionComponent >> descText [
	^ descText
]

{ #category : #'private ' }
NewQuestionComponent >> descText: anObject [
	descText := anObject
]

{ #category : #'private ' }
NewQuestionComponent >> initialize [
	super initialize.
	tituloText := ''.
	descText:=''.
	topicoText:=''.
]

{ #category : #'private ' }
NewQuestionComponent >> publicar [
	| tops |
	tituloText ifEmpty: [ ^ self ].
	topicoText ifEmpty: [ ^ self ].
	topicoText parseLiterals.
	tops := topicoText splitOn: ','.
	self model
		agregarPreguntaConTitulo: tituloText
		descripcion: descText
		topicos: tops
		usuario: self session user.
	self answer
]

{ #category : #rendering }
NewQuestionComponent >> renderContentOn: aCanvas [
	self renderNavOn: aCanvas.
	aCanvas heading: 'Crear pregunta'.
	aCanvas
		form: [ self renderTextInputOn: aCanvas.
			aCanvas submitButton
				callback: [ self publicar ];
				value: 'Guardar'.
			aCanvas space.
			aCanvas submitButton
				callback: [ self answer  ];
				value: 'Cancelar' ]
]

{ #category : #'private ' }
NewQuestionComponent >> renderTextInputOn: aCanvas [ 
	aCanvas
				text: 'Titulo: ';
				paragraph.
			aCanvas textInput on: #tituloText of: self.
			aCanvas break.
			aCanvas
				text: 'Descripcion: ';
				paragraph.
			aCanvas textArea on: #descText of: self.
			aCanvas break.
			aCanvas
				text: 'Topicos (separados por una ",")';
				paragraph.
			aCanvas textInput on: #topicoText of: self.
			aCanvas break.
			aCanvas paragraph.
]

{ #category : #'private ' }
NewQuestionComponent >> tituloText [
	^ tituloText
]

{ #category : #'private ' }
NewQuestionComponent >> tituloText: anObject [
	tituloText := anObject
]

{ #category : #'private ' }
NewQuestionComponent >> topicoText [
	^topicoText 
]

{ #category : #'private ' }
NewQuestionComponent >> topicoText: aTopicText [
	topicoText := aTopicText 
]
