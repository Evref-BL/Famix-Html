Trait {
	#name : #FamixHtmlTHasIndexedReferenceToImmediateSource,
	#instVars : [
		'#endPos => FMProperty',
		'#startPos => FMProperty'
	],
	#category : #'Famix-Html-Traits'
}

{ #category : #meta }
FamixHtmlTHasIndexedReferenceToImmediateSource classSide >> annotation [

	<FMClass: #THasIndexedReferenceToImmediateSource super: #Object>
	<package: #'Famix-Html'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixHtmlTHasIndexedReferenceToImmediateSource >> endPos [

	<FMProperty: #endPos type: #Number>
	<generated>
	^ endPos
]

{ #category : #accessing }
FamixHtmlTHasIndexedReferenceToImmediateSource >> endPos: anObject [
	<generated>
	endPos := anObject
]

{ #category : #accessing }
FamixHtmlTHasIndexedReferenceToImmediateSource >> immediateSource [
	"Relation named: #immediateSource type: #FamixTHasImmediateSource opposite: #referenceToImmediateSource"

	<generated>
	<FMProperty: #immediateSource type: #FamixTHasImmediateSource opposite: #referenceToImmediateSource>
	^ self attributeAt: #immediateSource ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixHtmlTHasIndexedReferenceToImmediateSource >> immediateSource: anObject [

	<generated>
	self attributeAt: #immediateSource put: (FMMultivalueLink on: self update: #referenceToImmediateSource from: self immediateSource to: anObject).
]

{ #category : #accessing }
FamixHtmlTHasIndexedReferenceToImmediateSource >> startPos [

	<FMProperty: #startPos type: #Number>
	<generated>
	^ startPos
]

{ #category : #accessing }
FamixHtmlTHasIndexedReferenceToImmediateSource >> startPos: anObject [
	<generated>
	startPos := anObject
]
