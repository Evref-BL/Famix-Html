Class {
	#name : #BaselineOfFamixHtml,
	#superclass : #BaselineOf,
	#category : #BaselineOfFamixHtml
}

{ #category : #baselines }
BaselineOfFamixHtml >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfFamixHtml >> defineDependencies: spec [

	spec baseline: 'SmaCC' with: [ 
		spec
			loads: #( 'SmaCCRuntime' );
			repository: 'github://j-brant/SmaCC/src' ]
]

{ #category : #baselines }
BaselineOfFamixHtml >> defineGroups: spec [
]

{ #category : #baselines }
BaselineOfFamixHtml >> definePackages: spec [

	spec
		package: 'Famix-Html';
		package: 'Famix-Html-Extension'
		with: [ spec requires: #( 'Famix-Html' ) ];
		package: 'Famix-Html-Generator';
		package: 'Famix-Html-Importer' with: [ spec requires: #( 'SmaCC_HTML' ) ];
		package: 'Famix-Html-Importer-Tests' with: [ spec requires: #( 'Famix-Html-Importer' ) ];
		package: 'SmaCC_HTML' with: [ spec requires: #( 'SmaCC' ) ]
]
