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

	^ 44
]

{ #category : #generated }
HTMLScanner >> errorTokenId [

	^ 45
]

{ #category : #generated }
HTMLScanner >> scan1 [

	self step.
	currentCharacter == $" ifTrue: [ ^ self scan6 ].
	currentCharacter == $# ifTrue: [ ^ self scan1X1 ].
	currentCharacter == $' ifTrue: [ ^ self scan14 ].
	currentCharacter == $< ifTrue: [ ^ self scan10 ].
	currentCharacter isDigit ifTrue: [ ^ self scan1X2 ].
	((currentCharacter between: Character tab and: Character lf) or: [
		 currentCharacter == Character cr or: [
			 currentCharacter == Character space ] ]) ifTrue: [ ^ self scan5 ].
	((currentCharacter between: $+ and: $?) or: [
		 (currentCharacter between: $A and: $Z) or: [
			 currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ ^ self scan9 ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan10 [

	[
	self recordMatch: #( 20 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan7 ].
	currentCharacter == $/ ifTrue: [ ^ self scan11 ].
	currentCharacter == $< ] whileTrue.
	(currentCharacter == $# or: [
		 (currentCharacter between: $+ and: $?) or: [
			 (currentCharacter between: $A and: $Z) or: [
				 currentCharacter == $_ or: [
					 currentCharacter between: $a and: $z ] ] ] ]) ifTrue: [
		^ self scan9 ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan11 [

	self recordMatch: #( 20 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan7 ].
	currentCharacter == $< ifTrue: [ ^ self scan10 ].
	currentCharacter == $> ifTrue: [ ^ self scan11X1 ].
	currentCharacter == $s ifTrue: [ ^ self scan12 ].
	(currentCharacter <= $" or: [
		 (currentCharacter between: $$ and: $*) or: [
			 currentCharacter == $@ or: [
				 (currentCharacter between: $[ and: $^) or: [
					 currentCharacter == $` or: [ currentCharacter >= ${ ] ] ] ] ])
		ifTrue: [ ^ self scan2 ].
	^ self scan9
]

{ #category : #generated }
HTMLScanner >> scan11X1 [

	self recordMatch: #( 17 20 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan7 ].
	currentCharacter == $< ifTrue: [ ^ self scan10 ].
	(currentCharacter == $# or: [
		 (currentCharacter between: $+ and: $?) or: [
			 (currentCharacter between: $A and: $Z) or: [
				 currentCharacter == $_ or: [
					 currentCharacter between: $a and: $z ] ] ] ]) ifTrue: [
		^ self scan9 ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan12 [

	self recordMatch: #( 20 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan7 ].
	currentCharacter == $< ifTrue: [ ^ self scan10 ].
	currentCharacter == $c ifTrue: [ ^ self scan13 ].
	(currentCharacter == $# or: [
		 (currentCharacter between: $+ and: $?) or: [
			 (currentCharacter between: $A and: $Z) or: [
				 currentCharacter == $_ or: [
					 currentCharacter between: $a and: $z ] ] ] ]) ifTrue: [
		^ self scan9 ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan13 [

	self recordMatch: #( 20 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan7 ].
	currentCharacter == $< ifTrue: [ ^ self scan10 ].
	currentCharacter == $r ifTrue: [
		self recordMatch: #( 20 ).
		self step.
		currentCharacter == Character space ifTrue: [ ^ self scan7 ].
		currentCharacter == $< ifTrue: [ ^ self scan10 ].
		currentCharacter == $i ifTrue: [
			self recordMatch: #( 20 ).
			self step.
			currentCharacter == Character space ifTrue: [ ^ self scan7 ].
			currentCharacter == $< ifTrue: [ ^ self scan10 ].
			currentCharacter == $p ifTrue: [
				self recordMatch: #( 20 ).
				self step.
				currentCharacter == Character space ifTrue: [ ^ self scan7 ].
				currentCharacter == $< ifTrue: [ ^ self scan10 ].
				currentCharacter == $t ifTrue: [
					self recordMatch: #( 20 ).
					self step.
					currentCharacter == Character space ifTrue: [ ^ self scan7 ].
					currentCharacter == $< ifTrue: [ ^ self scan10 ].
					currentCharacter == $> ifTrue: [
						self recordMatch: #( 16 20 ).
						self step.
						currentCharacter == Character space ifTrue: [ ^ self scan7 ].
						currentCharacter == $< ifTrue: [ ^ self scan10 ] ] ] ] ] ].
	(currentCharacter == $# or: [
		 (currentCharacter between: $+ and: $?) or: [
			 (currentCharacter between: $A and: $Z) or: [
				 currentCharacter == $_ or: [
					 currentCharacter between: $a and: $z ] ] ] ]) ifTrue: [
		^ self scan9 ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan14 [

	[
	self step.
	currentCharacter == $' ifTrue: [ ^ self scan7 ].
	currentCharacter == $< ifTrue: [ ^ self scan15 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan15 [

	[
	self step.
	currentCharacter == $' ifTrue: [ ^ self scan7 ].
	currentCharacter == $/ ifTrue: [
		self step.
		currentCharacter == $' ifTrue: [ ^ self scan7 ].
		currentCharacter == $< ifTrue: [ ^ self scan15 ].
		currentCharacter == $> ifTrue: [
			self recordMatch: #( 17 ).
			self step.
			currentCharacter == $' ifTrue: [ ^ self scan7 ].
			currentCharacter == $< ifTrue: [ ^ self scan15 ].
			^ self scan14 ].
		currentCharacter == $s ifTrue: [
			self step.
			currentCharacter == $' ifTrue: [ ^ self scan7 ].
			currentCharacter == $< ifTrue: [ ^ self scan15 ].
			currentCharacter == $c ifTrue: [
				self step.
				currentCharacter == $' ifTrue: [ ^ self scan7 ].
				currentCharacter == $< ifTrue: [ ^ self scan15 ].
				currentCharacter == $r ifTrue: [
					self step.
					currentCharacter == $' ifTrue: [ ^ self scan7 ].
					currentCharacter == $< ifTrue: [ ^ self scan15 ].
					currentCharacter == $i ifTrue: [
						self step.
						currentCharacter == $' ifTrue: [ ^ self scan7 ].
						currentCharacter == $< ifTrue: [ ^ self scan15 ].
						currentCharacter == $p ifTrue: [
							self step.
							currentCharacter == $' ifTrue: [ ^ self scan7 ].
							currentCharacter == $< ifTrue: [ ^ self scan15 ].
							currentCharacter == $t ifTrue: [
								self step.
								currentCharacter == $' ifTrue: [ ^ self scan7 ].
								currentCharacter == $< ifTrue: [ ^ self scan15 ].
								currentCharacter == $> ifTrue: [
									self recordMatch: #( 16 ).
									self step.
									currentCharacter == $' ifTrue: [ ^ self scan7 ].
									currentCharacter == $< ifTrue: [ ^ self scan15 ] ] ] ] ] ] ] ].
		^ self scan14 ].
	currentCharacter == $< ] whileTrue.
	^ self scan14
]

{ #category : #generated }
HTMLScanner >> scan16 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan18 ].
	((currentCharacter between: Character tab and: Character lf) or: [
		 currentCharacter == Character cr or: [
			 currentCharacter == Character space ] ]) ifTrue: [
		[
		self recordMatch: #( 6 10 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan3 ].
		(currentCharacter between: Character tab and: Character lf) or: [
			currentCharacter == Character cr or: [
				currentCharacter == Character space ] ] ] whileTrue ].
	^ self scan17
]

{ #category : #generated }
HTMLScanner >> scan17 [

	[
	self recordMatch: #( 10 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan18 [

	self recordMatch: #( 9 ).
	self step.
	currentCharacter == $! ifTrue: [ ^ self scan18X2 ].
	currentCharacter == $% ifTrue: [ ^ self scan30 ].
	currentCharacter == $/ ifTrue: [ ^ self scan4 ].
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	currentCharacter == $? ifTrue: [ ^ self scan18X1 ].
	currentCharacter == $s ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan3 ].
		currentCharacter == $c ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan3 ].
			currentCharacter == $r ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan3 ].
				currentCharacter == $i ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan3 ].
					currentCharacter == $p ifTrue: [
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan3 ].
						currentCharacter == $t ifTrue: [ ^ self scan41 ] ] ] ].
			^ self scan2 ].
		currentCharacter == $t ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan3 ].
			currentCharacter == $y ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan3 ].
				currentCharacter == $l ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan3 ].
					currentCharacter == $e ifTrue: [ ^ self scan44 ] ] ] ] ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan18X1 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan34 ].
	currentCharacter == $? ifTrue: [ ^ self scan35 ].
	currentCharacter == $x ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan34 ].
		currentCharacter == $? ifTrue: [ ^ self scan35 ].
		currentCharacter == $m ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan34 ].
			currentCharacter == $? ifTrue: [ ^ self scan35 ].
			currentCharacter == $l ifTrue: [ ^ self scan36 ] ] ].
	^ self scan33
]

{ #category : #generated }
HTMLScanner >> scan18X2 [

	self step.
	currentCharacter == $- ifTrue: [
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan22 ].
		currentCharacter == $< ifTrue: [ ^ self scan3 ].
		^ self scan2 ].
	currentCharacter == $< ifTrue: [ ^ self scan20 ].
	currentCharacter == $[ ifTrue: [ ^ self scan25 ].
	^ self scan19
]

{ #category : #generated }
HTMLScanner >> scan19 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan20 ].
	currentCharacter == $> ifTrue: [ ^ self scan21 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan1X1 [

	[
	self recordMatch: #( 20 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan7 ].
	currentCharacter == $< ifTrue: [ ^ self scan10 ].
	currentCharacter isDigit or: [
		(currentCharacter between: $A and: $F) or: [
			currentCharacter between: $a and: $f ] ] ] whileTrue.
	(currentCharacter == $# or: [
		 (currentCharacter between: $+ and: $?) or: [
			 (currentCharacter between: $G and: $Z) or: [
				 currentCharacter == $_ or: [
					 currentCharacter between: $g and: $z ] ] ] ]) ifTrue: [
		^ self scan9 ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan1X2 [

	[
	self recordMatch: #( 20 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan10 ].
	currentCharacter isDigit ] whileTrue.
	(currentCharacter == Character space or: [ currentCharacter == $% ])
		ifTrue: [ ^ self scan7 ].
	(currentCharacter == $# or: [
		 (currentCharacter between: $+ and: $?) or: [
			 (currentCharacter between: $A and: $Z) or: [
				 currentCharacter == $_ or: [
					 currentCharacter between: $a and: $z ] ] ] ]) ifTrue: [
		^ self scan9 ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan2 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan20 [

	[
	self step.
	currentCharacter == $/ ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan20 ].
		currentCharacter == $> ifTrue: [
			self recordMatch: #( 4 17 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan20 ].
			currentCharacter == $> ifTrue: [ ^ self scan21 ].
			^ self scan19 ].
		currentCharacter == $s ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan20 ].
			currentCharacter == $> ifTrue: [ ^ self scan21 ].
			currentCharacter == $c ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan20 ].
				currentCharacter == $> ifTrue: [ ^ self scan21 ].
				currentCharacter == $r ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan20 ].
					currentCharacter == $> ifTrue: [ ^ self scan21 ].
					currentCharacter == $i ifTrue: [
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan20 ].
						currentCharacter == $> ifTrue: [ ^ self scan21 ].
						currentCharacter == $p ifTrue: [
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan20 ].
							currentCharacter == $> ifTrue: [ ^ self scan21 ].
							currentCharacter == $t ifTrue: [
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan20 ].
								currentCharacter == $> ifTrue: [
									self recordMatch: #( 4 16 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan20 ].
									currentCharacter == $> ifTrue: [ ^ self scan21 ] ] ] ] ] ] ] ].
		^ self scan19 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan21 ].
	^ self scan19
]

{ #category : #generated }
HTMLScanner >> scan21 [

	[
	self recordMatch: #( 4 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan20 ].
	currentCharacter == $> ] whileTrue.
	^ self scan19
]

{ #category : #generated }
HTMLScanner >> scan22 [

	[
	self step.
	currentCharacter == $- ifTrue: [ ^ self scan23 ].
	currentCharacter == $< ifTrue: [ ^ self scan24 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan23 [

	self step.
	currentCharacter == $- ifTrue: [
		[
		self step.
		currentCharacter == $- ] whileTrue.
		currentCharacter == $< ifTrue: [ ^ self scan24 ].
		currentCharacter == $> ifTrue: [
			self recordMatch: #( 1 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan3 ].
			^ self scan2 ].
		^ self scan22 ].
	currentCharacter == $< ifTrue: [ ^ self scan24 ].
	^ self scan22
]

{ #category : #generated }
HTMLScanner >> scan24 [

	[
	self step.
	currentCharacter == $- ifTrue: [ ^ self scan23 ].
	currentCharacter == $/ ifTrue: [
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan23 ].
		currentCharacter == $< ifTrue: [ ^ self scan24 ].
		currentCharacter == $> ifTrue: [
			self recordMatch: #( 17 ).
			self step.
			currentCharacter == $- ifTrue: [ ^ self scan23 ].
			currentCharacter == $< ifTrue: [ ^ self scan24 ].
			^ self scan22 ].
		currentCharacter == $s ifTrue: [
			self step.
			currentCharacter == $- ifTrue: [ ^ self scan23 ].
			currentCharacter == $< ifTrue: [ ^ self scan24 ].
			currentCharacter == $c ifTrue: [
				self step.
				currentCharacter == $- ifTrue: [ ^ self scan23 ].
				currentCharacter == $< ifTrue: [ ^ self scan24 ].
				currentCharacter == $r ifTrue: [
					self step.
					currentCharacter == $- ifTrue: [ ^ self scan23 ].
					currentCharacter == $< ifTrue: [ ^ self scan24 ].
					currentCharacter == $i ifTrue: [
						self step.
						currentCharacter == $- ifTrue: [ ^ self scan23 ].
						currentCharacter == $< ifTrue: [ ^ self scan24 ].
						currentCharacter == $p ifTrue: [
							self step.
							currentCharacter == $- ifTrue: [ ^ self scan23 ].
							currentCharacter == $< ifTrue: [ ^ self scan24 ].
							currentCharacter == $t ifTrue: [
								self step.
								currentCharacter == $- ifTrue: [ ^ self scan23 ].
								currentCharacter == $< ifTrue: [ ^ self scan24 ].
								currentCharacter == $> ifTrue: [
									self recordMatch: #( 16 ).
									self step.
									currentCharacter == $- ifTrue: [ ^ self scan23 ].
									currentCharacter == $< ifTrue: [ ^ self scan24 ] ] ] ] ] ] ] ].
		^ self scan22 ].
	currentCharacter == $< ] whileTrue.
	^ self scan22
]

{ #category : #generated }
HTMLScanner >> scan25 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan26 ].
	currentCharacter == $> ifTrue: [ ^ self scan28 ].
	currentCharacter == $] ifTrue: [ ^ self scan29 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan26 [

	[
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan27 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan28 ].
	currentCharacter == $] ifTrue: [ ^ self scan29 ].
	^ self scan25
]

{ #category : #generated }
HTMLScanner >> scan27 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan26 ].
	currentCharacter == $> ifTrue: [
		self recordMatch: #( 4 17 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan26 ].
		currentCharacter == $> ifTrue: [ ^ self scan28 ].
		currentCharacter == $] ifTrue: [ ^ self scan29 ].
		^ self scan25 ].
	currentCharacter == $] ifTrue: [ ^ self scan29 ].
	currentCharacter == $s ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan26 ].
		currentCharacter == $> ifTrue: [ ^ self scan28 ].
		currentCharacter == $] ifTrue: [ ^ self scan29 ].
		currentCharacter == $c ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan26 ].
			currentCharacter == $> ifTrue: [ ^ self scan28 ].
			currentCharacter == $] ifTrue: [ ^ self scan29 ].
			currentCharacter == $r ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan26 ].
				currentCharacter == $> ifTrue: [ ^ self scan28 ].
				currentCharacter == $] ifTrue: [ ^ self scan29 ].
				currentCharacter == $i ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan26 ].
					currentCharacter == $> ifTrue: [ ^ self scan28 ].
					currentCharacter == $] ifTrue: [ ^ self scan29 ].
					currentCharacter == $p ifTrue: [
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan26 ].
						currentCharacter == $> ifTrue: [ ^ self scan28 ].
						currentCharacter == $] ifTrue: [ ^ self scan29 ].
						currentCharacter == $t ifTrue: [
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan26 ].
							currentCharacter == $> ifTrue: [
								self recordMatch: #( 4 16 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan26 ].
								currentCharacter == $> ifTrue: [ ^ self scan28 ] ].
							currentCharacter == $] ifTrue: [ ^ self scan29 ] ] ] ] ] ] ].
	^ self scan25
]

{ #category : #generated }
HTMLScanner >> scan28 [

	[
	self recordMatch: #( 4 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan26 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $] ifTrue: [ ^ self scan29 ].
	^ self scan25
]

{ #category : #generated }
HTMLScanner >> scan29 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan26 ].
	currentCharacter == $> ifTrue: [
		self recordMatch: #( 2 4 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan26 ].
		currentCharacter == $> ifTrue: [ ^ self scan28 ].
		currentCharacter == $] ifTrue: [ ^ self scan29 ].
		^ self scan25 ].
	currentCharacter == $] ] whileTrue.
	^ self scan25
]

{ #category : #generated }
HTMLScanner >> scan3 [

	[
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan4 ].
	currentCharacter == $< ] whileTrue.
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan30 [

	[
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan31 ].
	currentCharacter == $< ifTrue: [ ^ self scan32 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan31 [

	[
	self step.
	currentCharacter == $% ] whileTrue.
	currentCharacter == $< ifTrue: [ ^ self scan32 ].
	currentCharacter == $> ifTrue: [
		self recordMatch: #( 5 ).
		self step.
		currentCharacter == $% ifTrue: [ ^ self scan31 ].
		currentCharacter == $< ifTrue: [ ^ self scan32 ] ].
	^ self scan30
]

{ #category : #generated }
HTMLScanner >> scan32 [

	[
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan31 ].
	currentCharacter == $/ ifTrue: [
		self step.
		currentCharacter == $% ifTrue: [ ^ self scan31 ].
		currentCharacter == $< ifTrue: [ ^ self scan32 ].
		currentCharacter == $> ifTrue: [
			self recordMatch: #( 17 ).
			self step.
			currentCharacter == $% ifTrue: [ ^ self scan31 ].
			currentCharacter == $< ifTrue: [ ^ self scan32 ].
			^ self scan30 ].
		currentCharacter == $s ifTrue: [
			self step.
			currentCharacter == $% ifTrue: [ ^ self scan31 ].
			currentCharacter == $< ifTrue: [ ^ self scan32 ].
			currentCharacter == $c ifTrue: [
				self step.
				currentCharacter == $% ifTrue: [ ^ self scan31 ].
				currentCharacter == $< ifTrue: [ ^ self scan32 ].
				currentCharacter == $r ifTrue: [
					self step.
					currentCharacter == $% ifTrue: [ ^ self scan31 ].
					currentCharacter == $< ifTrue: [ ^ self scan32 ].
					currentCharacter == $i ifTrue: [
						self step.
						currentCharacter == $% ifTrue: [ ^ self scan31 ].
						currentCharacter == $< ifTrue: [ ^ self scan32 ].
						currentCharacter == $p ifTrue: [
							self step.
							currentCharacter == $% ifTrue: [ ^ self scan31 ].
							currentCharacter == $< ifTrue: [ ^ self scan32 ].
							currentCharacter == $t ifTrue: [
								self step.
								currentCharacter == $% ifTrue: [ ^ self scan31 ].
								currentCharacter == $< ifTrue: [ ^ self scan32 ].
								currentCharacter == $> ifTrue: [
									self recordMatch: #( 16 ).
									self step.
									currentCharacter == $% ifTrue: [ ^ self scan31 ].
									currentCharacter == $< ifTrue: [ ^ self scan32 ] ] ] ] ] ] ] ].
		^ self scan30 ].
	currentCharacter == $< ] whileTrue.
	^ self scan30
]

{ #category : #generated }
HTMLScanner >> scan33 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan34 ].
	currentCharacter == $? ifTrue: [ ^ self scan35 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan34 [

	[
	self step.
	currentCharacter == $/ ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan34 ].
		currentCharacter == $> ifTrue: [
			self recordMatch: #( 17 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan34 ].
			currentCharacter == $? ifTrue: [ ^ self scan35 ].
			^ self scan33 ].
		currentCharacter == $? ifTrue: [ ^ self scan35 ].
		currentCharacter == $s ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan34 ].
			currentCharacter == $? ifTrue: [ ^ self scan35 ].
			currentCharacter == $c ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan34 ].
				currentCharacter == $? ifTrue: [ ^ self scan35 ].
				currentCharacter == $r ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan34 ].
					currentCharacter == $? ifTrue: [ ^ self scan35 ].
					currentCharacter == $i ifTrue: [
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan34 ].
						currentCharacter == $? ifTrue: [ ^ self scan35 ].
						currentCharacter == $p ifTrue: [
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan34 ].
							currentCharacter == $? ifTrue: [ ^ self scan35 ].
							currentCharacter == $t ifTrue: [
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan34 ].
								currentCharacter == $> ifTrue: [
									self recordMatch: #( 16 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan34 ] ].
								currentCharacter == $? ifTrue: [ ^ self scan35 ] ] ] ] ] ] ].
		^ self scan33 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $? ifTrue: [ ^ self scan35 ].
	^ self scan33
]

{ #category : #generated }
HTMLScanner >> scan35 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan34 ].
	currentCharacter == $> ifTrue: [
		self recordMatch: #( 5 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan34 ].
		currentCharacter == $? ifTrue: [ ^ self scan35 ].
		^ self scan33 ].
	currentCharacter == $? ] whileTrue.
	^ self scan33
]

{ #category : #generated }
HTMLScanner >> scan36 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan37 ].
	currentCharacter == $> ifTrue: [ ^ self scan39 ].
	currentCharacter == $? ifTrue: [ ^ self scan40 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan37 [

	[
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan38 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan39 ].
	currentCharacter == $? ifTrue: [ ^ self scan40 ].
	^ self scan36
]

{ #category : #generated }
HTMLScanner >> scan38 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan37 ].
	currentCharacter == $> ifTrue: [
		self recordMatch: #( 3 17 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan37 ].
		currentCharacter == $> ifTrue: [ ^ self scan39 ].
		currentCharacter == $? ifTrue: [ ^ self scan40 ].
		^ self scan36 ].
	currentCharacter == $? ifTrue: [ ^ self scan40 ].
	currentCharacter == $s ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan37 ].
		currentCharacter == $> ifTrue: [ ^ self scan39 ].
		currentCharacter == $? ifTrue: [ ^ self scan40 ].
		currentCharacter == $c ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan37 ].
			currentCharacter == $> ifTrue: [ ^ self scan39 ].
			currentCharacter == $? ifTrue: [ ^ self scan40 ].
			currentCharacter == $r ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan37 ].
				currentCharacter == $> ifTrue: [ ^ self scan39 ].
				currentCharacter == $? ifTrue: [ ^ self scan40 ].
				currentCharacter == $i ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan37 ].
					currentCharacter == $> ifTrue: [ ^ self scan39 ].
					currentCharacter == $? ifTrue: [ ^ self scan40 ].
					currentCharacter == $p ifTrue: [
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan37 ].
						currentCharacter == $> ifTrue: [ ^ self scan39 ].
						currentCharacter == $? ifTrue: [ ^ self scan40 ].
						currentCharacter == $t ifTrue: [
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan37 ].
							currentCharacter == $> ifTrue: [
								self recordMatch: #( 3 16 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan37 ].
								currentCharacter == $> ifTrue: [ ^ self scan39 ] ].
							currentCharacter == $? ifTrue: [ ^ self scan40 ] ] ] ] ] ] ].
	^ self scan36
]

{ #category : #generated }
HTMLScanner >> scan39 [

	[
	self recordMatch: #( 3 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan37 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $? ifTrue: [ ^ self scan40 ].
	^ self scan36
]

{ #category : #generated }
HTMLScanner >> scan4 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	currentCharacter == $> ifTrue: [
		self recordMatch: #( 17 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan3 ].
		^ self scan2 ].
	currentCharacter == $s ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan3 ].
		currentCharacter == $c ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan3 ].
			currentCharacter == $r ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan3 ].
				currentCharacter == $i ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan3 ].
					currentCharacter == $p ifTrue: [
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan3 ].
						currentCharacter == $t ifTrue: [
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan3 ].
							currentCharacter == $> ifTrue: [
								self recordMatch: #( 16 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan3 ] ] ] ] ] ] ] ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan40 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan37 ].
	currentCharacter == $> ifTrue: [
		self recordMatch: #( 3 5 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan37 ].
		currentCharacter == $> ifTrue: [ ^ self scan39 ].
		currentCharacter == $? ifTrue: [ ^ self scan40 ].
		^ self scan36 ].
	currentCharacter == $? ] whileTrue.
	^ self scan36
]

{ #category : #generated }
HTMLScanner >> scan41 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan42 ].
	currentCharacter == $> ifTrue: [ ^ self scan43 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan42 [

	[
	self step.
	currentCharacter == $/ ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan42 ].
		currentCharacter == $> ifTrue: [
			self recordMatch: #( 7 17 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan42 ].
			currentCharacter == $> ifTrue: [ ^ self scan43 ].
			^ self scan41 ].
		currentCharacter == $s ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan42 ].
			currentCharacter == $> ifTrue: [ ^ self scan43 ].
			currentCharacter == $c ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan42 ].
				currentCharacter == $> ifTrue: [ ^ self scan43 ].
				currentCharacter == $r ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan42 ].
					currentCharacter == $> ifTrue: [ ^ self scan43 ].
					currentCharacter == $i ifTrue: [
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan42 ].
						currentCharacter == $> ifTrue: [ ^ self scan43 ].
						currentCharacter == $p ifTrue: [
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan42 ].
							currentCharacter == $> ifTrue: [ ^ self scan43 ].
							currentCharacter == $t ifTrue: [
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan42 ].
								currentCharacter == $> ifTrue: [
									self recordMatch: #( 7 16 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan42 ].
									currentCharacter == $> ifTrue: [ ^ self scan43 ] ] ] ] ] ] ] ].
		^ self scan41 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan43 ].
	^ self scan41
]

{ #category : #generated }
HTMLScanner >> scan43 [

	[
	self recordMatch: #( 7 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan42 ].
	currentCharacter == $> ] whileTrue.
	^ self scan41
]

{ #category : #generated }
HTMLScanner >> scan44 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan45 ].
	currentCharacter == $> ifTrue: [ ^ self scan46 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan45 [

	[
	self step.
	currentCharacter == $/ ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan45 ].
		currentCharacter == $> ifTrue: [
			self recordMatch: #( 8 17 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan45 ].
			currentCharacter == $> ifTrue: [ ^ self scan46 ].
			^ self scan44 ].
		currentCharacter == $s ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan45 ].
			currentCharacter == $> ifTrue: [ ^ self scan46 ].
			currentCharacter == $c ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan45 ].
				currentCharacter == $> ifTrue: [ ^ self scan46 ].
				currentCharacter == $r ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan45 ].
					currentCharacter == $> ifTrue: [ ^ self scan46 ].
					currentCharacter == $i ifTrue: [
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan45 ].
						currentCharacter == $> ifTrue: [ ^ self scan46 ].
						currentCharacter == $p ifTrue: [
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan45 ].
							currentCharacter == $> ifTrue: [ ^ self scan46 ].
							currentCharacter == $t ifTrue: [
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan45 ].
								currentCharacter == $> ifTrue: [
									self recordMatch: #( 8 16 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan45 ].
									currentCharacter == $> ifTrue: [ ^ self scan46 ] ] ] ] ] ] ] ].
		^ self scan44 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan46 ].
	^ self scan44
]

{ #category : #generated }
HTMLScanner >> scan46 [

	[
	self recordMatch: #( 8 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan45 ].
	currentCharacter == $> ] whileTrue.
	^ self scan44
]

{ #category : #generated }
HTMLScanner >> scan47 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan48 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan48 [

	[
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan49 ].
	currentCharacter == $< ] whileTrue.
	^ self scan47
]

{ #category : #generated }
HTMLScanner >> scan49 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan48 ].
	currentCharacter == $> ifTrue: [
		self recordMatch: #( 17 19 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan48 ].
		^ self scan47 ].
	currentCharacter == $s ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan48 ].
		currentCharacter == $c ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan48 ].
			currentCharacter == $r ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan48 ].
				currentCharacter == $i ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan48 ].
					currentCharacter == $p ifTrue: [
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan48 ].
						currentCharacter == $t ifTrue: [
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan48 ].
							currentCharacter == $> ifTrue: [
								self recordMatch: #( 16 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan48 ] ] ] ] ] ].
			^ self scan47 ].
		currentCharacter == $t ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan48 ].
			currentCharacter == $y ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan48 ].
				currentCharacter == $l ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan48 ].
					currentCharacter == $e ifTrue: [
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan48 ].
						currentCharacter == $> ifTrue: [
							self recordMatch: #( 18 ).
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan48 ] ] ] ] ] ] ].
	^ self scan47
]

{ #category : #generated }
HTMLScanner >> scan5 [

	[
	self recordMatch: #( 6 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	(currentCharacter between: Character tab and: Character lf) or: [
		currentCharacter == Character cr or: [
			currentCharacter == Character space ] ] ] whileTrue.
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan50 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	(currentCharacter == $: or: [
		 (currentCharacter between: $A and: $Z) or: [
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan51 ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan51 [

	[
	self recordMatch: #( 14 ).
	self step.
	currentCharacter == $) ifTrue: [
		self recordMatch: #( 14 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan3 ].
		currentCharacter == $] ifTrue: [ ^ self scan52 ].
		^ self scan2 ].
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	currentCharacter == $] ifTrue: [ ^ self scan52 ].
	(currentCharacter between: $- and: $.) or: [
		(currentCharacter between: $0 and: $:) or: [
			(currentCharacter between: $A and: $Z) or: [
				currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ]
		whileTrue.
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan52 [

	self recordMatch: #( 14 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan53 [

	self step.
	currentCharacter == $# ifTrue: [ ^ self scan50 ].
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	(currentCharacter == $: or: [
		 (currentCharacter between: $A and: $Z) or: [
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan51 ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan6 [

	[
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan7 ].
	currentCharacter == $< ifTrue: [ ^ self scan8 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan7 [

	self recordMatch: #( 20 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan8 [

	[
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan7 ].
	currentCharacter == $/ ifTrue: [
		self step.
		currentCharacter == $" ifTrue: [ ^ self scan7 ].
		currentCharacter == $< ifTrue: [ ^ self scan8 ].
		currentCharacter == $> ifTrue: [
			self recordMatch: #( 17 ).
			self step.
			currentCharacter == $" ifTrue: [ ^ self scan7 ].
			currentCharacter == $< ifTrue: [ ^ self scan8 ].
			^ self scan6 ].
		currentCharacter == $s ifTrue: [
			self step.
			currentCharacter == $" ifTrue: [ ^ self scan7 ].
			currentCharacter == $< ifTrue: [ ^ self scan8 ].
			currentCharacter == $c ifTrue: [
				self step.
				currentCharacter == $" ifTrue: [ ^ self scan7 ].
				currentCharacter == $< ifTrue: [ ^ self scan8 ].
				currentCharacter == $r ifTrue: [
					self step.
					currentCharacter == $" ifTrue: [ ^ self scan7 ].
					currentCharacter == $< ifTrue: [ ^ self scan8 ].
					currentCharacter == $i ifTrue: [
						self step.
						currentCharacter == $" ifTrue: [ ^ self scan7 ].
						currentCharacter == $< ifTrue: [ ^ self scan8 ].
						currentCharacter == $p ifTrue: [
							self step.
							currentCharacter == $" ifTrue: [ ^ self scan7 ].
							currentCharacter == $< ifTrue: [ ^ self scan8 ].
							currentCharacter == $t ifTrue: [
								self step.
								currentCharacter == $" ifTrue: [ ^ self scan7 ].
								currentCharacter == $< ifTrue: [ ^ self scan8 ].
								currentCharacter == $> ifTrue: [
									self recordMatch: #( 16 ).
									self step.
									currentCharacter == $" ifTrue: [ ^ self scan7 ].
									currentCharacter == $< ifTrue: [ ^ self scan8 ] ] ] ] ] ] ] ].
		^ self scan6 ].
	currentCharacter == $< ] whileTrue.
	^ self scan6
]

{ #category : #generated }
HTMLScanner >> scan9 [

	[
	self recordMatch: #( 20 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan7 ].
	currentCharacter == $< ifTrue: [ ^ self scan10 ].
	currentCharacter == $# or: [
		(currentCharacter between: $+ and: $?) or: [
			(currentCharacter between: $A and: $Z) or: [
				currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ]
		whileTrue.
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scanForToken [

	scope == #style ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan48 ].
		((currentCharacter between: Character tab and: Character lf) or: [
			 currentCharacter == Character cr or: [
				 currentCharacter == Character space ] ]) ifTrue: [
			[
			self recordMatch: #( 6 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan48 ].
			(currentCharacter between: Character tab and: Character lf) or: [
				currentCharacter == Character cr or: [
					currentCharacter == Character space ] ] ] whileTrue ].
		^ self scan47 ].
	scope == #default ifTrue: [ ^ self scan16 ].
	scope == #attvalue ifTrue: [ ^ self scan1 ].
	scope == #tag ifTrue: [ ^ self scanForTokenX1 ].
	^ self reportLastMatch
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1 [

	self step.
	currentCharacter == $( ifTrue: [ ^ self scan53 ].
	^ self scanForTokenX1X5
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X1 [

	self step.
	currentCharacter == $# ifTrue: [ ^ self scan50 ].
	currentCharacter == $( ifTrue: [ ^ self scan53 ].
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	(currentCharacter == $: or: [
		 (currentCharacter between: $A and: $Z) or: [
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan51 ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X2 [

	self recordMatch: #( 11 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X3 [

	self recordMatch: #( 13 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X4 [

	self recordMatch: #( 12 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X5 [

	currentCharacter == $/ ifTrue: [ ^ self scanForTokenX1X4 ].
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	currentCharacter == $= ifTrue: [ ^ self scanForTokenX1X3 ].
	currentCharacter == $> ifTrue: [ ^ self scanForTokenX1X2 ].
	currentCharacter == $[ ifTrue: [ ^ self scanForTokenX1X1 ].
	('#*' includes: currentCharacter) ifTrue: [ ^ self scan50 ].
	((currentCharacter between: Character tab and: Character lf) or: [
		 currentCharacter == Character cr or: [
			 currentCharacter == Character space ] ]) ifTrue: [ ^ self scan5 ].
	(currentCharacter == $: or: [
		 (currentCharacter between: $A and: $Z) or: [
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan51 ].
	^ self scan2
]
