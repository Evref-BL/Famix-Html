"
A FamixHtmlImporterTest is a test class for testing the behavior of FamixHtmlImporter
"
Class {
	#name : #FamixHtmlImporterTest,
	#superclass : #TestCase,
	#instVars : [
		'importer',
		'htmlModel'
	],
	#category : #'Famix-Html-Importer-Tests'
}

{ #category : #initialization }
FamixHtmlImporterTest >> setUp [

	super setUp.
	importer := FamixHtmlImporter new.
	htmlModel := FamixHtmlModel new.
	importer model: htmlModel
]

{ #category : #initialization }
FamixHtmlImporterTest >> testCanImportEmptyFile [

	importer importString: ''.
	self assert: htmlModel size equals: 1
]

{ #category : #initialization }
FamixHtmlImporterTest >> testCanImportSimpleDiv [

	importer importString: '<div></div>'.
	self assert: htmlModel size equals: 2.
	self
		assert: (htmlModel allUsing: FamixHtmlDomElement) anyOne tagName
		equals: 'div'
]

{ #category : #initialization }
FamixHtmlImporterTest >> testCanImportSimpleDivWithAttribute [

	importer importString: '<div att="hello"></div>'.
	self assert: htmlModel size equals: 3.
	self
		assert: (htmlModel allUsing: FamixHtmlDomElement) anyOne attributes size
		equals: 1.
	self
		assert: (htmlModel allUsing: FamixHtmlDomElement) anyOne attributes anyOne
				attributeName
		equals: 'att'.
	self
		assert: (htmlModel allUsing: FamixHtmlDomElement) anyOne attributes anyOne
				attributeValue
		equals: '"hello"'
]
