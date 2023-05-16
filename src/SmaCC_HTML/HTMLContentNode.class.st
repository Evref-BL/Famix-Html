Class {
	#name : #HTMLContentNode,
	#superclass : #HTMLProgramNode,
	#instVars : [
		'elements',
		'_comments'
	],
	#category : #'SmaCC_HTML'
}

{ #category : #generated }
HTMLContentNode >> _comments [

	^ _comments
]

{ #category : #generated }
HTMLContentNode >> _comments: anOrderedCollection [

	_comments := anOrderedCollection
]

{ #category : #generated }
HTMLContentNode >> acceptVisitor: aProgramVisitor [

	^ aProgramVisitor visitContent: self
]

{ #category : #generated }
HTMLContentNode >> compositeTokenVariables [

	^ #( #_comments )
]

{ #category : #generated }
HTMLContentNode >> elements [

	^ elements
]

{ #category : #generated }
HTMLContentNode >> elements: anOrderedCollection [

	self setParent: self elements to: nil.
	elements := anOrderedCollection.
	self setParent: self elements to: self
]

{ #category : #'generated-initialize-release' }
HTMLContentNode >> initialize [
	super initialize.
	elements := OrderedCollection new: 2.
	_comments := OrderedCollection new: 2.
]

{ #category : #generated }
HTMLContentNode >> otherVariables [

	^ #( #elements )
]
