Trait {
	#name : #THTMLProgramNodeVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #'SmaCC_HTML'
}

{ #category : #generated }
THTMLProgramNodeVisitor >> visitAttribute: anAttribute [

	^ self visitProgram: anAttribute
]

{ #category : #generated }
THTMLProgramNodeVisitor >> visitAttributes: anAttributes [

	^ self visitProgram: anAttributes
]

{ #category : #generated }
THTMLProgramNodeVisitor >> visitComment: aComment [

	^ self visitProgram: aComment
]

{ #category : #generated }
THTMLProgramNodeVisitor >> visitContent: aContent [

	^ self visitProgram: aContent
]

{ #category : #generated }
THTMLProgramNodeVisitor >> visitDocument: aDocument [

	^ self visitProgram: aDocument
]

{ #category : #generated }
THTMLProgramNodeVisitor >> visitElement: anElement [

	^ self visitProgram: anElement
]

{ #category : #generated }
THTMLProgramNodeVisitor >> visitProgram: aProgram [

	^ self visitSmaCCParseNode: aProgram
]
