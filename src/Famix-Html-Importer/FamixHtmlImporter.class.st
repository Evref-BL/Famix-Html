Class {
	#name : #FamixHtmlImporter,
	#superclass : #Object,
	#traits : 'THTMLProgramNodeVisitor',
	#classTraits : 'THTMLProgramNodeVisitor classTrait',
	#instVars : [
		'model',
		'parentNode'
	],
	#category : #'Famix-Html-Importer'
}

{ #category : #'as yet unclassified' }
FamixHtmlImporter >> importString: aHTMLString [

	self accept: (HTMLParser parse: aHTMLString).
	^ model
]

{ #category : #accessing }
FamixHtmlImporter >> model [

	^ model
]

{ #category : #accessing }
FamixHtmlImporter >> model: anObject [

	model := anObject
]

{ #category : #accessing }
FamixHtmlImporter >> parentNode [

	^ parentNode
]

{ #category : #accessing }
FamixHtmlImporter >> parentNode: anObject [

	parentNode := anObject
]

{ #category : #generated }
FamixHtmlImporter >> visitAttribute: anAttribute [

	| currentEntity |
	currentEntity := parentNode addAttribute:
		                 (self model add: FamixHtmlAttribute new).
	currentEntity attributeName: anAttribute attributeName value.
	currentEntity attributeValue: anAttribute attributeValue value
]

{ #category : #generated }
FamixHtmlImporter >> visitDocument: aDocument [

	parentNode := (self model add: FamixHtmlDocument new).
	self clone visitSmaCCParseNode: aDocument.
]

{ #category : #generated }
FamixHtmlImporter >> visitElement: anElement [

	| currentEntity |
	currentEntity := parentNode addDomElement:
		                 (self model add: FamixHtmlElement new).
	currentEntity tagName: anElement tagOpenName value.
	self clone
		parentNode: currentEntity;
		visitSmaCCParseNode: anElement
]
