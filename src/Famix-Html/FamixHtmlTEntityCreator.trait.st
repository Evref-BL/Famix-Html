"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.
"
Trait {
	#name : #FamixHtmlTEntityCreator,
	#category : #'Famix-Html-Model'
}

{ #category : #meta }
FamixHtmlTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Html'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixHtmlTEntityCreator >> newAttribute [

	<generated>
	^ self add: FamixHtmlAttribute new
]

{ #category : #'entity creation' }
FamixHtmlTEntityCreator >> newDocument [

	<generated>
	^ self add: FamixHtmlDocument new
]

{ #category : #'entity creation' }
FamixHtmlTEntityCreator >> newElement [

	<generated>
	^ self add: FamixHtmlElement new
]

{ #category : #'entity creation' }
FamixHtmlTEntityCreator >> newScript [

	<generated>
	^ self add: FamixHtmlScript new
]

{ #category : #'entity creation' }
FamixHtmlTEntityCreator >> newText [

	<generated>
	^ self add: FamixHtmlText new
]
