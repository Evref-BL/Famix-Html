Class {
	#name : #HTMLProgramNode,
	#superclass : #SmaCCParseNode,
	#category : #'SmaCC_HTML'
}

{ #category : #generated }
HTMLProgramNode >> acceptVisitor: aProgramVisitor [

	^ aProgramVisitor visitProgram: self
]
