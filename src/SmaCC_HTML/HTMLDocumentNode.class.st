Class {
	#name : #HTMLDocumentNode,
	#superclass : #HTMLProgramNode,
	#instVars : [
		'elements'
	],
	#category : #'SmaCC_HTML'
}

{ #category : #generated }
HTMLDocumentNode >> acceptVisitor: aProgramVisitor [

	^ aProgramVisitor visitDocument: self
]

{ #category : #generated }
HTMLDocumentNode >> elements [

	^ elements
]

{ #category : #generated }
HTMLDocumentNode >> elements: anOrderedCollection [

	self setParent: self elements to: nil.
	elements := anOrderedCollection.
	self setParent: self elements to: self
]

{ #category : #'generated-initialize-release' }
HTMLDocumentNode >> initialize [
	super initialize.
	elements := OrderedCollection new: 2.
]

{ #category : #generated }
HTMLDocumentNode >> otherVariables [

	^ #( #elements )
]
