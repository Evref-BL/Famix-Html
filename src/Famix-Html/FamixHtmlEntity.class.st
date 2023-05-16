Class {
	#name : #FamixHtmlEntity,
	#superclass : #MooseEntity,
	#category : #'Famix-Html-Entities'
}

{ #category : #meta }
FamixHtmlEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Html'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixHtmlEntity class >> isAbstract [

	<generated>
	^ self == FamixHtmlEntity
]

{ #category : #meta }
FamixHtmlEntity class >> metamodel [

	<generated>
	^ FamixHtmlModel metamodel
]

{ #category : #testing }
FamixHtmlEntity >> isDocument [

	<generated>
	^ false
]
