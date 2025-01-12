Class {
	#name : #Publication,
	#superclass : #Object,
	#instVars : [
		'votes',
		'timestamp',
		'description',
		'user'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #adding }
Publication >> addVote: aVote [
	votes add: aVote
]

{ #category : #accessing }
Publication >> description [
	^ description
]

{ #category : #accessing }
Publication >> description: anObject [
	description := anObject
]

{ #category : #queries }
Publication >> haveMoreVotesThan: averageVotes [
	^ self positiveVotes size >= averageVotes
]

{ #category : #initalize }
Publication >> initialize [
	votes := OrderedCollection new.
	timestamp := DateAndTime now.
]

{ #category : #queries }
Publication >> isOfToday [
	^ timestamp asDate = Date today
	
]

{ #category : #adding }
Publication >> negativeVotes [
	^ votes reject:[ :vote | vote isLike ]
]

{ #category : #adding }
Publication >> positiveVotes [
	^ votes select: [ :vote | vote isLike ]
]

{ #category : #queries }
Publication >> sameUser: anUser [
	^ user == anUser
]

{ #category : #accessing }
Publication >> timestamp [
	^ timestamp
]

{ #category : #private }
Publication >> timestamp: anObject [
	timestamp := anObject
]

{ #category : #accessing }
Publication >> user [
	^ user
]

{ #category : #private }
Publication >> user: anObject [
	user := anObject
]

{ #category : #accessing }
Publication >> votes [
	^ votes
]
