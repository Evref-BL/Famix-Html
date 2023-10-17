Class {
	#name : #HTMLScanner,
	#superclass : #SmaCCScanner,
	#category : #'SmaCC_HTML'
}

{ #category : #'generated-initialization' }
HTMLScanner class >> initializeKeywordMap [

	keywordMap := Dictionary new.
	#( #( 14 'area' #( 15 #( #tag ) ) ) #( 14 'base' #( 15 #( #tag ) ) )
	   #( 14 'br' #( 15 #( #tag ) ) ) #( 14 'col' #( 15 #( #tag ) ) )
	   #( 14 'embed' #( 15 #( #tag ) ) )
	   #( 14 'hr' #( 15 #( #tag ) ) ) #( 14 'img' #( 15 #( #tag ) ) )
	   #( 14 'input' #( 15 #( #tag ) ) )
	   #( 14 'link' #( 15 #( #tag ) ) ) #( 14 'meta' #( 15 #( #tag ) ) )
	   #( 14 'param' #( 15 #( #tag ) ) )
	   #( 14 'source' #( 15 #( #tag ) ) )
	   #( 14 'track' #( 15 #( #tag ) ) )
	   #( 14 'wbr' #( 15 #( #tag ) ) ) ) do: [ :each |
		(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
			at: (each at: 2)
			put: each last ].
	^ keywordMap
]

{ #category : #generated }
HTMLScanner >> emptySymbolTokenId [

	^ 45
]

{ #category : #generated }
HTMLScanner >> errorTokenId [

	^ 46
]

{ #category : #generated }
HTMLScanner >> scan1 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan1X1 ].
	((currentCharacter between: Character tab and: Character lf) or: [
		 currentCharacter == Character cr or: [
			 currentCharacter == Character space ] ]) ifTrue: [
		[
		self recordMatch: #( 6 10 ).
		self step.
		(currentCharacter between: Character tab and: Character lf) or: [
			currentCharacter == Character cr or: [
				currentCharacter == Character space ] ] ] whileTrue.
		(currentCharacter <= $; or: [ currentCharacter >= $= ]) ifTrue: [
			[
			self recordMatch: #( 10 ).
			self step.
			currentCharacter ~~ $< ] whileTrue ].
		^ self reportLastMatch ].
	true ifTrue: [
		[
		self recordMatch: #( 10 ).
		self step.
		currentCharacter ~~ $< ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
HTMLScanner >> scan10 [

	[
	self step.
	currentCharacter == $> ifTrue: [
		self recordMatch: #( 5 ).
		self step.
		currentCharacter == $? ifTrue: [ ^ self scan10 ].
		^ self scan9 ].
	currentCharacter == $? ] whileTrue.
	^ self scan9
]

{ #category : #generated }
HTMLScanner >> scan11 [

	[
	self step.
	currentCharacter == $> ifTrue: [ ^ self scan12 ].
	currentCharacter == $? ifTrue: [ ^ self scan13 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan12 [

	[
	self recordMatch: #( 3 ).
	self step.
	currentCharacter == $> ] whileTrue.
	currentCharacter == $? ifTrue: [ ^ self scan13 ].
	^ self scan11
]

{ #category : #generated }
HTMLScanner >> scan13 [

	[
	self step.
	currentCharacter == $> ifTrue: [
		self recordMatch: #( 3 5 ).
		self step.
		currentCharacter == $> ifTrue: [ ^ self scan12 ].
		currentCharacter == $? ifTrue: [ ^ self scan13 ].
		^ self scan11 ].
	currentCharacter == $? ] whileTrue.
	^ self scan11
]

{ #category : #generated }
HTMLScanner >> scan14 [

	[
	self step.
	currentCharacter == $> ifTrue: [
		[
		self recordMatch: #( 8 ).
		self step.
		currentCharacter == $> ] whileTrue.
		^ self scan14 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan15 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan16 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan16 [

	[
	self step.
	currentCharacter == $/ ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan16 ].
		currentCharacter == $> ifTrue: [
			self recordMatch: #( 17 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan16 ].
			^ self scan15 ].
		currentCharacter == $s ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan16 ].
			currentCharacter == $c ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan16 ].
				currentCharacter == $r ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan16 ].
					currentCharacter == $i ifTrue: [
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan16 ].
						currentCharacter == $p ifTrue: [
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan16 ].
							currentCharacter == $t ifTrue: [
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan16 ].
								currentCharacter == $> ifTrue: [
									self recordMatch: #( 16 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan16 ] ] ] ] ] ] ] ].
		^ self scan15 ].
	currentCharacter == $< ] whileTrue.
	^ self scan15
]

{ #category : #generated }
HTMLScanner >> scan17 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan18 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan18 [

	[
	self step.
	currentCharacter == $/ ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan18 ].
		currentCharacter == $> ifTrue: [
			self recordMatch: #( 19 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan18 ].
			^ self scan17 ].
		currentCharacter == $s ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan18 ].
			currentCharacter == $t ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan18 ].
				currentCharacter == $y ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan18 ].
					currentCharacter == $l ifTrue: [
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan18 ].
						currentCharacter == $e ifTrue: [
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan18 ].
							currentCharacter == $> ifTrue: [
								self recordMatch: #( 18 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan18 ] ] ] ] ] ] ].
		^ self scan17 ].
	currentCharacter == $< ] whileTrue.
	^ self scan17
]

{ #category : #generated }
HTMLScanner >> scan19 [

	self step.
	(currentCharacter == $: or: [
		 (currentCharacter between: $A and: $Z) or: [
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan20 ].
	^ self reportLastMatch
]

{ #category : #generated }
HTMLScanner >> scan1X1 [

	self recordMatch: #( 9 ).
	self step.
	currentCharacter == $! ifTrue: [
		self step.
		currentCharacter == $- ifTrue: [
			self step.
			currentCharacter == $- ifTrue: [ ^ self scan3 ].
			^ self reportLastMatch ].
		currentCharacter == $[ ifTrue: [ ^ self scan4 ].
		^ self scan2 ].
	currentCharacter == $% ifTrue: [ ^ self scan7 ].
	currentCharacter == $? ifTrue: [
		self step.
		currentCharacter == $? ifTrue: [ ^ self scan10 ].
		currentCharacter == $x ifTrue: [
			self step.
			currentCharacter == $? ifTrue: [ ^ self scan10 ].
			currentCharacter == $m ifTrue: [
				self step.
				currentCharacter == $? ifTrue: [ ^ self scan10 ].
				currentCharacter == $l ifTrue: [ ^ self scan11 ] ] ].
		^ self scan9 ].
	currentCharacter == $s ifTrue: [
		self step.
		currentCharacter == $c ifTrue: [ ^ self scan1X1X1 ].
		currentCharacter == $t ifTrue: [
			(self scanForString: 'yle') ifTrue: [ ^ self scan14 ] ] ].
	^ self reportLastMatch
]

{ #category : #generated }
HTMLScanner >> scan1X1X1 [

	(self scanForString: 'ript') ifTrue: [
		[
		self step.
		currentCharacter == $> ifTrue: [
			^ self recordAndReportMatch: #( 7 ) ].
		true ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
HTMLScanner >> scan2 [

	[
	self step.
	currentCharacter == $> ifTrue: [
		[
		self recordMatch: #( 4 ).
		self step.
		currentCharacter == $> ] whileTrue.
		^ self scan2 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan20 [

	[
	self recordMatch: #( 14 ).
	self step.
	currentCharacter == $) ifTrue: [
		self recordMatch: #( 14 ).
		self step.
		currentCharacter == $] ifTrue: [
			^ self recordAndReportMatch: #( 14 ) ].
		^ self reportLastMatch ].
	currentCharacter == $] ifTrue: [
		^ self recordAndReportMatch: #( 14 ) ].
	(currentCharacter between: $- and: $.) or: [
		(currentCharacter between: $0 and: $:) or: [
			(currentCharacter between: $A and: $Z) or: [
				currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
HTMLScanner >> scan21 [

	self step.
	currentCharacter == $# ifTrue: [ ^ self scan19 ].
	(currentCharacter == $: or: [
		 (currentCharacter between: $A and: $Z) or: [
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan20 ].
	^ self reportLastMatch
]

{ #category : #generated }
HTMLScanner >> scan3 [

	[
	self step.
	currentCharacter == $- ifTrue: [
		self step.
		currentCharacter == $- ifTrue: [
			[
			self step.
			currentCharacter == $- ] whileTrue.
			currentCharacter == $> ifTrue: [
				^ self recordAndReportMatch: #( 1 ) ] ].
		^ self scan3 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan4 [

	[
	self step.
	currentCharacter == $> ifTrue: [ ^ self scan5 ].
	currentCharacter == $] ifTrue: [ ^ self scan6 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan5 [

	[
	self recordMatch: #( 4 ).
	self step.
	currentCharacter == $> ] whileTrue.
	currentCharacter == $] ifTrue: [ ^ self scan6 ].
	^ self scan4
]

{ #category : #generated }
HTMLScanner >> scan6 [

	[
	self step.
	currentCharacter == $> ifTrue: [
		self recordMatch: #( 2 4 ).
		self step.
		currentCharacter == $> ifTrue: [ ^ self scan5 ].
		currentCharacter == $] ifTrue: [ ^ self scan6 ].
		^ self scan4 ].
	currentCharacter == $] ] whileTrue.
	^ self scan4
]

{ #category : #generated }
HTMLScanner >> scan7 [

	[
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan8 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan8 [

	[
	self step.
	currentCharacter == $% ] whileTrue.
	currentCharacter == $> ifTrue: [
		self recordMatch: #( 5 ).
		self step.
		currentCharacter == $% ifTrue: [ ^ self scan8 ] ].
	^ self scan7
]

{ #category : #generated }
HTMLScanner >> scan9 [

	[
	self step.
	currentCharacter == $? ifTrue: [ ^ self scan10 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scanForToken [

	scope == #style ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan18 ].
		((currentCharacter between: Character tab and: Character lf) or: [
			 currentCharacter == Character cr or: [
				 currentCharacter == Character space ] ]) ifTrue: [
			[
			self recordMatch: #( 6 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan18 ].
			(currentCharacter between: Character tab and: Character lf) or: [
				currentCharacter == Character cr or: [
					currentCharacter == Character space ] ] ] whileTrue ].
		^ self scan17 ].
	scope == #script ifTrue: [ ^ self scan15 ].
	scope == #tag ifTrue: [ ^ self scanForTokenX1 ].
	scope == #attvalue ifTrue: [ ^ self scanForTokenX2 ].
	scope == #default ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1 [

	self step.
	currentCharacter == $( ifTrue: [ ^ self scan21 ].
	^ self scanForTokenX1X3
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X1 [

	self step.
	currentCharacter == $# ifTrue: [ ^ self scan19 ].
	currentCharacter == $( ifTrue: [ ^ self scan21 ].
	(currentCharacter == $: or: [
		 (currentCharacter between: $A and: $Z) or: [
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan20 ].
	^ self reportLastMatch
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X2 [

	[
	self recordMatch: #( 6 ).
	self step.
	(currentCharacter between: Character tab and: Character lf) or: [
		currentCharacter == Character cr or: [
			currentCharacter == Character space ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X3 [

	currentCharacter == $/ ifTrue: [
		^ self recordAndReportMatch: #( 12 ) ].
	currentCharacter == $= ifTrue: [
		^ self recordAndReportMatch: #( 13 ) ].
	currentCharacter == $> ifTrue: [
		^ self recordAndReportMatch: #( 11 ) ].
	currentCharacter == $[ ifTrue: [ ^ self scanForTokenX1X1 ].
	('#*' includes: currentCharacter) ifTrue: [ ^ self scan19 ].
	((currentCharacter between: Character tab and: Character lf) or: [
		 currentCharacter == Character cr or: [
			 currentCharacter == Character space ] ]) ifTrue: [
		^ self scanForTokenX1X2 ].
	(currentCharacter == $: or: [
		 (currentCharacter between: $A and: $Z) or: [
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan20 ].
	^ self reportLastMatch
]

{ #category : #generated }
HTMLScanner >> scanForTokenX2 [

	self step.
	currentCharacter == $" ifTrue: [
		[
		self step.
		currentCharacter == $" ifTrue: [
			^ self recordAndReportMatch: #( 20 ) ].
		true ] whileTrue ].
	currentCharacter == $# ifTrue: [
		self step.
		(currentCharacter isDigit or: [
			 (currentCharacter between: $A and: $F) or: [
				 currentCharacter between: $a and: $f ] ]) ifTrue: [
			[
			self recordMatch: #( 20 ).
			self step.
			currentCharacter isDigit or: [
				(currentCharacter between: $A and: $F) or: [
					currentCharacter between: $a and: $f ] ] ] whileTrue ].
		^ self reportLastMatch ].
	currentCharacter == $' ifTrue: [
		[
		self step.
		currentCharacter == $' ifTrue: [
			^ self recordAndReportMatch: #( 20 ) ].
		true ] whileTrue ].
	currentCharacter isDigit ifTrue: [
		[
		self recordMatch: #( 20 ).
		self step.
		currentCharacter == $% ifTrue: [
			^ self recordAndReportMatch: #( 20 ) ].
		currentCharacter isDigit ] whileTrue.
		((currentCharacter between: $A and: $Z) or: [
			 currentCharacter between: $a and: $z ]) ifTrue: [
			[
			self recordMatch: #( 20 ).
			self step.
			(currentCharacter between: $0 and: $9) or: [
				(currentCharacter between: $A and: $Z) or: [
					currentCharacter between: $a and: $z ] ] ] whileTrue ].
		^ self reportLastMatch ].
	((currentCharacter between: $A and: $Z) or: [
		 currentCharacter between: $a and: $z ]) ifTrue: [
		[
		self recordMatch: #( 20 ).
		self step.
		(currentCharacter between: $0 and: $9) or: [
			(currentCharacter between: $A and: $Z) or: [
				currentCharacter between: $a and: $z ] ] ] whileTrue.
		^ self reportLastMatch ].
	((currentCharacter between: Character tab and: Character lf) or: [
		 currentCharacter == Character cr or: [
			 currentCharacter == Character space ] ]) ifTrue: [
		[
		self recordMatch: #( 6 ).
		self step.
		(currentCharacter between: Character tab and: Character lf) or: [
			currentCharacter == Character cr or: [
				currentCharacter == Character space ] ] ] whileTrue ].
	^ self reportLastMatch
]
