Extension { #name : #FamixTHasImmediateSource }

{ #category : #'*Famix-Html-accessing' }
FamixTHasImmediateSource >> hasIndexedReferenceToImmediateSource [
	"Relation named: #hasIndexedReferenceToImmediateSource type: #FamixHtmlTHasIndexedReferenceToImmediateSource opposite: #immediateSource"

	<generated>
	<derived>
	<FMProperty: #hasIndexedReferenceToImmediateSource type: #FamixHtmlTHasIndexedReferenceToImmediateSource opposite: #immediateSource>
	<package: #'Famix-Html'>
	^ self attributeAt: #hasIndexedReferenceToImmediateSource ifAbsentPut: [ FMMultivalueLink on: self opposite: #immediateSource: ]
]

{ #category : #'*Famix-Html-accessing' }
FamixTHasImmediateSource >> hasIndexedReferenceToImmediateSource: anObject [

	<generated>
	self hasIndexedReferenceToImmediateSource value: anObject
]

{ #category : #'*Famix-Html-accessing' }
FamixTHasImmediateSource >> hasIndexedReferenceToImmediateSources [
	"Relation named: #hasIndexedReferenceToImmediateSources type: #FamixHtmlTHasIndexedReferenceToImmediateSource opposite: #hasImmediateSource"

	<generated>
	<derived>
	<FMProperty: #hasIndexedReferenceToImmediateSources type: #FamixHtmlTHasIndexedReferenceToImmediateSource opposite: #hasImmediateSource>
	<package: #'Famix-Html'>
	^ self attributeAt: #hasIndexedReferenceToImmediateSources ifAbsentPut: [ FMMultivalueLink on: self opposite: #hasImmediateSource: ]
]

{ #category : #'*Famix-Html-accessing' }
FamixTHasImmediateSource >> hasIndexedReferenceToImmediateSources: anObject [

	<generated>
	self hasIndexedReferenceToImmediateSources value: anObject
]

{ #category : #'*Famix-Html-accessing' }
FamixTHasImmediateSource >> referenceToImmediateSource [
	"Relation named: #referenceToImmediateSource type: #FamixHtmlTHasIndexedReferenceToImmediateSource opposite: #immediateSource"

	<generated>
	<derived>
	<FMProperty: #referenceToImmediateSource type: #FamixHtmlTHasIndexedReferenceToImmediateSource opposite: #immediateSource>
	<package: #'Famix-Html'>
	^ self attributeAt: #referenceToImmediateSource ifAbsentPut: [ FMMultivalueLink on: self opposite: #immediateSource: ]
]

{ #category : #'*Famix-Html-accessing' }
FamixTHasImmediateSource >> referenceToImmediateSource: anObject [

	<generated>
	self referenceToImmediateSource value: anObject
]
