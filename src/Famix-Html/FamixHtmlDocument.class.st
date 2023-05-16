"
I represent an HTML document
"
Class {
	#name : #FamixHtmlDocument,
	#superclass : #FamixHtmlEntity,
	#traits : 'FamixHtmlTWithDomElements',
	#classTraits : 'FamixHtmlTWithDomElements classTrait',
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
