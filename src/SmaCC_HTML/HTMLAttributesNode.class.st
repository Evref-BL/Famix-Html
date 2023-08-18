Class {
	#name : #HTMLAttributesNode,
	#superclass : #HTMLProgramNode,
	#instVars : [
		'htmlAttributes'
	],
	#category : #'SmaCC_HTML'
}

{ #category : #generated }
HTMLAttributesNode >> acceptVisitor: aProgramVisitor [

	^ aProgramVisitor visitAttributes: self
]

{ #category : #generated }
HTMLAttributesNode >> compositeNodeVariables [

	^ #( #htmlAttributes )
]

{ #category : #generated }
HTMLAttributesNode >> htmlAttributes [

	^ htmlAttributes
]

{ #category : #generated }
HTMLAttributesNode >> htmlAttributes: anOrderedCollection [

	self setParents: self htmlAttributes to: nil.
	htmlAttributes := anOrderedCollection.
	self setParents: self htmlAttributes to: self
]

{ #category : #'generated-initialize-release' }
HTMLAttributesNode >> initialize [
	super initialize.
	htmlAttributes := OrderedCollection new: 2.
]
