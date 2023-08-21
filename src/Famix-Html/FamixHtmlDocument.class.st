"
I represent an HTML document
"
Class {
	#name : #FamixHtmlDocument,
	#superclass : #FamixHtmlEntity,
	#traits : 'FamixHtmlTWithDomElements + FamixTHasImmediateSource',
	#classTraits : 'FamixHtmlTWithDomElements classTrait + FamixTHasImmediateSource classTrait',
	#instVars : [
		'#fileNameReference => FMProperty'
	],
	#category : #'Famix-Html-Entities'
}

{ #category : #meta }
FamixHtmlDocument class >> annotation [

	<FMClass: #Document super: #FamixHtmlEntity>
	<package: #'Famix-Html'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixHtmlDocument >> fileNameReference [

	<FMProperty: #fileNameReference type: #String>
	<generated>
	^ fileNameReference
]

{ #category : #accessing }
FamixHtmlDocument >> fileNameReference: anObject [
	<generated>
	fileNameReference := anObject
]

{ #category : #testing }
FamixHtmlDocument >> isDocument [

	<generated>
	^ true
]
