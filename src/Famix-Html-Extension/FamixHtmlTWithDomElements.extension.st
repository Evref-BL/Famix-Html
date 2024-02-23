Extension { #name : #FamixHtmlTWithDomElements }

{ #category : #'*Famix-Html-Extension' }
FamixHtmlTWithDomElements >> miHTMLExtension [

	<inspectorPresentationOrder: 150 title: 'HTML'>
	^ SpTreeTablePresenter new
		  addColumn: (SpCompositeTableColumn new
				   "addColumn: ((SpImageTableColumn evaluated: #midasIcon)
						    width: 20;
						    yourself);"
				   addColumn: (SpStringTableColumn evaluated: [ :node |
						    String streamContents: [ :stream |
							    node isDocument
								    ifTrue: [ stream << '<<DOCUMENT ROOT>>' ]
								    ifFalse: [
									    stream
										    << '<';
										    << node tagName.
									    node attributes ifNotEmpty: [ stream << ' ' ].
									    node attributes
										    do: [ :attribute |
											    stream << attribute attributeName.
											    attribute attributeValue ifNotNil: [ :attVal |
												    stream
													    << '=';
													    << attVal ] ]
										    separatedBy: [ stream << ' ' ].
									    stream << '>' ] ] ]);
				   yourself);
		  children: [ :aClass |
			  aClass domElements asOrderedCollection sorted: [ :a :b |
				  (a startPos ifNil: 0) <= (b startPos ifNil: 0) ] ];
		  beMultipleSelection;
		  roots: { self };
		  beResizable
]
