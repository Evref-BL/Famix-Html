Class {
	#name : #HTMLCommentNode,
	#superclass : #HTMLProgramNode,
	#instVars : [
		'comment'
	],
	#category : #'SmaCC_HTML'
}

{ #category : #generated }
HTMLCommentNode >> acceptVisitor: aProgramVisitor [

	^ aProgramVisitor visitComment: self
]

{ #category : #generated }
HTMLCommentNode >> comment [

	^ comment
]

{ #category : #generated }
HTMLCommentNode >> comment: aSmaCCToken [

	comment := aSmaCCToken
]

{ #category : #generated }
HTMLCommentNode >> tokenVariables [

	^ #( #comment )
]
