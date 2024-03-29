"
This is an importer for an HTML document.

Unlike an XML parser, we try to parse also document that can be used in frameworks such as React, Angular, _and so on_.

## Specification

We deal with [void elements](https://developer.mozilla.org/en-US/docs/Glossary/Void_element)


## Example

```st
importer := FamixHtmlImporter new.
importer model: FamixHtmlModel new.

importer importString: '<h1>
	<button class=""Hello"">
		hello
	</button>
</h1>'.
importer model
```
"
Class {
	#name : #FamixHtmlImporter,
	#superclass : #Object,
	#traits : 'THTMLProgramNodeVisitor',
	#classTraits : 'THTMLProgramNodeVisitor classTrait',
	#instVars : [
		'model',
		'parentNode',
		'currentDocument'
	],
	#category : #'Famix-Html-Importer'
}

{ #category : #generated }
FamixHtmlImporter >> create: aType for: aNode [

	^ self model add: (aType new
			   startPos: aNode startPosition;
			   endPos: aNode stopPosition;
			   immediateSource: currentDocument;
			   yourself)
]

{ #category : #'as yet unclassified' }
FamixHtmlImporter >> importFromFileReference: aFileReference [
	^ (self importString: aFileReference asFileReference contents)
		  fileNameReference: aFileReference pathString;
		  yourself
]

{ #category : #'as yet unclassified' }
FamixHtmlImporter >> importString: aHTMLString [

	^ self accept: (HTMLParser parse: aHTMLString)
]

{ #category : #accessing }
FamixHtmlImporter >> model [

	^ model
]

{ #category : #accessing }
FamixHtmlImporter >> model: anObject [

	model := anObject
]

{ #category : #accessing }
FamixHtmlImporter >> parentNode [

	^ parentNode
]

{ #category : #accessing }
FamixHtmlImporter >> parentNode: anObject [

	parentNode := anObject
]

{ #category : #generated }
FamixHtmlImporter >> visitAttribute: anAttribute [

	| currentEntity |

	currentEntity := parentNode addAttribute:
		                 (self create: FamixHtmlAttribute for: anAttribute).
	currentEntity attributeName: anAttribute attributeName value.
	currentEntity attributeValue: anAttribute attributeValue value
]

{ #category : #generated }
FamixHtmlImporter >> visitDocument: aDocument [

	parentNode := self model add: FamixHtmlDocument new.
	currentDocument := parentNode.
	parentNode source: aDocument source.
	self clone visitSmaCCParseNode: aDocument.
	^ currentDocument
]

{ #category : #generated }
FamixHtmlImporter >> visitElement: anElement [

	| currentEntity |
	currentEntity := parentNode addDomElement:
		                 (self create: FamixHtmlElement for: anElement).
	currentEntity tagName: anElement tagOpenName value.
	self clone
		parentNode: currentEntity;
		visitSmaCCParseNode: anElement
]
