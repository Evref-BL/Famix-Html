Class {
	#name : #HTMLScanner,
	#superclass : #SmaCCScanner,
	#category : #'SmaCC_HTML'
}

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

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan10 [

	[ 
	self recordMatch: #( 21 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan8 ].
	currentCharacter == $< ifTrue: [ ^ self scan12 ].
	currentCharacter isDigit or: [ 
		(currentCharacter between: $A and: $F) or: [ 
			currentCharacter between: $a and: $f ] ] ] whileTrue.
	(currentCharacter == $# or: [ 
		 (currentCharacter between: $+ and: $?) or: [ 
			 (currentCharacter between: $G and: $Z) or: [ 
				 currentCharacter == $_ or: [ 
					 currentCharacter between: $g and: $z ] ] ] ]) ifTrue: [ 
		^ self scan11 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan11 [

	[ 
	self recordMatch: #( 21 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan8 ].
	currentCharacter == $< ifTrue: [ ^ self scan12 ].
	currentCharacter == $# or: [ 
		(currentCharacter between: $+ and: $?) or: [ 
			(currentCharacter between: $A and: $Z) or: [ 
				currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ]
		whileTrue.
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan12 [

	[ 
	self recordMatch: #( 21 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan8 ].
	currentCharacter == $/ ifTrue: [ ^ self scan13 ].
	currentCharacter == $< ] whileTrue.
	(currentCharacter == $# or: [ 
		 (currentCharacter between: $+ and: $?) or: [ 
			 (currentCharacter between: $A and: $Z) or: [ 
				 currentCharacter == $_ or: [ 
					 currentCharacter between: $a and: $z ] ] ] ]) ifTrue: [ 
		^ self scan11 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan13 [

	self recordMatch: #( 21 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan8 ].
	currentCharacter == $< ifTrue: [ ^ self scan12 ].
	currentCharacter == $> ifTrue: [ ^ self scan13X1 ].
	currentCharacter == $s ifTrue: [ ^ self scan14 ].
	(currentCharacter <= $" or: [ 
		 (currentCharacter between: $$ and: $*) or: [ 
			 currentCharacter == $@ or: [ 
				 (currentCharacter between: $[ and: $^) or: [ 
					 currentCharacter == $` or: [ currentCharacter >= ${ ] ] ] ] ]) 
		ifTrue: [ ^ self scan1 ].
	^ self scan11
]

{ #category : #generated }
HTMLScanner >> scan13X1 [

	self recordMatch: #( 18 21 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan8 ].
	currentCharacter == $< ifTrue: [ ^ self scan12 ].
	(currentCharacter == $# or: [ 
		 (currentCharacter between: $+ and: $?) or: [ 
			 (currentCharacter between: $A and: $Z) or: [ 
				 currentCharacter == $_ or: [ 
					 currentCharacter between: $a and: $z ] ] ] ]) ifTrue: [ 
		^ self scan11 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan14 [

	self recordMatch: #( 21 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan8 ].
	currentCharacter == $< ifTrue: [ ^ self scan12 ].
	currentCharacter == $c ifTrue: [ ^ self scan15 ].
	(currentCharacter == $# or: [ 
		 (currentCharacter between: $+ and: $?) or: [ 
			 (currentCharacter between: $A and: $Z) or: [ 
				 currentCharacter == $_ or: [ 
					 currentCharacter between: $a and: $z ] ] ] ]) ifTrue: [ 
		^ self scan11 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan15 [

	self recordMatch: #( 21 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan8 ].
	currentCharacter == $< ifTrue: [ ^ self scan12 ].
	currentCharacter == $r ifTrue: [ 
		self recordMatch: #( 21 ).
		self step.
		currentCharacter == Character space ifTrue: [ ^ self scan8 ].
		currentCharacter == $< ifTrue: [ ^ self scan12 ].
		currentCharacter == $i ifTrue: [ 
			self recordMatch: #( 21 ).
			self step.
			currentCharacter == Character space ifTrue: [ ^ self scan8 ].
			currentCharacter == $< ifTrue: [ ^ self scan12 ].
			currentCharacter == $p ifTrue: [ 
				self recordMatch: #( 21 ).
				self step.
				currentCharacter == Character space ifTrue: [ ^ self scan8 ].
				currentCharacter == $< ifTrue: [ ^ self scan12 ].
				currentCharacter == $t ifTrue: [ 
					self recordMatch: #( 21 ).
					self step.
					currentCharacter == Character space ifTrue: [ ^ self scan8 ].
					currentCharacter == $< ifTrue: [ ^ self scan12 ].
					currentCharacter == $> ifTrue: [ 
						self recordMatch: #( 17 21 ).
						self step.
						currentCharacter == Character space ifTrue: [ ^ self scan8 ].
						currentCharacter == $< ifTrue: [ ^ self scan12 ] ] ] ] ] ].
	(currentCharacter == $# or: [ 
		 (currentCharacter between: $+ and: $?) or: [ 
			 (currentCharacter between: $A and: $Z) or: [ 
				 currentCharacter == $_ or: [ 
					 currentCharacter between: $a and: $z ] ] ] ]) ifTrue: [ 
		^ self scan11 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan16 [

	[ 
	self step.
	currentCharacter == $' ifTrue: [ ^ self scan8 ].
	currentCharacter == $< ifTrue: [ ^ self scan17 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan17 [

	[ 
	self step.
	currentCharacter == $' ifTrue: [ ^ self scan8 ].
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $' ifTrue: [ ^ self scan8 ].
		currentCharacter == $< ifTrue: [ ^ self scan17 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 18 ).
			self step.
			currentCharacter == $' ifTrue: [ ^ self scan8 ].
			currentCharacter == $< ifTrue: [ ^ self scan17 ].
			^ self scan16 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $' ifTrue: [ ^ self scan8 ].
			currentCharacter == $< ifTrue: [ ^ self scan17 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $' ifTrue: [ ^ self scan8 ].
				currentCharacter == $< ifTrue: [ ^ self scan17 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $' ifTrue: [ ^ self scan8 ].
					currentCharacter == $< ifTrue: [ ^ self scan17 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $' ifTrue: [ ^ self scan8 ].
						currentCharacter == $< ifTrue: [ ^ self scan17 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $' ifTrue: [ ^ self scan8 ].
							currentCharacter == $< ifTrue: [ ^ self scan17 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $' ifTrue: [ ^ self scan8 ].
								currentCharacter == $< ifTrue: [ ^ self scan17 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 17 ).
									self step.
									currentCharacter == $' ifTrue: [ ^ self scan8 ].
									currentCharacter == $< ifTrue: [ ^ self scan17 ] ] ] ] ] ] ] ].
		^ self scan16 ].
	currentCharacter == $< ] whileTrue.
	^ self scan16
]

{ #category : #generated }
HTMLScanner >> scan18 [

	[ 
	self recordMatch: #( 21 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan12 ].
	currentCharacter isDigit ] whileTrue.
	(currentCharacter == Character space or: [ currentCharacter == $% ]) 
		ifTrue: [ ^ self scan8 ].
	(currentCharacter == $# or: [ 
		 (currentCharacter between: $+ and: $?) or: [ 
			 (currentCharacter between: $A and: $Z) or: [ 
				 currentCharacter == $_ or: [ 
					 currentCharacter between: $a and: $z ] ] ] ]) ifTrue: [ 
		^ self scan11 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan19 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan21 ].
	((currentCharacter between: Character tab and: Character lf) or: [ 
		 currentCharacter == Character cr or: [ 
			 currentCharacter == Character space ] ]) ifTrue: [ 
		[ 
		self recordMatch: #( 7 11 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan2 ].
		(currentCharacter between: Character tab and: Character lf) or: [ 
			currentCharacter == Character cr or: [ 
				currentCharacter == Character space ] ] ] whileTrue ].
	^ self scan20
]

{ #category : #generated }
HTMLScanner >> scan2 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan3 ].
	currentCharacter == $< ] whileTrue.
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan20 [

	[ 
	self recordMatch: #( 11 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan21 [

	self recordMatch: #( 10 ).
	self step.
	currentCharacter == $! ifTrue: [ ^ self scan21X1 ].
	currentCharacter == $% ifTrue: [ ^ self scan38 ].
	currentCharacter == $/ ifTrue: [ ^ self scan3 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	currentCharacter == $? ifTrue: [ ^ self scan21X2 ].
	currentCharacter == $s ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan2 ].
		currentCharacter == $c ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan2 ].
			currentCharacter == $r ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan2 ].
				currentCharacter == $i ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan2 ].
					currentCharacter == $p ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan2 ].
						currentCharacter == $t ifTrue: [ ^ self scan49 ] ] ] ].
			^ self scan1 ].
		currentCharacter == $t ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan2 ].
			currentCharacter == $y ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan2 ].
				currentCharacter == $l ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan2 ].
					currentCharacter == $e ifTrue: [ ^ self scan52 ] ] ] ] ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan21X1 [

	self step.
	currentCharacter == $- ifTrue: [ 
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan25 ].
		currentCharacter == $< ifTrue: [ ^ self scan2 ].
		^ self scan1 ].
	currentCharacter == $< ifTrue: [ ^ self scan23 ].
	currentCharacter == $[ ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan29 ].
		currentCharacter == $> ifTrue: [ ^ self scan31 ].
		currentCharacter == $C ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan29 ].
			currentCharacter == $> ifTrue: [ ^ self scan31 ].
			currentCharacter == $D ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan29 ].
				currentCharacter == $> ifTrue: [ ^ self scan31 ].
				currentCharacter == $A ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan29 ].
					currentCharacter == $> ifTrue: [ ^ self scan31 ].
					currentCharacter == $T ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan29 ].
						currentCharacter == $> ifTrue: [ ^ self scan31 ].
						currentCharacter == $A ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan29 ].
							currentCharacter == $> ifTrue: [ ^ self scan31 ].
							currentCharacter == $[ ifTrue: [ ^ self scan33 ] ] ] ] ] ].
		currentCharacter == $] ifTrue: [ ^ self scan32 ].
		^ self scan28 ].
	^ self scan22
]

{ #category : #generated }
HTMLScanner >> scan21X2 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan42 ].
	currentCharacter == $? ifTrue: [ ^ self scan43 ].
	currentCharacter == $x ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan42 ].
		currentCharacter == $? ifTrue: [ ^ self scan43 ].
		currentCharacter == $m ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan42 ].
			currentCharacter == $? ifTrue: [ ^ self scan43 ].
			currentCharacter == $l ifTrue: [ ^ self scan44 ] ] ].
	^ self scan41
]

{ #category : #generated }
HTMLScanner >> scan22 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan23 ].
	currentCharacter == $> ifTrue: [ ^ self scan24 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan23 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan23 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 5 18 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan23 ].
			currentCharacter == $> ifTrue: [ ^ self scan24 ].
			^ self scan22 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan23 ].
			currentCharacter == $> ifTrue: [ ^ self scan24 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan23 ].
				currentCharacter == $> ifTrue: [ ^ self scan24 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan23 ].
					currentCharacter == $> ifTrue: [ ^ self scan24 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan23 ].
						currentCharacter == $> ifTrue: [ ^ self scan24 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan23 ].
							currentCharacter == $> ifTrue: [ ^ self scan24 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan23 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 5 17 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan23 ].
									currentCharacter == $> ifTrue: [ ^ self scan24 ] ] ] ] ] ] ] ].
		^ self scan22 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan24 ].
	^ self scan22
]

{ #category : #generated }
HTMLScanner >> scan24 [

	[ 
	self recordMatch: #( 5 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan23 ].
	currentCharacter == $> ] whileTrue.
	^ self scan22
]

{ #category : #generated }
HTMLScanner >> scan25 [

	[ 
	self step.
	currentCharacter == $- ifTrue: [ ^ self scan26 ].
	currentCharacter == $< ifTrue: [ ^ self scan27 ].
	currentCharacter == $> ifTrue: [ ^ self scan1 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan26 [

	self step.
	currentCharacter == $- ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan2 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 1 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan2 ] ].
		^ self scan1 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan27 [

	[ 
	self step.
	currentCharacter == $- ifTrue: [ ^ self scan26 ].
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan26 ].
		currentCharacter == $< ifTrue: [ ^ self scan27 ].
		currentCharacter == $> ifTrue: [ ^ self scan4 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $- ifTrue: [ ^ self scan26 ].
			currentCharacter == $< ifTrue: [ ^ self scan27 ].
			currentCharacter == $> ifTrue: [ ^ self scan1 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $- ifTrue: [ ^ self scan26 ].
				currentCharacter == $< ifTrue: [ ^ self scan27 ].
				currentCharacter == $> ifTrue: [ ^ self scan1 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $- ifTrue: [ ^ self scan26 ].
					currentCharacter == $< ifTrue: [ ^ self scan27 ].
					currentCharacter == $> ifTrue: [ ^ self scan1 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $- ifTrue: [ ^ self scan26 ].
						currentCharacter == $< ifTrue: [ ^ self scan27 ].
						currentCharacter == $> ifTrue: [ ^ self scan1 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $- ifTrue: [ ^ self scan26 ].
							currentCharacter == $< ifTrue: [ ^ self scan27 ].
							currentCharacter == $> ifTrue: [ ^ self scan1 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $- ifTrue: [ ^ self scan26 ].
								currentCharacter == $< ifTrue: [ ^ self scan27 ].
								currentCharacter == $> ifTrue: [ ^ self scan5 ] ] ] ] ] ] ].
		^ self scan25 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan1 ].
	^ self scan25
]

{ #category : #generated }
HTMLScanner >> scan28 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan29 ].
	currentCharacter == $> ifTrue: [ ^ self scan31 ].
	currentCharacter == $] ifTrue: [ ^ self scan32 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan29 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan30 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan31 ].
	currentCharacter == $] ifTrue: [ ^ self scan32 ].
	^ self scan28
]

{ #category : #generated }
HTMLScanner >> scan3 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	currentCharacter == $> ifTrue: [ ^ self scan4 ].
	currentCharacter == $s ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan2 ].
		currentCharacter == $c ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan2 ].
			currentCharacter == $r ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan2 ].
				currentCharacter == $i ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan2 ].
					currentCharacter == $p ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan2 ].
						currentCharacter == $t ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan2 ].
							currentCharacter == $> ifTrue: [ ^ self scan5 ] ] ] ] ] ] ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan30 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan29 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 5 18 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan29 ].
		currentCharacter == $> ifTrue: [ ^ self scan31 ].
		currentCharacter == $] ifTrue: [ ^ self scan32 ].
		^ self scan28 ].
	currentCharacter == $] ifTrue: [ ^ self scan32 ].
	currentCharacter == $s ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan29 ].
		currentCharacter == $> ifTrue: [ ^ self scan31 ].
		currentCharacter == $] ifTrue: [ ^ self scan32 ].
		currentCharacter == $c ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan29 ].
			currentCharacter == $> ifTrue: [ ^ self scan31 ].
			currentCharacter == $] ifTrue: [ ^ self scan32 ].
			currentCharacter == $r ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan29 ].
				currentCharacter == $> ifTrue: [ ^ self scan31 ].
				currentCharacter == $] ifTrue: [ ^ self scan32 ].
				currentCharacter == $i ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan29 ].
					currentCharacter == $> ifTrue: [ ^ self scan31 ].
					currentCharacter == $] ifTrue: [ ^ self scan32 ].
					currentCharacter == $p ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan29 ].
						currentCharacter == $> ifTrue: [ ^ self scan31 ].
						currentCharacter == $] ifTrue: [ ^ self scan32 ].
						currentCharacter == $t ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan29 ].
							currentCharacter == $> ifTrue: [ 
								self recordMatch: #( 5 17 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan29 ].
								currentCharacter == $> ifTrue: [ ^ self scan31 ] ].
							currentCharacter == $] ifTrue: [ ^ self scan32 ] ] ] ] ] ] ].
	^ self scan28
]

{ #category : #generated }
HTMLScanner >> scan31 [

	[ 
	self recordMatch: #( 5 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan29 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $] ifTrue: [ ^ self scan32 ].
	^ self scan28
]

{ #category : #generated }
HTMLScanner >> scan32 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan29 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 2 5 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan29 ].
		currentCharacter == $> ifTrue: [ ^ self scan31 ].
		currentCharacter == $] ifTrue: [ ^ self scan32 ].
		^ self scan28 ].
	currentCharacter == $] ] whileTrue.
	^ self scan28
]

{ #category : #generated }
HTMLScanner >> scan33 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan34 ].
	currentCharacter == $> ifTrue: [ ^ self scan36 ].
	currentCharacter == $] ifTrue: [ ^ self scan37 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan34 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan35 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan36 ].
	currentCharacter == $] ifTrue: [ ^ self scan37 ].
	^ self scan33
]

{ #category : #generated }
HTMLScanner >> scan35 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan34 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 5 18 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan34 ].
		currentCharacter == $> ifTrue: [ ^ self scan36 ].
		currentCharacter == $] ifTrue: [ ^ self scan37 ].
		^ self scan33 ].
	currentCharacter == $] ifTrue: [ ^ self scan37 ].
	currentCharacter == $s ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan34 ].
		currentCharacter == $> ifTrue: [ ^ self scan36 ].
		currentCharacter == $] ifTrue: [ ^ self scan37 ].
		currentCharacter == $c ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan34 ].
			currentCharacter == $> ifTrue: [ ^ self scan36 ].
			currentCharacter == $] ifTrue: [ ^ self scan37 ].
			currentCharacter == $r ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan34 ].
				currentCharacter == $> ifTrue: [ ^ self scan36 ].
				currentCharacter == $] ifTrue: [ ^ self scan37 ].
				currentCharacter == $i ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan34 ].
					currentCharacter == $> ifTrue: [ ^ self scan36 ].
					currentCharacter == $] ifTrue: [ ^ self scan37 ].
					currentCharacter == $p ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan34 ].
						currentCharacter == $> ifTrue: [ ^ self scan36 ].
						currentCharacter == $] ifTrue: [ ^ self scan37 ].
						currentCharacter == $t ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan34 ].
							currentCharacter == $> ifTrue: [ 
								self recordMatch: #( 5 17 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan34 ].
								currentCharacter == $> ifTrue: [ ^ self scan36 ] ].
							currentCharacter == $] ifTrue: [ ^ self scan37 ] ] ] ] ] ] ].
	^ self scan33
]

{ #category : #generated }
HTMLScanner >> scan36 [

	[ 
	self recordMatch: #( 5 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan34 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $] ifTrue: [ ^ self scan37 ].
	^ self scan33
]

{ #category : #generated }
HTMLScanner >> scan37 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan34 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 2 5 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan34 ].
		currentCharacter == $> ifTrue: [ ^ self scan36 ].
		currentCharacter == $] ifTrue: [ ^ self scan37 ].
		^ self scan33 ].
	currentCharacter == $] ifTrue: [ 
		[ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan34 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 2 4 5 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan34 ].
			currentCharacter == $> ifTrue: [ ^ self scan36 ].
			currentCharacter == $] ifTrue: [ ^ self scan37 ].
			^ self scan33 ].
		currentCharacter == $] ] whileTrue ].
	^ self scan33
]

{ #category : #generated }
HTMLScanner >> scan38 [

	[ 
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan39 ].
	currentCharacter == $< ifTrue: [ ^ self scan40 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan39 [

	[ 
	self step.
	currentCharacter == $% ] whileTrue.
	currentCharacter == $< ifTrue: [ ^ self scan40 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 6 ).
		self step.
		currentCharacter == $% ifTrue: [ ^ self scan39 ].
		currentCharacter == $< ifTrue: [ ^ self scan40 ] ].
	^ self scan38
]

{ #category : #generated }
HTMLScanner >> scan4 [

	self recordMatch: #( 18 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan40 [

	[ 
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan39 ].
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $% ifTrue: [ ^ self scan39 ].
		currentCharacter == $< ifTrue: [ ^ self scan40 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 18 ).
			self step.
			currentCharacter == $% ifTrue: [ ^ self scan39 ].
			currentCharacter == $< ifTrue: [ ^ self scan40 ].
			^ self scan38 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $% ifTrue: [ ^ self scan39 ].
			currentCharacter == $< ifTrue: [ ^ self scan40 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $% ifTrue: [ ^ self scan39 ].
				currentCharacter == $< ifTrue: [ ^ self scan40 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $% ifTrue: [ ^ self scan39 ].
					currentCharacter == $< ifTrue: [ ^ self scan40 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $% ifTrue: [ ^ self scan39 ].
						currentCharacter == $< ifTrue: [ ^ self scan40 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $% ifTrue: [ ^ self scan39 ].
							currentCharacter == $< ifTrue: [ ^ self scan40 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $% ifTrue: [ ^ self scan39 ].
								currentCharacter == $< ifTrue: [ ^ self scan40 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 17 ).
									self step.
									currentCharacter == $% ifTrue: [ ^ self scan39 ].
									currentCharacter == $< ifTrue: [ ^ self scan40 ] ] ] ] ] ] ] ].
		^ self scan38 ].
	currentCharacter == $< ] whileTrue.
	^ self scan38
]

{ #category : #generated }
HTMLScanner >> scan41 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan42 ].
	currentCharacter == $? ifTrue: [ ^ self scan43 ].
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
			self recordMatch: #( 18 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan42 ].
			currentCharacter == $? ifTrue: [ ^ self scan43 ].
			^ self scan41 ].
		currentCharacter == $? ifTrue: [ ^ self scan43 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan42 ].
			currentCharacter == $? ifTrue: [ ^ self scan43 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan42 ].
				currentCharacter == $? ifTrue: [ ^ self scan43 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan42 ].
					currentCharacter == $? ifTrue: [ ^ self scan43 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan42 ].
						currentCharacter == $? ifTrue: [ ^ self scan43 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan42 ].
							currentCharacter == $? ifTrue: [ ^ self scan43 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan42 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 17 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan42 ] ].
								currentCharacter == $? ifTrue: [ ^ self scan43 ] ] ] ] ] ] ].
		^ self scan41 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $? ifTrue: [ ^ self scan43 ].
	^ self scan41
]

{ #category : #generated }
HTMLScanner >> scan43 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan42 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 6 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan42 ].
		currentCharacter == $? ifTrue: [ ^ self scan43 ].
		^ self scan41 ].
	currentCharacter == $? ] whileTrue.
	^ self scan41
]

{ #category : #generated }
HTMLScanner >> scan44 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan45 ].
	currentCharacter == $> ifTrue: [ ^ self scan47 ].
	currentCharacter == $? ifTrue: [ ^ self scan48 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan45 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan46 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan47 ].
	currentCharacter == $? ifTrue: [ ^ self scan48 ].
	^ self scan44
]

{ #category : #generated }
HTMLScanner >> scan46 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan45 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 3 18 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan45 ].
		currentCharacter == $> ifTrue: [ ^ self scan47 ].
		currentCharacter == $? ifTrue: [ ^ self scan48 ].
		^ self scan44 ].
	currentCharacter == $? ifTrue: [ ^ self scan48 ].
	currentCharacter == $s ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan45 ].
		currentCharacter == $> ifTrue: [ ^ self scan47 ].
		currentCharacter == $? ifTrue: [ ^ self scan48 ].
		currentCharacter == $c ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan45 ].
			currentCharacter == $> ifTrue: [ ^ self scan47 ].
			currentCharacter == $? ifTrue: [ ^ self scan48 ].
			currentCharacter == $r ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan45 ].
				currentCharacter == $> ifTrue: [ ^ self scan47 ].
				currentCharacter == $? ifTrue: [ ^ self scan48 ].
				currentCharacter == $i ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan45 ].
					currentCharacter == $> ifTrue: [ ^ self scan47 ].
					currentCharacter == $? ifTrue: [ ^ self scan48 ].
					currentCharacter == $p ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan45 ].
						currentCharacter == $> ifTrue: [ ^ self scan47 ].
						currentCharacter == $? ifTrue: [ ^ self scan48 ].
						currentCharacter == $t ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan45 ].
							currentCharacter == $> ifTrue: [ 
								self recordMatch: #( 3 17 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan45 ].
								currentCharacter == $> ifTrue: [ ^ self scan47 ] ].
							currentCharacter == $? ifTrue: [ ^ self scan48 ] ] ] ] ] ] ].
	^ self scan44
]

{ #category : #generated }
HTMLScanner >> scan47 [

	[ 
	self recordMatch: #( 3 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan45 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $? ifTrue: [ ^ self scan48 ].
	^ self scan44
]

{ #category : #generated }
HTMLScanner >> scan48 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan45 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 3 6 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan45 ].
		currentCharacter == $> ifTrue: [ ^ self scan47 ].
		currentCharacter == $? ifTrue: [ ^ self scan48 ].
		^ self scan44 ].
	currentCharacter == $? ] whileTrue.
	^ self scan44
]

{ #category : #generated }
HTMLScanner >> scan49 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan50 ].
	currentCharacter == $> ifTrue: [ ^ self scan51 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan5 [

	self recordMatch: #( 17 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan50 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan50 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 8 18 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan50 ].
			currentCharacter == $> ifTrue: [ ^ self scan51 ].
			^ self scan49 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan50 ].
			currentCharacter == $> ifTrue: [ ^ self scan51 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan50 ].
				currentCharacter == $> ifTrue: [ ^ self scan51 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan50 ].
					currentCharacter == $> ifTrue: [ ^ self scan51 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan50 ].
						currentCharacter == $> ifTrue: [ ^ self scan51 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan50 ].
							currentCharacter == $> ifTrue: [ ^ self scan51 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan50 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 8 17 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan50 ].
									currentCharacter == $> ifTrue: [ ^ self scan51 ] ] ] ] ] ] ] ].
		^ self scan49 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan51 ].
	^ self scan49
]

{ #category : #generated }
HTMLScanner >> scan51 [

	[ 
	self recordMatch: #( 8 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan50 ].
	currentCharacter == $> ] whileTrue.
	^ self scan49
]

{ #category : #generated }
HTMLScanner >> scan52 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan53 ].
	currentCharacter == $> ifTrue: [ ^ self scan54 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan53 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan53 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 9 18 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan53 ].
			currentCharacter == $> ifTrue: [ ^ self scan54 ].
			^ self scan52 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan53 ].
			currentCharacter == $> ifTrue: [ ^ self scan54 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan53 ].
				currentCharacter == $> ifTrue: [ ^ self scan54 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan53 ].
					currentCharacter == $> ifTrue: [ ^ self scan54 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan53 ].
						currentCharacter == $> ifTrue: [ ^ self scan54 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan53 ].
							currentCharacter == $> ifTrue: [ ^ self scan54 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan53 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 9 17 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan53 ].
									currentCharacter == $> ifTrue: [ ^ self scan54 ] ] ] ] ] ] ] ].
		^ self scan52 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan54 ].
	^ self scan52
]

{ #category : #generated }
HTMLScanner >> scan54 [

	[ 
	self recordMatch: #( 9 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan53 ].
	currentCharacter == $> ] whileTrue.
	^ self scan52
]

{ #category : #generated }
HTMLScanner >> scan55 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan56 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan56 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan57 ].
	currentCharacter == $< ] whileTrue.
	^ self scan55
]

{ #category : #generated }
HTMLScanner >> scan57 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan56 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 18 20 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan56 ].
		^ self scan55 ].
	currentCharacter == $s ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan56 ].
		currentCharacter == $c ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan56 ].
			currentCharacter == $r ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan56 ].
				currentCharacter == $i ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan56 ].
					currentCharacter == $p ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan56 ].
						currentCharacter == $t ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan56 ].
							currentCharacter == $> ifTrue: [ 
								self recordMatch: #( 17 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan56 ] ] ] ] ] ].
			^ self scan55 ].
		currentCharacter == $t ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan56 ].
			currentCharacter == $y ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan56 ].
				currentCharacter == $l ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan56 ].
					currentCharacter == $e ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan56 ].
						currentCharacter == $> ifTrue: [ 
							self recordMatch: #( 19 ).
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan56 ] ] ] ] ] ] ].
	^ self scan55
]

{ #category : #generated }
HTMLScanner >> scan58 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	(currentCharacter == $: or: [ 
		 (currentCharacter between: $A and: $Z) or: [ 
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan59 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan59 [

	[ 
	self recordMatch: #( 16 ).
	self step.
	currentCharacter == $) ifTrue: [ 
		self recordMatch: #( 16 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan2 ].
		currentCharacter == $] ifTrue: [ ^ self scan60 ].
		^ self scan1 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	currentCharacter == $] ifTrue: [ ^ self scan60 ].
	(currentCharacter between: $- and: $.) or: [ 
		(currentCharacter between: $0 and: $:) or: [ 
			(currentCharacter between: $A and: $Z) or: [ 
				currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ]
		whileTrue.
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan6 [

	[ 
	self recordMatch: #( 7 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	(currentCharacter between: Character tab and: Character lf) or: [ 
		currentCharacter == Character cr or: [ 
			currentCharacter == Character space ] ] ] whileTrue.
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan60 [

	self recordMatch: #( 16 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan61 [

	self step.
	currentCharacter == $# ifTrue: [ ^ self scan58 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	(currentCharacter == $: or: [ 
		 (currentCharacter between: $A and: $Z) or: [ 
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan59 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan7 [

	[ 
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan8 ].
	currentCharacter == $< ifTrue: [ ^ self scan9 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan8 [

	self recordMatch: #( 21 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan9 [

	[ 
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan8 ].
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $" ifTrue: [ ^ self scan8 ].
		currentCharacter == $< ifTrue: [ ^ self scan9 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 18 ).
			self step.
			currentCharacter == $" ifTrue: [ ^ self scan8 ].
			currentCharacter == $< ifTrue: [ ^ self scan9 ].
			^ self scan7 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $" ifTrue: [ ^ self scan8 ].
			currentCharacter == $< ifTrue: [ ^ self scan9 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $" ifTrue: [ ^ self scan8 ].
				currentCharacter == $< ifTrue: [ ^ self scan9 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $" ifTrue: [ ^ self scan8 ].
					currentCharacter == $< ifTrue: [ ^ self scan9 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $" ifTrue: [ ^ self scan8 ].
						currentCharacter == $< ifTrue: [ ^ self scan9 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $" ifTrue: [ ^ self scan8 ].
							currentCharacter == $< ifTrue: [ ^ self scan9 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $" ifTrue: [ ^ self scan8 ].
								currentCharacter == $< ifTrue: [ ^ self scan9 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 17 ).
									self step.
									currentCharacter == $" ifTrue: [ ^ self scan8 ].
									currentCharacter == $< ifTrue: [ ^ self scan9 ] ] ] ] ] ] ] ].
		^ self scan7 ].
	currentCharacter == $< ] whileTrue.
	^ self scan7
]

{ #category : #generated }
HTMLScanner >> scanForToken [

	scope == #style ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan56 ].
		((currentCharacter between: Character tab and: Character lf) or: [ 
			 currentCharacter == Character cr or: [ 
				 currentCharacter == Character space ] ]) ifTrue: [ 
			[ 
			self recordMatch: #( 7 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan56 ].
			(currentCharacter between: Character tab and: Character lf) or: [ 
				currentCharacter == Character cr or: [ 
					currentCharacter == Character space ] ] ] whileTrue ].
		^ self scan55 ].
	scope == #default ifTrue: [ ^ self scan19 ].
	scope == #attvalue ifTrue: [ ^ self scanForTokenX2 ].
	scope == #tag ifTrue: [ ^ self scanForTokenX1 ].
	^ self reportLastMatch
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1 [

	self step.
	currentCharacter == $# ifTrue: [ ^ self scan58 ].
	^ self scanForTokenX1X5
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X1 [

	self step.
	currentCharacter == $# ifTrue: [ ^ self scan58 ].
	currentCharacter == $( ifTrue: [ ^ self scan61 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	(currentCharacter == $: or: [ 
		 (currentCharacter between: $A and: $Z) or: [ 
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan59 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X2 [

	self recordMatch: #( 14 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 13 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan2 ] ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X3 [

	self recordMatch: #( 12 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X4 [

	self recordMatch: #( 15 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X5 [

	currentCharacter == $( ifTrue: [ ^ self scan61 ].
	currentCharacter == $/ ifTrue: [ ^ self scanForTokenX1X2 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	currentCharacter == $= ifTrue: [ ^ self scanForTokenX1X4 ].
	currentCharacter == $> ifTrue: [ ^ self scanForTokenX1X3 ].
	currentCharacter == $[ ifTrue: [ ^ self scanForTokenX1X1 ].
	((currentCharacter between: Character tab and: Character lf) or: [ 
		 currentCharacter == Character cr or: [ 
			 currentCharacter == Character space ] ]) ifTrue: [ ^ self scan6 ].
	(currentCharacter == $: or: [ 
		 (currentCharacter between: $A and: $Z) or: [ 
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan59 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scanForTokenX2 [

	self step.
	currentCharacter == Character space ifTrue: [ self scanForTokenX2X1 ].
	currentCharacter == $" ifTrue: [ ^ self scan7 ].
	currentCharacter == $# ifTrue: [ ^ self scan10 ].
	currentCharacter == $' ifTrue: [ ^ self scan16 ].
	currentCharacter == $< ifTrue: [ ^ self scan12 ].
	currentCharacter isDigit ifTrue: [ ^ self scan18 ].
	((currentCharacter between: Character tab and: Character lf) or: [ 
		 currentCharacter == Character cr ]) ifTrue: [ ^ self scan6 ].
	((currentCharacter between: $+ and: $?) or: [ 
		 (currentCharacter between: $A and: $Z) or: [ 
			 currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ]) 
		ifTrue: [ ^ self scan11 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scanForTokenX2X1 [

	[ 
	self recordMatch: #( 7 ).
	self step.
	currentCharacter == Character space ] whileTrue
]
