"
A dom that has children
"
Trait {
	#name : #FamixHtmlTWithDomElements,
	#instVars : [
		'#domElements => FMMany type: #FamixHtmlDomElement opposite: #withDomElements'
	],
	#traits : 'TEntityMetaLevelDependency',
	#classTraits : 'TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Html-Traits'
}

{ #category : #meta }
FamixHtmlTWithDomElements classSide >> annotation [

	<FMClass: #TWithDomElements super: #Object>
	<package: #'Famix-Html'>
	<generated>
	^ self
]

{ #category : #adding }
FamixHtmlTWithDomElements >> addDomElement: anObject [
	<generated>
	^ self domElements add: anObject
]

{ #category : #accessing }
FamixHtmlTWithDomElements >> domElements [
	"Relation named: #domElements type: #FamixHtmlDomElement opposite: #withDomElements"

	<generated>
	<derived>
	^ domElements
]

{ #category : #accessing }
FamixHtmlTWithDomElements >> domElements: anObject [

	<generated>
	domElements value: anObject
]

{ #category : #navigation }
FamixHtmlTWithDomElements >> domElementsGroup [
	<generated>
	<navigation: 'DomElements'>
	^ MooseSpecializedGroup withAll: self domElements asSet
]
