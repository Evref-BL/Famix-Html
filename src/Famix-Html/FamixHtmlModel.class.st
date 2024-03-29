Class {
	#name : #FamixHtmlModel,
	#superclass : #MooseModel,
	#traits : 'FamixHtmlTEntityCreator',
	#classTraits : 'FamixHtmlTEntityCreator classTrait',
	#category : #'Famix-Html-Model'
}

{ #category : #accessing }
FamixHtmlModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : #meta }
FamixHtmlModel class >> annotation [
	<FMClass: #FamixHtmlModel super: #MooseModel>
	<package: #'Famix-Html'>
	<generated>
]
