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
	self step.
	currentCharacter == $' ifTrue: [ ^ self scan7 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan100 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan101 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan102 ].
	^ self scan99
]

{ #category : #generated }
HTMLScanner >> scan101 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan100 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 8 18 20 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan100 ].
		currentCharacter == $> ifTrue: [ ^ self scan102 ].
		^ self scan99 ].
	currentCharacter == $s ifTrue: [ ^ self scan103 ].
	^ self scan99
]

{ #category : #generated }
HTMLScanner >> scan102 [

	[ 
	self recordMatch: #( 8 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan100 ].
	currentCharacter == $> ] whileTrue.
	^ self scan99
]

{ #category : #generated }
HTMLScanner >> scan103 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan100 ].
	currentCharacter == $> ifTrue: [ ^ self scan102 ].
	currentCharacter == $c ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan100 ].
		currentCharacter == $> ifTrue: [ ^ self scan102 ].
		currentCharacter == $r ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan100 ].
			currentCharacter == $> ifTrue: [ ^ self scan102 ].
			currentCharacter == $i ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan100 ].
				currentCharacter == $> ifTrue: [ ^ self scan102 ].
				currentCharacter == $p ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan100 ].
					currentCharacter == $> ifTrue: [ ^ self scan102 ].
					currentCharacter == $t ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan100 ].
						currentCharacter == $> ifTrue: [ 
							self recordMatch: #( 8 17 ).
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan100 ].
							currentCharacter == $> ifTrue: [ ^ self scan102 ] ] ] ] ] ].
		^ self scan99 ].
	currentCharacter == $t ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan100 ].
		currentCharacter == $> ifTrue: [ ^ self scan102 ].
		currentCharacter == $y ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan100 ].
			currentCharacter == $> ifTrue: [ ^ self scan102 ].
			currentCharacter == $l ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan100 ].
				currentCharacter == $> ifTrue: [ ^ self scan102 ].
				currentCharacter == $e ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan100 ].
					currentCharacter == $> ifTrue: [ 
						self recordMatch: #( 8 19 ).
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan100 ].
						currentCharacter == $> ifTrue: [ ^ self scan102 ] ] ] ] ] ].
	^ self scan99
]

{ #category : #generated }
HTMLScanner >> scan104 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan105 ].
	currentCharacter == $> ifTrue: [ ^ self scan107 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan105 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan106 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan107 ].
	^ self scan104
]

{ #category : #generated }
HTMLScanner >> scan106 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan105 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 9 18 20 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan105 ].
		currentCharacter == $> ifTrue: [ ^ self scan107 ].
		^ self scan104 ].
	currentCharacter == $s ifTrue: [ ^ self scan108 ].
	^ self scan104
]

{ #category : #generated }
HTMLScanner >> scan107 [

	[ 
	self recordMatch: #( 9 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan105 ].
	currentCharacter == $> ] whileTrue.
	^ self scan104
]

{ #category : #generated }
HTMLScanner >> scan108 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan105 ].
	currentCharacter == $> ifTrue: [ ^ self scan107 ].
	currentCharacter == $c ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan105 ].
		currentCharacter == $> ifTrue: [ ^ self scan107 ].
		currentCharacter == $r ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan105 ].
			currentCharacter == $> ifTrue: [ ^ self scan107 ].
			currentCharacter == $i ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan105 ].
				currentCharacter == $> ifTrue: [ ^ self scan107 ].
				currentCharacter == $p ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan105 ].
					currentCharacter == $> ifTrue: [ ^ self scan107 ].
					currentCharacter == $t ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan105 ].
						currentCharacter == $> ifTrue: [ 
							self recordMatch: #( 9 17 ).
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan105 ].
							currentCharacter == $> ifTrue: [ ^ self scan107 ] ] ] ] ] ].
		^ self scan104 ].
	currentCharacter == $t ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan105 ].
		currentCharacter == $> ifTrue: [ ^ self scan107 ].
		currentCharacter == $y ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan105 ].
			currentCharacter == $> ifTrue: [ ^ self scan107 ].
			currentCharacter == $l ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan105 ].
				currentCharacter == $> ifTrue: [ ^ self scan107 ].
				currentCharacter == $e ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan105 ].
					currentCharacter == $> ifTrue: [ 
						self recordMatch: #( 9 19 ).
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan105 ].
						currentCharacter == $> ifTrue: [ ^ self scan107 ] ] ] ] ] ].
	^ self scan104
]

{ #category : #generated }
HTMLScanner >> scan109 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	(currentCharacter == $: or: [ 
		 (currentCharacter between: $A and: $Z) or: [ 
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ 
		^ self scan110 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan11 [

	[ 
	self recordMatch: #( 21 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	currentCharacter isDigit ] whileTrue.
	(currentCharacter == Character space or: [ currentCharacter == $% ]) 
		ifTrue: [ ^ self scan7 ].
	(currentCharacter == $# or: [ 
		 (currentCharacter between: $+ and: $=) or: [ 
			 currentCharacter == $? or: [ 
				 (currentCharacter between: $A and: $Z) or: [ 
					 currentCharacter == $_ or: [ 
						 currentCharacter between: $a and: $z ] ] ] ] ]) ifTrue: [ 
		^ self scan9 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan110 [

	[ 
	self recordMatch: #( 16 ).
	self step.
	currentCharacter == $) ifTrue: [ 
		self recordMatch: #( 16 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan2 ].
		currentCharacter == $] ifTrue: [ ^ self scan111 ].
		^ self scan1 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	currentCharacter == $] ifTrue: [ ^ self scan111 ].
	(currentCharacter between: $- and: $.) or: [ 
		(currentCharacter between: $0 and: $:) or: [ 
			(currentCharacter between: $A and: $Z) or: [ 
				currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ]
		whileTrue.
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan111 [

	self recordMatch: #( 16 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan12 [

	self recordMatch: #( 10 ).
	self step.
	currentCharacter == $! ifTrue: [ ^ self scan13 ].
	currentCharacter == $% ifTrue: [ ^ self scan32 ].
	currentCharacter == $/ ifTrue: [ ^ self scan3 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	currentCharacter == $? ifTrue: [ ^ self scan12X1 ].
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
						currentCharacter == $t ifTrue: [ ^ self scan43 ] ] ] ].
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
					currentCharacter == $e ifTrue: [ ^ self scan46 ] ] ] ] ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan12X1 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan36 ].
	currentCharacter == $? ifTrue: [ ^ self scan37 ].
	currentCharacter == $x ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan36 ].
		currentCharacter == $? ifTrue: [ ^ self scan37 ].
		currentCharacter == $m ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan36 ].
			currentCharacter == $? ifTrue: [ ^ self scan37 ].
			currentCharacter == $l ifTrue: [ ^ self scan38 ] ] ].
	^ self scan35
]

{ #category : #generated }
HTMLScanner >> scan13 [

	self step.
	currentCharacter == $- ifTrue: [ 
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan17 ].
		currentCharacter == $< ifTrue: [ ^ self scan15 ].
		currentCharacter == $> ifTrue: [ ^ self scan16 ].
		^ self scan14 ].
	currentCharacter == $< ifTrue: [ ^ self scan15 ].
	currentCharacter == $> ifTrue: [ ^ self scan16 ].
	currentCharacter == $[ ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan23 ].
		currentCharacter == $> ifTrue: [ ^ self scan25 ].
		currentCharacter == $C ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan23 ].
			currentCharacter == $> ifTrue: [ ^ self scan25 ].
			currentCharacter == $D ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan23 ].
				currentCharacter == $> ifTrue: [ ^ self scan25 ].
				currentCharacter == $A ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan23 ].
					currentCharacter == $> ifTrue: [ ^ self scan25 ].
					currentCharacter == $T ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan23 ].
						currentCharacter == $> ifTrue: [ ^ self scan25 ].
						currentCharacter == $A ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan23 ].
							currentCharacter == $> ifTrue: [ ^ self scan25 ].
							currentCharacter == $[ ifTrue: [ ^ self scan27 ] ] ] ] ] ].
		currentCharacter == $] ifTrue: [ ^ self scan26 ].
		^ self scan22 ].
	^ self scan14
]

{ #category : #generated }
HTMLScanner >> scan14 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan15 ].
	currentCharacter == $> ifTrue: [ ^ self scan16 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan15 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan15 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 5 18 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan15 ].
			currentCharacter == $> ifTrue: [ ^ self scan16 ].
			^ self scan14 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan15 ].
			currentCharacter == $> ifTrue: [ ^ self scan16 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan15 ].
				currentCharacter == $> ifTrue: [ ^ self scan16 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan15 ].
					currentCharacter == $> ifTrue: [ ^ self scan16 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan15 ].
						currentCharacter == $> ifTrue: [ ^ self scan16 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan15 ].
							currentCharacter == $> ifTrue: [ ^ self scan16 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan15 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 5 17 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan15 ].
									currentCharacter == $> ifTrue: [ ^ self scan16 ] ] ] ] ] ] ] ].
		^ self scan14 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan16 ].
	^ self scan14
]

{ #category : #generated }
HTMLScanner >> scan16 [

	[ 
	self recordMatch: #( 5 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan15 ].
	currentCharacter == $> ] whileTrue.
	^ self scan14
]

{ #category : #generated }
HTMLScanner >> scan17 [

	[ 
	self step.
	currentCharacter == $- ifTrue: [ ^ self scan18 ].
	currentCharacter == $< ifTrue: [ ^ self scan19 ].
	currentCharacter == $> ifTrue: [ ^ self scan21 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan18 [

	self step.
	currentCharacter == $- ifTrue: [ 
		[ 
		self step.
		currentCharacter == $- ] whileTrue.
		currentCharacter == $< ifTrue: [ ^ self scan19 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 1 5 ).
			self step.
			currentCharacter == $- ifTrue: [ ^ self scan18 ].
			currentCharacter == $< ifTrue: [ ^ self scan19 ].
			currentCharacter == $> ifTrue: [ ^ self scan21 ] ].
		^ self scan17 ].
	currentCharacter == $< ifTrue: [ ^ self scan19 ].
	currentCharacter == $> ifTrue: [ ^ self scan21 ].
	^ self scan17
]

{ #category : #generated }
HTMLScanner >> scan19 [

	[ 
	self step.
	currentCharacter == $- ifTrue: [ ^ self scan18 ].
	currentCharacter == $/ ifTrue: [ ^ self scan20 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan21 ].
	^ self scan17
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

	self step.
	currentCharacter == $- ifTrue: [ ^ self scan18 ].
	currentCharacter == $< ifTrue: [ ^ self scan19 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 5 18 ).
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan18 ].
		currentCharacter == $< ifTrue: [ ^ self scan19 ].
		currentCharacter == $> ifTrue: [ ^ self scan21 ].
		^ self scan17 ].
	currentCharacter == $s ifTrue: [ 
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan18 ].
		currentCharacter == $< ifTrue: [ ^ self scan19 ].
		currentCharacter == $> ifTrue: [ ^ self scan21 ].
		currentCharacter == $c ifTrue: [ 
			self step.
			currentCharacter == $- ifTrue: [ ^ self scan18 ].
			currentCharacter == $< ifTrue: [ ^ self scan19 ].
			currentCharacter == $> ifTrue: [ ^ self scan21 ].
			currentCharacter == $r ifTrue: [ 
				self step.
				currentCharacter == $- ifTrue: [ ^ self scan18 ].
				currentCharacter == $< ifTrue: [ ^ self scan19 ].
				currentCharacter == $> ifTrue: [ ^ self scan21 ].
				currentCharacter == $i ifTrue: [ 
					self step.
					currentCharacter == $- ifTrue: [ ^ self scan18 ].
					currentCharacter == $< ifTrue: [ ^ self scan19 ].
					currentCharacter == $> ifTrue: [ ^ self scan21 ].
					currentCharacter == $p ifTrue: [ 
						self step.
						currentCharacter == $- ifTrue: [ ^ self scan18 ].
						currentCharacter == $< ifTrue: [ ^ self scan19 ].
						currentCharacter == $> ifTrue: [ ^ self scan21 ].
						currentCharacter == $t ifTrue: [ 
							self step.
							currentCharacter == $- ifTrue: [ ^ self scan18 ].
							currentCharacter == $< ifTrue: [ ^ self scan19 ].
							currentCharacter == $> ifTrue: [ 
								self recordMatch: #( 5 17 ).
								self step.
								currentCharacter == $- ifTrue: [ ^ self scan18 ].
								currentCharacter == $< ifTrue: [ ^ self scan19 ].
								currentCharacter == $> ifTrue: [ ^ self scan21 ] ] ] ] ] ] ] ].
	^ self scan17
]

{ #category : #generated }
HTMLScanner >> scan21 [

	[ 
	self recordMatch: #( 5 ).
	self step.
	currentCharacter == $- ifTrue: [ ^ self scan18 ].
	currentCharacter == $< ifTrue: [ ^ self scan19 ].
	currentCharacter == $> ] whileTrue.
	^ self scan17
]

{ #category : #generated }
HTMLScanner >> scan22 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan23 ].
	currentCharacter == $> ifTrue: [ ^ self scan25 ].
	currentCharacter == $] ifTrue: [ ^ self scan26 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan23 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan24 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan25 ].
	currentCharacter == $] ifTrue: [ ^ self scan26 ].
	^ self scan22
]

{ #category : #generated }
HTMLScanner >> scan24 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan23 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 5 18 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan23 ].
		currentCharacter == $> ifTrue: [ ^ self scan25 ].
		currentCharacter == $] ifTrue: [ ^ self scan26 ].
		^ self scan22 ].
	currentCharacter == $] ifTrue: [ ^ self scan26 ].
	currentCharacter == $s ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan23 ].
		currentCharacter == $> ifTrue: [ ^ self scan25 ].
		currentCharacter == $] ifTrue: [ ^ self scan26 ].
		currentCharacter == $c ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan23 ].
			currentCharacter == $> ifTrue: [ ^ self scan25 ].
			currentCharacter == $] ifTrue: [ ^ self scan26 ].
			currentCharacter == $r ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan23 ].
				currentCharacter == $> ifTrue: [ ^ self scan25 ].
				currentCharacter == $] ifTrue: [ ^ self scan26 ].
				currentCharacter == $i ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan23 ].
					currentCharacter == $> ifTrue: [ ^ self scan25 ].
					currentCharacter == $] ifTrue: [ ^ self scan26 ].
					currentCharacter == $p ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan23 ].
						currentCharacter == $> ifTrue: [ ^ self scan25 ].
						currentCharacter == $] ifTrue: [ ^ self scan26 ].
						currentCharacter == $t ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan23 ].
							currentCharacter == $> ifTrue: [ 
								self recordMatch: #( 5 17 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan23 ].
								currentCharacter == $> ifTrue: [ ^ self scan25 ] ].
							currentCharacter == $] ifTrue: [ ^ self scan26 ] ] ] ] ] ] ].
	^ self scan22
]

{ #category : #generated }
HTMLScanner >> scan25 [

	[ 
	self recordMatch: #( 5 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan23 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $] ifTrue: [ ^ self scan26 ].
	^ self scan22
]

{ #category : #generated }
HTMLScanner >> scan26 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan23 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 2 5 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan23 ].
		currentCharacter == $> ifTrue: [ ^ self scan25 ].
		currentCharacter == $] ifTrue: [ ^ self scan26 ].
		^ self scan22 ].
	currentCharacter == $] ] whileTrue.
	^ self scan22
]

{ #category : #generated }
HTMLScanner >> scan27 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan28 ].
	currentCharacter == $> ifTrue: [ ^ self scan30 ].
	currentCharacter == $] ifTrue: [ ^ self scan31 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan28 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan29 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan30 ].
	currentCharacter == $] ifTrue: [ ^ self scan31 ].
	^ self scan27
]

{ #category : #generated }
HTMLScanner >> scan29 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan28 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 5 18 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan28 ].
		currentCharacter == $> ifTrue: [ ^ self scan30 ].
		currentCharacter == $] ifTrue: [ ^ self scan31 ].
		^ self scan27 ].
	currentCharacter == $] ifTrue: [ ^ self scan31 ].
	currentCharacter == $s ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan28 ].
		currentCharacter == $> ifTrue: [ ^ self scan30 ].
		currentCharacter == $] ifTrue: [ ^ self scan31 ].
		currentCharacter == $c ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan28 ].
			currentCharacter == $> ifTrue: [ ^ self scan30 ].
			currentCharacter == $] ifTrue: [ ^ self scan31 ].
			currentCharacter == $r ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan28 ].
				currentCharacter == $> ifTrue: [ ^ self scan30 ].
				currentCharacter == $] ifTrue: [ ^ self scan31 ].
				currentCharacter == $i ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan28 ].
					currentCharacter == $> ifTrue: [ ^ self scan30 ].
					currentCharacter == $] ifTrue: [ ^ self scan31 ].
					currentCharacter == $p ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan28 ].
						currentCharacter == $> ifTrue: [ ^ self scan30 ].
						currentCharacter == $] ifTrue: [ ^ self scan31 ].
						currentCharacter == $t ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan28 ].
							currentCharacter == $> ifTrue: [ 
								self recordMatch: #( 5 17 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan28 ].
								currentCharacter == $> ifTrue: [ ^ self scan30 ] ].
							currentCharacter == $] ifTrue: [ ^ self scan31 ] ] ] ] ] ] ].
	^ self scan27
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
	self recordMatch: #( 5 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan28 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $] ifTrue: [ ^ self scan31 ].
	^ self scan27
]

{ #category : #generated }
HTMLScanner >> scan31 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan28 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 2 5 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan28 ].
		currentCharacter == $> ifTrue: [ ^ self scan30 ].
		currentCharacter == $] ifTrue: [ ^ self scan31 ].
		^ self scan27 ].
	currentCharacter == $] ifTrue: [ 
		[ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan28 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 2 4 5 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan28 ].
			currentCharacter == $> ifTrue: [ ^ self scan30 ].
			currentCharacter == $] ifTrue: [ ^ self scan31 ].
			^ self scan27 ].
		currentCharacter == $] ] whileTrue ].
	^ self scan27
]

{ #category : #generated }
HTMLScanner >> scan32 [

	[ 
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan33 ].
	currentCharacter == $< ifTrue: [ ^ self scan34 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan33 [

	[ 
	self step.
	currentCharacter == $% ] whileTrue.
	currentCharacter == $< ifTrue: [ ^ self scan34 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 6 ).
		self step.
		currentCharacter == $% ifTrue: [ ^ self scan33 ].
		currentCharacter == $< ifTrue: [ ^ self scan34 ] ].
	^ self scan32
]

{ #category : #generated }
HTMLScanner >> scan34 [

	[ 
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan33 ].
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $% ifTrue: [ ^ self scan33 ].
		currentCharacter == $< ifTrue: [ ^ self scan34 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 18 ).
			self step.
			currentCharacter == $% ifTrue: [ ^ self scan33 ].
			currentCharacter == $< ifTrue: [ ^ self scan34 ].
			^ self scan32 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $% ifTrue: [ ^ self scan33 ].
			currentCharacter == $< ifTrue: [ ^ self scan34 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $% ifTrue: [ ^ self scan33 ].
				currentCharacter == $< ifTrue: [ ^ self scan34 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $% ifTrue: [ ^ self scan33 ].
					currentCharacter == $< ifTrue: [ ^ self scan34 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $% ifTrue: [ ^ self scan33 ].
						currentCharacter == $< ifTrue: [ ^ self scan34 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $% ifTrue: [ ^ self scan33 ].
							currentCharacter == $< ifTrue: [ ^ self scan34 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $% ifTrue: [ ^ self scan33 ].
								currentCharacter == $< ifTrue: [ ^ self scan34 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 17 ).
									self step.
									currentCharacter == $% ifTrue: [ ^ self scan33 ].
									currentCharacter == $< ifTrue: [ ^ self scan34 ] ] ] ] ] ] ] ].
		^ self scan32 ].
	currentCharacter == $< ] whileTrue.
	^ self scan32
]

{ #category : #generated }
HTMLScanner >> scan35 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan36 ].
	currentCharacter == $? ifTrue: [ ^ self scan37 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan36 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan36 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 18 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan36 ].
			currentCharacter == $? ifTrue: [ ^ self scan37 ].
			^ self scan35 ].
		currentCharacter == $? ifTrue: [ ^ self scan37 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan36 ].
			currentCharacter == $? ifTrue: [ ^ self scan37 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan36 ].
				currentCharacter == $? ifTrue: [ ^ self scan37 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan36 ].
					currentCharacter == $? ifTrue: [ ^ self scan37 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan36 ].
						currentCharacter == $? ifTrue: [ ^ self scan37 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan36 ].
							currentCharacter == $? ifTrue: [ ^ self scan37 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan36 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 17 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan36 ] ].
								currentCharacter == $? ifTrue: [ ^ self scan37 ] ] ] ] ] ] ].
		^ self scan35 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $? ifTrue: [ ^ self scan37 ].
	^ self scan35
]

{ #category : #generated }
HTMLScanner >> scan37 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan36 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 6 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan36 ].
		currentCharacter == $? ifTrue: [ ^ self scan37 ].
		^ self scan35 ].
	currentCharacter == $? ] whileTrue.
	^ self scan35
]

{ #category : #generated }
HTMLScanner >> scan38 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan39 ].
	currentCharacter == $> ifTrue: [ ^ self scan41 ].
	currentCharacter == $? ifTrue: [ ^ self scan42 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan39 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan40 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan41 ].
	currentCharacter == $? ifTrue: [ ^ self scan42 ].
	^ self scan38
]

{ #category : #generated }
HTMLScanner >> scan4 [

	[ 
	self recordMatch: #( 7 ).
	self step.
	currentCharacter == Character cr ifTrue: [ ^ self scan5 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	(currentCharacter between: Character tab and: Character lf) or: [ 
		currentCharacter == Character space ] ] whileTrue.
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan40 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan39 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 3 18 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan39 ].
		currentCharacter == $> ifTrue: [ ^ self scan41 ].
		currentCharacter == $? ifTrue: [ ^ self scan42 ].
		^ self scan38 ].
	currentCharacter == $? ifTrue: [ ^ self scan42 ].
	currentCharacter == $s ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan39 ].
		currentCharacter == $> ifTrue: [ ^ self scan41 ].
		currentCharacter == $? ifTrue: [ ^ self scan42 ].
		currentCharacter == $c ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan39 ].
			currentCharacter == $> ifTrue: [ ^ self scan41 ].
			currentCharacter == $? ifTrue: [ ^ self scan42 ].
			currentCharacter == $r ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan39 ].
				currentCharacter == $> ifTrue: [ ^ self scan41 ].
				currentCharacter == $? ifTrue: [ ^ self scan42 ].
				currentCharacter == $i ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan39 ].
					currentCharacter == $> ifTrue: [ ^ self scan41 ].
					currentCharacter == $? ifTrue: [ ^ self scan42 ].
					currentCharacter == $p ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan39 ].
						currentCharacter == $> ifTrue: [ ^ self scan41 ].
						currentCharacter == $? ifTrue: [ ^ self scan42 ].
						currentCharacter == $t ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan39 ].
							currentCharacter == $> ifTrue: [ 
								self recordMatch: #( 3 17 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan39 ].
								currentCharacter == $> ifTrue: [ ^ self scan41 ] ].
							currentCharacter == $? ifTrue: [ ^ self scan42 ] ] ] ] ] ] ].
	^ self scan38
]

{ #category : #generated }
HTMLScanner >> scan41 [

	[ 
	self recordMatch: #( 3 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan39 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $? ifTrue: [ ^ self scan42 ].
	^ self scan38
]

{ #category : #generated }
HTMLScanner >> scan42 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan39 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 3 6 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan39 ].
		currentCharacter == $> ifTrue: [ ^ self scan41 ].
		currentCharacter == $? ifTrue: [ ^ self scan42 ].
		^ self scan38 ].
	currentCharacter == $? ] whileTrue.
	^ self scan38
]

{ #category : #generated }
HTMLScanner >> scan43 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan44 ].
	currentCharacter == $> ifTrue: [ ^ self scan45 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan44 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan44 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 8 18 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan44 ].
			currentCharacter == $> ifTrue: [ ^ self scan45 ].
			^ self scan43 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan44 ].
			currentCharacter == $> ifTrue: [ ^ self scan45 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan44 ].
				currentCharacter == $> ifTrue: [ ^ self scan45 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan44 ].
					currentCharacter == $> ifTrue: [ ^ self scan45 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan44 ].
						currentCharacter == $> ifTrue: [ ^ self scan45 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan44 ].
							currentCharacter == $> ifTrue: [ ^ self scan45 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan44 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 8 17 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan44 ].
									currentCharacter == $> ifTrue: [ ^ self scan45 ] ] ] ] ] ] ] ].
		^ self scan43 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan45 ].
	^ self scan43
]

{ #category : #generated }
HTMLScanner >> scan45 [

	[ 
	self recordMatch: #( 8 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan44 ].
	currentCharacter == $> ] whileTrue.
	^ self scan43
]

{ #category : #generated }
HTMLScanner >> scan46 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan47 ].
	currentCharacter == $> ifTrue: [ ^ self scan48 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan47 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan47 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 9 18 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan47 ].
			currentCharacter == $> ifTrue: [ ^ self scan48 ].
			^ self scan46 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan47 ].
			currentCharacter == $> ifTrue: [ ^ self scan48 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan47 ].
				currentCharacter == $> ifTrue: [ ^ self scan48 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan47 ].
					currentCharacter == $> ifTrue: [ ^ self scan48 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan47 ].
						currentCharacter == $> ifTrue: [ ^ self scan48 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan47 ].
							currentCharacter == $> ifTrue: [ ^ self scan48 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan47 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 9 17 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan47 ].
									currentCharacter == $> ifTrue: [ ^ self scan48 ] ] ] ] ] ] ] ].
		^ self scan46 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan48 ].
	^ self scan46
]

{ #category : #generated }
HTMLScanner >> scan48 [

	[ 
	self recordMatch: #( 9 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan47 ].
	currentCharacter == $> ] whileTrue.
	^ self scan46
]

{ #category : #generated }
HTMLScanner >> scan49 [

	[ 
	self recordMatch: #( 11 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan5 [

	self step.
	currentCharacter == Character lf ifTrue: [ ^ self scan4 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan50 [

	[ 
	self recordMatch: #( 7 11 ).
	self step.
	currentCharacter == Character cr ifTrue: [ ^ self scan51 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	(currentCharacter between: Character tab and: Character lf) or: [ 
		currentCharacter == Character space ] ] whileTrue.
	^ self scan49
]

{ #category : #generated }
HTMLScanner >> scan51 [

	self recordMatch: #( 11 ).
	self step.
	currentCharacter == Character lf ifTrue: [ ^ self scan50 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	^ self scan49
]

{ #category : #generated }
HTMLScanner >> scan52 [

	self step.
	currentCharacter == Character cr ifTrue: [ ^ self scan57 ].
	currentCharacter == $< ifTrue: [ ^ self scan58 ].
	((currentCharacter between: Character tab and: Character lf) or: [ 
		 currentCharacter == Character space ]) ifTrue: [ ^ self scan56 ].
	^ self scan53
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

	[ 
	self recordMatch: #( 7 ).
	self step.
	currentCharacter == Character cr ifTrue: [ ^ self scan57 ].
	currentCharacter == $< ifTrue: [ ^ self scan54 ].
	(currentCharacter between: Character tab and: Character lf) or: [ 
		currentCharacter == Character space ] ] whileTrue.
	^ self scan53
]

{ #category : #generated }
HTMLScanner >> scan57 [

	self step.
	currentCharacter == Character lf ifTrue: [ ^ self scan56 ].
	currentCharacter == $< ifTrue: [ ^ self scan54 ].
	^ self scan53
]

{ #category : #generated }
HTMLScanner >> scan58 [

	self recordMatch: #( 10 ).
	self step.
	currentCharacter == $! ifTrue: [ ^ self scan59 ].
	currentCharacter == $% ifTrue: [ ^ self scan83 ].
	currentCharacter == $/ ifTrue: [ ^ self scan55 ].
	currentCharacter == $< ifTrue: [ ^ self scan54 ].
	currentCharacter == $? ifTrue: [ ^ self scan58X1 ].
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
						currentCharacter == $t ifTrue: [ ^ self scan99 ] ] ] ].
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
					currentCharacter == $e ifTrue: [ ^ self scan104 ] ] ] ] ].
	^ self scan53
]

{ #category : #generated }
HTMLScanner >> scan58X1 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan89 ].
	currentCharacter == $? ifTrue: [ ^ self scan91 ].
	currentCharacter == $x ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan89 ].
		currentCharacter == $? ifTrue: [ ^ self scan91 ].
		currentCharacter == $m ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan89 ].
			currentCharacter == $? ifTrue: [ ^ self scan91 ].
			currentCharacter == $l ifTrue: [ ^ self scan93 ] ] ].
	^ self scan88
]

{ #category : #generated }
HTMLScanner >> scan59 [

	self step.
	currentCharacter == $- ifTrue: [ 
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan65 ].
		currentCharacter == $< ifTrue: [ ^ self scan61 ].
		currentCharacter == $> ifTrue: [ ^ self scan63 ].
		^ self scan60 ].
	currentCharacter == $< ifTrue: [ ^ self scan61 ].
	currentCharacter == $> ifTrue: [ ^ self scan63 ].
	currentCharacter == $[ ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan72 ].
		currentCharacter == $> ifTrue: [ ^ self scan74 ].
		currentCharacter == $C ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan72 ].
			currentCharacter == $> ifTrue: [ ^ self scan74 ].
			currentCharacter == $D ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan72 ].
				currentCharacter == $> ifTrue: [ ^ self scan74 ].
				currentCharacter == $A ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan72 ].
					currentCharacter == $> ifTrue: [ ^ self scan74 ].
					currentCharacter == $T ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan72 ].
						currentCharacter == $> ifTrue: [ ^ self scan74 ].
						currentCharacter == $A ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan72 ].
							currentCharacter == $> ifTrue: [ ^ self scan74 ].
							currentCharacter == $[ ifTrue: [ ^ self scan77 ] ] ] ] ] ].
		currentCharacter == $] ifTrue: [ ^ self scan75 ].
		^ self scan71 ].
	^ self scan60
]

{ #category : #generated }
HTMLScanner >> scan6 [

	[ 
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan7 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan60 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan61 ].
	currentCharacter == $> ifTrue: [ ^ self scan63 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan61 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan62 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan63 ].
	^ self scan60
]

{ #category : #generated }
HTMLScanner >> scan62 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan61 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 5 18 20 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan61 ].
		currentCharacter == $> ifTrue: [ ^ self scan63 ].
		^ self scan60 ].
	currentCharacter == $s ifTrue: [ ^ self scan64 ].
	^ self scan60
]

{ #category : #generated }
HTMLScanner >> scan63 [

	[ 
	self recordMatch: #( 5 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan61 ].
	currentCharacter == $> ] whileTrue.
	^ self scan60
]

{ #category : #generated }
HTMLScanner >> scan64 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan61 ].
	currentCharacter == $> ifTrue: [ ^ self scan63 ].
	currentCharacter == $c ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan61 ].
		currentCharacter == $> ifTrue: [ ^ self scan63 ].
		currentCharacter == $r ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan61 ].
			currentCharacter == $> ifTrue: [ ^ self scan63 ].
			currentCharacter == $i ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan61 ].
				currentCharacter == $> ifTrue: [ ^ self scan63 ].
				currentCharacter == $p ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan61 ].
					currentCharacter == $> ifTrue: [ ^ self scan63 ].
					currentCharacter == $t ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan61 ].
						currentCharacter == $> ifTrue: [ 
							self recordMatch: #( 5 17 ).
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan61 ].
							currentCharacter == $> ifTrue: [ ^ self scan63 ] ] ] ] ] ].
		^ self scan60 ].
	currentCharacter == $t ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan61 ].
		currentCharacter == $> ifTrue: [ ^ self scan63 ].
		currentCharacter == $y ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan61 ].
			currentCharacter == $> ifTrue: [ ^ self scan63 ].
			currentCharacter == $l ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan61 ].
				currentCharacter == $> ifTrue: [ ^ self scan63 ].
				currentCharacter == $e ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan61 ].
					currentCharacter == $> ifTrue: [ 
						self recordMatch: #( 5 19 ).
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan61 ].
						currentCharacter == $> ifTrue: [ ^ self scan63 ] ] ] ] ] ].
	^ self scan60
]

{ #category : #generated }
HTMLScanner >> scan65 [

	[ 
	self step.
	currentCharacter == $- ifTrue: [ ^ self scan66 ].
	currentCharacter == $< ifTrue: [ ^ self scan67 ].
	currentCharacter == $> ifTrue: [ ^ self scan69 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan66 [

	self step.
	currentCharacter == $- ifTrue: [ 
		[ 
		self step.
		currentCharacter == $- ] whileTrue.
		currentCharacter == $< ifTrue: [ ^ self scan67 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 1 5 ).
			self step.
			currentCharacter == $- ifTrue: [ ^ self scan66 ].
			currentCharacter == $< ifTrue: [ ^ self scan67 ].
			currentCharacter == $> ifTrue: [ ^ self scan69 ] ].
		^ self scan65 ].
	currentCharacter == $< ifTrue: [ ^ self scan67 ].
	currentCharacter == $> ifTrue: [ ^ self scan69 ].
	^ self scan65
]

{ #category : #generated }
HTMLScanner >> scan67 [

	[ 
	self step.
	currentCharacter == $- ifTrue: [ ^ self scan66 ].
	currentCharacter == $/ ifTrue: [ ^ self scan68 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan69 ].
	^ self scan65
]

{ #category : #generated }
HTMLScanner >> scan68 [

	self step.
	currentCharacter == $- ifTrue: [ ^ self scan66 ].
	currentCharacter == $< ifTrue: [ ^ self scan67 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 5 18 20 ).
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan66 ].
		currentCharacter == $< ifTrue: [ ^ self scan67 ].
		currentCharacter == $> ifTrue: [ ^ self scan69 ].
		^ self scan65 ].
	currentCharacter == $s ifTrue: [ ^ self scan70 ].
	^ self scan65
]

{ #category : #generated }
HTMLScanner >> scan69 [

	[ 
	self recordMatch: #( 5 ).
	self step.
	currentCharacter == $- ifTrue: [ ^ self scan66 ].
	currentCharacter == $< ifTrue: [ ^ self scan67 ].
	currentCharacter == $> ] whileTrue.
	^ self scan65
]

{ #category : #generated }
HTMLScanner >> scan7 [

	self recordMatch: #( 21 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan70 [

	self step.
	currentCharacter == $- ifTrue: [ ^ self scan66 ].
	currentCharacter == $< ifTrue: [ ^ self scan67 ].
	currentCharacter == $> ifTrue: [ ^ self scan69 ].
	currentCharacter == $c ifTrue: [ 
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan66 ].
		currentCharacter == $< ifTrue: [ ^ self scan67 ].
		currentCharacter == $> ifTrue: [ ^ self scan69 ].
		currentCharacter == $r ifTrue: [ 
			self step.
			currentCharacter == $- ifTrue: [ ^ self scan66 ].
			currentCharacter == $< ifTrue: [ ^ self scan67 ].
			currentCharacter == $> ifTrue: [ ^ self scan69 ].
			currentCharacter == $i ifTrue: [ 
				self step.
				currentCharacter == $- ifTrue: [ ^ self scan66 ].
				currentCharacter == $< ifTrue: [ ^ self scan67 ].
				currentCharacter == $> ifTrue: [ ^ self scan69 ].
				currentCharacter == $p ifTrue: [ 
					self step.
					currentCharacter == $- ifTrue: [ ^ self scan66 ].
					currentCharacter == $< ifTrue: [ ^ self scan67 ].
					currentCharacter == $> ifTrue: [ ^ self scan69 ].
					currentCharacter == $t ifTrue: [ 
						self step.
						currentCharacter == $- ifTrue: [ ^ self scan66 ].
						currentCharacter == $< ifTrue: [ ^ self scan67 ].
						currentCharacter == $> ifTrue: [ 
							self recordMatch: #( 5 17 ).
							self step.
							currentCharacter == $- ifTrue: [ ^ self scan66 ].
							currentCharacter == $< ifTrue: [ ^ self scan67 ].
							currentCharacter == $> ifTrue: [ ^ self scan69 ] ] ] ] ] ].
		^ self scan65 ].
	currentCharacter == $t ifTrue: [ 
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan66 ].
		currentCharacter == $< ifTrue: [ ^ self scan67 ].
		currentCharacter == $> ifTrue: [ ^ self scan69 ].
		currentCharacter == $y ifTrue: [ 
			self step.
			currentCharacter == $- ifTrue: [ ^ self scan66 ].
			currentCharacter == $< ifTrue: [ ^ self scan67 ].
			currentCharacter == $> ifTrue: [ ^ self scan69 ].
			currentCharacter == $l ifTrue: [ 
				self step.
				currentCharacter == $- ifTrue: [ ^ self scan66 ].
				currentCharacter == $< ifTrue: [ ^ self scan67 ].
				currentCharacter == $> ifTrue: [ ^ self scan69 ].
				currentCharacter == $e ifTrue: [ 
					self step.
					currentCharacter == $- ifTrue: [ ^ self scan66 ].
					currentCharacter == $< ifTrue: [ ^ self scan67 ].
					currentCharacter == $> ifTrue: [ 
						self recordMatch: #( 5 19 ).
						self step.
						currentCharacter == $- ifTrue: [ ^ self scan66 ].
						currentCharacter == $< ifTrue: [ ^ self scan67 ].
						currentCharacter == $> ifTrue: [ ^ self scan69 ] ] ] ] ] ].
	^ self scan65
]

{ #category : #generated }
HTMLScanner >> scan71 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan72 ].
	currentCharacter == $> ifTrue: [ ^ self scan74 ].
	currentCharacter == $] ifTrue: [ ^ self scan75 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan72 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan73 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan74 ].
	currentCharacter == $] ifTrue: [ ^ self scan75 ].
	^ self scan71
]

{ #category : #generated }
HTMLScanner >> scan73 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan72 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 5 18 20 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan72 ].
		currentCharacter == $> ifTrue: [ ^ self scan74 ].
		currentCharacter == $] ifTrue: [ ^ self scan75 ].
		^ self scan71 ].
	currentCharacter == $] ifTrue: [ ^ self scan75 ].
	currentCharacter == $s ifTrue: [ ^ self scan76 ].
	^ self scan71
]

{ #category : #generated }
HTMLScanner >> scan74 [

	[ 
	self recordMatch: #( 5 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan72 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $] ifTrue: [ ^ self scan75 ].
	^ self scan71
]

{ #category : #generated }
HTMLScanner >> scan75 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan72 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 2 5 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan72 ].
		currentCharacter == $> ifTrue: [ ^ self scan74 ].
		currentCharacter == $] ifTrue: [ ^ self scan75 ].
		^ self scan71 ].
	currentCharacter == $] ] whileTrue.
	^ self scan71
]

{ #category : #generated }
HTMLScanner >> scan76 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan72 ].
	currentCharacter == $> ifTrue: [ ^ self scan74 ].
	currentCharacter == $] ifTrue: [ ^ self scan75 ].
	currentCharacter == $c ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan72 ].
		currentCharacter == $> ifTrue: [ ^ self scan74 ].
		currentCharacter == $] ifTrue: [ ^ self scan75 ].
		currentCharacter == $r ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan72 ].
			currentCharacter == $> ifTrue: [ ^ self scan74 ].
			currentCharacter == $] ifTrue: [ ^ self scan75 ].
			currentCharacter == $i ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan72 ].
				currentCharacter == $> ifTrue: [ ^ self scan74 ].
				currentCharacter == $] ifTrue: [ ^ self scan75 ].
				currentCharacter == $p ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan72 ].
					currentCharacter == $> ifTrue: [ ^ self scan74 ].
					currentCharacter == $] ifTrue: [ ^ self scan75 ].
					currentCharacter == $t ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan72 ].
						currentCharacter == $> ifTrue: [ 
							self recordMatch: #( 5 17 ).
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan72 ].
							currentCharacter == $> ifTrue: [ ^ self scan74 ] ].
						currentCharacter == $] ifTrue: [ ^ self scan75 ] ] ] ] ].
		^ self scan71 ].
	currentCharacter == $t ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan72 ].
		currentCharacter == $> ifTrue: [ ^ self scan74 ].
		currentCharacter == $] ifTrue: [ ^ self scan75 ].
		currentCharacter == $y ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan72 ].
			currentCharacter == $> ifTrue: [ ^ self scan74 ].
			currentCharacter == $] ifTrue: [ ^ self scan75 ].
			currentCharacter == $l ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan72 ].
				currentCharacter == $> ifTrue: [ ^ self scan74 ].
				currentCharacter == $] ifTrue: [ ^ self scan75 ].
				currentCharacter == $e ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan72 ].
					currentCharacter == $> ifTrue: [ 
						self recordMatch: #( 5 19 ).
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan72 ].
						currentCharacter == $> ifTrue: [ ^ self scan74 ] ].
					currentCharacter == $] ifTrue: [ ^ self scan75 ] ] ] ] ].
	^ self scan71
]

{ #category : #generated }
HTMLScanner >> scan77 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan78 ].
	currentCharacter == $> ifTrue: [ ^ self scan80 ].
	currentCharacter == $] ifTrue: [ ^ self scan81 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan78 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan79 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan80 ].
	currentCharacter == $] ifTrue: [ ^ self scan81 ].
	^ self scan77
]

{ #category : #generated }
HTMLScanner >> scan79 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan78 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 5 18 20 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan78 ].
		currentCharacter == $> ifTrue: [ ^ self scan80 ].
		currentCharacter == $] ifTrue: [ ^ self scan81 ].
		^ self scan77 ].
	currentCharacter == $] ifTrue: [ ^ self scan81 ].
	currentCharacter == $s ifTrue: [ ^ self scan82 ].
	^ self scan77
]

{ #category : #generated }
HTMLScanner >> scan8 [

	[ 
	self recordMatch: #( 21 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan7 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	currentCharacter isDigit or: [ 
		(currentCharacter between: $A and: $F) or: [ 
			currentCharacter between: $a and: $f ] ] ] whileTrue.
	(currentCharacter == $# or: [ 
		 (currentCharacter between: $+ and: $=) or: [ 
			 currentCharacter == $? or: [ 
				 (currentCharacter between: $G and: $Z) or: [ 
					 currentCharacter == $_ or: [ 
						 currentCharacter between: $g and: $z ] ] ] ] ]) ifTrue: [ 
		^ self scan9 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan80 [

	[ 
	self recordMatch: #( 5 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan78 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $] ifTrue: [ ^ self scan81 ].
	^ self scan77
]

{ #category : #generated }
HTMLScanner >> scan81 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan78 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 2 5 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan78 ].
		currentCharacter == $> ifTrue: [ ^ self scan80 ].
		currentCharacter == $] ifTrue: [ ^ self scan81 ].
		^ self scan77 ].
	currentCharacter == $] ifTrue: [ 
		[ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan78 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 2 4 5 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan78 ].
			currentCharacter == $> ifTrue: [ ^ self scan80 ].
			currentCharacter == $] ifTrue: [ ^ self scan81 ].
			^ self scan77 ].
		currentCharacter == $] ] whileTrue ].
	^ self scan77
]

{ #category : #generated }
HTMLScanner >> scan82 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan78 ].
	currentCharacter == $> ifTrue: [ ^ self scan80 ].
	currentCharacter == $] ifTrue: [ ^ self scan81 ].
	currentCharacter == $c ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan78 ].
		currentCharacter == $> ifTrue: [ ^ self scan80 ].
		currentCharacter == $] ifTrue: [ ^ self scan81 ].
		currentCharacter == $r ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan78 ].
			currentCharacter == $> ifTrue: [ ^ self scan80 ].
			currentCharacter == $] ifTrue: [ ^ self scan81 ].
			currentCharacter == $i ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan78 ].
				currentCharacter == $> ifTrue: [ ^ self scan80 ].
				currentCharacter == $] ifTrue: [ ^ self scan81 ].
				currentCharacter == $p ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan78 ].
					currentCharacter == $> ifTrue: [ ^ self scan80 ].
					currentCharacter == $] ifTrue: [ ^ self scan81 ].
					currentCharacter == $t ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan78 ].
						currentCharacter == $> ifTrue: [ 
							self recordMatch: #( 5 17 ).
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan78 ].
							currentCharacter == $> ifTrue: [ ^ self scan80 ] ].
						currentCharacter == $] ifTrue: [ ^ self scan81 ] ] ] ] ].
		^ self scan77 ].
	currentCharacter == $t ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan78 ].
		currentCharacter == $> ifTrue: [ ^ self scan80 ].
		currentCharacter == $] ifTrue: [ ^ self scan81 ].
		currentCharacter == $y ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan78 ].
			currentCharacter == $> ifTrue: [ ^ self scan80 ].
			currentCharacter == $] ifTrue: [ ^ self scan81 ].
			currentCharacter == $l ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan78 ].
				currentCharacter == $> ifTrue: [ ^ self scan80 ].
				currentCharacter == $] ifTrue: [ ^ self scan81 ].
				currentCharacter == $e ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan78 ].
					currentCharacter == $> ifTrue: [ 
						self recordMatch: #( 5 19 ).
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan78 ].
						currentCharacter == $> ifTrue: [ ^ self scan80 ] ].
					currentCharacter == $] ifTrue: [ ^ self scan81 ] ] ] ] ].
	^ self scan77
]

{ #category : #generated }
HTMLScanner >> scan83 [

	[ 
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan84 ].
	currentCharacter == $< ifTrue: [ ^ self scan85 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan84 [

	[ 
	self step.
	currentCharacter == $% ] whileTrue.
	currentCharacter == $< ifTrue: [ ^ self scan85 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 6 ).
		self step.
		currentCharacter == $% ifTrue: [ ^ self scan84 ].
		currentCharacter == $< ifTrue: [ ^ self scan85 ] ].
	^ self scan83
]

{ #category : #generated }
HTMLScanner >> scan85 [

	[ 
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan84 ].
	currentCharacter == $/ ifTrue: [ ^ self scan86 ].
	currentCharacter == $< ] whileTrue.
	^ self scan83
]

{ #category : #generated }
HTMLScanner >> scan86 [

	self step.
	currentCharacter == $% ifTrue: [ ^ self scan84 ].
	currentCharacter == $< ifTrue: [ ^ self scan85 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 18 20 ).
		self step.
		currentCharacter == $% ifTrue: [ ^ self scan84 ].
		currentCharacter == $< ifTrue: [ ^ self scan85 ].
		^ self scan83 ].
	currentCharacter == $s ifTrue: [ ^ self scan87 ].
	^ self scan83
]

{ #category : #generated }
HTMLScanner >> scan87 [

	self step.
	currentCharacter == $% ifTrue: [ ^ self scan84 ].
	currentCharacter == $< ifTrue: [ ^ self scan85 ].
	currentCharacter == $c ifTrue: [ 
		self step.
		currentCharacter == $% ifTrue: [ ^ self scan84 ].
		currentCharacter == $< ifTrue: [ ^ self scan85 ].
		currentCharacter == $r ifTrue: [ 
			self step.
			currentCharacter == $% ifTrue: [ ^ self scan84 ].
			currentCharacter == $< ifTrue: [ ^ self scan85 ].
			currentCharacter == $i ifTrue: [ 
				self step.
				currentCharacter == $% ifTrue: [ ^ self scan84 ].
				currentCharacter == $< ifTrue: [ ^ self scan85 ].
				currentCharacter == $p ifTrue: [ 
					self step.
					currentCharacter == $% ifTrue: [ ^ self scan84 ].
					currentCharacter == $< ifTrue: [ ^ self scan85 ].
					currentCharacter == $t ifTrue: [ 
						self step.
						currentCharacter == $% ifTrue: [ ^ self scan84 ].
						currentCharacter == $< ifTrue: [ ^ self scan85 ].
						currentCharacter == $> ifTrue: [ 
							self recordMatch: #( 17 ).
							self step.
							currentCharacter == $% ifTrue: [ ^ self scan84 ].
							currentCharacter == $< ifTrue: [ ^ self scan85 ] ] ] ] ] ].
		^ self scan83 ].
	currentCharacter == $t ifTrue: [ 
		self step.
		currentCharacter == $% ifTrue: [ ^ self scan84 ].
		currentCharacter == $< ifTrue: [ ^ self scan85 ].
		currentCharacter == $y ifTrue: [ 
			self step.
			currentCharacter == $% ifTrue: [ ^ self scan84 ].
			currentCharacter == $< ifTrue: [ ^ self scan85 ].
			currentCharacter == $l ifTrue: [ 
				self step.
				currentCharacter == $% ifTrue: [ ^ self scan84 ].
				currentCharacter == $< ifTrue: [ ^ self scan85 ].
				currentCharacter == $e ifTrue: [ 
					self step.
					currentCharacter == $% ifTrue: [ ^ self scan84 ].
					currentCharacter == $< ifTrue: [ ^ self scan85 ].
					currentCharacter == $> ifTrue: [ 
						self recordMatch: #( 19 ).
						self step.
						currentCharacter == $% ifTrue: [ ^ self scan84 ].
						currentCharacter == $< ifTrue: [ ^ self scan85 ] ] ] ] ] ].
	^ self scan83
]

{ #category : #generated }
HTMLScanner >> scan88 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan89 ].
	currentCharacter == $? ifTrue: [ ^ self scan91 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan89 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan90 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $? ifTrue: [ ^ self scan91 ].
	^ self scan88
]

{ #category : #generated }
HTMLScanner >> scan9 [

	[ 
	self recordMatch: #( 21 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan7 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	currentCharacter == $# or: [ 
		(currentCharacter between: $+ and: $=) or: [ 
			currentCharacter == $? or: [ 
				(currentCharacter between: $A and: $Z) or: [ 
					currentCharacter == $_ or: [ 
						currentCharacter between: $a and: $z ] ] ] ] ] ] whileTrue.
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan90 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan89 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 18 20 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan89 ].
		currentCharacter == $? ifTrue: [ ^ self scan91 ].
		^ self scan88 ].
	currentCharacter == $? ifTrue: [ ^ self scan91 ].
	currentCharacter == $s ifTrue: [ ^ self scan92 ].
	^ self scan88
]

{ #category : #generated }
HTMLScanner >> scan91 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan89 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 6 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan89 ].
		currentCharacter == $? ifTrue: [ ^ self scan91 ].
		^ self scan88 ].
	currentCharacter == $? ] whileTrue.
	^ self scan88
]

{ #category : #generated }
HTMLScanner >> scan92 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan89 ].
	currentCharacter == $? ifTrue: [ ^ self scan91 ].
	currentCharacter == $c ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan89 ].
		currentCharacter == $? ifTrue: [ ^ self scan91 ].
		currentCharacter == $r ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan89 ].
			currentCharacter == $? ifTrue: [ ^ self scan91 ].
			currentCharacter == $i ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan89 ].
				currentCharacter == $? ifTrue: [ ^ self scan91 ].
				currentCharacter == $p ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan89 ].
					currentCharacter == $? ifTrue: [ ^ self scan91 ].
					currentCharacter == $t ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan89 ].
						currentCharacter == $> ifTrue: [ 
							self recordMatch: #( 17 ).
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan89 ] ].
						currentCharacter == $? ifTrue: [ ^ self scan91 ] ] ] ] ].
		^ self scan88 ].
	currentCharacter == $t ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan89 ].
		currentCharacter == $? ifTrue: [ ^ self scan91 ].
		currentCharacter == $y ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan89 ].
			currentCharacter == $? ifTrue: [ ^ self scan91 ].
			currentCharacter == $l ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan89 ].
				currentCharacter == $? ifTrue: [ ^ self scan91 ].
				currentCharacter == $e ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan89 ].
					currentCharacter == $> ifTrue: [ 
						self recordMatch: #( 19 ).
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan89 ] ].
					currentCharacter == $? ifTrue: [ ^ self scan91 ] ] ] ] ].
	^ self scan88
]

{ #category : #generated }
HTMLScanner >> scan93 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan94 ].
	currentCharacter == $> ifTrue: [ ^ self scan96 ].
	currentCharacter == $? ifTrue: [ ^ self scan97 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan94 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan95 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan96 ].
	currentCharacter == $? ifTrue: [ ^ self scan97 ].
	^ self scan93
]

{ #category : #generated }
HTMLScanner >> scan95 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan94 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 3 18 20 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan94 ].
		currentCharacter == $> ifTrue: [ ^ self scan96 ].
		currentCharacter == $? ifTrue: [ ^ self scan97 ].
		^ self scan93 ].
	currentCharacter == $? ifTrue: [ ^ self scan97 ].
	currentCharacter == $s ifTrue: [ ^ self scan98 ].
	^ self scan93
]

{ #category : #generated }
HTMLScanner >> scan96 [

	[ 
	self recordMatch: #( 3 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan94 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $? ifTrue: [ ^ self scan97 ].
	^ self scan93
]

{ #category : #generated }
HTMLScanner >> scan97 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan94 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 3 6 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan94 ].
		currentCharacter == $> ifTrue: [ ^ self scan96 ].
		currentCharacter == $? ifTrue: [ ^ self scan97 ].
		^ self scan93 ].
	currentCharacter == $? ] whileTrue.
	^ self scan93
]

{ #category : #generated }
HTMLScanner >> scan98 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan94 ].
	currentCharacter == $> ifTrue: [ ^ self scan96 ].
	currentCharacter == $? ifTrue: [ ^ self scan97 ].
	currentCharacter == $c ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan94 ].
		currentCharacter == $> ifTrue: [ ^ self scan96 ].
		currentCharacter == $? ifTrue: [ ^ self scan97 ].
		currentCharacter == $r ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan94 ].
			currentCharacter == $> ifTrue: [ ^ self scan96 ].
			currentCharacter == $? ifTrue: [ ^ self scan97 ].
			currentCharacter == $i ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan94 ].
				currentCharacter == $> ifTrue: [ ^ self scan96 ].
				currentCharacter == $? ifTrue: [ ^ self scan97 ].
				currentCharacter == $p ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan94 ].
					currentCharacter == $> ifTrue: [ ^ self scan96 ].
					currentCharacter == $? ifTrue: [ ^ self scan97 ].
					currentCharacter == $t ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan94 ].
						currentCharacter == $> ifTrue: [ 
							self recordMatch: #( 3 17 ).
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan94 ].
							currentCharacter == $> ifTrue: [ ^ self scan96 ] ].
						currentCharacter == $? ifTrue: [ ^ self scan97 ] ] ] ] ].
		^ self scan93 ].
	currentCharacter == $t ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan94 ].
		currentCharacter == $> ifTrue: [ ^ self scan96 ].
		currentCharacter == $? ifTrue: [ ^ self scan97 ].
		currentCharacter == $y ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan94 ].
			currentCharacter == $> ifTrue: [ ^ self scan96 ].
			currentCharacter == $? ifTrue: [ ^ self scan97 ].
			currentCharacter == $l ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan94 ].
				currentCharacter == $> ifTrue: [ ^ self scan96 ].
				currentCharacter == $? ifTrue: [ ^ self scan97 ].
				currentCharacter == $e ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan94 ].
					currentCharacter == $> ifTrue: [ 
						self recordMatch: #( 3 19 ).
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan94 ].
						currentCharacter == $> ifTrue: [ ^ self scan96 ] ].
					currentCharacter == $? ifTrue: [ ^ self scan97 ] ] ] ] ].
	^ self scan93
]

{ #category : #generated }
HTMLScanner >> scan99 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan100 ].
	currentCharacter == $> ifTrue: [ ^ self scan102 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scanForToken [

	scope == #style ifTrue: [ ^ self scan52 ].
	scope == #default ifTrue: [ 
		self step.
		currentCharacter == Character cr ifTrue: [ ^ self scan51 ].
		currentCharacter == $< ifTrue: [ ^ self scan12 ].
		((currentCharacter between: Character tab and: Character lf) or: [ 
			 currentCharacter == Character space ]) ifTrue: [ ^ self scan50 ].
		^ self scan49 ].
	scope == #attvalue ifTrue: [ ^ self scanForTokenX1 ].
	scope == #tag ifTrue: [ ^ self scanForTokenX2 ].
	^ self reportLastMatch
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1 [

	self step.
	currentCharacter == Character cr ifTrue: [ ^ self scan5 ].
	^ self scanForTokenX1X2
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X1 [

	[ 
	self recordMatch: #( 7 ).
	self step.
	currentCharacter == Character cr ifTrue: [ ^ self scan5 ].
	currentCharacter == Character space ] whileTrue.
	^ self scanForTokenX1X1X1
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X1X1 [

	currentCharacter == $" ifTrue: [ ^ self scan6 ].
	currentCharacter == $# ifTrue: [ ^ self scan8 ].
	currentCharacter == $' ifTrue: [ ^ self scan10 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	(currentCharacter between: Character tab and: Character lf) ifTrue: [ 
		^ self scan4 ].
	currentCharacter isDigit ifTrue: [ ^ self scan11 ].
	((currentCharacter between: $+ and: $=) or: [ 
		 currentCharacter == $? or: [ 
			 (currentCharacter between: $A and: $Z) or: [ 
				 currentCharacter == $_ or: [ 
					 currentCharacter between: $a and: $z ] ] ] ]) ifTrue: [ 
		^ self scan9 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X2 [

	currentCharacter == Character space ifTrue: [ 
		^ self scanForTokenX1X1 ].
	currentCharacter == $" ifTrue: [ ^ self scan6 ].
	currentCharacter == $# ifTrue: [ ^ self scan8 ].
	currentCharacter == $' ifTrue: [ ^ self scan10 ].
	currentCharacter == $< ifTrue: [ ^ self scan12 ].
	(currentCharacter between: Character tab and: Character lf) ifTrue: [ 
		^ self scan4 ].
	currentCharacter isDigit ifTrue: [ ^ self scan11 ].
	((currentCharacter between: $+ and: $=) or: [ 
		 currentCharacter == $? or: [ 
			 (currentCharacter between: $A and: $Z) or: [ 
				 currentCharacter == $_ or: [ 
					 currentCharacter between: $a and: $z ] ] ] ]) ifTrue: [ 
		^ self scan9 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scanForTokenX2 [

	self step.
	currentCharacter == Character cr ifTrue: [ ^ self scan5 ].
	currentCharacter == $( ifTrue: [ ^ self scan109 ].
	currentCharacter == $/ ifTrue: [ ^ self scanForTokenX2X2 ].
	currentCharacter == $< ifTrue: [ ^ self scan12 ].
	currentCharacter == $= ifTrue: [ ^ self scanForTokenX2X4 ].
	currentCharacter == $> ifTrue: [ ^ self scanForTokenX2X3 ].
	currentCharacter == $[ ifTrue: [ ^ self scanForTokenX2X1 ].
	((currentCharacter between: Character tab and: Character lf) or: [ 
		 currentCharacter == Character space ]) ifTrue: [ ^ self scan4 ].
	(currentCharacter == $: or: [ 
		 (currentCharacter between: $A and: $Z) or: [ 
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ 
		^ self scan110 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scanForTokenX2X1 [

	self step.
	currentCharacter == $( ifTrue: [ ^ self scan109 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	(currentCharacter == $: or: [ 
		 (currentCharacter between: $A and: $Z) or: [ 
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ 
		^ self scan110 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scanForTokenX2X2 [

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
HTMLScanner >> scanForTokenX2X3 [

	self recordMatch: #( 12 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scanForTokenX2X4 [

	self recordMatch: #( 15 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	^ self scan1
]
