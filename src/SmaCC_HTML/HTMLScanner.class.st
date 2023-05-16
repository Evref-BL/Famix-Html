Class {
	#name : #HTMLScanner,
	#superclass : #SmaCCScanner,
	#category : #'SmaCC_HTML'
}

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
	currentCharacter == Character cr ifTrue: [ ^ self scan7 ].
	currentCharacter == Character space ifTrue: [ ^ self scan1X1 ].
	currentCharacter == $" ifTrue: [ ^ self scan8 ].
	^ self scan1X2
]

{ #category : #generated }
HTMLScanner >> scan10 [

	[ 
	self recordMatch: #( 22 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan9 ].
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	currentCharacter isDigit or: [ 
		(currentCharacter between: $A and: $F) or: [ 
			currentCharacter between: $a and: $f ] ] ] whileTrue.
	(currentCharacter == $# or: [ 
		 (currentCharacter between: $+ and: $=) or: [ 
			 currentCharacter == $? or: [ 
				 (currentCharacter between: $G and: $Z) or: [ 
					 currentCharacter == $_ or: [ 
						 currentCharacter between: $g and: $z ] ] ] ] ]) ifTrue: [ 
		^ self scan11 ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan100 [

	[ 
	self recordMatch: #( 4 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan98 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $? ifTrue: [ ^ self scan101 ].
	^ self scan97
]

{ #category : #generated }
HTMLScanner >> scan101 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan98 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 4 7 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan98 ].
		currentCharacter == $> ifTrue: [ ^ self scan100 ].
		currentCharacter == $? ifTrue: [ ^ self scan101 ].
		^ self scan97 ].
	currentCharacter == $? ] whileTrue.
	^ self scan97
]

{ #category : #generated }
HTMLScanner >> scan102 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan98 ].
	currentCharacter == $> ifTrue: [ ^ self scan100 ].
	currentCharacter == $? ifTrue: [ ^ self scan101 ].
	currentCharacter == $c ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan98 ].
		currentCharacter == $> ifTrue: [ ^ self scan100 ].
		currentCharacter == $? ifTrue: [ ^ self scan101 ].
		currentCharacter == $r ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan98 ].
			currentCharacter == $> ifTrue: [ ^ self scan100 ].
			currentCharacter == $? ifTrue: [ ^ self scan101 ].
			currentCharacter == $i ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan98 ].
				currentCharacter == $> ifTrue: [ ^ self scan100 ].
				currentCharacter == $? ifTrue: [ ^ self scan101 ].
				currentCharacter == $p ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan98 ].
					currentCharacter == $> ifTrue: [ ^ self scan100 ].
					currentCharacter == $? ifTrue: [ ^ self scan101 ].
					currentCharacter == $t ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan98 ].
						currentCharacter == $> ifTrue: [ 
							self recordMatch: #( 4 18 ).
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan98 ].
							currentCharacter == $> ifTrue: [ ^ self scan100 ] ].
						currentCharacter == $? ifTrue: [ ^ self scan101 ] ] ] ] ].
		^ self scan97 ].
	currentCharacter == $t ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan98 ].
		currentCharacter == $> ifTrue: [ ^ self scan100 ].
		currentCharacter == $? ifTrue: [ ^ self scan101 ].
		currentCharacter == $y ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan98 ].
			currentCharacter == $> ifTrue: [ ^ self scan100 ].
			currentCharacter == $? ifTrue: [ ^ self scan101 ].
			currentCharacter == $l ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan98 ].
				currentCharacter == $> ifTrue: [ ^ self scan100 ].
				currentCharacter == $? ifTrue: [ ^ self scan101 ].
				currentCharacter == $e ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan98 ].
					currentCharacter == $> ifTrue: [ 
						self recordMatch: #( 4 20 ).
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan98 ].
						currentCharacter == $> ifTrue: [ ^ self scan100 ] ].
					currentCharacter == $? ifTrue: [ ^ self scan101 ] ] ] ] ].
	^ self scan97
]

{ #category : #generated }
HTMLScanner >> scan103 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan104 ].
	currentCharacter == $> ifTrue: [ ^ self scan106 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan104 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan105 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan106 ].
	^ self scan103
]

{ #category : #generated }
HTMLScanner >> scan105 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan104 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 9 19 21 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan104 ].
		currentCharacter == $> ifTrue: [ ^ self scan106 ].
		^ self scan103 ].
	currentCharacter == $s ifTrue: [ ^ self scan107 ].
	^ self scan103
]

{ #category : #generated }
HTMLScanner >> scan106 [

	[ 
	self recordMatch: #( 9 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan104 ].
	currentCharacter == $> ] whileTrue.
	^ self scan103
]

{ #category : #generated }
HTMLScanner >> scan107 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan104 ].
	currentCharacter == $> ifTrue: [ ^ self scan106 ].
	currentCharacter == $c ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan104 ].
		currentCharacter == $> ifTrue: [ ^ self scan106 ].
		currentCharacter == $r ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan104 ].
			currentCharacter == $> ifTrue: [ ^ self scan106 ].
			currentCharacter == $i ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan104 ].
				currentCharacter == $> ifTrue: [ ^ self scan106 ].
				currentCharacter == $p ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan104 ].
					currentCharacter == $> ifTrue: [ ^ self scan106 ].
					currentCharacter == $t ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan104 ].
						currentCharacter == $> ifTrue: [ 
							self recordMatch: #( 9 18 ).
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan104 ].
							currentCharacter == $> ifTrue: [ ^ self scan106 ] ] ] ] ] ].
		^ self scan103 ].
	currentCharacter == $t ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan104 ].
		currentCharacter == $> ifTrue: [ ^ self scan106 ].
		currentCharacter == $y ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan104 ].
			currentCharacter == $> ifTrue: [ ^ self scan106 ].
			currentCharacter == $l ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan104 ].
				currentCharacter == $> ifTrue: [ ^ self scan106 ].
				currentCharacter == $e ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan104 ].
					currentCharacter == $> ifTrue: [ 
						self recordMatch: #( 9 20 ).
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan104 ].
						currentCharacter == $> ifTrue: [ ^ self scan106 ] ] ] ] ] ].
	^ self scan103
]

{ #category : #generated }
HTMLScanner >> scan108 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan109 ].
	currentCharacter == $> ifTrue: [ ^ self scan111 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan109 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan110 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan111 ].
	^ self scan108
]

{ #category : #generated }
HTMLScanner >> scan11 [

	[ 
	self recordMatch: #( 22 ).
	self step.
	currentCharacter == Character space ifTrue: [ ^ self scan9 ].
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	currentCharacter == $# or: [ 
		(currentCharacter between: $+ and: $=) or: [ 
			currentCharacter == $? or: [ 
				(currentCharacter between: $A and: $Z) or: [ 
					currentCharacter == $_ or: [ 
						currentCharacter between: $a and: $z ] ] ] ] ] ] whileTrue.
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan110 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan109 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 10 19 21 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan109 ].
		currentCharacter == $> ifTrue: [ ^ self scan111 ].
		^ self scan108 ].
	currentCharacter == $s ifTrue: [ ^ self scan112 ].
	^ self scan108
]

{ #category : #generated }
HTMLScanner >> scan111 [

	[ 
	self recordMatch: #( 10 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan109 ].
	currentCharacter == $> ] whileTrue.
	^ self scan108
]

{ #category : #generated }
HTMLScanner >> scan112 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan109 ].
	currentCharacter == $> ifTrue: [ ^ self scan111 ].
	currentCharacter == $c ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan109 ].
		currentCharacter == $> ifTrue: [ ^ self scan111 ].
		currentCharacter == $r ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan109 ].
			currentCharacter == $> ifTrue: [ ^ self scan111 ].
			currentCharacter == $i ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan109 ].
				currentCharacter == $> ifTrue: [ ^ self scan111 ].
				currentCharacter == $p ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan109 ].
					currentCharacter == $> ifTrue: [ ^ self scan111 ].
					currentCharacter == $t ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan109 ].
						currentCharacter == $> ifTrue: [ 
							self recordMatch: #( 10 18 ).
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan109 ].
							currentCharacter == $> ifTrue: [ ^ self scan111 ] ] ] ] ] ].
		^ self scan108 ].
	currentCharacter == $t ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan109 ].
		currentCharacter == $> ifTrue: [ ^ self scan111 ].
		currentCharacter == $y ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan109 ].
			currentCharacter == $> ifTrue: [ ^ self scan111 ].
			currentCharacter == $l ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan109 ].
				currentCharacter == $> ifTrue: [ ^ self scan111 ].
				currentCharacter == $e ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan109 ].
					currentCharacter == $> ifTrue: [ 
						self recordMatch: #( 10 20 ).
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan109 ].
						currentCharacter == $> ifTrue: [ ^ self scan111 ] ] ] ] ] ].
	^ self scan108
]

{ #category : #generated }
HTMLScanner >> scan12 [

	[ 
	self step.
	currentCharacter == $' ifTrue: [ ^ self scan9 ].
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan13 [

	[ 
	self recordMatch: #( 22 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	currentCharacter isDigit ] whileTrue.
	(currentCharacter == Character space or: [ currentCharacter == $% ]) 
		ifTrue: [ ^ self scan9 ].
	(currentCharacter == $# or: [ 
		 (currentCharacter between: $+ and: $=) or: [ 
			 currentCharacter == $? or: [ 
				 (currentCharacter between: $A and: $Z) or: [ 
					 currentCharacter == $_ or: [ 
						 currentCharacter between: $a and: $z ] ] ] ] ]) ifTrue: [ 
		^ self scan11 ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan14 [

	self recordMatch: #( 11 ).
	self step.
	currentCharacter == $! ifTrue: [ ^ self scan15 ].
	currentCharacter == $% ifTrue: [ ^ self scan34 ].
	currentCharacter == $/ ifTrue: [ ^ self scan4 ].
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	currentCharacter == $? ifTrue: [ ^ self scan14X1 ].
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
						currentCharacter == $t ifTrue: [ ^ self scan45 ] ] ] ].
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
					currentCharacter == $e ifTrue: [ ^ self scan48 ] ] ] ] ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan14X1 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan38 ].
	currentCharacter == $? ifTrue: [ ^ self scan39 ].
	currentCharacter == $x ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan38 ].
		currentCharacter == $? ifTrue: [ ^ self scan39 ].
		currentCharacter == $m ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan38 ].
			currentCharacter == $? ifTrue: [ ^ self scan39 ].
			currentCharacter == $l ifTrue: [ ^ self scan40 ] ] ].
	^ self scan37
]

{ #category : #generated }
HTMLScanner >> scan15 [

	self step.
	currentCharacter == $- ifTrue: [ 
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan19 ].
		currentCharacter == $< ifTrue: [ ^ self scan17 ].
		currentCharacter == $> ifTrue: [ ^ self scan18 ].
		^ self scan16 ].
	currentCharacter == $< ifTrue: [ ^ self scan17 ].
	currentCharacter == $> ifTrue: [ ^ self scan18 ].
	currentCharacter == $[ ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan25 ].
		currentCharacter == $> ifTrue: [ ^ self scan27 ].
		currentCharacter == $C ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan25 ].
			currentCharacter == $> ifTrue: [ ^ self scan27 ].
			currentCharacter == $D ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan25 ].
				currentCharacter == $> ifTrue: [ ^ self scan27 ].
				currentCharacter == $A ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan25 ].
					currentCharacter == $> ifTrue: [ ^ self scan27 ].
					currentCharacter == $T ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan25 ].
						currentCharacter == $> ifTrue: [ ^ self scan27 ].
						currentCharacter == $A ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan25 ].
							currentCharacter == $> ifTrue: [ ^ self scan27 ].
							currentCharacter == $[ ifTrue: [ ^ self scan29 ] ] ] ] ] ].
		currentCharacter == $] ifTrue: [ ^ self scan28 ].
		^ self scan24 ].
	^ self scan16
]

{ #category : #generated }
HTMLScanner >> scan16 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan17 ].
	currentCharacter == $> ifTrue: [ ^ self scan18 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan17 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan17 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 6 19 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan17 ].
			currentCharacter == $> ifTrue: [ ^ self scan18 ].
			^ self scan16 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan17 ].
			currentCharacter == $> ifTrue: [ ^ self scan18 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan17 ].
				currentCharacter == $> ifTrue: [ ^ self scan18 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan17 ].
					currentCharacter == $> ifTrue: [ ^ self scan18 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan17 ].
						currentCharacter == $> ifTrue: [ ^ self scan18 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan17 ].
							currentCharacter == $> ifTrue: [ ^ self scan18 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan17 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 6 18 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan17 ].
									currentCharacter == $> ifTrue: [ ^ self scan18 ] ] ] ] ] ] ] ].
		^ self scan16 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan18 ].
	^ self scan16
]

{ #category : #generated }
HTMLScanner >> scan18 [

	[ 
	self recordMatch: #( 6 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan17 ].
	currentCharacter == $> ] whileTrue.
	^ self scan16
]

{ #category : #generated }
HTMLScanner >> scan19 [

	[ 
	self step.
	currentCharacter == $- ifTrue: [ ^ self scan20 ].
	currentCharacter == $< ifTrue: [ ^ self scan21 ].
	currentCharacter == $> ifTrue: [ ^ self scan23 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan1X1 [

	[ 
	self recordMatch: #( 1 8 ).
	self step.
	currentCharacter == Character cr ifTrue: [ ^ self scan7 ].
	currentCharacter == Character space ] whileTrue.
	currentCharacter == $" ifTrue: [ ^ self scan8 ].
	^ self scan1X1X1
]

{ #category : #generated }
HTMLScanner >> scan1X1X1 [

	currentCharacter == $# ifTrue: [ ^ self scan10 ].
	currentCharacter == $' ifTrue: [ ^ self scan12 ].
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	(currentCharacter between: Character tab and: Character lf) ifTrue: [ 
		^ self scan5 ].
	(currentCharacter isSeparator or: [ 
		 currentCharacter == Character pageUp ]) ifTrue: [ ^ self scan6 ].
	currentCharacter isDigit ifTrue: [ ^ self scan13 ].
	((currentCharacter between: $+ and: $=) or: [ 
		 currentCharacter == $? or: [ 
			 (currentCharacter between: $A and: $Z) or: [ 
				 currentCharacter == $_ or: [ 
					 currentCharacter between: $a and: $z ] ] ] ]) ifTrue: [ 
		^ self scan11 ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan1X2 [

	currentCharacter == $# ifTrue: [ ^ self scan10 ].
	currentCharacter == $' ifTrue: [ ^ self scan12 ].
	currentCharacter == $< ifTrue: [ ^ self scan14 ].
	(currentCharacter between: Character tab and: Character lf) ifTrue: [ 
		^ self scan5 ].
	(currentCharacter isSeparator or: [ 
		 currentCharacter == Character pageUp ]) ifTrue: [ ^ self scan6 ].
	currentCharacter isDigit ifTrue: [ ^ self scan13 ].
	((currentCharacter between: $+ and: $=) or: [ 
		 currentCharacter == $? or: [ 
			 (currentCharacter between: $A and: $Z) or: [ 
				 currentCharacter == $_ or: [ 
					 currentCharacter between: $a and: $z ] ] ] ]) ifTrue: [ 
		^ self scan11 ].
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

	self step.
	currentCharacter == $- ifTrue: [ 
		[ 
		self step.
		currentCharacter == $- ] whileTrue.
		currentCharacter == $< ifTrue: [ ^ self scan21 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 2 6 ).
			self step.
			currentCharacter == $- ifTrue: [ ^ self scan20 ].
			currentCharacter == $< ifTrue: [ ^ self scan21 ].
			currentCharacter == $> ifTrue: [ ^ self scan23 ] ].
		^ self scan19 ].
	currentCharacter == $< ifTrue: [ ^ self scan21 ].
	currentCharacter == $> ifTrue: [ ^ self scan23 ].
	^ self scan19
]

{ #category : #generated }
HTMLScanner >> scan21 [

	[ 
	self step.
	currentCharacter == $- ifTrue: [ ^ self scan20 ].
	currentCharacter == $/ ifTrue: [ ^ self scan22 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan23 ].
	^ self scan19
]

{ #category : #generated }
HTMLScanner >> scan22 [

	self step.
	currentCharacter == $- ifTrue: [ ^ self scan20 ].
	currentCharacter == $< ifTrue: [ ^ self scan21 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 6 19 ).
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan20 ].
		currentCharacter == $< ifTrue: [ ^ self scan21 ].
		currentCharacter == $> ifTrue: [ ^ self scan23 ].
		^ self scan19 ].
	currentCharacter == $s ifTrue: [ 
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan20 ].
		currentCharacter == $< ifTrue: [ ^ self scan21 ].
		currentCharacter == $> ifTrue: [ ^ self scan23 ].
		currentCharacter == $c ifTrue: [ 
			self step.
			currentCharacter == $- ifTrue: [ ^ self scan20 ].
			currentCharacter == $< ifTrue: [ ^ self scan21 ].
			currentCharacter == $> ifTrue: [ ^ self scan23 ].
			currentCharacter == $r ifTrue: [ 
				self step.
				currentCharacter == $- ifTrue: [ ^ self scan20 ].
				currentCharacter == $< ifTrue: [ ^ self scan21 ].
				currentCharacter == $> ifTrue: [ ^ self scan23 ].
				currentCharacter == $i ifTrue: [ 
					self step.
					currentCharacter == $- ifTrue: [ ^ self scan20 ].
					currentCharacter == $< ifTrue: [ ^ self scan21 ].
					currentCharacter == $> ifTrue: [ ^ self scan23 ].
					currentCharacter == $p ifTrue: [ 
						self step.
						currentCharacter == $- ifTrue: [ ^ self scan20 ].
						currentCharacter == $< ifTrue: [ ^ self scan21 ].
						currentCharacter == $> ifTrue: [ ^ self scan23 ].
						currentCharacter == $t ifTrue: [ 
							self step.
							currentCharacter == $- ifTrue: [ ^ self scan20 ].
							currentCharacter == $< ifTrue: [ ^ self scan21 ].
							currentCharacter == $> ifTrue: [ 
								self recordMatch: #( 6 18 ).
								self step.
								currentCharacter == $- ifTrue: [ ^ self scan20 ].
								currentCharacter == $< ifTrue: [ ^ self scan21 ].
								currentCharacter == $> ifTrue: [ ^ self scan23 ] ] ] ] ] ] ] ].
	^ self scan19
]

{ #category : #generated }
HTMLScanner >> scan23 [

	[ 
	self recordMatch: #( 6 ).
	self step.
	currentCharacter == $- ifTrue: [ ^ self scan20 ].
	currentCharacter == $< ifTrue: [ ^ self scan21 ].
	currentCharacter == $> ] whileTrue.
	^ self scan19
]

{ #category : #generated }
HTMLScanner >> scan24 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan25 ].
	currentCharacter == $> ifTrue: [ ^ self scan27 ].
	currentCharacter == $] ifTrue: [ ^ self scan28 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan25 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan26 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan27 ].
	currentCharacter == $] ifTrue: [ ^ self scan28 ].
	^ self scan24
]

{ #category : #generated }
HTMLScanner >> scan26 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan25 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 6 19 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan25 ].
		currentCharacter == $> ifTrue: [ ^ self scan27 ].
		currentCharacter == $] ifTrue: [ ^ self scan28 ].
		^ self scan24 ].
	currentCharacter == $] ifTrue: [ ^ self scan28 ].
	currentCharacter == $s ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan25 ].
		currentCharacter == $> ifTrue: [ ^ self scan27 ].
		currentCharacter == $] ifTrue: [ ^ self scan28 ].
		currentCharacter == $c ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan25 ].
			currentCharacter == $> ifTrue: [ ^ self scan27 ].
			currentCharacter == $] ifTrue: [ ^ self scan28 ].
			currentCharacter == $r ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan25 ].
				currentCharacter == $> ifTrue: [ ^ self scan27 ].
				currentCharacter == $] ifTrue: [ ^ self scan28 ].
				currentCharacter == $i ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan25 ].
					currentCharacter == $> ifTrue: [ ^ self scan27 ].
					currentCharacter == $] ifTrue: [ ^ self scan28 ].
					currentCharacter == $p ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan25 ].
						currentCharacter == $> ifTrue: [ ^ self scan27 ].
						currentCharacter == $] ifTrue: [ ^ self scan28 ].
						currentCharacter == $t ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan25 ].
							currentCharacter == $> ifTrue: [ 
								self recordMatch: #( 6 18 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan25 ].
								currentCharacter == $> ifTrue: [ ^ self scan27 ] ].
							currentCharacter == $] ifTrue: [ ^ self scan28 ] ] ] ] ] ] ].
	^ self scan24
]

{ #category : #generated }
HTMLScanner >> scan27 [

	[ 
	self recordMatch: #( 6 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan25 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $] ifTrue: [ ^ self scan28 ].
	^ self scan24
]

{ #category : #generated }
HTMLScanner >> scan28 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan25 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 3 6 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan25 ].
		currentCharacter == $> ifTrue: [ ^ self scan27 ].
		currentCharacter == $] ifTrue: [ ^ self scan28 ].
		^ self scan24 ].
	currentCharacter == $] ] whileTrue.
	^ self scan24
]

{ #category : #generated }
HTMLScanner >> scan29 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan30 ].
	currentCharacter == $> ifTrue: [ ^ self scan32 ].
	currentCharacter == $] ifTrue: [ ^ self scan33 ].
	true ] whileTrue
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
	currentCharacter == $/ ifTrue: [ ^ self scan31 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan32 ].
	currentCharacter == $] ifTrue: [ ^ self scan33 ].
	^ self scan29
]

{ #category : #generated }
HTMLScanner >> scan31 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan30 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 6 19 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan30 ].
		currentCharacter == $> ifTrue: [ ^ self scan32 ].
		currentCharacter == $] ifTrue: [ ^ self scan33 ].
		^ self scan29 ].
	currentCharacter == $] ifTrue: [ ^ self scan33 ].
	currentCharacter == $s ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan30 ].
		currentCharacter == $> ifTrue: [ ^ self scan32 ].
		currentCharacter == $] ifTrue: [ ^ self scan33 ].
		currentCharacter == $c ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan30 ].
			currentCharacter == $> ifTrue: [ ^ self scan32 ].
			currentCharacter == $] ifTrue: [ ^ self scan33 ].
			currentCharacter == $r ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan30 ].
				currentCharacter == $> ifTrue: [ ^ self scan32 ].
				currentCharacter == $] ifTrue: [ ^ self scan33 ].
				currentCharacter == $i ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan30 ].
					currentCharacter == $> ifTrue: [ ^ self scan32 ].
					currentCharacter == $] ifTrue: [ ^ self scan33 ].
					currentCharacter == $p ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan30 ].
						currentCharacter == $> ifTrue: [ ^ self scan32 ].
						currentCharacter == $] ifTrue: [ ^ self scan33 ].
						currentCharacter == $t ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan30 ].
							currentCharacter == $> ifTrue: [ 
								self recordMatch: #( 6 18 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan30 ].
								currentCharacter == $> ifTrue: [ ^ self scan32 ] ].
							currentCharacter == $] ifTrue: [ ^ self scan33 ] ] ] ] ] ] ].
	^ self scan29
]

{ #category : #generated }
HTMLScanner >> scan32 [

	[ 
	self recordMatch: #( 6 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan30 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $] ifTrue: [ ^ self scan33 ].
	^ self scan29
]

{ #category : #generated }
HTMLScanner >> scan33 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan30 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 3 6 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan30 ].
		currentCharacter == $> ifTrue: [ ^ self scan32 ].
		currentCharacter == $] ifTrue: [ ^ self scan33 ].
		^ self scan29 ].
	currentCharacter == $] ifTrue: [ 
		[ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan30 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 3 5 6 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan30 ].
			currentCharacter == $> ifTrue: [ ^ self scan32 ].
			currentCharacter == $] ifTrue: [ ^ self scan33 ].
			^ self scan29 ].
		currentCharacter == $] ] whileTrue ].
	^ self scan29
]

{ #category : #generated }
HTMLScanner >> scan34 [

	[ 
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan35 ].
	currentCharacter == $< ifTrue: [ ^ self scan36 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan35 [

	[ 
	self step.
	currentCharacter == $% ] whileTrue.
	currentCharacter == $< ifTrue: [ ^ self scan36 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 7 ).
		self step.
		currentCharacter == $% ifTrue: [ ^ self scan35 ].
		currentCharacter == $< ifTrue: [ ^ self scan36 ] ].
	^ self scan34
]

{ #category : #generated }
HTMLScanner >> scan36 [

	[ 
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan35 ].
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $% ifTrue: [ ^ self scan35 ].
		currentCharacter == $< ifTrue: [ ^ self scan36 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 19 ).
			self step.
			currentCharacter == $% ifTrue: [ ^ self scan35 ].
			currentCharacter == $< ifTrue: [ ^ self scan36 ].
			^ self scan34 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $% ifTrue: [ ^ self scan35 ].
			currentCharacter == $< ifTrue: [ ^ self scan36 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $% ifTrue: [ ^ self scan35 ].
				currentCharacter == $< ifTrue: [ ^ self scan36 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $% ifTrue: [ ^ self scan35 ].
					currentCharacter == $< ifTrue: [ ^ self scan36 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $% ifTrue: [ ^ self scan35 ].
						currentCharacter == $< ifTrue: [ ^ self scan36 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $% ifTrue: [ ^ self scan35 ].
							currentCharacter == $< ifTrue: [ ^ self scan36 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $% ifTrue: [ ^ self scan35 ].
								currentCharacter == $< ifTrue: [ ^ self scan36 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 18 ).
									self step.
									currentCharacter == $% ifTrue: [ ^ self scan35 ].
									currentCharacter == $< ifTrue: [ ^ self scan36 ] ] ] ] ] ] ] ].
		^ self scan34 ].
	currentCharacter == $< ] whileTrue.
	^ self scan34
]

{ #category : #generated }
HTMLScanner >> scan37 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan38 ].
	currentCharacter == $? ifTrue: [ ^ self scan39 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan38 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan38 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 19 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan38 ].
			currentCharacter == $? ifTrue: [ ^ self scan39 ].
			^ self scan37 ].
		currentCharacter == $? ifTrue: [ ^ self scan39 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan38 ].
			currentCharacter == $? ifTrue: [ ^ self scan39 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan38 ].
				currentCharacter == $? ifTrue: [ ^ self scan39 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan38 ].
					currentCharacter == $? ifTrue: [ ^ self scan39 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan38 ].
						currentCharacter == $? ifTrue: [ ^ self scan39 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan38 ].
							currentCharacter == $? ifTrue: [ ^ self scan39 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan38 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 18 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan38 ] ].
								currentCharacter == $? ifTrue: [ ^ self scan39 ] ] ] ] ] ] ].
		^ self scan37 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $? ifTrue: [ ^ self scan39 ].
	^ self scan37
]

{ #category : #generated }
HTMLScanner >> scan39 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan38 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 7 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan38 ].
		currentCharacter == $? ifTrue: [ ^ self scan39 ].
		^ self scan37 ].
	currentCharacter == $? ] whileTrue.
	^ self scan37
]

{ #category : #generated }
HTMLScanner >> scan4 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 19 ).
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
								self recordMatch: #( 18 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan3 ] ] ] ] ] ] ] ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan40 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan41 ].
	currentCharacter == $> ifTrue: [ ^ self scan43 ].
	currentCharacter == $? ifTrue: [ ^ self scan44 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan41 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan42 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan43 ].
	currentCharacter == $? ifTrue: [ ^ self scan44 ].
	^ self scan40
]

{ #category : #generated }
HTMLScanner >> scan42 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan41 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 4 19 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan41 ].
		currentCharacter == $> ifTrue: [ ^ self scan43 ].
		currentCharacter == $? ifTrue: [ ^ self scan44 ].
		^ self scan40 ].
	currentCharacter == $? ifTrue: [ ^ self scan44 ].
	currentCharacter == $s ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan41 ].
		currentCharacter == $> ifTrue: [ ^ self scan43 ].
		currentCharacter == $? ifTrue: [ ^ self scan44 ].
		currentCharacter == $c ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan41 ].
			currentCharacter == $> ifTrue: [ ^ self scan43 ].
			currentCharacter == $? ifTrue: [ ^ self scan44 ].
			currentCharacter == $r ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan41 ].
				currentCharacter == $> ifTrue: [ ^ self scan43 ].
				currentCharacter == $? ifTrue: [ ^ self scan44 ].
				currentCharacter == $i ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan41 ].
					currentCharacter == $> ifTrue: [ ^ self scan43 ].
					currentCharacter == $? ifTrue: [ ^ self scan44 ].
					currentCharacter == $p ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan41 ].
						currentCharacter == $> ifTrue: [ ^ self scan43 ].
						currentCharacter == $? ifTrue: [ ^ self scan44 ].
						currentCharacter == $t ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan41 ].
							currentCharacter == $> ifTrue: [ 
								self recordMatch: #( 4 18 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan41 ].
								currentCharacter == $> ifTrue: [ ^ self scan43 ] ].
							currentCharacter == $? ifTrue: [ ^ self scan44 ] ] ] ] ] ] ].
	^ self scan40
]

{ #category : #generated }
HTMLScanner >> scan43 [

	[ 
	self recordMatch: #( 4 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan41 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $? ifTrue: [ ^ self scan44 ].
	^ self scan40
]

{ #category : #generated }
HTMLScanner >> scan44 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan41 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 4 7 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan41 ].
		currentCharacter == $> ifTrue: [ ^ self scan43 ].
		currentCharacter == $? ifTrue: [ ^ self scan44 ].
		^ self scan40 ].
	currentCharacter == $? ] whileTrue.
	^ self scan40
]

{ #category : #generated }
HTMLScanner >> scan45 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan46 ].
	currentCharacter == $> ifTrue: [ ^ self scan47 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan46 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan46 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 9 19 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan46 ].
			currentCharacter == $> ifTrue: [ ^ self scan47 ].
			^ self scan45 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan46 ].
			currentCharacter == $> ifTrue: [ ^ self scan47 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan46 ].
				currentCharacter == $> ifTrue: [ ^ self scan47 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan46 ].
					currentCharacter == $> ifTrue: [ ^ self scan47 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan46 ].
						currentCharacter == $> ifTrue: [ ^ self scan47 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan46 ].
							currentCharacter == $> ifTrue: [ ^ self scan47 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan46 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 9 18 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan46 ].
									currentCharacter == $> ifTrue: [ ^ self scan47 ] ] ] ] ] ] ] ].
		^ self scan45 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan47 ].
	^ self scan45
]

{ #category : #generated }
HTMLScanner >> scan47 [

	[ 
	self recordMatch: #( 9 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan46 ].
	currentCharacter == $> ] whileTrue.
	^ self scan45
]

{ #category : #generated }
HTMLScanner >> scan48 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan49 ].
	currentCharacter == $> ifTrue: [ ^ self scan50 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan49 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan49 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 10 19 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan49 ].
			currentCharacter == $> ifTrue: [ ^ self scan50 ].
			^ self scan48 ].
		currentCharacter == $s ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan49 ].
			currentCharacter == $> ifTrue: [ ^ self scan50 ].
			currentCharacter == $c ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan49 ].
				currentCharacter == $> ifTrue: [ ^ self scan50 ].
				currentCharacter == $r ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan49 ].
					currentCharacter == $> ifTrue: [ ^ self scan50 ].
					currentCharacter == $i ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan49 ].
						currentCharacter == $> ifTrue: [ ^ self scan50 ].
						currentCharacter == $p ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan49 ].
							currentCharacter == $> ifTrue: [ ^ self scan50 ].
							currentCharacter == $t ifTrue: [ 
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan49 ].
								currentCharacter == $> ifTrue: [ 
									self recordMatch: #( 10 18 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan49 ].
									currentCharacter == $> ifTrue: [ ^ self scan50 ] ] ] ] ] ] ] ].
		^ self scan48 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan50 ].
	^ self scan48
]

{ #category : #generated }
HTMLScanner >> scan5 [

	[ 
	self recordMatch: #( 1 8 ).
	self step.
	currentCharacter == Character cr ifTrue: [ ^ self scan7 ].
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	(currentCharacter between: Character pageUp and: Character newPage) 
		ifTrue: [ ^ self scan6 ].
	currentCharacter isSeparator ] whileTrue.
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan50 [

	[ 
	self recordMatch: #( 10 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan49 ].
	currentCharacter == $> ] whileTrue.
	^ self scan48
]

{ #category : #generated }
HTMLScanner >> scan51 [

	[ 
	self recordMatch: #( 12 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan52 [

	[ 
	self recordMatch: #( 1 8 12 ).
	self step.
	currentCharacter == Character cr ifTrue: [ ^ self scan54 ].
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	(currentCharacter between: Character pageUp and: Character newPage) 
		ifTrue: [ ^ self scan53 ].
	currentCharacter isSeparator ] whileTrue.
	^ self scan51
]

{ #category : #generated }
HTMLScanner >> scan53 [

	[ 
	self recordMatch: #( 1 12 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	currentCharacter isSeparator or: [ 
		currentCharacter == Character pageUp ] ] whileTrue.
	^ self scan51
]

{ #category : #generated }
HTMLScanner >> scan54 [

	self recordMatch: #( 1 12 ).
	self step.
	currentCharacter == Character lf ifTrue: [ ^ self scan52 ].
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	(currentCharacter isSeparator or: [ 
		 currentCharacter == Character pageUp ]) ifTrue: [ ^ self scan53 ].
	^ self scan51
]

{ #category : #generated }
HTMLScanner >> scan55 [

	self step.
	currentCharacter == Character cr ifTrue: [ ^ self scan61 ].
	currentCharacter == $< ifTrue: [ ^ self scan62 ].
	(currentCharacter between: Character pageUp and: Character newPage) 
		ifTrue: [ ^ self scan60 ].
	currentCharacter isSeparator ifTrue: [ ^ self scan59 ].
	^ self scan56
]

{ #category : #generated }
HTMLScanner >> scan56 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan57 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan57 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan58 ].
	currentCharacter == $< ] whileTrue.
	^ self scan56
]

{ #category : #generated }
HTMLScanner >> scan58 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan57 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 19 21 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan57 ].
		^ self scan56 ].
	currentCharacter == $s ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan57 ].
		currentCharacter == $c ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan57 ].
			currentCharacter == $r ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan57 ].
				currentCharacter == $i ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan57 ].
					currentCharacter == $p ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan57 ].
						currentCharacter == $t ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan57 ].
							currentCharacter == $> ifTrue: [ 
								self recordMatch: #( 18 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan57 ] ] ] ] ] ].
			^ self scan56 ].
		currentCharacter == $t ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan57 ].
			currentCharacter == $y ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan57 ].
				currentCharacter == $l ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan57 ].
					currentCharacter == $e ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan57 ].
						currentCharacter == $> ifTrue: [ 
							self recordMatch: #( 20 ).
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan57 ] ] ] ] ] ] ].
	^ self scan56
]

{ #category : #generated }
HTMLScanner >> scan59 [

	[ 
	self recordMatch: #( 1 8 ).
	self step.
	currentCharacter == Character cr ifTrue: [ ^ self scan61 ].
	currentCharacter == $< ifTrue: [ ^ self scan57 ].
	(currentCharacter between: Character pageUp and: Character newPage) 
		ifTrue: [ ^ self scan60 ].
	currentCharacter isSeparator ] whileTrue.
	^ self scan56
]

{ #category : #generated }
HTMLScanner >> scan6 [

	[ 
	self recordMatch: #( 1 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	currentCharacter isSeparator or: [ 
		currentCharacter == Character pageUp ] ] whileTrue.
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan60 [

	[ 
	self recordMatch: #( 1 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan57 ].
	currentCharacter isSeparator or: [ 
		currentCharacter == Character pageUp ] ] whileTrue.
	^ self scan56
]

{ #category : #generated }
HTMLScanner >> scan61 [

	self recordMatch: #( 1 ).
	self step.
	currentCharacter == Character lf ifTrue: [ ^ self scan59 ].
	currentCharacter == $< ifTrue: [ ^ self scan57 ].
	(currentCharacter isSeparator or: [ 
		 currentCharacter == Character pageUp ]) ifTrue: [ ^ self scan60 ].
	^ self scan56
]

{ #category : #generated }
HTMLScanner >> scan62 [

	self recordMatch: #( 11 ).
	self step.
	currentCharacter == $! ifTrue: [ ^ self scan63 ].
	currentCharacter == $% ifTrue: [ ^ self scan87 ].
	currentCharacter == $/ ifTrue: [ ^ self scan58 ].
	currentCharacter == $< ifTrue: [ ^ self scan57 ].
	currentCharacter == $? ifTrue: [ ^ self scan62X1 ].
	currentCharacter == $s ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan57 ].
		currentCharacter == $c ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan57 ].
			currentCharacter == $r ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan57 ].
				currentCharacter == $i ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan57 ].
					currentCharacter == $p ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan57 ].
						currentCharacter == $t ifTrue: [ ^ self scan103 ] ] ] ].
			^ self scan56 ].
		currentCharacter == $t ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan57 ].
			currentCharacter == $y ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan57 ].
				currentCharacter == $l ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan57 ].
					currentCharacter == $e ifTrue: [ ^ self scan108 ] ] ] ] ].
	^ self scan56
]

{ #category : #generated }
HTMLScanner >> scan62X1 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan93 ].
	currentCharacter == $? ifTrue: [ ^ self scan95 ].
	currentCharacter == $x ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan93 ].
		currentCharacter == $? ifTrue: [ ^ self scan95 ].
		currentCharacter == $m ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan93 ].
			currentCharacter == $? ifTrue: [ ^ self scan95 ].
			currentCharacter == $l ifTrue: [ ^ self scan97 ] ] ].
	^ self scan92
]

{ #category : #generated }
HTMLScanner >> scan63 [

	self step.
	currentCharacter == $- ifTrue: [ 
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan69 ].
		currentCharacter == $< ifTrue: [ ^ self scan65 ].
		currentCharacter == $> ifTrue: [ ^ self scan67 ].
		^ self scan64 ].
	currentCharacter == $< ifTrue: [ ^ self scan65 ].
	currentCharacter == $> ifTrue: [ ^ self scan67 ].
	currentCharacter == $[ ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan76 ].
		currentCharacter == $> ifTrue: [ ^ self scan78 ].
		currentCharacter == $C ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan76 ].
			currentCharacter == $> ifTrue: [ ^ self scan78 ].
			currentCharacter == $D ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan76 ].
				currentCharacter == $> ifTrue: [ ^ self scan78 ].
				currentCharacter == $A ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan76 ].
					currentCharacter == $> ifTrue: [ ^ self scan78 ].
					currentCharacter == $T ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan76 ].
						currentCharacter == $> ifTrue: [ ^ self scan78 ].
						currentCharacter == $A ifTrue: [ 
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan76 ].
							currentCharacter == $> ifTrue: [ ^ self scan78 ].
							currentCharacter == $[ ifTrue: [ ^ self scan81 ] ] ] ] ] ].
		currentCharacter == $] ifTrue: [ ^ self scan79 ].
		^ self scan75 ].
	^ self scan64
]

{ #category : #generated }
HTMLScanner >> scan64 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan65 ].
	currentCharacter == $> ifTrue: [ ^ self scan67 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan65 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan66 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan67 ].
	^ self scan64
]

{ #category : #generated }
HTMLScanner >> scan66 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan65 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 6 19 21 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan65 ].
		currentCharacter == $> ifTrue: [ ^ self scan67 ].
		^ self scan64 ].
	currentCharacter == $s ifTrue: [ ^ self scan68 ].
	^ self scan64
]

{ #category : #generated }
HTMLScanner >> scan67 [

	[ 
	self recordMatch: #( 6 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan65 ].
	currentCharacter == $> ] whileTrue.
	^ self scan64
]

{ #category : #generated }
HTMLScanner >> scan68 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan65 ].
	currentCharacter == $> ifTrue: [ ^ self scan67 ].
	currentCharacter == $c ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan65 ].
		currentCharacter == $> ifTrue: [ ^ self scan67 ].
		currentCharacter == $r ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan65 ].
			currentCharacter == $> ifTrue: [ ^ self scan67 ].
			currentCharacter == $i ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan65 ].
				currentCharacter == $> ifTrue: [ ^ self scan67 ].
				currentCharacter == $p ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan65 ].
					currentCharacter == $> ifTrue: [ ^ self scan67 ].
					currentCharacter == $t ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan65 ].
						currentCharacter == $> ifTrue: [ 
							self recordMatch: #( 6 18 ).
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan65 ].
							currentCharacter == $> ifTrue: [ ^ self scan67 ] ] ] ] ] ].
		^ self scan64 ].
	currentCharacter == $t ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan65 ].
		currentCharacter == $> ifTrue: [ ^ self scan67 ].
		currentCharacter == $y ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan65 ].
			currentCharacter == $> ifTrue: [ ^ self scan67 ].
			currentCharacter == $l ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan65 ].
				currentCharacter == $> ifTrue: [ ^ self scan67 ].
				currentCharacter == $e ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan65 ].
					currentCharacter == $> ifTrue: [ 
						self recordMatch: #( 6 20 ).
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan65 ].
						currentCharacter == $> ifTrue: [ ^ self scan67 ] ] ] ] ] ].
	^ self scan64
]

{ #category : #generated }
HTMLScanner >> scan69 [

	[ 
	self step.
	currentCharacter == $- ifTrue: [ ^ self scan70 ].
	currentCharacter == $< ifTrue: [ ^ self scan71 ].
	currentCharacter == $> ifTrue: [ ^ self scan73 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan7 [

	self recordMatch: #( 1 ).
	self step.
	currentCharacter == Character lf ifTrue: [ ^ self scan5 ].
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	(currentCharacter isSeparator or: [ 
		 currentCharacter == Character pageUp ]) ifTrue: [ ^ self scan6 ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan70 [

	self step.
	currentCharacter == $- ifTrue: [ 
		[ 
		self step.
		currentCharacter == $- ] whileTrue.
		currentCharacter == $< ifTrue: [ ^ self scan71 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 2 6 ).
			self step.
			currentCharacter == $- ifTrue: [ ^ self scan70 ].
			currentCharacter == $< ifTrue: [ ^ self scan71 ].
			currentCharacter == $> ifTrue: [ ^ self scan73 ] ].
		^ self scan69 ].
	currentCharacter == $< ifTrue: [ ^ self scan71 ].
	currentCharacter == $> ifTrue: [ ^ self scan73 ].
	^ self scan69
]

{ #category : #generated }
HTMLScanner >> scan71 [

	[ 
	self step.
	currentCharacter == $- ifTrue: [ ^ self scan70 ].
	currentCharacter == $/ ifTrue: [ ^ self scan72 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan73 ].
	^ self scan69
]

{ #category : #generated }
HTMLScanner >> scan72 [

	self step.
	currentCharacter == $- ifTrue: [ ^ self scan70 ].
	currentCharacter == $< ifTrue: [ ^ self scan71 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 6 19 21 ).
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan70 ].
		currentCharacter == $< ifTrue: [ ^ self scan71 ].
		currentCharacter == $> ifTrue: [ ^ self scan73 ].
		^ self scan69 ].
	currentCharacter == $s ifTrue: [ ^ self scan74 ].
	^ self scan69
]

{ #category : #generated }
HTMLScanner >> scan73 [

	[ 
	self recordMatch: #( 6 ).
	self step.
	currentCharacter == $- ifTrue: [ ^ self scan70 ].
	currentCharacter == $< ifTrue: [ ^ self scan71 ].
	currentCharacter == $> ] whileTrue.
	^ self scan69
]

{ #category : #generated }
HTMLScanner >> scan74 [

	self step.
	currentCharacter == $- ifTrue: [ ^ self scan70 ].
	currentCharacter == $< ifTrue: [ ^ self scan71 ].
	currentCharacter == $> ifTrue: [ ^ self scan73 ].
	currentCharacter == $c ifTrue: [ 
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan70 ].
		currentCharacter == $< ifTrue: [ ^ self scan71 ].
		currentCharacter == $> ifTrue: [ ^ self scan73 ].
		currentCharacter == $r ifTrue: [ 
			self step.
			currentCharacter == $- ifTrue: [ ^ self scan70 ].
			currentCharacter == $< ifTrue: [ ^ self scan71 ].
			currentCharacter == $> ifTrue: [ ^ self scan73 ].
			currentCharacter == $i ifTrue: [ 
				self step.
				currentCharacter == $- ifTrue: [ ^ self scan70 ].
				currentCharacter == $< ifTrue: [ ^ self scan71 ].
				currentCharacter == $> ifTrue: [ ^ self scan73 ].
				currentCharacter == $p ifTrue: [ 
					self step.
					currentCharacter == $- ifTrue: [ ^ self scan70 ].
					currentCharacter == $< ifTrue: [ ^ self scan71 ].
					currentCharacter == $> ifTrue: [ ^ self scan73 ].
					currentCharacter == $t ifTrue: [ 
						self step.
						currentCharacter == $- ifTrue: [ ^ self scan70 ].
						currentCharacter == $< ifTrue: [ ^ self scan71 ].
						currentCharacter == $> ifTrue: [ 
							self recordMatch: #( 6 18 ).
							self step.
							currentCharacter == $- ifTrue: [ ^ self scan70 ].
							currentCharacter == $< ifTrue: [ ^ self scan71 ].
							currentCharacter == $> ifTrue: [ ^ self scan73 ] ] ] ] ] ].
		^ self scan69 ].
	currentCharacter == $t ifTrue: [ 
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan70 ].
		currentCharacter == $< ifTrue: [ ^ self scan71 ].
		currentCharacter == $> ifTrue: [ ^ self scan73 ].
		currentCharacter == $y ifTrue: [ 
			self step.
			currentCharacter == $- ifTrue: [ ^ self scan70 ].
			currentCharacter == $< ifTrue: [ ^ self scan71 ].
			currentCharacter == $> ifTrue: [ ^ self scan73 ].
			currentCharacter == $l ifTrue: [ 
				self step.
				currentCharacter == $- ifTrue: [ ^ self scan70 ].
				currentCharacter == $< ifTrue: [ ^ self scan71 ].
				currentCharacter == $> ifTrue: [ ^ self scan73 ].
				currentCharacter == $e ifTrue: [ 
					self step.
					currentCharacter == $- ifTrue: [ ^ self scan70 ].
					currentCharacter == $< ifTrue: [ ^ self scan71 ].
					currentCharacter == $> ifTrue: [ 
						self recordMatch: #( 6 20 ).
						self step.
						currentCharacter == $- ifTrue: [ ^ self scan70 ].
						currentCharacter == $< ifTrue: [ ^ self scan71 ].
						currentCharacter == $> ifTrue: [ ^ self scan73 ] ] ] ] ] ].
	^ self scan69
]

{ #category : #generated }
HTMLScanner >> scan75 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan76 ].
	currentCharacter == $> ifTrue: [ ^ self scan78 ].
	currentCharacter == $] ifTrue: [ ^ self scan79 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan76 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan77 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan78 ].
	currentCharacter == $] ifTrue: [ ^ self scan79 ].
	^ self scan75
]

{ #category : #generated }
HTMLScanner >> scan77 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan76 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 6 19 21 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan76 ].
		currentCharacter == $> ifTrue: [ ^ self scan78 ].
		currentCharacter == $] ifTrue: [ ^ self scan79 ].
		^ self scan75 ].
	currentCharacter == $] ifTrue: [ ^ self scan79 ].
	currentCharacter == $s ifTrue: [ ^ self scan80 ].
	^ self scan75
]

{ #category : #generated }
HTMLScanner >> scan78 [

	[ 
	self recordMatch: #( 6 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan76 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $] ifTrue: [ ^ self scan79 ].
	^ self scan75
]

{ #category : #generated }
HTMLScanner >> scan79 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan76 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 3 6 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan76 ].
		currentCharacter == $> ifTrue: [ ^ self scan78 ].
		currentCharacter == $] ifTrue: [ ^ self scan79 ].
		^ self scan75 ].
	currentCharacter == $] ] whileTrue.
	^ self scan75
]

{ #category : #generated }
HTMLScanner >> scan8 [

	[ 
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan9 ].
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan80 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan76 ].
	currentCharacter == $> ifTrue: [ ^ self scan78 ].
	currentCharacter == $] ifTrue: [ ^ self scan79 ].
	currentCharacter == $c ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan76 ].
		currentCharacter == $> ifTrue: [ ^ self scan78 ].
		currentCharacter == $] ifTrue: [ ^ self scan79 ].
		currentCharacter == $r ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan76 ].
			currentCharacter == $> ifTrue: [ ^ self scan78 ].
			currentCharacter == $] ifTrue: [ ^ self scan79 ].
			currentCharacter == $i ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan76 ].
				currentCharacter == $> ifTrue: [ ^ self scan78 ].
				currentCharacter == $] ifTrue: [ ^ self scan79 ].
				currentCharacter == $p ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan76 ].
					currentCharacter == $> ifTrue: [ ^ self scan78 ].
					currentCharacter == $] ifTrue: [ ^ self scan79 ].
					currentCharacter == $t ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan76 ].
						currentCharacter == $> ifTrue: [ 
							self recordMatch: #( 6 18 ).
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan76 ].
							currentCharacter == $> ifTrue: [ ^ self scan78 ] ].
						currentCharacter == $] ifTrue: [ ^ self scan79 ] ] ] ] ].
		^ self scan75 ].
	currentCharacter == $t ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan76 ].
		currentCharacter == $> ifTrue: [ ^ self scan78 ].
		currentCharacter == $] ifTrue: [ ^ self scan79 ].
		currentCharacter == $y ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan76 ].
			currentCharacter == $> ifTrue: [ ^ self scan78 ].
			currentCharacter == $] ifTrue: [ ^ self scan79 ].
			currentCharacter == $l ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan76 ].
				currentCharacter == $> ifTrue: [ ^ self scan78 ].
				currentCharacter == $] ifTrue: [ ^ self scan79 ].
				currentCharacter == $e ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan76 ].
					currentCharacter == $> ifTrue: [ 
						self recordMatch: #( 6 20 ).
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan76 ].
						currentCharacter == $> ifTrue: [ ^ self scan78 ] ].
					currentCharacter == $] ifTrue: [ ^ self scan79 ] ] ] ] ].
	^ self scan75
]

{ #category : #generated }
HTMLScanner >> scan81 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan82 ].
	currentCharacter == $> ifTrue: [ ^ self scan84 ].
	currentCharacter == $] ifTrue: [ ^ self scan85 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan82 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan83 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan84 ].
	currentCharacter == $] ifTrue: [ ^ self scan85 ].
	^ self scan81
]

{ #category : #generated }
HTMLScanner >> scan83 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan82 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 6 19 21 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan82 ].
		currentCharacter == $> ifTrue: [ ^ self scan84 ].
		currentCharacter == $] ifTrue: [ ^ self scan85 ].
		^ self scan81 ].
	currentCharacter == $] ifTrue: [ ^ self scan85 ].
	currentCharacter == $s ifTrue: [ ^ self scan86 ].
	^ self scan81
]

{ #category : #generated }
HTMLScanner >> scan84 [

	[ 
	self recordMatch: #( 6 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan82 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $] ifTrue: [ ^ self scan85 ].
	^ self scan81
]

{ #category : #generated }
HTMLScanner >> scan85 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan82 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 3 6 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan82 ].
		currentCharacter == $> ifTrue: [ ^ self scan84 ].
		currentCharacter == $] ifTrue: [ ^ self scan85 ].
		^ self scan81 ].
	currentCharacter == $] ifTrue: [ 
		[ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan82 ].
		currentCharacter == $> ifTrue: [ 
			self recordMatch: #( 3 5 6 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan82 ].
			currentCharacter == $> ifTrue: [ ^ self scan84 ].
			currentCharacter == $] ifTrue: [ ^ self scan85 ].
			^ self scan81 ].
		currentCharacter == $] ] whileTrue ].
	^ self scan81
]

{ #category : #generated }
HTMLScanner >> scan86 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan82 ].
	currentCharacter == $> ifTrue: [ ^ self scan84 ].
	currentCharacter == $] ifTrue: [ ^ self scan85 ].
	currentCharacter == $c ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan82 ].
		currentCharacter == $> ifTrue: [ ^ self scan84 ].
		currentCharacter == $] ifTrue: [ ^ self scan85 ].
		currentCharacter == $r ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan82 ].
			currentCharacter == $> ifTrue: [ ^ self scan84 ].
			currentCharacter == $] ifTrue: [ ^ self scan85 ].
			currentCharacter == $i ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan82 ].
				currentCharacter == $> ifTrue: [ ^ self scan84 ].
				currentCharacter == $] ifTrue: [ ^ self scan85 ].
				currentCharacter == $p ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan82 ].
					currentCharacter == $> ifTrue: [ ^ self scan84 ].
					currentCharacter == $] ifTrue: [ ^ self scan85 ].
					currentCharacter == $t ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan82 ].
						currentCharacter == $> ifTrue: [ 
							self recordMatch: #( 6 18 ).
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan82 ].
							currentCharacter == $> ifTrue: [ ^ self scan84 ] ].
						currentCharacter == $] ifTrue: [ ^ self scan85 ] ] ] ] ].
		^ self scan81 ].
	currentCharacter == $t ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan82 ].
		currentCharacter == $> ifTrue: [ ^ self scan84 ].
		currentCharacter == $] ifTrue: [ ^ self scan85 ].
		currentCharacter == $y ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan82 ].
			currentCharacter == $> ifTrue: [ ^ self scan84 ].
			currentCharacter == $] ifTrue: [ ^ self scan85 ].
			currentCharacter == $l ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan82 ].
				currentCharacter == $> ifTrue: [ ^ self scan84 ].
				currentCharacter == $] ifTrue: [ ^ self scan85 ].
				currentCharacter == $e ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan82 ].
					currentCharacter == $> ifTrue: [ 
						self recordMatch: #( 6 20 ).
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan82 ].
						currentCharacter == $> ifTrue: [ ^ self scan84 ] ].
					currentCharacter == $] ifTrue: [ ^ self scan85 ] ] ] ] ].
	^ self scan81
]

{ #category : #generated }
HTMLScanner >> scan87 [

	[ 
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan88 ].
	currentCharacter == $< ifTrue: [ ^ self scan89 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan88 [

	[ 
	self step.
	currentCharacter == $% ] whileTrue.
	currentCharacter == $< ifTrue: [ ^ self scan89 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 7 ).
		self step.
		currentCharacter == $% ifTrue: [ ^ self scan88 ].
		currentCharacter == $< ifTrue: [ ^ self scan89 ] ].
	^ self scan87
]

{ #category : #generated }
HTMLScanner >> scan89 [

	[ 
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan88 ].
	currentCharacter == $/ ifTrue: [ ^ self scan90 ].
	currentCharacter == $< ] whileTrue.
	^ self scan87
]

{ #category : #generated }
HTMLScanner >> scan9 [

	self recordMatch: #( 22 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scan90 [

	self step.
	currentCharacter == $% ifTrue: [ ^ self scan88 ].
	currentCharacter == $< ifTrue: [ ^ self scan89 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 19 21 ).
		self step.
		currentCharacter == $% ifTrue: [ ^ self scan88 ].
		currentCharacter == $< ifTrue: [ ^ self scan89 ].
		^ self scan87 ].
	currentCharacter == $s ifTrue: [ ^ self scan91 ].
	^ self scan87
]

{ #category : #generated }
HTMLScanner >> scan91 [

	self step.
	currentCharacter == $% ifTrue: [ ^ self scan88 ].
	currentCharacter == $< ifTrue: [ ^ self scan89 ].
	currentCharacter == $c ifTrue: [ 
		self step.
		currentCharacter == $% ifTrue: [ ^ self scan88 ].
		currentCharacter == $< ifTrue: [ ^ self scan89 ].
		currentCharacter == $r ifTrue: [ 
			self step.
			currentCharacter == $% ifTrue: [ ^ self scan88 ].
			currentCharacter == $< ifTrue: [ ^ self scan89 ].
			currentCharacter == $i ifTrue: [ 
				self step.
				currentCharacter == $% ifTrue: [ ^ self scan88 ].
				currentCharacter == $< ifTrue: [ ^ self scan89 ].
				currentCharacter == $p ifTrue: [ 
					self step.
					currentCharacter == $% ifTrue: [ ^ self scan88 ].
					currentCharacter == $< ifTrue: [ ^ self scan89 ].
					currentCharacter == $t ifTrue: [ 
						self step.
						currentCharacter == $% ifTrue: [ ^ self scan88 ].
						currentCharacter == $< ifTrue: [ ^ self scan89 ].
						currentCharacter == $> ifTrue: [ 
							self recordMatch: #( 18 ).
							self step.
							currentCharacter == $% ifTrue: [ ^ self scan88 ].
							currentCharacter == $< ifTrue: [ ^ self scan89 ] ] ] ] ] ].
		^ self scan87 ].
	currentCharacter == $t ifTrue: [ 
		self step.
		currentCharacter == $% ifTrue: [ ^ self scan88 ].
		currentCharacter == $< ifTrue: [ ^ self scan89 ].
		currentCharacter == $y ifTrue: [ 
			self step.
			currentCharacter == $% ifTrue: [ ^ self scan88 ].
			currentCharacter == $< ifTrue: [ ^ self scan89 ].
			currentCharacter == $l ifTrue: [ 
				self step.
				currentCharacter == $% ifTrue: [ ^ self scan88 ].
				currentCharacter == $< ifTrue: [ ^ self scan89 ].
				currentCharacter == $e ifTrue: [ 
					self step.
					currentCharacter == $% ifTrue: [ ^ self scan88 ].
					currentCharacter == $< ifTrue: [ ^ self scan89 ].
					currentCharacter == $> ifTrue: [ 
						self recordMatch: #( 20 ).
						self step.
						currentCharacter == $% ifTrue: [ ^ self scan88 ].
						currentCharacter == $< ifTrue: [ ^ self scan89 ] ] ] ] ] ].
	^ self scan87
]

{ #category : #generated }
HTMLScanner >> scan92 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan93 ].
	currentCharacter == $? ifTrue: [ ^ self scan95 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan93 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan94 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $? ifTrue: [ ^ self scan95 ].
	^ self scan92
]

{ #category : #generated }
HTMLScanner >> scan94 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan93 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 19 21 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan93 ].
		currentCharacter == $? ifTrue: [ ^ self scan95 ].
		^ self scan92 ].
	currentCharacter == $? ifTrue: [ ^ self scan95 ].
	currentCharacter == $s ifTrue: [ ^ self scan96 ].
	^ self scan92
]

{ #category : #generated }
HTMLScanner >> scan95 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan93 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 7 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan93 ].
		currentCharacter == $? ifTrue: [ ^ self scan95 ].
		^ self scan92 ].
	currentCharacter == $? ] whileTrue.
	^ self scan92
]

{ #category : #generated }
HTMLScanner >> scan96 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan93 ].
	currentCharacter == $? ifTrue: [ ^ self scan95 ].
	currentCharacter == $c ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan93 ].
		currentCharacter == $? ifTrue: [ ^ self scan95 ].
		currentCharacter == $r ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan93 ].
			currentCharacter == $? ifTrue: [ ^ self scan95 ].
			currentCharacter == $i ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan93 ].
				currentCharacter == $? ifTrue: [ ^ self scan95 ].
				currentCharacter == $p ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan93 ].
					currentCharacter == $? ifTrue: [ ^ self scan95 ].
					currentCharacter == $t ifTrue: [ 
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan93 ].
						currentCharacter == $> ifTrue: [ 
							self recordMatch: #( 18 ).
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan93 ] ].
						currentCharacter == $? ifTrue: [ ^ self scan95 ] ] ] ] ].
		^ self scan92 ].
	currentCharacter == $t ifTrue: [ 
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan93 ].
		currentCharacter == $? ifTrue: [ ^ self scan95 ].
		currentCharacter == $y ifTrue: [ 
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan93 ].
			currentCharacter == $? ifTrue: [ ^ self scan95 ].
			currentCharacter == $l ifTrue: [ 
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan93 ].
				currentCharacter == $? ifTrue: [ ^ self scan95 ].
				currentCharacter == $e ifTrue: [ 
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan93 ].
					currentCharacter == $> ifTrue: [ 
						self recordMatch: #( 20 ).
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan93 ] ].
					currentCharacter == $? ifTrue: [ ^ self scan95 ] ] ] ] ].
	^ self scan92
]

{ #category : #generated }
HTMLScanner >> scan97 [

	[ 
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan98 ].
	currentCharacter == $> ifTrue: [ ^ self scan100 ].
	currentCharacter == $? ifTrue: [ ^ self scan101 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan98 [

	[ 
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan99 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan100 ].
	currentCharacter == $? ifTrue: [ ^ self scan101 ].
	^ self scan97
]

{ #category : #generated }
HTMLScanner >> scan99 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan98 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 4 19 21 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan98 ].
		currentCharacter == $> ifTrue: [ ^ self scan100 ].
		currentCharacter == $? ifTrue: [ ^ self scan101 ].
		^ self scan97 ].
	currentCharacter == $? ifTrue: [ ^ self scan101 ].
	currentCharacter == $s ifTrue: [ ^ self scan102 ].
	^ self scan97
]

{ #category : #generated }
HTMLScanner >> scanForToken [

	scope == #style ifTrue: [ ^ self scan55 ].
	scope == #default ifTrue: [ 
		self step.
		currentCharacter == Character cr ifTrue: [ ^ self scan54 ].
		currentCharacter == $< ifTrue: [ ^ self scan14 ].
		(currentCharacter between: Character pageUp and: Character newPage) 
			ifTrue: [ ^ self scan53 ].
		currentCharacter isSeparator ifTrue: [ ^ self scan52 ].
		^ self scan51 ].
	scope == #attvalue ifTrue: [ ^ self scan1 ].
	scope == #tag ifTrue: [ ^ self scanForTokenX1 ].
	^ self reportLastMatch
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1 [

	self step.
	currentCharacter == Character cr ifTrue: [ ^ self scan7 ].
	currentCharacter == $/ ifTrue: [ ^ self scanForTokenX1X1 ].
	currentCharacter == $< ifTrue: [ ^ self scan14 ].
	^ self scanForTokenX1X4
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X1 [

	self recordMatch: #( 15 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	currentCharacter == $> ifTrue: [ 
		self recordMatch: #( 14 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan3 ] ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X2 [

	self recordMatch: #( 13 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X3 [

	self recordMatch: #( 16 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan3 ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X4 [

	currentCharacter == $= ifTrue: [ ^ self scanForTokenX1X3 ].
	currentCharacter == $> ifTrue: [ ^ self scanForTokenX1X2 ].
	(currentCharacter between: Character pageUp and: Character newPage) 
		ifTrue: [ ^ self scan6 ].
	currentCharacter isSeparator ifTrue: [ ^ self scan5 ].
	(currentCharacter == $: or: [ 
		 (currentCharacter between: $A and: $Z) or: [ 
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ 
		[ 
		self recordMatch: #( 17 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan3 ].
		(currentCharacter between: $- and: $.) or: [ 
			(currentCharacter between: $0 and: $:) or: [ 
				(currentCharacter between: $A and: $Z) or: [ 
					currentCharacter == $_ or: [ 
						currentCharacter between: $a and: $z ] ] ] ] ] whileTrue ].
	^ self scan2
]

{ #category : #generated }
HTMLScanner >> tokenActions [

	^ #( #whitespace )
]
