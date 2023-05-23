"
I represent an HTML document
"
Class {
	#name : #FamixHtmlDocument,
	#superclass : #FamixHtmlEntity,
	#traits : 'FamixHtmlTWithDomElements + FamixTHasImmediateSource',
	#classTraits : 'FamixHtmlTWithDomElements classTrait + FamixTHasImmediateSource classTrait',
	#category : #'Famix-Html-Entities'
}

{ #category : #meta }
FamixHtmlDocument class >> annotation [

	<FMClass: #Document super: #FamixHtmlEntity>
	<package: #'Famix-Html'>
	<generated>
	^ self
]

{ #category : #testing }
FamixHtmlDocument >> isDocument [

	<generated>
	^ true
]
