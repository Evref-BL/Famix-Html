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
	currentCharacter == Character space ifTrue: [ ^ self scan6 ].
	currentCharacter == $/ ifTrue: [ ^ self scan11 ].
	currentCharacter == $< ] whileTrue.
	(currentCharacter == $# or: [ 
		 (currentCharacter between: $+ and: $?) or: [ 
			 (currentCharacter between: $A and: $Z) or: [ 
				 currentCharacter == $_ or: [ 
					 currentCharacter between: $a and: $z ] ] ] ]) ifTrue: [ 
		^ self scan9 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan11 [

	self recordMatch: #( 21 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan6 ].
	currentCharacter == $< ifTrue: [ ^ self scan10 ].
	currentCharacter == $> ifTrue: [ ^ self scan11X1 ].
	currentCharacter == $s ifTrue: [ ^ self scan12 ].
	(currentCharacter <= $" or: [ 
		 (currentCharacter between: $$ and: $*) or: [ 
			 currentCharacter == $@ or: [ 
				 (currentCharacter between: $[ and: $^) or: [ 
					 currentCharacter == $` or: [ currentCharacter >= ${ ] ] ] ] ]) 
		ifTrue: [ ^ self scan1 ].
	^ self scan9
]

{ #category : #generated }
HTMLScanner >> scan11X1 [

	self recordMatch: #( 18 21 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan6 ].
	currentCharacter == $< ifTrue: [ ^ self scan10 ].
	(currentCharacter == $# or: [ 
		 (currentCharacter between: $+ and: $?) or: [ 
			 (currentCharacter between: $A and: $Z) or: [ 
				 currentCharacter == $_ or: [ 
					 currentCharacter between: $a and: $z ] ] ] ]) ifTrue: [ 
		^ self scan9 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan12 [

	self recordMatch: #( 21 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan6 ].
	currentCharacter == $< ifTrue: [ ^ self scan10 ].
	currentCharacter == $c ifTrue: [ ^ self scan13 ].
	(currentCharacter == $# or: [ 
		 (currentCharacter between: $+ and: $?) or: [ 
			 (currentCharacter between: $A and: $Z) or: [ 
				 currentCharacter == $_ or: [ 
					 currentCharacter between: $a and: $z ] ] ] ]) ifTrue: [ 
		^ self scan9 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan13 [

	self recordMatch: #( 21 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan6 ].
	currentCharacter == $< ifTrue: [ ^ self scan10 ].
	currentCharacter == $r ifTrue: [ 
		self recordMatch: #( 21 ).
		self step.
		currentCharacter == Character space ifTrue: [ ^ self scan6 ].
		currentCharacter == $< ifTrue: [ ^ self scan10 ].
		currentCharacter == $i ifTrue: [ 
			self recordMatch: #( 21 ).
			self step.
			currentCharacter == Character space ifTrue: [ ^ self scan6 ].
			currentCharacter == $< ifTrue: [ ^ self scan10 ].
			currentCharacter == $p ifTrue: [ 
				self recordMatch: #( 21 ).
				self step.
				currentCharacter == Character space ifTrue: [ ^ self scan6 ].
				currentCharacter == $< ifTrue: [ ^ self scan10 ].
				currentCharacter == $t ifTrue: [ 
					self recordMatch: #( 21 ).
					self step.
					currentCharacter == Character space ifTrue: [ ^ self scan6 ].
					currentCharacter == $< ifTrue: [ ^ self scan10 ].
					currentCharacter == $> ifTrue: [ 
						self recordMatch: #( 17 21 ).
						self step.
						currentCharacter == Character space ifTrue: [ ^ self scan6 ].
						currentCharacter == $< ifTrue: [ ^ self scan10 ] ] ] ] ] ].
	(currentCharacter == $# or: [ 
		 (currentCharacter between: $+ and: $?) or: [ 
			 (currentCharacter between: $A and: $Z) or: [ 
				 currentCharacter == $_ or: [ 
					 currentCharacter between: $a and: $z ] ] ] ]) ifTrue: [ 
		^ self scan9 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan14 [

	[ 
	self step.
	currentCharacter == $' ifTrue: [ ^ self scan6 ].
	currentCharacter == $< ifTrue: [ ^ self scan15 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan15 [

	[ 
	self step.
	currentCharacter == $' ifTrue: [ ^ self scan6 ].
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $' ifTrue: [ ^ self scan6 ].
		currentCharacter == $< ifTrue: [ ^ self scan15 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 18 ).
			self step.
			currentCharacter == $' ifTrue: [ ^ self scan6 ].
			currentCharacter == $< ifTrue: [ ^ self scan15 ].
			^ self scan14 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $' ifTrue: [ ^ self scan6 ].
			currentCharacter == $< ifTrue: [ ^ self scan15 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $' ifTrue: [ ^ self scan6 ].
				currentCharacter == $< ifTrue: [ ^ self scan15 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $' ifTrue: [ ^ self scan6 ].
					currentCharacter == $< ifTrue: [ ^ self scan15 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $' ifTrue: [ ^ self scan6 ].
						currentCharacter == $< ifTrue: [ ^ self scan15 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $' ifTrue: [ ^ self scan6 ].
							currentCharacter == $< ifTrue: [ ^ self scan15 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $' ifTrue: [ ^ self scan6 ].
								currentCharacter == $< ifTrue: [ ^ self scan15 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 17 ).
									self step.
									currentCharacter == $' ifTrue: [ ^ self scan6 ].
									currentCharacter == $< ifTrue: [ ^ self scan15 ] ] ] ] ] ] ] ].
		^ self scan14 ].
	currentCharacter == $< ] whileTrue.
	^ self scan14
]

{ #category : #generated }
HTMLScanner >> scan16 [

	[ 
	self recordMatch: #( 21 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan10 ].
	currentCharacter isDigit ] whileTrue.
	(currentCharacter == Character space or: [ currentCharacter == $% ]) 
		ifTrue: [ ^ self scan6 ].
	(currentCharacter == $# or: [ 
		 (currentCharacter between: $+ and: $?) or: [ 
			 (currentCharacter between: $A and: $Z) or: [ 
				 currentCharacter == $_ or: [ 
					 currentCharacter between: $a and: $z ] ] ] ]) ifTrue: [ 
		^ self scan9 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan17 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan19 ].
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
	^ self scan18
]

{ #category : #generated }
HTMLScanner >> scan18 [

	[ 
	self recordMatch: #( 11 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan19 [

	self recordMatch: #( 10 ).
	self step.
	currentCharacter == $! ifTrue: [ ^ self scan19X1 ].
	currentCharacter == $% ifTrue: [ ^ self scan36 ].
	currentCharacter == $/ ifTrue: [ ^ self scan3 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	currentCharacter == $? ifTrue: [ ^ self scan19X2 ].
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
						currentCharacter == $t ifTrue: [ ^ self scan47 ] ] ] ].
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
					currentCharacter == $e ifTrue: [ ^ self scan50 ] ] ] ] ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan19X1 [

	self step.
	currentCharacter == $- ifTrue: [ 
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan23 ].
		currentCharacter == $< ifTrue: [ ^ self scan2 ].
		^ self scan1 ].
	currentCharacter == $< ifTrue: [ ^ self scan21 ].
	currentCharacter == $[ ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan27 ].
		currentCharacter == $> ifTrue: [ ^ self scan29 ].
		currentCharacter == $C ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan27 ].
			currentCharacter == $> ifTrue: [ ^ self scan29 ].
			currentCharacter == $D ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan27 ].
				currentCharacter == $> ifTrue: [ ^ self scan29 ].
				currentCharacter == $A ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan27 ].
					currentCharacter == $> ifTrue: [ ^ self scan29 ].
					currentCharacter == $T ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan27 ].
						currentCharacter == $> ifTrue: [ ^ self scan29 ].
						currentCharacter == $A ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan27 ].
							currentCharacter == $> ifTrue: [ ^ self scan29 ].
							currentCharacter == $[ ifTrue: [ ^ self scan31 ] ] ] ] ] ].
		currentCharacter == $] ifTrue: [ ^ self scan30 ].
		^ self scan26 ].
	^ self scan20
]

{ #category : #generated }
HTMLScanner >> scan19X2 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan40 ].
	currentCharacter == $? ifTrue: [ ^ self scan41 ].
	currentCharacter == $x ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan40 ].
		currentCharacter == $? ifTrue: [ ^ self scan41 ].
		currentCharacter == $m ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan40 ].
			currentCharacter == $? ifTrue: [ ^ self scan41 ].
			currentCharacter == $l ifTrue: [ ^ self scan42 ] ] ].
	^ self scan39
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
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan21 ].
	currentCharacter == $> ifTrue: [ ^ self scan22 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan21 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan21 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 5 18 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan21 ].
			currentCharacter == $> ifTrue: [ ^ self scan22 ].
			^ self scan20 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan21 ].
			currentCharacter == $> ifTrue: [ ^ self scan22 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan21 ].
				currentCharacter == $> ifTrue: [ ^ self scan22 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan21 ].
					currentCharacter == $> ifTrue: [ ^ self scan22 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan21 ].
						currentCharacter == $> ifTrue: [ ^ self scan22 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan21 ].
							currentCharacter == $> ifTrue: [ ^ self scan22 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan21 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 5 17 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan21 ].
									currentCharacter == $> ifTrue: [ ^ self scan22 ] ] ] ] ] ] ] ].
		^ self scan20 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan22 ].
	^ self scan20
]

{ #category : #generated }
HTMLScanner >> scan22 [

	[ 
	self recordMatch: #( 5 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan21 ].
	currentCharacter == $> ] whileTrue.
	^ self scan20
]

{ #category : #generated }
HTMLScanner >> scan23 [

	[ 
	self step.
	currentCharacter == $- ifTrue: [ ^ self scan24 ].
	currentCharacter == $< ifTrue: [ ^ self scan25 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan24 [

	self step.
	currentCharacter == $- ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan2 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 1 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan2 ] ].
		^ self scan1 ].
	currentCharacter == $< ifTrue: [ ^ self scan25 ].
	^ self scan23
]

{ #category : #generated }
HTMLScanner >> scan25 [

	[ 
	self step.
	currentCharacter == $- ifTrue: [ ^ self scan24 ].
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan24 ].
		currentCharacter == $< ifTrue: [ ^ self scan25 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 18 ).
			self step.
			currentCharacter == $- ifTrue: [ ^ self scan24 ].
			currentCharacter == $< ifTrue: [ ^ self scan25 ].
			^ self scan23 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $- ifTrue: [ ^ self scan24 ].
			currentCharacter == $< ifTrue: [ ^ self scan25 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $- ifTrue: [ ^ self scan24 ].
				currentCharacter == $< ifTrue: [ ^ self scan25 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $- ifTrue: [ ^ self scan24 ].
					currentCharacter == $< ifTrue: [ ^ self scan25 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $- ifTrue: [ ^ self scan24 ].
						currentCharacter == $< ifTrue: [ ^ self scan25 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $- ifTrue: [ ^ self scan24 ].
							currentCharacter == $< ifTrue: [ ^ self scan25 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $- ifTrue: [ ^ self scan24 ].
								currentCharacter == $< ifTrue: [ ^ self scan25 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 17 ).
									self step.
									currentCharacter == $- ifTrue: [ ^ self scan24 ].
									currentCharacter == $< ifTrue: [ ^ self scan25 ] ] ] ] ] ] ] ].
		^ self scan23 ].
	currentCharacter == $< ] whileTrue.
	^ self scan23
]

{ #category : #generated }
HTMLScanner >> scan26 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan27 ].
	currentCharacter == $> ifTrue: [ ^ self scan29 ].
	currentCharacter == $] ifTrue: [ ^ self scan30 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan27 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan28 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan29 ].
	currentCharacter == $] ifTrue: [ ^ self scan30 ].
	^ self scan26
]

{ #category : #generated }
HTMLScanner >> scan28 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan27 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 5 18 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan27 ].
		currentCharacter == $> ifTrue: [ ^ self scan29 ].
		currentCharacter == $] ifTrue: [ ^ self scan30 ].
		^ self scan26 ].
	currentCharacter == $] ifTrue: [ ^ self scan30 ].
	currentCharacter == $s ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan27 ].
		currentCharacter == $> ifTrue: [ ^ self scan29 ].
		currentCharacter == $] ifTrue: [ ^ self scan30 ].
		currentCharacter == $c ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan27 ].
			currentCharacter == $> ifTrue: [ ^ self scan29 ].
			currentCharacter == $] ifTrue: [ ^ self scan30 ].
			currentCharacter == $r ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan27 ].
				currentCharacter == $> ifTrue: [ ^ self scan29 ].
				currentCharacter == $] ifTrue: [ ^ self scan30 ].
				currentCharacter == $i ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan27 ].
					currentCharacter == $> ifTrue: [ ^ self scan29 ].
					currentCharacter == $] ifTrue: [ ^ self scan30 ].
					currentCharacter == $p ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan27 ].
						currentCharacter == $> ifTrue: [ ^ self scan29 ].
						currentCharacter == $] ifTrue: [ ^ self scan30 ].
						currentCharacter == $t ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan27 ].
							currentCharacter == $> ifTrue: [ 
								self recordMatch: #( 5 17 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan27 ].
								currentCharacter == $> ifTrue: [ ^ self scan29 ] ].
							currentCharacter == $] ifTrue: [ ^ self scan30 ] ] ] ] ] ] ].
	^ self scan26
]

{ #category : #generated }
HTMLScanner >> scan29 [

	[ 
	self recordMatch: #( 5 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan27 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $] ifTrue: [ ^ self scan30 ].
	^ self scan26
]

{ #category : #generated }
HTMLScanner >> scan3 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 18 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan2 ].
		^ self scan1 ].
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
							currentCharacter == $> ifTrue: [ 
								self recordMatch: #( 17 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan2 ] ] ] ] ] ] ] ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan30 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan27 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 2 5 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan27 ].
		currentCharacter == $> ifTrue: [ ^ self scan29 ].
		currentCharacter == $] ifTrue: [ ^ self scan30 ].
		^ self scan26 ].
	currentCharacter == $] ] whileTrue.
	^ self scan26
]

{ #category : #generated }
HTMLScanner >> scan31 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan32 ].
	currentCharacter == $> ifTrue: [ ^ self scan34 ].
	currentCharacter == $] ifTrue: [ ^ self scan35 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan32 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan33 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan34 ].
	currentCharacter == $] ifTrue: [ ^ self scan35 ].
	^ self scan31
]

{ #category : #generated }
HTMLScanner >> scan33 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan32 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 5 18 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan32 ].
		currentCharacter == $> ifTrue: [ ^ self scan34 ].
		currentCharacter == $] ifTrue: [ ^ self scan35 ].
		^ self scan31 ].
	currentCharacter == $] ifTrue: [ ^ self scan35 ].
	currentCharacter == $s ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan32 ].
		currentCharacter == $> ifTrue: [ ^ self scan34 ].
		currentCharacter == $] ifTrue: [ ^ self scan35 ].
		currentCharacter == $c ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan32 ].
			currentCharacter == $> ifTrue: [ ^ self scan34 ].
			currentCharacter == $] ifTrue: [ ^ self scan35 ].
			currentCharacter == $r ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan32 ].
				currentCharacter == $> ifTrue: [ ^ self scan34 ].
				currentCharacter == $] ifTrue: [ ^ self scan35 ].
				currentCharacter == $i ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan32 ].
					currentCharacter == $> ifTrue: [ ^ self scan34 ].
					currentCharacter == $] ifTrue: [ ^ self scan35 ].
					currentCharacter == $p ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan32 ].
						currentCharacter == $> ifTrue: [ ^ self scan34 ].
						currentCharacter == $] ifTrue: [ ^ self scan35 ].
						currentCharacter == $t ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan32 ].
							currentCharacter == $> ifTrue: [ 
								self recordMatch: #( 5 17 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan32 ].
								currentCharacter == $> ifTrue: [ ^ self scan34 ] ].
							currentCharacter == $] ifTrue: [ ^ self scan35 ] ] ] ] ] ] ].
	^ self scan31
]

{ #category : #generated }
HTMLScanner >> scan34 [

	[ 
	self recordMatch: #( 5 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan32 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $] ifTrue: [ ^ self scan35 ].
	^ self scan31
]

{ #category : #generated }
HTMLScanner >> scan35 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan32 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 2 5 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan32 ].
		currentCharacter == $> ifTrue: [ ^ self scan34 ].
		currentCharacter == $] ifTrue: [ ^ self scan35 ].
		^ self scan31 ].
	currentCharacter == $] ifTrue: [ 
		[ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan32 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 2 4 5 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan32 ].
			currentCharacter == $> ifTrue: [ ^ self scan34 ].
			currentCharacter == $] ifTrue: [ ^ self scan35 ].
			^ self scan31 ].
		currentCharacter == $] ] whileTrue ].
	^ self scan31
]

{ #category : #generated }
HTMLScanner >> scan36 [

	[ 
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan37 ].
	currentCharacter == $< ifTrue: [ ^ self scan38 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan37 [

	[ 
	self step.
	currentCharacter == $% ] whileTrue.
	currentCharacter == $< ifTrue: [ ^ self scan38 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 6 ).
		self step.
		currentCharacter == $% ifTrue: [ ^ self scan37 ].
		currentCharacter == $< ifTrue: [ ^ self scan38 ] ].
	^ self scan36
]

{ #category : #generated }
HTMLScanner >> scan38 [

	[ 
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan37 ].
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $% ifTrue: [ ^ self scan37 ].
		currentCharacter == $< ifTrue: [ ^ self scan38 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 18 ).
			self step.
			currentCharacter == $% ifTrue: [ ^ self scan37 ].
			currentCharacter == $< ifTrue: [ ^ self scan38 ].
			^ self scan36 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $% ifTrue: [ ^ self scan37 ].
			currentCharacter == $< ifTrue: [ ^ self scan38 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $% ifTrue: [ ^ self scan37 ].
				currentCharacter == $< ifTrue: [ ^ self scan38 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $% ifTrue: [ ^ self scan37 ].
					currentCharacter == $< ifTrue: [ ^ self scan38 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $% ifTrue: [ ^ self scan37 ].
						currentCharacter == $< ifTrue: [ ^ self scan38 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $% ifTrue: [ ^ self scan37 ].
							currentCharacter == $< ifTrue: [ ^ self scan38 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $% ifTrue: [ ^ self scan37 ].
								currentCharacter == $< ifTrue: [ ^ self scan38 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 17 ).
									self step.
									currentCharacter == $% ifTrue: [ ^ self scan37 ].
									currentCharacter == $< ifTrue: [ ^ self scan38 ] ] ] ] ] ] ] ].
		^ self scan36 ].
	currentCharacter == $< ] whileTrue.
	^ self scan36
]

{ #category : #generated }
HTMLScanner >> scan39 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan40 ].
	currentCharacter == $? ifTrue: [ ^ self scan41 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan4 [

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
HTMLScanner >> scan40 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan40 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 18 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan40 ].
			currentCharacter == $? ifTrue: [ ^ self scan41 ].
			^ self scan39 ].
		currentCharacter == $? ifTrue: [ ^ self scan41 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan40 ].
			currentCharacter == $? ifTrue: [ ^ self scan41 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan40 ].
				currentCharacter == $? ifTrue: [ ^ self scan41 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan40 ].
					currentCharacter == $? ifTrue: [ ^ self scan41 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan40 ].
						currentCharacter == $? ifTrue: [ ^ self scan41 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan40 ].
							currentCharacter == $? ifTrue: [ ^ self scan41 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan40 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 17 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan40 ] ].
								currentCharacter == $? ifTrue: [ ^ self scan41 ] ] ] ] ] ] ].
		^ self scan39 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $? ifTrue: [ ^ self scan41 ].
	^ self scan39
]

{ #category : #generated }
HTMLScanner >> scan41 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan40 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 6 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan40 ].
		currentCharacter == $? ifTrue: [ ^ self scan41 ].
		^ self scan39 ].
	currentCharacter == $? ] whileTrue.
	^ self scan39
]

{ #category : #generated }
HTMLScanner >> scan42 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan43 ].
	currentCharacter == $> ifTrue: [ ^ self scan45 ].
	currentCharacter == $? ifTrue: [ ^ self scan46 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan43 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan44 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan45 ].
	currentCharacter == $? ifTrue: [ ^ self scan46 ].
	^ self scan42
]

{ #category : #generated }
HTMLScanner >> scan44 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan43 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 3 18 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan43 ].
		currentCharacter == $> ifTrue: [ ^ self scan45 ].
		currentCharacter == $? ifTrue: [ ^ self scan46 ].
		^ self scan42 ].
	currentCharacter == $? ifTrue: [ ^ self scan46 ].
	currentCharacter == $s ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan43 ].
		currentCharacter == $> ifTrue: [ ^ self scan45 ].
		currentCharacter == $? ifTrue: [ ^ self scan46 ].
		currentCharacter == $c ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan43 ].
			currentCharacter == $> ifTrue: [ ^ self scan45 ].
			currentCharacter == $? ifTrue: [ ^ self scan46 ].
			currentCharacter == $r ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan43 ].
				currentCharacter == $> ifTrue: [ ^ self scan45 ].
				currentCharacter == $? ifTrue: [ ^ self scan46 ].
				currentCharacter == $i ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan43 ].
					currentCharacter == $> ifTrue: [ ^ self scan45 ].
					currentCharacter == $? ifTrue: [ ^ self scan46 ].
					currentCharacter == $p ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan43 ].
						currentCharacter == $> ifTrue: [ ^ self scan45 ].
						currentCharacter == $? ifTrue: [ ^ self scan46 ].
						currentCharacter == $t ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan43 ].
							currentCharacter == $> ifTrue: [ 
								self recordMatch: #( 3 17 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan43 ].
								currentCharacter == $> ifTrue: [ ^ self scan45 ] ].
							currentCharacter == $? ifTrue: [ ^ self scan46 ] ] ] ] ] ] ].
	^ self scan42
]

{ #category : #generated }
HTMLScanner >> scan45 [

	[ 
	self recordMatch: #( 3 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan43 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $? ifTrue: [ ^ self scan46 ].
	^ self scan42
]

{ #category : #generated }
HTMLScanner >> scan46 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan43 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 3 6 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan43 ].
		currentCharacter == $> ifTrue: [ ^ self scan45 ].
		currentCharacter == $? ifTrue: [ ^ self scan46 ].
		^ self scan42 ].
	currentCharacter == $? ] whileTrue.
	^ self scan42
]

{ #category : #generated }
HTMLScanner >> scan47 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan48 ].
	currentCharacter == $> ifTrue: [ ^ self scan49 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan48 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan48 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 8 18 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan48 ].
			currentCharacter == $> ifTrue: [ ^ self scan49 ].
			^ self scan47 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan48 ].
			currentCharacter == $> ifTrue: [ ^ self scan49 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan48 ].
				currentCharacter == $> ifTrue: [ ^ self scan49 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan48 ].
					currentCharacter == $> ifTrue: [ ^ self scan49 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan48 ].
						currentCharacter == $> ifTrue: [ ^ self scan49 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan48 ].
							currentCharacter == $> ifTrue: [ ^ self scan49 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan48 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 8 17 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan48 ].
									currentCharacter == $> ifTrue: [ ^ self scan49 ] ] ] ] ] ] ] ].
		^ self scan47 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan49 ].
	^ self scan47
]

{ #category : #generated }
HTMLScanner >> scan49 [

	[ 
	self recordMatch: #( 8 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan48 ].
	currentCharacter == $> ] whileTrue.
	^ self scan47
]

{ #category : #generated }
HTMLScanner >> scan5 [

	[ 
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan6 ].
	currentCharacter == $< ifTrue: [ ^ self scan7 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan50 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan51 ].
	currentCharacter == $> ifTrue: [ ^ self scan52 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan51 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan51 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 9 18 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan51 ].
			currentCharacter == $> ifTrue: [ ^ self scan52 ].
			^ self scan50 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan51 ].
			currentCharacter == $> ifTrue: [ ^ self scan52 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan51 ].
				currentCharacter == $> ifTrue: [ ^ self scan52 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan51 ].
					currentCharacter == $> ifTrue: [ ^ self scan52 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan51 ].
						currentCharacter == $> ifTrue: [ ^ self scan52 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan51 ].
							currentCharacter == $> ifTrue: [ ^ self scan52 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan51 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 9 17 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan51 ].
									currentCharacter == $> ifTrue: [ ^ self scan52 ] ] ] ] ] ] ] ].
		^ self scan50 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan52 ].
	^ self scan50
]

{ #category : #generated }
HTMLScanner >> scan52 [

	[ 
	self recordMatch: #( 9 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan51 ].
	currentCharacter == $> ] whileTrue.
	^ self scan50
]

{ #category : #generated }
HTMLScanner >> scan53 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan54 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan54 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan55 ].
	currentCharacter == $< ] whileTrue.
	^ self scan53
]

{ #category : #generated }
HTMLScanner >> scan55 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan54 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 18 20 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan54 ].
		^ self scan53 ].
	currentCharacter == $s ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan54 ].
		currentCharacter == $c ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan54 ].
			currentCharacter == $r ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan54 ].
				currentCharacter == $i ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan54 ].
					currentCharacter == $p ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan54 ].
						currentCharacter == $t ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan54 ].
							currentCharacter == $> ifTrue: [ 
								self recordMatch: #( 17 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan54 ] ] ] ] ] ].
			^ self scan53 ].
		currentCharacter == $t ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan54 ].
			currentCharacter == $y ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan54 ].
				currentCharacter == $l ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan54 ].
					currentCharacter == $e ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan54 ].
						currentCharacter == $> ifTrue: [ 
							self recordMatch: #( 19 ).
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan54 ] ] ] ] ] ] ].
	^ self scan53
]

{ #category : #generated }
HTMLScanner >> scan56 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	(currentCharacter == $: or: [ 
		 (currentCharacter between: $A and: $Z) or: [ 
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan57 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan57 [

	[ 
	self recordMatch: #( 16 ).
	self step.
	currentCharacter == $) ifTrue: [ 
		self recordMatch: #( 16 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan2 ].
		currentCharacter == $] ifTrue: [ ^ self scan58 ].
		^ self scan1 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	currentCharacter == $] ifTrue: [ ^ self scan58 ].
	(currentCharacter between: $- and: $.) or: [ 
		(currentCharacter between: $0 and: $:) or: [ 
			(currentCharacter between: $A and: $Z) or: [ 
				currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ]
		whileTrue.
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan58 [

	self recordMatch: #( 16 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan59 [

	self step.
	currentCharacter == $# ifTrue: [ ^ self scan56 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	(currentCharacter == $: or: [ 
		 (currentCharacter between: $A and: $Z) or: [ 
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan57 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan6 [

	self recordMatch: #( 21 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan7 [

	[ 
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan6 ].
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $" ifTrue: [ ^ self scan6 ].
		currentCharacter == $< ifTrue: [ ^ self scan7 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 18 ).
			self step.
			currentCharacter == $" ifTrue: [ ^ self scan6 ].
			currentCharacter == $< ifTrue: [ ^ self scan7 ].
			^ self scan5 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $" ifTrue: [ ^ self scan6 ].
			currentCharacter == $< ifTrue: [ ^ self scan7 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $" ifTrue: [ ^ self scan6 ].
				currentCharacter == $< ifTrue: [ ^ self scan7 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $" ifTrue: [ ^ self scan6 ].
					currentCharacter == $< ifTrue: [ ^ self scan7 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $" ifTrue: [ ^ self scan6 ].
						currentCharacter == $< ifTrue: [ ^ self scan7 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $" ifTrue: [ ^ self scan6 ].
							currentCharacter == $< ifTrue: [ ^ self scan7 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $" ifTrue: [ ^ self scan6 ].
								currentCharacter == $< ifTrue: [ ^ self scan7 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 17 ).
									self step.
									currentCharacter == $" ifTrue: [ ^ self scan6 ].
									currentCharacter == $< ifTrue: [ ^ self scan7 ] ] ] ] ] ] ] ].
		^ self scan5 ].
	currentCharacter == $< ] whileTrue.
	^ self scan5
]

{ #category : #generated }
HTMLScanner >> scan8 [

	[ 
	self recordMatch: #( 21 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan6 ].
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
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan9 [

	[ 
	self recordMatch: #( 21 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan6 ].
	currentCharacter == $< ifTrue: [ ^ self scan10 ].
	currentCharacter == $# or: [ 
		(currentCharacter between: $+ and: $?) or: [ 
			(currentCharacter between: $A and: $Z) or: [ 
				currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ]
		whileTrue.
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scanForToken [

	scope == #style ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan54 ].
		((currentCharacter between: Character tab and: Character lf) or: [ 
			 currentCharacter == Character cr or: [ 
				 currentCharacter == Character space ] ]) ifTrue: [ 
			[ 
			self recordMatch: #( 7 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan54 ].
			(currentCharacter between: Character tab and: Character lf) or: [ 
				currentCharacter == Character cr or: [ 
					currentCharacter == Character space ] ] ] whileTrue ].
		^ self scan53 ].
	scope == #default ifTrue: [ ^ self scan17 ].
	scope == #attvalue ifTrue: [ ^ self scanForTokenX2 ].
	scope == #tag ifTrue: [ ^ self scanForTokenX1 ].
	^ self reportLastMatch
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1 [

	self step.
	currentCharacter == $# ifTrue: [ ^ self scan56 ].
	^ self scanForTokenX1X5
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X1 [

	self step.
	currentCharacter == $# ifTrue: [ ^ self scan56 ].
	currentCharacter == $( ifTrue: [ ^ self scan59 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	(currentCharacter == $: or: [ 
		 (currentCharacter between: $A and: $Z) or: [ 
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan57 ].
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

	currentCharacter == $( ifTrue: [ ^ self scan59 ].
	currentCharacter == $/ ifTrue: [ ^ self scanForTokenX1X2 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	currentCharacter == $= ifTrue: [ ^ self scanForTokenX1X4 ].
	currentCharacter == $> ifTrue: [ ^ self scanForTokenX1X3 ].
	currentCharacter == $[ ifTrue: [ ^ self scanForTokenX1X1 ].
	((currentCharacter between: Character tab and: Character lf) or: [ 
		 currentCharacter == Character cr or: [ 
			 currentCharacter == Character space ] ]) ifTrue: [ ^ self scan4 ].
	(currentCharacter == $: or: [ 
		 (currentCharacter between: $A and: $Z) or: [ 
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan57 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scanForTokenX2 [

	self step.
	currentCharacter == Character space ifTrue: [ self scanForTokenX2X1 ].
	currentCharacter == $" ifTrue: [ ^ self scan5 ].
	currentCharacter == $# ifTrue: [ ^ self scan8 ].
	currentCharacter == $' ifTrue: [ ^ self scan14 ].
	currentCharacter == $< ifTrue: [ ^ self scan10 ].
	currentCharacter isDigit ifTrue: [ ^ self scan16 ].
	((currentCharacter between: Character tab and: Character lf) or: [ 
		 currentCharacter == Character cr ]) ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $+ and: $?) or: [ 
		 (currentCharacter between: $A and: $Z) or: [ 
			 currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ]) 
		ifTrue: [ ^ self scan9 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scanForTokenX2X1 [

	[ 
	self recordMatch: #( 7 ).
	self step.
	currentCharacter == Character space ] whileTrue
]
