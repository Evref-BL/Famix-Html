Class {
	#name : #HTMLParser,
	#superclass : #SmaCCGLRParser,
	#category : #'SmaCC_HTML'
}

{ #category : #generated }
HTMLParser class >> ambiguousTransitions [
^#(
#[ 0 6 0 21] 
#[ 0 6 0 25] 
#[ 0 21 0 22] 
#[ 0 22 0 25] 
#[ 0 89 0 102] 
#[ 0 93 0 102] 
#[ 0 101 0 102] 
#[ 0 130 0 134] 
#[ 0 134 0 201] 
#[ 0 134 0 205] 
#[ 0 46 0 150] 
#[ 0 46 0 170]
	).
]

{ #category : #'generated-accessing' }
HTMLParser class >> cacheId [
	^'2023-05-23T07:58:28.225+02:00'
]

{ #category : #generated }
HTMLParser class >> definitionComment [
"%glr;
%prefix HTML ;
%suffix Node ;
%root Program ;

%start htmlDocument;

%scopes tag attvalue style ;

/* keyword */


/*parser grammar HTMLParser;*/

htmlDocument
    : scriptletOrSeaWs* <XML>? scriptletOrSeaWs* <DTD>? scriptletOrSeaWs* htmlElements* {{ Document  }}
    ;

scriptletOrSeaWs
    : <SCRIPTLET>
    | <SEA_WS>
    ;

htmlElements
    : htmlMisc* htmlElement 'element' htmlMisc*
    ;

htmlElement
    :  StartTag <TAG_OPEN> 'beginTagOpen' <TAG_NAME> 'tagOpenName' (<SEA_WS> Attribute 'htmlAttribute')*
      (RetDefault <TAG_CLOSE> 'beginTagClose' (Content 'children' StartTag <TAG_OPEN> 'endTagOpen' <TAG_SLASH> <TAG_NAME> 'endTagOpenName' RetDefault <TAG_CLOSE> 'endTagClose' )? | RetDefault <TAG_SLASH_CLOSE>) {{ Element }}
    | <SCRIPTLET>
    | script
    | style
    ;

Content
    : htmlChardata? ((htmlElement 'element' | <CDATA> | htmlComment 'comment' ) htmlChardata?)* {{}}
    ;

Attribute
    :  <TAG_NAME> 'attributeName' (StartATTVALUE <TAG_EQUALS> 'attributeEqualSymbol' StartTag <ATTVALUE_VALUE> 'attributeValue')? {{}}
    ;

htmlChardata
    : <HTML_TEXT>
    | <SEA_WS>
    ;

htmlMisc
    : htmlComment
    | <SEA_WS>
    ;

htmlComment
    : <HTML_COMMENT>
    | <HTML_CONDITIONAL_COMMENT>
    ;

script
    : <SCRIPT_OPEN> (<SCRIPT_BODY> | <SCRIPT_SHORT_BODY>)
    ;

style
    : <STYLE_OPEN> (<STYLE_BODY> | <STYLE_SHORT_BODY>)
    ;

<HTML_COMMENT>
    : \<\!\-\- .* \-\-\>
    ;

<HTML_CONDITIONAL_COMMENT>
    : \<\!\[ .*/* TODO: ? */ \]\>
    ;

<XML>
    : \<\?xml .*/* TODO: ? */ \>
    ;

<CDATA>
    : \<\!\[CDATA\[ .*/* TODO: ? */ \]\]\>
    ;

<DTD>
    : \<\! .*/* TODO: ? */ \>
    ;

<SCRIPTLET>
    : \<\? .*/* TODO: ? */ \?\>
    | \<\% .*/* TODO: ? */ \%\>
    ;

<SEA_WS>
    :  (\ |\t|\r? \n)+
    ;

<SCRIPT_OPEN>
    : \<script .*/* TODO: ? */ \> /* TODO: ->pushMode(SCRIPT)*/
    ;

<STYLE_OPEN>
    : \<style .*/* TODO: ? */ \>  /* TODO: ->pushMode(STYLE)*/
    ;

<TAG_OPEN>
    : \< 
    ;

default <HTML_TEXT>
    : [^<]+
    ;

/* tag declarations */

StartTag
	: [self scope: #tag. #tag]
	;

RetDefault
    : [self scope: #default.  #default]
    ;

tag <TAG_CLOSE>
    : \>
    ;

tag <TAG_SLASH_CLOSE>
    : \/\> 
    ;

tag <TAG_SLASH>
    : \/
    ;


/* lexing mode for attribute values */

tag <TAG_EQUALS>
    : \= /* TODO: -> pushMode(ATTVALUE)*/
    ;

tag <TAG_NAME>
    : <Attribute_tag_prefix>? <TAG_NameStartChar> <TAG_NameChar>* <Attribute_tag_suffix>?
    ;

tag <TAG_WHITESPACE>
    : [\ \t\r\n] /* TODO: -> channel(HIDDEN)*/
    ;

tag <HEXDIGIT>
    : [a-fA-F0-9]
    ;

tag <DIGIT>
    : [0-9]
    ;

tag <TAG_NameChar>
    : <TAG_NameStartChar>
    | \-
    | _
    | \.
    | <DIGIT>
    ;

tag <TAG_NameStartChar>
    : [\:a-zA-Z]
    ;


tag <Attribute_tag_prefix>
	: \[? \(?
	;

tag <Attribute_tag_suffix>
	: \)? \]?
	;

/* <scripts> */



<SCRIPT_BODY>
    : .*/* TODO: ? */ \<\/script\> /* TODO: -> popMode*/
    ;

<SCRIPT_SHORT_BODY>
    : .*/* TODO: ? */ \<\/\> /* TODO: -> popMode*/
    ;


/* <styles> */



style <STYLE_BODY>
    : .*/* TODO: ? */ \<\/style\> /* TODO: -> popMode*/
    ;

style <STYLE_SHORT_BODY>
    : .*/* TODO: ? */ \<\/\> /* TODO: -> popMode*/
    ;


/* attribute values */

/* an attribute value may have spaces b/t the '=' and the value*/

StartATTVALUE
	: [self scope: #attvalue. #attvalue]
	;

attvalue <ATTVALUE_VALUE>
    : \ * <ATTRIBUTE> /* TODO: -> popMode*/
    ;

attvalue <ATTRIBUTE>
    : <DOUBLE_QUOTE_STRING>
    | <SINGLE_QUOTE_STRING>
    | <ATTCHARS>
    | <HEXCHARS>
    | <DECCHARS>
    ;

attvalue <ATTCHARS>
    : <ATTCHAR>+ \ ?
    ;

attvalue <ATTCHAR>
    : \-
    | _
    | \.
    | \/
    | \+
    | \,
    | \?
    | \=
    | \:
    | \;
    | \#
    | [0-9a-zA-Z]
    ;

attvalue <HEXCHARS>
    : \# [0-9a-fA-F]+
    ;

attvalue <DECCHARS>
    : [0-9]+ \%?
    ;

attvalue <DOUBLE_QUOTE_STRING>
    : \"" [^\<\""]* \""
    ;

attvalue <SINGLE_QUOTE_STRING>
    : \' [^\<\']* \'
    ;"
]

{ #category : #generated }
HTMLParser class >> reduceTable [
^#(
	#(24 0 #nil 177153 false) 
	#(26 1 #liftFirstValue: 284673 false) 
	#(26 1 #liftFirstValue: 284674 false) 
	#(24 2 #liftFirstValue: 177154 false) 
	#(25 0 #reduceActionForhtmlElements_1: 246785 false) 
	#(28 0 #nil 362497 false) 
	#(23 4 #reduceActionForhtmlDocument1: 157697 false) 
	#(23 5 #reduceActionForhtmlDocument3: 157699 false) 
	#(23 5 #reduceActionForhtmlDocument3: 157698 false) 
	#(25 2 #reduceActionForhtmlElements_2: 246786 false) 
	#(41 0 #reduceActionForStartTag1: 2069505 true) 
	#(23 6 #reduceActionForhtmlDocument4: 157700 false) 
	#(38 1 #liftFirstValue: 1192961 false) 
	#(38 1 #liftFirstValue: 1192962 false) 
	#(29 1 #liftFirstValue: 412676 false) 
	#(37 1 #liftFirstValue: 1142786 false) 
	#(28 2 #liftFirstValue: 362498 false) 
	#(37 1 #liftFirstValue: 1142785 false) 
	#(29 1 #liftFirstValue: 412677 false) 
	#(29 1 #liftFirstValue: 412678 false) 
	#(39 2 #liftFirstValue: 1267713 false) 
	#(39 2 #liftFirstValue: 1267714 false) 
	#(40 2 #liftFirstValue: 1341441 false) 
	#(40 2 #liftFirstValue: 1341442 false) 
	#(27 3 #liftSecondValue: 343041 false) 
	#(31 0 #reduceActionForhtmlElements_1: 493569 false) 
	#(42 0 #reduceActionForRetDefault1: 2111489 true) 
	#(31 2 #reduceActionForhtmlElements_2: 493570 false) 
	#(35 1 #reduceActionForAttribute1: 932865 false) 
	#(43 0 #reduceActionForStartATTVALUE1: 3344385 true) 
	#(30 2 #liftSecondValue: 493569 false) 
	#(34 0 #reduceActionFor__htmlElement__element_____CDATA____htmlComment__comment____htmlChardata___1: 842753 false) 
	#(29 6 #reduceActionForhtmlElement1: 412673 false) 
	#(29 6 #reduceActionForhtmlElement3: 412675 false) 
	#(36 1 #liftFirstValue: 1088514 false) 
	#(36 1 #liftFirstValue: 1088513 false) 
	#(32 1 #reduceActionForContent1: 814081 false) 
	#(33 1 #reduceActionFor__htmlElement__element_____CDATA____htmlComment__comment____htmlChardata__3: 842755 false) 
	#(33 1 #reduceActionFor__htmlElement__element_____CDATA____htmlComment__comment____htmlChardata__1: 842753 false) 
	#(34 2 #reduceActionFor__htmlElement__element_____CDATA____htmlComment__comment____htmlChardata___2: 842754 false) 
	#(33 1 #reduceActionFor__htmlElement__element_____CDATA____htmlComment__comment____htmlChardata__5: 842757 false) 
	#(32 2 #reduceActionForContent2: 814082 false) 
	#(33 2 #reduceActionFor__htmlElement__element_____CDATA____htmlComment__comment____htmlChardata__3: 842756 false) 
	#(33 2 #reduceActionFor__htmlElement__element_____CDATA____htmlComment__comment____htmlChardata__1: 842754 false) 
	#(33 2 #reduceActionFor__htmlElement__element_____CDATA____htmlComment__comment____htmlChardata__5: 842758 false) 
	#(35 5 #reduceActionForAttribute2: 932866 false) 
	#(29 13 #reduceActionForhtmlElement2: 412674 false)
	).
]

{ #category : #'generated-accessing' }
HTMLParser class >> scannerClass [
	^HTMLScanner
]

{ #category : #generated }
HTMLParser class >> startingStateForhtmlDocument [

	^ 1
]

{ #category : #generated }
HTMLParser class >> symbolNames [

	^ #( '<HTML_COMMENT>' '<HTML_CONDITIONAL_COMMENT>'
	     '<XML>' '<CDATA>' '<DTD>' '<SCRIPTLET>' '<SEA_WS>' '<SCRIPT_OPEN>'
	     '<STYLE_OPEN>' '<TAG_OPEN>' '<HTML_TEXT>' '<TAG_CLOSE>'
	     '<TAG_SLASH_CLOSE>' '<TAG_SLASH>' '<TAG_EQUALS>' '<TAG_NAME>'
	     '<SCRIPT_BODY>' '<SCRIPT_SHORT_BODY>' '<STYLE_BODY>'
	     '<STYLE_SHORT_BODY>' '<ATTVALUE_VALUE>' 'B e g i n' 'htmlDocument'
	     'scriptletOrSeaWs*' 'htmlElements*' 'scriptletOrSeaWs'
	     'htmlElements' 'htmlMisc*' 'htmlElement' '(<SEA_WS> Attribute ''htmlAttribute'')'
	     '(<SEA_WS> Attribute ''htmlAttribute'')*'
	     'Content' '((htmlElement ''element'' | <CDATA> | htmlComment ''comment'' ) htmlChardata?)'
	     '((htmlElement ''element'' | <CDATA> | htmlComment ''comment'' ) htmlChardata?)*'
	     'Attribute' 'htmlChardata' 'htmlMisc' 'htmlComment'
	     'script' 'style' 'StartTag' 'RetDefault' 'StartATTVALUE'
	     'E O F' 'error' )
]

{ #category : #generated }
HTMLParser class >> symbolTypes [

	^ #( #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken
	     #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken
	     #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken
	     #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken
	     #SmaCCToken #HTMLDocumentNode #HTMLDocumentNode
	     nil #OrderedCollection #SmaCCToken #Object nil #Object #HTMLAttributeNode
	     #OrderedCollection #HTMLContentNode #OrderedCollection
	     #OrderedCollection #HTMLAttributeNode #SmaCCToken #SmaCCToken
	     #SmaCCToken #SmaCCToken #SmaCCToken #ByteSymbol #ByteSymbol
	     #ByteSymbol #SmaCCToken #SmaCCErrorNode )
]

{ #category : #generated }
HTMLParser class >> transitionTable [
^#(
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 5 0 6 0 6 0 6 0 7 0 6 0 8 0 6 0 9 0 6 0 10 0 9 0 23 0 13 0 24 0 6 0 44] 
#[0 0 0 0 44] 
#[1 0 6 0 1 0 6 0 2 0 17 0 3 0 6 0 5 0 7 0 6 0 11 0 7 0 6 0 8 0 6 0 9 0 6 0 10 0 29 0 24 0 33 0 26 0 6 0 44] 
#[1 0 6 0 1 0 6 0 2 0 6 0 5 0 6 0 6 0 6 0 7 0 6 0 8 0 6 0 9 0 6 0 10 0 37 0 24 0 6 0 44] 
#[0 0 10 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 44] 
#[0 0 14 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 44] 
#[1 0 6 0 1 0 6 0 2 0 41 0 5 0 7 0 6 0 11 0 7 0 6 0 8 0 6 0 9 0 6 0 10 0 45 0 24 0 33 0 26 0 6 0 44] 
#[0 0 18 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 44] 
#[1 0 6 0 1 0 6 0 2 0 49 0 5 0 7 0 6 0 11 0 7 0 6 0 8 0 6 0 9 0 6 0 10 0 53 0 24 0 33 0 26 0 6 0 44] 
#[1 0 6 0 1 0 6 0 2 0 6 0 6 0 6 0 7 0 6 0 8 0 6 0 9 0 6 0 10 0 57 0 24 0 6 0 44] 
#[1 0 22 0 1 0 22 0 2 0 15 0 6 0 19 0 7 0 22 0 8 0 22 0 9 0 22 0 10 0 61 0 25 0 33 0 26 0 22 0 44] 
#[1 0 6 0 1 0 6 0 2 0 6 0 6 0 6 0 7 0 6 0 8 0 6 0 9 0 6 0 10 0 65 0 24 0 6 0 44] 
#[1 0 22 0 1 0 22 0 2 0 15 0 6 0 19 0 7 0 22 0 8 0 22 0 9 0 22 0 10 0 69 0 25 0 33 0 26 0 22 0 44] 
#[1 0 22 0 1 0 22 0 2 0 15 0 6 0 19 0 7 0 22 0 8 0 22 0 9 0 22 0 10 0 73 0 25 0 33 0 26 0 22 0 44] 
#[1 0 26 0 1 0 26 0 2 0 26 0 6 0 26 0 7 0 26 0 8 0 26 0 9 0 26 0 10 0 77 0 27 0 81 0 28 0 30 0 44] 
#[1 0 22 0 1 0 22 0 2 0 15 0 6 0 19 0 7 0 22 0 8 0 22 0 9 0 22 0 10 0 85 0 25 0 33 0 26 0 22 0 44] 
#[1 0 26 0 1 0 26 0 2 0 26 0 6 0 26 0 7 0 26 0 8 0 26 0 9 0 26 0 10 0 77 0 27 0 81 0 28 0 34 0 44] 
#[1 0 26 0 1 0 26 0 2 0 26 0 6 0 26 0 7 0 26 0 8 0 26 0 9 0 26 0 10 0 77 0 27 0 81 0 28 0 38 0 44] 
#[0 0 42 0 1 0 2 0 6 0 7 0 8 0 9 0 10 0 44] 
#[1 0 117 0 1 0 117 0 2 0 113 0 6 0 117 0 7 0 105 0 8 0 109 0 9 0 46 0 10 0 113 0 29 0 117 0 37 0 117 0 38 0 113 0 39 0 113 0 40 0 133 0 41] 
#[1 0 26 0 1 0 26 0 2 0 26 0 6 0 26 0 7 0 26 0 8 0 26 0 9 0 26 0 10 0 77 0 27 0 81 0 28 0 50 0 44] 
#[0 0 54 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[0 0 58 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[0 0 62 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[0 0 66 0 1 0 2 0 6 0 7 0 8 0 9 0 10 0 44] 
#[1 0 137 0 17 0 141 0 18] 
#[1 0 145 0 19 0 149 0 20] 
#[1 0 26 0 1 0 26 0 2 0 26 0 6 0 26 0 7 0 26 0 8 0 26 0 9 0 26 0 10 0 153 0 28 0 26 0 44] 
#[0 0 70 0 1 0 2 0 6 0 7 0 8 0 9 0 10 0 44] 
#[0 0 74 0 1 0 2 0 6 0 7 0 8 0 9 0 10 0 44] 
#[0 0 78 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[0 0 82 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[0 0 157 0 10] 
#[0 0 86 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[0 0 90 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[0 0 94 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[0 0 98 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[1 0 23 0 1 0 27 0 2 0 102 0 6 0 31 0 7 0 102 0 8 0 102 0 9 0 102 0 10 0 117 0 37 0 117 0 38 0 102 0 44] 
#[0 0 161 0 16] 
#[1 0 106 0 7 0 106 0 12 0 106 0 13 0 165 0 31] 
#[1 0 169 0 7 0 110 0 12 0 110 0 13 0 173 0 30 0 177 0 42] 
#[1 0 181 0 16 0 185 0 35] 
#[0 0 114 0 7 0 12 0 13] 
#[1 0 189 0 12 0 193 0 13] 
#[1 0 118 0 7 0 118 0 12 0 118 0 13 0 122 0 15 0 197 0 43] 
#[0 0 126 0 7 0 12 0 13] 
#[1 0 35 0 1 0 35 0 2 0 35 0 4 0 35 0 6 0 39 0 7 0 35 0 8 0 35 0 9 0 35 0 10 0 43 0 11 0 209 0 32 0 213 0 34 0 217 0 36 0 134 0 44] 
#[0 0 138 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[0 0 221 0 15] 
#[0 0 142 0 1 0 2 0 4 0 6 0 8 0 9 0 10] 
#[0 0 146 0 1 0 2 0 4 0 6 0 8 0 9 0 10] 
#[1 0 46 0 10 0 225 0 41] 
#[1 0 241 0 1 0 241 0 2 0 229 0 4 0 233 0 6 0 105 0 8 0 109 0 9 0 47 0 10 0 233 0 29 0 237 0 33 0 241 0 38 0 233 0 39 0 233 0 40 0 133 0 41] 
#[1 0 130 0 1 0 130 0 2 0 130 0 4 0 130 0 6 0 130 0 8 0 130 0 9 0 130 0 10 0 245 0 34] 
#[1 0 46 0 21 0 249 0 41] 
#[0 0 253 0 10] 
#[1 0 154 0 1 0 154 0 2 0 154 0 4 0 154 0 6 1 1 0 7 0 154 0 8 0 154 0 9 0 154 0 10 1 1 0 11 1 1 0 36] 
#[1 0 158 0 1 0 158 0 2 0 158 0 4 0 158 0 6 1 5 0 7 0 158 0 8 0 158 0 9 0 158 0 10 1 5 0 11 1 5 0 36] 
#[0 0 162 0 1 0 2 0 4 0 6 0 8 0 9 0 10] 
#[1 0 166 0 1 0 166 0 2 0 166 0 4 0 166 0 6 1 9 0 7 0 166 0 8 0 166 0 9 0 166 0 10 1 9 0 11 1 9 0 36] 
#[1 0 241 0 1 0 241 0 2 0 229 0 4 0 233 0 6 0 105 0 8 0 109 0 9 0 51 0 10 0 233 0 29 0 237 0 33 0 241 0 38 0 233 0 39 0 233 0 40 0 133 0 41] 
#[0 1 13 0 21] 
#[0 1 17 0 14] 
#[0 0 174 0 1 0 2 0 4 0 6 0 8 0 9 0 10] 
#[0 0 178 0 1 0 2 0 4 0 6 0 8 0 9 0 10] 
#[0 0 182 0 1 0 2 0 4 0 6 0 8 0 9 0 10] 
#[0 0 186 0 7 0 12 0 13] 
#[0 1 21 0 16] 
#[1 0 110 0 12 1 25 0 42] 
#[0 1 29 0 12] 
#[0 0 190 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44]
	).
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForAttribute1: nodes [

	| result |
	result := HTMLAttributeNode new.
	result attributeName: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForAttribute2: nodes [

	| result |
	result := HTMLAttributeNode new.
	result attributeName: (nodes at: 1).
	result attributeEqualSymbol: (nodes at: 3).
	result attributeValue: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForContent1: nodes [

	| result |
	result := HTMLContentNode new.
	result addObjects: ((nodes at: 1) at: 1) to: result elements.
	result addTokens: ((nodes at: 1) at: 2) to: result _comments.
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForContent2: nodes [

	| result |
	result := HTMLContentNode new.
	result addObjects: ((nodes at: 2) at: 1) to: result elements.
	result addTokens: ((nodes at: 2) at: 2) to: result _comments.
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForRetDefault1: nodes [

	self scope: #default.
	^ #default
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForStartATTVALUE1: nodes [

	self scope: #attvalue.
	^ #attvalue
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForStartTag1: nodes [

	self scope: #tag.
	^ #tag
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionFor__htmlElement__element_____CDATA____htmlComment__comment____htmlChardata__1: nodes [

	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionFor__htmlElement__element_____CDATA____htmlComment__comment____htmlChardata__3: nodes [

	| result |
	result := Array new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionFor__htmlElement__element_____CDATA____htmlComment__comment____htmlChardata__5: nodes [

	| result |
	result := Array new: 2.
	result at: 2 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionFor__htmlElement__element_____CDATA____htmlComment__comment____htmlChardata___1: nodes [

	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionFor__htmlElement__element_____CDATA____htmlComment__comment____htmlChardata___2: nodes [

	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self add: ((nodes at: 2) at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlDocument1: nodes [

	| result |
	result := HTMLDocumentNode new.
	result addObjects: (nodes at: 4) to: result elements.
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlDocument3: nodes [

	| result |
	result := HTMLDocumentNode new.
	result addObjects: (nodes at: 5) to: result elements.
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlDocument4: nodes [

	| result |
	result := HTMLDocumentNode new.
	result addObjects: (nodes at: 6) to: result elements.
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement1: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result htmlAttributes.
	result beginTagClose: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement2: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result htmlAttributes.
	result beginTagClose: (nodes at: 6).
	result _children: (nodes at: 7).
	result endTagOpen: (nodes at: 9).
	result endTagOpenName: (nodes at: 11).
	result endTagClose: (nodes at: 13).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement3: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result htmlAttributes.
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElements_1: nodes [

	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElements_2: nodes [

	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]
