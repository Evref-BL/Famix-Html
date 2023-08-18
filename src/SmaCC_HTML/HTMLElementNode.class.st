Class {
	#name : #HTMLElementNode,
	#superclass : #HTMLProgramNode,
	#instVars : [
		'beginTagOpen',
		'tagOpenName',
		'beginTagClose',
		'childrens',
		'endTagOpen',
		'endTagOpenName',
		'endTagClose',
		'_attributes'
	],
	#category : #'SmaCC_HTML'
}

{ #category : #generated }
HTMLElementNode >> _attributes [

	^ _attributes
]

{ #category : #generated }
HTMLElementNode >> _attributes: aHTMLAttributesNode [

	self _attributes notNil ifTrue: [ self _attributes parent: nil ].
	_attributes := aHTMLAttributesNode.
	self _attributes notNil ifTrue: [ self _attributes parent: self ]
]

{ #category : #generated }
HTMLElementNode >> acceptVisitor: aProgramVisitor [

	^ aProgramVisitor visitElement: self
]

{ #category : #generated }
HTMLElementNode >> beginTagClose [

	^ beginTagClose
]

{ #category : #generated }
HTMLElementNode >> beginTagClose: aSmaCCToken [

	beginTagClose := aSmaCCToken
]

{ #category : #generated }
HTMLElementNode >> beginTagOpen [

	^ beginTagOpen
]

{ #category : #generated }
HTMLElementNode >> beginTagOpen: aSmaCCToken [

	beginTagOpen := aSmaCCToken
]

{ #category : #generated }
HTMLElementNode >> childrens [

	^ childrens
]

{ #category : #generated }
HTMLElementNode >> childrens: anOrderedCollection [

	self setParent: self childrens to: nil.
	childrens := anOrderedCollection.
	self setParent: self childrens to: self
]

{ #category : #generated }
HTMLElementNode >> endTagClose [

	^ endTagClose
]

{ #category : #generated }
HTMLElementNode >> endTagClose: aSmaCCToken [

	endTagClose := aSmaCCToken
]

{ #category : #generated }
HTMLElementNode >> endTagOpen [

	^ endTagOpen
]

{ #category : #generated }
HTMLElementNode >> endTagOpen: aSmaCCToken [

	endTagOpen := aSmaCCToken
]

{ #category : #generated }
HTMLElementNode >> endTagOpenName [

	^ endTagOpenName
]

{ #category : #generated }
HTMLElementNode >> endTagOpenName: aSmaCCToken [

	endTagOpenName := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
HTMLElementNode >> initialize [
	super initialize.
	childrens := OrderedCollection new: 2.
]

{ #category : #generated }
HTMLElementNode >> nodeVariables [

	^ #( #_attributes )
]

{ #category : #generated }
HTMLElementNode >> otherVariables [

	^ #( #childrens )
]

{ #category : #generated }
HTMLElementNode >> tagOpenName [

	^ tagOpenName
]

{ #category : #generated }
HTMLElementNode >> tagOpenName: aSmaCCToken [

	tagOpenName := aSmaCCToken
]

{ #category : #generated }
HTMLElementNode >> tokenVariables [

	^ #( #beginTagOpen #tagOpenName #beginTagClose #endTagOpen
	     #endTagOpenName #endTagClose )
]
