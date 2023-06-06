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
FamixHtmlImporterTest >> testCanImportComplexAttributeValue [

	importer importString: '<div att="hello<--world"></div>'.
	self assert: htmlModel size equals: 3.
	self
		assert:
		(htmlModel allUsing: FamixHtmlDomElement) anyOne attributes size
		equals: 1.
	self
		assert:
			(htmlModel allUsing: FamixHtmlDomElement) anyOne attributes anyOne
				attributeName
		equals: 'att'.
	self
		assert:
			(htmlModel allUsing: FamixHtmlDomElement) anyOne attributes anyOne
				attributeValue
		equals: '"hello<--world"'
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

{ #category : #initialization }
FamixHtmlImporterTest >> testCanImportTagWithEndOfLine [

	importer importString: '<div
	att="hello"
	></div>'.
	self assert: htmlModel size equals: 3.
	self
		assert:
		(htmlModel allUsing: FamixHtmlDomElement) anyOne attributes size
		equals: 1.
	self
		assert:
			(htmlModel allUsing: FamixHtmlDomElement) anyOne attributes anyOne
				attributeName
		equals: 'att'.
	self
		assert:
			(htmlModel allUsing: FamixHtmlDomElement) anyOne attributes anyOne
				attributeValue
		equals: '"hello"'
]

{ #category : #initialization }
FamixHtmlImporterTest >> testCanParseLongEndComment [

	importer importString: '<div att="hello1"></div>
	<!-- First comment ----->
	<div att="hello2"></div>'.
	self assert: (htmlModel allWithType: FamixHtmlElement) size equals: 2
]

{ #category : #initialization }
FamixHtmlImporterTest >> testCanParseTwoComments [

	importer importString: '<div att="hello1"></div>
	<!-- First comment -->
	<div att="hello2"></div>
	<!-- Second comment -->
	<div att="hello3"></div>'.
	self
		assert:
		(htmlModel allWithType: FamixHtmlElement) size
		equals: 3
]

{ #category : #initialization }
FamixHtmlImporterTest >> testParseMultilineWithArrow [

	importer importString: '<div>
    <!-- 
      >
    -->
</div>'.
	self
		assert:
		(htmlModel allWithType: FamixHtmlElement) size
		equals: 1
]

{ #category : #initialization }
FamixHtmlImporterTest >> testParseMultilineWithDash [

	importer importString: '<div>
    <!-- 
      -
    -->
</div>'.
	self
		assert:
		(htmlModel allWithType: FamixHtmlElement) size
		equals: 1
]

{ #category : #initialization }
FamixHtmlImporterTest >> testParseMultilineWithDashes [

	importer importString: '<div>
    <!-- 
      ---
    -->
</div>'.
	self
		assert:
		(htmlModel allWithType: FamixHtmlElement) size
		equals: 1
]
