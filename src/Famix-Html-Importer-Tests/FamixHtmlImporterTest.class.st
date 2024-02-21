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

{ #category : #'parse - attributes' }
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
FamixHtmlImporterTest >> testCanImportOnlyAScript [

	importer importString: '<script src="tslib.es6.js"></script>'.
	self flag: 'Not sure how to deal with it'.
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

{ #category : #'parse - attributes' }
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

{ #category : #'parse - attributes' }
FamixHtmlImporterTest >> testCanParseAttributeEndAtLastTagCharacter [

	importer importString: ' <div read=true></div>'.
	self assert: (htmlModel allWithType: FamixHtmlElement) size equals: 1.
	self
		assert:
			(htmlModel allWithType: FamixHtmlAttribute) anyOne entityAttributes
				size
		equals: 1.
	self
		assert:
		(htmlModel allWithType: FamixHtmlAttribute) anyOne attributeName
		equals: 'read'.
	self
		assert:
		(htmlModel allWithType: FamixHtmlAttribute) anyOne attributeValue
		equals: 'true'
]

{ #category : #'parse - attributes' }
FamixHtmlImporterTest >> testCanParseAttributePrefixedWithStar [

	importer importString: '<div *ngIf="hello"></div>'.
	self assert: (htmlModel allWithType: FamixHtmlElement) size equals: 1.
	self
		assert: (htmlModel allWithType: FamixHtmlAttribute) size
		equals: 1.
	self
		assert:
		(htmlModel allWithType: FamixHtmlAttribute) anyOne attributeName
		equals: '*ngIf'
]

{ #category : #'parse - attributes' }
FamixHtmlImporterTest >> testCanParseAttributeWithComa [

	importer importString: '<div att="''hello1''"></div>'.
	self assert: (htmlModel allWithType: FamixHtmlElement) size equals: 1
]

{ #category : #'parse - attributes' }
FamixHtmlImporterTest >> testCanParseAttributesWithSeveralSpaces [

	importer importString:
		'<div class  =   "hello"  secondAttribute lastAttribute = "''tired''"></div>'.
	self
		assert: (htmlModel allWithType: FamixHtmlAttribute) size
		equals: 3.
	self
		assert:
			((htmlModel allWithType: FamixHtmlAttribute) detect: [ :att |
				 att attributeName = 'class' ]) attributeValue
		equals: '"hello"'.

	self
		assert:
			((htmlModel allWithType: FamixHtmlAttribute) detect: [ :att |
				 att attributeName = 'secondAttribute' ]) attributeValue
		equals: nil.

	self
		assert:
			((htmlModel allWithType: FamixHtmlAttribute) detect: [ :att |
				 att attributeName = 'lastAttribute' ]) attributeValue
		equals: '"''tired''"'
]

{ #category : #initialization }
FamixHtmlImporterTest >> testCanParseCommentFirstThenDiv [

	importer importString: '<!-- hello --> <div></div>'.
	self assert: (htmlModel allWithType: FamixHtmlElement) size equals: 1
]

{ #category : #'parse - attributes' }
FamixHtmlImporterTest >> testCanParseConsecutiveAttributes [

	importer importString:
		' <a [element]="false" testLabelValue="Lien_31" id="lien31" (clickEvent)="someCode"[link]="''#''"></a>'.
	self assert: (htmlModel allWithType: FamixHtmlElement) size equals: 1.
	self
		assert:
		(htmlModel allWithType: FamixHtmlElement) anyOne attributes size
		equals: 5
]

{ #category : #initialization }
FamixHtmlImporterTest >> testCanParseDivFirstThenComment [

	importer importString: '<div></div><!-- hello --> '.
	self assert: (htmlModel allWithType: FamixHtmlElement) size equals: 1
]

{ #category : #initialization }
FamixHtmlImporterTest >> testCanParseDivFirstThenSimpleText [

	importer importString: '<div></div>Hello World'.
	self assert: (htmlModel allWithType: FamixHtmlElement) size equals: 1
]

{ #category : #initialization }
FamixHtmlImporterTest >> testCanParseLongEndComment [

	importer importString: '<div att="hello1"></div>
	<!-- First comment ----->
	<div att="hello2"></div>'.
	self assert: (htmlModel allWithType: FamixHtmlElement) size equals: 2
]

{ #category : #initialization }
FamixHtmlImporterTest >> testCanParseNested [

	importer importString:
'<div-a>
    <div-b>
		<div-c>
       </div-c>
		<div-D>
</div-D>
	</div-b>
</div-a>'.
	self assert: (htmlModel allWithType: FamixHtmlElement) size equals: 4
]

{ #category : #initialization }
FamixHtmlImporterTest >> testCanParseOnlyComment [

	importer importString: '<!-- hello -->'.
	self assert: (htmlModel allWithType: FamixHtmlElement) size equals: 0
]

{ #category : #initialization }
FamixHtmlImporterTest >> testCanParseSimpleText [

	importer importString: 'Hello World'.
	self assert: (htmlModel allWithType: FamixHtmlElement) size equals: 0
]

{ #category : #initialization }
FamixHtmlImporterTest >> testCanParseSimpleTextFirstThenDiv [

	importer importString: 'Hello World<div></div>'.
	self assert: (htmlModel allWithType: FamixHtmlElement) size equals: 1
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
FamixHtmlImporterTest >> testCanParseWithoutEndingTag [

	importer importString: '<div>
			<area>
			<div-b>
				<input>
				<div-c></div-c>
				<b/>
			</div-b>
		</div>'.
	self assert: (htmlModel allWithType: FamixHtmlElement) size equals: 6.
	self
		assert: ((htmlModel allWithType: FamixHtmlElement) detect: [ :tag |
				 tag tagName = 'div' ]) domElements size
		equals: 2.
	self
		assert: ((htmlModel allWithType: FamixHtmlElement) detect: [ :tag |
				 tag tagName = 'div-b' ]) domElements size
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

{ #category : #initialization }
FamixHtmlImporterTest >> testParseMultilineWithDashesAndTest [

	importer importString: '<div>
    <!-- 
      ---Hello
    -->
</div>'.
	self
		assert:
		(htmlModel allWithType: FamixHtmlElement) size
		equals: 1
]

{ #category : #initialization }
FamixHtmlImporterTest >> testParseMultipleChildren [

	importer importString: '<div>
	<span></span>
	<span></span>
</div>'.
	self
		assert: ((htmlModel allWithType: FamixHtmlElement) detect: [ :el |
				 el tagName = 'div' ]) domElements size
		equals: 2
]

{ #category : #initialization }
FamixHtmlImporterTest >> testParseWithInterpolation [

	importer importString: ' <mat-card-header>
                                <mat-card-title>
                                    <icon [iconClassName]="''filter''"></icon>
                                    {{ ''interpolated'' | translate }}
                                </mat-card-title>
                            </mat-card-header>'.
	self assert: (htmlModel allWithType: FamixHtmlElement) size equals: 3
]

{ #category : #initialization }
FamixHtmlImporterTest >> testParseWithInterpolationAsAttributValue [

	importer importString:
		'<div data-toggle="tooltip" data-placement="top" title=${modelresume.tooltipCompetence} class="stackpanel horizontal"></div>'.

	self
		assert:
			((htmlModel allWithType: FamixHtmlAttribute) detect: [ :att |
				 att attributeName = 'title' ]) attributeValue
		equals: '${modelresume.tooltipCompetence}'
]

{ #category : #'parse - attributes' }
FamixHtmlImporterTest >> testShortTagWithShortAttribute [

	importer importString: '<div test/>'.
	self assert: (htmlModel allWithType: FamixHtmlElement) size equals: 1.
	self
		assert: (htmlModel allWithType: FamixHtmlAttribute) size
		equals: 1
]

{ #category : #'parse - attributes' }
FamixHtmlImporterTest >> testShortTagWithShortHashAttribute [

	importer importString: '<div #test/>'.
	self assert: (htmlModel allWithType: FamixHtmlElement) size equals: 1.
	self
		assert: (htmlModel allWithType: FamixHtmlAttribute) size
		equals: 1
]
