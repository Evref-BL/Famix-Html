Class {
	#name : #FamixHtmlGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'document',
		'element',
		'attribute',
		'text',
		'script',
		'tWithAttribute',
		'tWithDomElements',
		'tag',
		'tDomElement',
		'tHasIndexedReferenceToImmediateSource',
		'famixTHasImmediateSource'
	],
	#category : #'Famix-Html-Generator'
}

{ #category : #accessing }
FamixHtmlGenerator class >> packageName [

	^ #'Famix-Html'
]

{ #category : #accessing }
FamixHtmlGenerator class >> prefix [

	^ #'FamixHtml'
]

{ #category : #accessing }
FamixHtmlGenerator class >> submetamodels [ 
	^ { FamixGenerator }
]

{ #category : #definition }
FamixHtmlGenerator >> defineClasses [

	super defineClasses.
	document := builder
		            newClassNamed: #Document
		            comment: 'I represent an HTML document'.
	document withTesting.
	element := builder
		           newClassNamed: #Element
		           comment: 'I represent an element of an HTML document'.
	attribute := builder
		             newClassNamed: #Attribute
		             comment: 'I represent an attribute of an HTML element'.
	text := builder
		        newClassNamed: #Text
		        comment: 'I represent some text inside an element'.
	script := builder
		          newClassNamed: #Script
		          comment: 'I represent some script inside an element'.
		
	famixTHasImmediateSource := self remoteTrait: #THasImmediateSource withPrefix: #Famix 
]

{ #category : #definition }
FamixHtmlGenerator >> defineHierarchy [

	super defineHierarchy.
	document --|> tWithDomElements.
	document --|> famixTHasImmediateSource.
	element --|> tWithDomElements.
	element --|> tDomElement.
	element --|> tWithAttribute.
	element --|> tHasIndexedReferenceToImmediateSource.
	attribute --|> tHasIndexedReferenceToImmediateSource.
	tWithDomElements --|> #TEntityMetaLevelDependency.
	tWithAttribute --|> #TEntityMetaLevelDependency.
]

{ #category : #definition }
FamixHtmlGenerator >> defineProperties [

	super defineProperties.
	attribute property: #attributeName type: #String.
	attribute property: #attributeValue type: #String.
	element property: #tagName type: #String.
	tHasIndexedReferenceToImmediateSource
		property: #startPos
		type: #Number.
	tHasIndexedReferenceToImmediateSource property: #endPos type: #Number.
	document property: #fileNameReference type: #String
]

{ #category : #definition }
FamixHtmlGenerator >> defineRelations [

	super defineRelations.
	tWithDomElements <>-* tDomElement.
	element <>-* attribute.
	(tHasIndexedReferenceToImmediateSource property: #immediateSource)
	*- (famixTHasImmediateSource property: #referenceToImmediateSource)
]

{ #category : #definition }
FamixHtmlGenerator >> defineTraits [

	super defineTraits.
	tWithAttribute := builder
		                  newTraitNamed: #TWithAttribute
		                  comment: 'A dom element with attribute'.
	tWithDomElements := builder
		                    newTraitNamed: #TWithDomElements
		                    comment: 'A dom that has children'.
	tDomElement := builder
		                newTraitNamed: #DomElement
		                comment:
		                'A dom object that can be added inside an element accepting dom concept'.
	tHasIndexedReferenceToImmediateSource := builder
		                newTraitNamed: #THasIndexedReferenceToImmediateSource
]
