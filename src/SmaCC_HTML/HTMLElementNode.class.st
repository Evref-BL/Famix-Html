Class {
	#name : #HTMLElementNode,
	#superclass : #HTMLProgramNode,
	#instVars : [
		'beginTagOpen',
		'tagOpenName',
		'beginTagClose',
		'_children',
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
HTMLElementNode >> _children [

	^ _children
]

{ #category : #generated }
HTMLElementNode >> _children: aHTMLContentNode [

	self _children notNil ifTrue: [ self _children parent: nil ].
	_children := aHTMLContentNode.
	self _children notNil ifTrue: [ self _children parent: self ]
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

{ #category : #generated }
HTMLElementNode >> nodeVariables [

	^ #( #_children #_attributes )
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
