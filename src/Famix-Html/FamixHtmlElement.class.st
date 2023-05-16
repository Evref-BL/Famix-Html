"
I represent an element of an HTML document
"
Class {
	#name : #FamixHtmlElement,
	#superclass : #FamixHtmlEntity,
	#traits : 'FamixHtmlDomElement + FamixHtmlTWithAttribute + FamixHtmlTWithDomElements',
	#classTraits : 'FamixHtmlDomElement classTrait + FamixHtmlTWithAttribute classTrait + FamixHtmlTWithDomElements classTrait',
	#instVars : [
		'#attributes => FMMany type: #FamixHtmlAttribute opposite: #element',
		'#tagName => FMProperty'
	],
	#category : #'Famix-Html-Entities'
}

{ #category : #meta }
FamixHtmlElement class >> annotation [

	<FMClass: #Element super: #FamixHtmlEntity>
	<package: #'Famix-Html'>
	<generated>
	^ self
]

{ #category : #adding }
FamixHtmlElement >> addAttribute: anObject [
	<generated>
	^ self attributes add: anObject
]

{ #category : #accessing }
FamixHtmlElement >> attributes [
	"Relation named: #attributes type: #FamixHtmlAttribute opposite: #element"

	<generated>
	<derived>
	^ attributes
]

{ #category : #accessing }
FamixHtmlElement >> attributes: anObject [

	<generated>
	attributes value: anObject
]

{ #category : #navigation }
FamixHtmlElement >> attributesGroup [
	<generated>
	<navigation: 'Attributes'>
	^ MooseSpecializedGroup withAll: self attributes asSet
]

{ #category : #accessing }
FamixHtmlElement >> tagName [

	<FMProperty: #tagName type: #String>
	<generated>
	^ tagName
]

{ #category : #accessing }
FamixHtmlElement >> tagName: anObject [
	<generated>
	tagName := anObject
]
