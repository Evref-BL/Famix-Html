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
HTMLScanner >> scan12 [

	self step.
	currentCharacter == Character cr ifTrue: [ ^ self scan15 ].
	currentCharacter == $< ifTrue: [ ^ self scan16 ].
	((currentCharacter between: Character tab and: Character lf) or: [ 
		 currentCharacter == Character space ]) ifTrue: [ ^ self scan14 ].
	^ self scan13
]

{ #category : #generated }
HTMLScanner >> scan13 [

	[ 
	self recordMatch: #( 11 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan14 [

	[ 
	self recordMatch: #( 7 11 ).
	self step.
	currentCharacter == Character cr ifTrue: [ ^ self scan15 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	(currentCharacter between: Character tab and: Character lf) or: [ 
		currentCharacter == Character space ] ] whileTrue.
	^ self scan13
]

{ #category : #generated }
HTMLScanner >> scan15 [

	self recordMatch: #( 11 ).
	self step.
	currentCharacter == Character lf ifTrue: [ ^ self scan14 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	^ self scan13
]

{ #category : #generated }
HTMLScanner >> scan16 [

	self recordMatch: #( 10 ).
	self step.
	currentCharacter == $! ifTrue: [ ^ self scan16X1 ].
	currentCharacter == $% ifTrue: [ ^ self scan33 ].
	currentCharacter == $/ ifTrue: [ ^ self scan3 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	currentCharacter == $? ifTrue: [ ^ self scan16X2 ].
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
						currentCharacter == $t ifTrue: [ ^ self scan44 ] ] ] ].
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
					currentCharacter == $e ifTrue: [ ^ self scan47 ] ] ] ] ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan16X1 [

	self step.
	currentCharacter == $- ifTrue: [ 
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan20 ].
		currentCharacter == $< ifTrue: [ ^ self scan2 ].
		^ self scan1 ].
	currentCharacter == $< ifTrue: [ ^ self scan18 ].
	currentCharacter == $[ ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan24 ].
		currentCharacter == $> ifTrue: [ ^ self scan26 ].
		currentCharacter == $C ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan24 ].
			currentCharacter == $> ifTrue: [ ^ self scan26 ].
			currentCharacter == $D ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan24 ].
				currentCharacter == $> ifTrue: [ ^ self scan26 ].
				currentCharacter == $A ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan24 ].
					currentCharacter == $> ifTrue: [ ^ self scan26 ].
					currentCharacter == $T ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan24 ].
						currentCharacter == $> ifTrue: [ ^ self scan26 ].
						currentCharacter == $A ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan24 ].
							currentCharacter == $> ifTrue: [ ^ self scan26 ].
							currentCharacter == $[ ifTrue: [ ^ self scan28 ] ] ] ] ] ].
		currentCharacter == $] ifTrue: [ ^ self scan27 ].
		^ self scan23 ].
	^ self scan17
]

{ #category : #generated }
HTMLScanner >> scan16X2 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan37 ].
	currentCharacter == $? ifTrue: [ ^ self scan38 ].
	currentCharacter == $x ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan37 ].
		currentCharacter == $? ifTrue: [ ^ self scan38 ].
		currentCharacter == $m ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan37 ].
			currentCharacter == $? ifTrue: [ ^ self scan38 ].
			currentCharacter == $l ifTrue: [ ^ self scan39 ] ] ].
	^ self scan36
]

{ #category : #generated }
HTMLScanner >> scan17 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan18 ].
	currentCharacter == $> ifTrue: [ ^ self scan19 ].
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
			self recordMatch: #( 5 18 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan18 ].
			currentCharacter == $> ifTrue: [ ^ self scan19 ].
			^ self scan17 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan18 ].
			currentCharacter == $> ifTrue: [ ^ self scan19 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan18 ].
				currentCharacter == $> ifTrue: [ ^ self scan19 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan18 ].
					currentCharacter == $> ifTrue: [ ^ self scan19 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan18 ].
						currentCharacter == $> ifTrue: [ ^ self scan19 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan18 ].
							currentCharacter == $> ifTrue: [ ^ self scan19 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan18 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 5 17 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan18 ].
									currentCharacter == $> ifTrue: [ ^ self scan19 ] ] ] ] ] ] ] ].
		^ self scan17 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan19 ].
	^ self scan17
]

{ #category : #generated }
HTMLScanner >> scan19 [

	[ 
	self recordMatch: #( 5 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan18 ].
	currentCharacter == $> ] whileTrue.
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

	[ 
	self step.
	currentCharacter == $- ifTrue: [ ^ self scan21 ].
	currentCharacter == $< ifTrue: [ ^ self scan22 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan21 [

	self step.
	currentCharacter == $- ifTrue: [ 
		[ 
		self step.
		currentCharacter == $- ] whileTrue.
		currentCharacter == $< ifTrue: [ ^ self scan22 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 1 ).
			self step.
			currentCharacter == $- ifTrue: [ ^ self scan21 ].
			currentCharacter == $< ifTrue: [ ^ self scan22 ] ].
		^ self scan20 ].
	currentCharacter == $< ifTrue: [ ^ self scan22 ].
	^ self scan20
]

{ #category : #generated }
HTMLScanner >> scan22 [

	[ 
	self step.
	currentCharacter == $- ifTrue: [ ^ self scan21 ].
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan21 ].
		currentCharacter == $< ifTrue: [ ^ self scan22 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 18 ).
			self step.
			currentCharacter == $- ifTrue: [ ^ self scan21 ].
			currentCharacter == $< ifTrue: [ ^ self scan22 ].
			^ self scan20 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $- ifTrue: [ ^ self scan21 ].
			currentCharacter == $< ifTrue: [ ^ self scan22 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $- ifTrue: [ ^ self scan21 ].
				currentCharacter == $< ifTrue: [ ^ self scan22 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $- ifTrue: [ ^ self scan21 ].
					currentCharacter == $< ifTrue: [ ^ self scan22 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $- ifTrue: [ ^ self scan21 ].
						currentCharacter == $< ifTrue: [ ^ self scan22 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $- ifTrue: [ ^ self scan21 ].
							currentCharacter == $< ifTrue: [ ^ self scan22 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $- ifTrue: [ ^ self scan21 ].
								currentCharacter == $< ifTrue: [ ^ self scan22 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 17 ).
									self step.
									currentCharacter == $- ifTrue: [ ^ self scan21 ].
									currentCharacter == $< ifTrue: [ ^ self scan22 ] ] ] ] ] ] ] ].
		^ self scan20 ].
	currentCharacter == $< ] whileTrue.
	^ self scan20
]

{ #category : #generated }
HTMLScanner >> scan23 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan24 ].
	currentCharacter == $> ifTrue: [ ^ self scan26 ].
	currentCharacter == $] ifTrue: [ ^ self scan27 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan24 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan25 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan26 ].
	currentCharacter == $] ifTrue: [ ^ self scan27 ].
	^ self scan23
]

{ #category : #generated }
HTMLScanner >> scan25 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan24 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 5 18 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan24 ].
		currentCharacter == $> ifTrue: [ ^ self scan26 ].
		currentCharacter == $] ifTrue: [ ^ self scan27 ].
		^ self scan23 ].
	currentCharacter == $] ifTrue: [ ^ self scan27 ].
	currentCharacter == $s ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan24 ].
		currentCharacter == $> ifTrue: [ ^ self scan26 ].
		currentCharacter == $] ifTrue: [ ^ self scan27 ].
		currentCharacter == $c ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan24 ].
			currentCharacter == $> ifTrue: [ ^ self scan26 ].
			currentCharacter == $] ifTrue: [ ^ self scan27 ].
			currentCharacter == $r ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan24 ].
				currentCharacter == $> ifTrue: [ ^ self scan26 ].
				currentCharacter == $] ifTrue: [ ^ self scan27 ].
				currentCharacter == $i ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan24 ].
					currentCharacter == $> ifTrue: [ ^ self scan26 ].
					currentCharacter == $] ifTrue: [ ^ self scan27 ].
					currentCharacter == $p ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan24 ].
						currentCharacter == $> ifTrue: [ ^ self scan26 ].
						currentCharacter == $] ifTrue: [ ^ self scan27 ].
						currentCharacter == $t ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan24 ].
							currentCharacter == $> ifTrue: [ 
								self recordMatch: #( 5 17 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan24 ].
								currentCharacter == $> ifTrue: [ ^ self scan26 ] ].
							currentCharacter == $] ifTrue: [ ^ self scan27 ] ] ] ] ] ] ].
	^ self scan23
]

{ #category : #generated }
HTMLScanner >> scan26 [

	[ 
	self recordMatch: #( 5 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan24 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $] ifTrue: [ ^ self scan27 ].
	^ self scan23
]

{ #category : #generated }
HTMLScanner >> scan27 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan24 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 2 5 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan24 ].
		currentCharacter == $> ifTrue: [ ^ self scan26 ].
		currentCharacter == $] ifTrue: [ ^ self scan27 ].
		^ self scan23 ].
	currentCharacter == $] ] whileTrue.
	^ self scan23
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

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan29 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 2 5 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan29 ].
		currentCharacter == $> ifTrue: [ ^ self scan31 ].
		currentCharacter == $] ifTrue: [ ^ self scan32 ].
		^ self scan28 ].
	currentCharacter == $] ifTrue: [ 
		[ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan29 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 2 4 5 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan29 ].
			currentCharacter == $> ifTrue: [ ^ self scan31 ].
			currentCharacter == $] ifTrue: [ ^ self scan32 ].
			^ self scan28 ].
		currentCharacter == $] ] whileTrue ].
	^ self scan28
]

{ #category : #generated }
HTMLScanner >> scan33 [

	[ 
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan34 ].
	currentCharacter == $< ifTrue: [ ^ self scan35 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan34 [

	[ 
	self step.
	currentCharacter == $% ] whileTrue.
	currentCharacter == $< ifTrue: [ ^ self scan35 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 6 ).
		self step.
		currentCharacter == $% ifTrue: [ ^ self scan34 ].
		currentCharacter == $< ifTrue: [ ^ self scan35 ] ].
	^ self scan33
]

{ #category : #generated }
HTMLScanner >> scan35 [

	[ 
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan34 ].
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $% ifTrue: [ ^ self scan34 ].
		currentCharacter == $< ifTrue: [ ^ self scan35 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 18 ).
			self step.
			currentCharacter == $% ifTrue: [ ^ self scan34 ].
			currentCharacter == $< ifTrue: [ ^ self scan35 ].
			^ self scan33 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $% ifTrue: [ ^ self scan34 ].
			currentCharacter == $< ifTrue: [ ^ self scan35 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $% ifTrue: [ ^ self scan34 ].
				currentCharacter == $< ifTrue: [ ^ self scan35 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $% ifTrue: [ ^ self scan34 ].
					currentCharacter == $< ifTrue: [ ^ self scan35 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $% ifTrue: [ ^ self scan34 ].
						currentCharacter == $< ifTrue: [ ^ self scan35 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $% ifTrue: [ ^ self scan34 ].
							currentCharacter == $< ifTrue: [ ^ self scan35 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $% ifTrue: [ ^ self scan34 ].
								currentCharacter == $< ifTrue: [ ^ self scan35 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 17 ).
									self step.
									currentCharacter == $% ifTrue: [ ^ self scan34 ].
									currentCharacter == $< ifTrue: [ ^ self scan35 ] ] ] ] ] ] ] ].
		^ self scan33 ].
	currentCharacter == $< ] whileTrue.
	^ self scan33
]

{ #category : #generated }
HTMLScanner >> scan36 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan37 ].
	currentCharacter == $? ifTrue: [ ^ self scan38 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan37 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan37 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 18 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan37 ].
			currentCharacter == $? ifTrue: [ ^ self scan38 ].
			^ self scan36 ].
		currentCharacter == $? ifTrue: [ ^ self scan38 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan37 ].
			currentCharacter == $? ifTrue: [ ^ self scan38 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan37 ].
				currentCharacter == $? ifTrue: [ ^ self scan38 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan37 ].
					currentCharacter == $? ifTrue: [ ^ self scan38 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan37 ].
						currentCharacter == $? ifTrue: [ ^ self scan38 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan37 ].
							currentCharacter == $? ifTrue: [ ^ self scan38 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan37 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 17 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan37 ] ].
								currentCharacter == $? ifTrue: [ ^ self scan38 ] ] ] ] ] ] ].
		^ self scan36 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $? ifTrue: [ ^ self scan38 ].
	^ self scan36
]

{ #category : #generated }
HTMLScanner >> scan38 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan37 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 6 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan37 ].
		currentCharacter == $? ifTrue: [ ^ self scan38 ].
		^ self scan36 ].
	currentCharacter == $? ] whileTrue.
	^ self scan36
]

{ #category : #generated }
HTMLScanner >> scan39 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan40 ].
	currentCharacter == $> ifTrue: [ ^ self scan42 ].
	currentCharacter == $? ifTrue: [ ^ self scan43 ].
	true ] whileTrue
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

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan41 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan42 ].
	currentCharacter == $? ifTrue: [ ^ self scan43 ].
	^ self scan39
]

{ #category : #generated }
HTMLScanner >> scan41 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan40 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 3 18 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan40 ].
		currentCharacter == $> ifTrue: [ ^ self scan42 ].
		currentCharacter == $? ifTrue: [ ^ self scan43 ].
		^ self scan39 ].
	currentCharacter == $? ifTrue: [ ^ self scan43 ].
	currentCharacter == $s ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan40 ].
		currentCharacter == $> ifTrue: [ ^ self scan42 ].
		currentCharacter == $? ifTrue: [ ^ self scan43 ].
		currentCharacter == $c ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan40 ].
			currentCharacter == $> ifTrue: [ ^ self scan42 ].
			currentCharacter == $? ifTrue: [ ^ self scan43 ].
			currentCharacter == $r ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan40 ].
				currentCharacter == $> ifTrue: [ ^ self scan42 ].
				currentCharacter == $? ifTrue: [ ^ self scan43 ].
				currentCharacter == $i ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan40 ].
					currentCharacter == $> ifTrue: [ ^ self scan42 ].
					currentCharacter == $? ifTrue: [ ^ self scan43 ].
					currentCharacter == $p ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan40 ].
						currentCharacter == $> ifTrue: [ ^ self scan42 ].
						currentCharacter == $? ifTrue: [ ^ self scan43 ].
						currentCharacter == $t ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan40 ].
							currentCharacter == $> ifTrue: [ 
								self recordMatch: #( 3 17 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan40 ].
								currentCharacter == $> ifTrue: [ ^ self scan42 ] ].
							currentCharacter == $? ifTrue: [ ^ self scan43 ] ] ] ] ] ] ].
	^ self scan39
]

{ #category : #generated }
HTMLScanner >> scan42 [

	[ 
	self recordMatch: #( 3 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan40 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $? ifTrue: [ ^ self scan43 ].
	^ self scan39
]

{ #category : #generated }
HTMLScanner >> scan43 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan40 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 3 6 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan40 ].
		currentCharacter == $> ifTrue: [ ^ self scan42 ].
		currentCharacter == $? ifTrue: [ ^ self scan43 ].
		^ self scan39 ].
	currentCharacter == $? ] whileTrue.
	^ self scan39
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
			self recordMatch: #( 8 18 ).
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
									self recordMatch: #( 8 17 ).
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
			self recordMatch: #( 9 18 ).
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
									self recordMatch: #( 9 17 ).
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
	self recordMatch: #( 9 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan48 ].
	currentCharacter == $> ] whileTrue.
	^ self scan47
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
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan51 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan51 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan52 ].
	currentCharacter == $< ] whileTrue.
	^ self scan50
]

{ #category : #generated }
HTMLScanner >> scan52 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan51 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 18 20 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan51 ].
		^ self scan50 ].
	currentCharacter == $s ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan51 ].
		currentCharacter == $c ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan51 ].
			currentCharacter == $r ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan51 ].
				currentCharacter == $i ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan51 ].
					currentCharacter == $p ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan51 ].
						currentCharacter == $t ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan51 ].
							currentCharacter == $> ifTrue: [ 
								self recordMatch: #( 17 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan51 ] ] ] ] ] ].
			^ self scan50 ].
		currentCharacter == $t ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan51 ].
			currentCharacter == $y ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan51 ].
				currentCharacter == $l ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan51 ].
					currentCharacter == $e ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan51 ].
						currentCharacter == $> ifTrue: [ 
							self recordMatch: #( 19 ).
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan51 ] ] ] ] ] ] ].
	^ self scan50
]

{ #category : #generated }
HTMLScanner >> scan53 [

	[ 
	self recordMatch: #( 7 ).
	self step.
	currentCharacter == Character cr ifTrue: [ ^ self scan54 ].
	currentCharacter == $< ifTrue: [ ^ self scan51 ].
	(currentCharacter between: Character tab and: Character lf) or: [ 
		currentCharacter == Character space ] ] whileTrue.
	^ self scan50
]

{ #category : #generated }
HTMLScanner >> scan54 [

	self step.
	currentCharacter == Character lf ifTrue: [ ^ self scan53 ].
	currentCharacter == $< ifTrue: [ ^ self scan51 ].
	^ self scan50
]

{ #category : #generated }
HTMLScanner >> scan55 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	(currentCharacter == $: or: [ 
		 (currentCharacter between: $A and: $Z) or: [ 
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan56 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan56 [

	[ 
	self recordMatch: #( 16 ).
	self step.
	currentCharacter == $) ifTrue: [ 
		self recordMatch: #( 16 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan2 ].
		currentCharacter == $] ifTrue: [ ^ self scan57 ].
		^ self scan1 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	currentCharacter == $] ifTrue: [ ^ self scan57 ].
	(currentCharacter between: $- and: $.) or: [ 
		(currentCharacter between: $0 and: $:) or: [ 
			(currentCharacter between: $A and: $Z) or: [ 
				currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ]
		whileTrue.
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan57 [

	self recordMatch: #( 16 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	^ self scan1
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
HTMLScanner >> scan7 [

	self recordMatch: #( 21 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	^ self scan1
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
HTMLScanner >> scanForToken [

	scope == #style ifTrue: [ 
		self step.
		currentCharacter == Character cr ifTrue: [ ^ self scan54 ].
		currentCharacter == $< ifTrue: [ ^ self scan51 ].
		((currentCharacter between: Character tab and: Character lf) or: [ 
			 currentCharacter == Character space ]) ifTrue: [ ^ self scan53 ].
		^ self scan50 ].
	scope == #default ifTrue: [ ^ self scan12 ].
	scope == #attvalue ifTrue: [ ^ self scanForTokenX1 ].
	scope == #tag ifTrue: [ ^ self scanForTokenX2 ].
	^ self reportLastMatch
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1 [

	self step.
	currentCharacter == Character cr ifTrue: [ ^ self scan5 ].
	currentCharacter == Character space ifTrue: [ 
		[ 
		self recordMatch: #( 7 ).
		self step.
		currentCharacter == Character cr ifTrue: [ ^ self scan5 ].
		currentCharacter == Character space ] whileTrue ].
	^ self scanForTokenX1X1
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X1 [

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
HTMLScanner >> scanForTokenX2 [

	self step.
	currentCharacter == Character cr ifTrue: [ ^ self scan5 ].
	currentCharacter == $( ifTrue: [ ^ self scan55 ].
	currentCharacter == $/ ifTrue: [ ^ self scanForTokenX2X2 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	currentCharacter == $= ifTrue: [ ^ self scanForTokenX2X4 ].
	currentCharacter == $> ifTrue: [ ^ self scanForTokenX2X3 ].
	currentCharacter == $[ ifTrue: [ ^ self scanForTokenX2X1 ].
	((currentCharacter between: Character tab and: Character lf) or: [ 
		 currentCharacter == Character space ]) ifTrue: [ ^ self scan4 ].
	(currentCharacter == $: or: [ 
		 (currentCharacter between: $A and: $Z) or: [ 
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan56 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scanForTokenX2X1 [

	self step.
	currentCharacter == $( ifTrue: [ ^ self scan55 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	(currentCharacter == $: or: [ 
		 (currentCharacter between: $A and: $Z) or: [ 
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan56 ].
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
