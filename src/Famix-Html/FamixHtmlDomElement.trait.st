"
A dom object that can be added inside an element accepting dom concept
"
Trait {
	#name : #FamixHtmlDomElement,
	#instVars : [
		'#withDomElements => FMOne type: #FamixHtmlTWithDomElements opposite: #domElements'
	],
	#category : #'Famix-Html-Traits'
}

{ #category : #meta }
FamixHtmlDomElement classSide >> annotation [

	<FMClass: #DomElement super: #Object>
	<package: #'Famix-Html'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixHtmlDomElement >> withDomElements [
	"Relation named: #withDomElements type: #FamixHtmlTWithDomElements opposite: #domElements"

	<generated>
	<container>
	^ withDomElements
]

{ #category : #accessing }
FamixHtmlDomElement >> withDomElements: anObject [

	<generated>
	withDomElements := anObject
]

{ #category : #navigation }
FamixHtmlDomElement >> withDomElementsGroup [
	<generated>
	<navigation: 'WithDomElements'>
	^ MooseSpecializedGroup with: self withDomElements
]
