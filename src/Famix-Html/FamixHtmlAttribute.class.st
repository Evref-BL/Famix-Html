"
I represent an attribute of an HTML element
"
Class {
	#name : #FamixHtmlAttribute,
	#superclass : #FamixHtmlEntity,
	#traits : 'FamixHtmlTHasIndexedReferenceToImmediateSource',
	#classTraits : 'FamixHtmlTHasIndexedReferenceToImmediateSource classTrait',
	#instVars : [
		'#attributeName => FMProperty',
		'#attributeValue => FMProperty',
		'#element => FMOne type: #FamixHtmlElement opposite: #attributes'
	],
	#category : #'Famix-Html-Entities'
}

{ #category : #meta }
FamixHtmlAttribute class >> annotation [

	<FMClass: #Attribute super: #FamixHtmlEntity>
	<package: #'Famix-Html'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixHtmlAttribute >> attributeName [

	<FMProperty: #attributeName type: #String>
	<generated>
	^ attributeName
]

{ #category : #accessing }
FamixHtmlAttribute >> attributeName: anObject [
	<generated>
	attributeName := anObject
]

{ #category : #accessing }
FamixHtmlAttribute >> attributeValue [

	<FMProperty: #attributeValue type: #String>
	<generated>
	^ attributeValue
]

{ #category : #accessing }
FamixHtmlAttribute >> attributeValue: anObject [
	<generated>
	attributeValue := anObject
]

{ #category : #accessing }
FamixHtmlAttribute >> element [
	"Relation named: #element type: #FamixHtmlElement opposite: #attributes"

	<generated>
	<container>
	^ element
]

{ #category : #accessing }
FamixHtmlAttribute >> element: anObject [

	<generated>
	element := anObject
]

{ #category : #navigation }
FamixHtmlAttribute >> elementGroup [
	<generated>
	<navigation: 'Element'>
	^ MooseSpecializedGroup with: self element
]
