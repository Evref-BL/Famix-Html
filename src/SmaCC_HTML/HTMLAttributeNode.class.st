Class {
	#name : #HTMLAttributeNode,
	#superclass : #HTMLProgramNode,
	#instVars : [
		'attributeName',
		'attributeEqualSymbol',
		'attributeValue'
	],
	#category : #'SmaCC_HTML'
}

{ #category : #generated }
HTMLAttributeNode >> acceptVisitor: aProgramVisitor [

	^ aProgramVisitor visitAttribute: self
]

{ #category : #generated }
HTMLAttributeNode >> attributeEqualSymbol [

	^ attributeEqualSymbol
]

{ #category : #generated }
HTMLAttributeNode >> attributeEqualSymbol: aSmaCCToken [

	attributeEqualSymbol := aSmaCCToken
]

{ #category : #generated }
HTMLAttributeNode >> attributeName [

	^ attributeName
]

{ #category : #generated }
HTMLAttributeNode >> attributeName: aSmaCCToken [

	attributeName := aSmaCCToken
]

{ #category : #generated }
HTMLAttributeNode >> attributeValue [

	^ attributeValue
]

{ #category : #generated }
HTMLAttributeNode >> attributeValue: aSmaCCToken [

	attributeValue := aSmaCCToken
]

{ #category : #generated }
HTMLAttributeNode >> tokenVariables [

	^ #( #attributeName #attributeEqualSymbol #attributeValue )
]
