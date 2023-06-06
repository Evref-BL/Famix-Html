Class {
	#name : #HTMLParser,
	#superclass : #SmaCCGLRParser,
	#category : #'SmaCC_HTML'
}

{ #category : #generated }
HTMLParser class >> ambiguousTransitions [
^#(
#[ 0 10 0 25] 
#[ 0 10 0 29] 
#[ 0 25 0 26] 
#[ 0 26 0 29] 
#[ 0 93 0 106] 
#[ 0 97 0 106] 
#[ 0 105 0 106] 
#[ 0 130 0 134] 
#[ 0 130 0 217] 
#[ 0 130 0 221] 
#[ 0 134 0 142] 
#[ 0 142 0 217] 
#[ 0 142 0 221] 
#[ 0 50 0 158] 
#[ 0 50 0 178]
	).
]

{ #category : #'generated-accessing' }
HTMLParser class >> cacheId [
	^'2023-06-06T17:35:36.666+02:00'
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
    : RetDefault scriptletOrSeaWs* <XML>? scriptletOrSeaWs* <DTD>? scriptletOrSeaWs* htmlElements* {{ Document  }}
    ;

scriptletOrSeaWs
    : <SCRIPTLET>
    | <SEA_WS>
    ;

htmlElements
    : htmlMisc* htmlElement 'element' htmlMisc*
    ;

htmlElement
    :  StartTag <TAG_OPEN> 'beginTagOpen' <TAG_NAME> 'tagOpenName' (<SEA_WS> Attribute 'htmlAttribute')* <SEA_WS>?
      (RetDefault <TAG_CLOSE> 'beginTagClose' (Content 'children' StartTag <TAG_OPEN> 'endTagOpen' <TAG_SLASH> <TAG_NAME> 'endTagOpenName' <SEA_WS>?  RetDefault <TAG_CLOSE> 'endTagClose' )? | RetDefault <TAG_SLASH_CLOSE>) {{ Element }}
    | <SCRIPTLET>
    | script
    | style
    ;

Content
    : htmlChardata? ((htmlComment 'comment' | htmlElement 'element' | <CDATA> ) htmlChardata?)* {{}}
    ;

Attribute
    :  <TAG_NAME> 'attributeName' (StartATTVALUE <TAG_EQUALS> 'attributeEqualSymbol' StartTag <ATTVALUE_VALUE> 'attributeValue')? {{}}
    ;

htmlChardata
    : <HTML_TEXT>
    | <SEA_WS>
    ;

htmlMisc
    : htmlComment 'comment' {{Comment}}
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

default <HTML_COMMENT>
    : \<!\-\- (.?[^\-]|(\-)*\s)* \-*\-\-\>
    ;

default <HTML_CONDITIONAL_COMMENT>
    : \<\!\[ .*/* TODO: ? */ \]\>
    ;

default <XML>
    : \<\?xml .*/* TODO: ? */ \>
    ;

default <CDATA>
    : \<\!\[CDATA\[ .*/* TODO: ? */ \]\]\>
    ;

default <DTD>
    : \<\![^\-\-] .* \>
    ;

default <SCRIPTLET>
    : \<\? .*/* TODO: ? */ \?\>
    | \<\% .*/* TODO: ? */ \%\>
    ;

default tag attvalue style <SEA_WS>
    :  (\ |\t|\r|\n)+
    ;

default <SCRIPT_OPEN>
    : \<script .*/* TODO: ? */ \> /* TODO: ->pushMode(SCRIPT)*/
    ;

default <STYLE_OPEN>
    : \<style .*/* TODO: ? */ \>  /* TODO: ->pushMode(STYLE)*/
    ;

default <TAG_OPEN>
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
    : [\ \t\r\n]
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
	: \[? \(? \#?
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
    : \ * <ATTRIBUTE>
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
    | \<
    | \>
    | [0-9a-zA-Z]
    ;

attvalue <HEXCHARS>
    : \# [0-9a-fA-F]+
    ;

attvalue <DECCHARS>
    : [0-9]+ \%?
    ;

attvalue <DOUBLE_QUOTE_STRING>
    : \"" [^\""]* \""
    ;

attvalue <SINGLE_QUOTE_STRING>
    : \' [^\']* \'
    ;"
]

{ #category : #generated }
HTMLParser class >> reduceTable [
^#(
	#(42 0 #reduceActionForRetDefault1: 2278401 true) 
	#(24 0 #nil 188417 false) 
	#(26 1 #liftFirstValue: 295937 false) 
	#(26 1 #liftFirstValue: 295938 false) 
	#(24 2 #liftFirstValue: 188418 false) 
	#(25 0 #reduceActionForhtmlElements_1: 258049 false) 
	#(28 0 #nil 373761 false) 
	#(23 5 #reduceActionForhtmlDocument1: 157697 false) 
	#(23 6 #reduceActionForhtmlDocument3: 157699 false) 
	#(23 6 #reduceActionForhtmlDocument3: 157698 false) 
	#(25 2 #reduceActionForhtmlElements_2: 258050 false) 
	#(41 0 #reduceActionForStartTag1: 2236417 true) 
	#(23 7 #reduceActionForhtmlDocument4: 157700 false) 
	#(38 1 #liftFirstValue: 1248257 false) 
	#(38 1 #liftFirstValue: 1248258 false) 
	#(29 1 #liftFirstValue: 423945 false) 
	#(37 1 #liftFirstValue: 1175554 false) 
	#(28 2 #liftFirstValue: 373762 false) 
	#(37 1 #reduceActionForhtmlMisc1: 1175553 false) 
	#(29 1 #liftFirstValue: 423946 false) 
	#(29 1 #liftFirstValue: 423947 false) 
	#(39 2 #liftFirstValue: 1323009 false) 
	#(39 2 #liftFirstValue: 1323010 false) 
	#(40 2 #liftFirstValue: 1396737 false) 
	#(40 2 #liftFirstValue: 1396738 false) 
	#(27 3 #reduceActionForhtmlElements1: 354305 false) 
	#(31 0 #reduceActionFor__SEA_WS__Attribute__htmlAttribute___1: 504833 false) 
	#(31 2 #reduceActionFor__SEA_WS__Attribute__htmlAttribute___2: 504834 false) 
	#(35 1 #reduceActionForAttribute1: 965633 false) 
	#(43 0 #reduceActionForStartATTVALUE1: 3484673 true) 
	#(30 2 #liftSecondValue: 504833 false) 
	#(29 6 #reduceActionForhtmlElement1: 423937 false) 
	#(34 0 #reduceActionForhtmlElements_1: 875521 false) 
	#(29 6 #reduceActionForhtmlElement4: 423940 false) 
	#(29 7 #reduceActionForhtmlElement5: 423941 false) 
	#(29 7 #reduceActionForhtmlElement4: 423944 false) 
	#(36 1 #liftFirstValue: 1121282 false) 
	#(36 1 #liftFirstValue: 1121281 false) 
	#(32 1 #reduceActionForContent1: 846849 false) 
	#(33 1 #reduceActionFor__htmlComment__comment____htmlElement__element_____CDATA____htmlChardata__5: 875525 false) 
	#(33 1 #reduceActionFor__htmlComment__comment____htmlElement__element_____CDATA____htmlChardata__3: 875523 false) 
	#(34 2 #reduceActionFor__htmlComment__comment____htmlElement__element_____CDATA____htmlChardata___2: 875522 false) 
	#(33 1 #reduceActionFor__htmlComment__comment____htmlElement__element_____CDATA____htmlChardata__1: 875521 false) 
	#(32 2 #reduceActionForContent2: 846850 false) 
	#(33 2 #reduceActionFor__htmlComment__comment____htmlElement__element_____CDATA____htmlChardata__5: 875526 false) 
	#(33 2 #reduceActionFor__htmlComment__comment____htmlElement__element_____CDATA____htmlChardata__3: 875524 false) 
	#(33 2 #reduceActionFor__htmlComment__comment____htmlElement__element_____CDATA____htmlChardata__1: 875522 false) 
	#(35 5 #reduceActionForAttribute2: 965634 false) 
	#(29 13 #reduceActionForhtmlElement2: 423938 false) 
	#(29 14 #reduceActionForhtmlElement6: 423942 false) 
	#(29 14 #reduceActionForhtmlElement3: 423939 false) 
	#(29 15 #reduceActionForhtmlElement7: 423943 false)
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
	     'Content' '((htmlComment ''comment'' | htmlElement ''element'' | <CDATA> ) htmlChardata?)'
	     '((htmlComment ''comment'' | htmlElement ''element'' | <CDATA> ) htmlChardata?)*'
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
	     nil #OrderedCollection #SmaCCToken #OrderedCollection
	     nil #Object #HTMLAttributeNode #OrderedCollection
	     #HTMLContentNode #OrderedCollection #OrderedCollection
	     #HTMLAttributeNode #SmaCCToken #Object #SmaCCToken #SmaCCToken
	     #SmaCCToken #ByteSymbol #ByteSymbol #ByteSymbol #SmaCCToken
	     #SmaCCErrorNode )
]

{ #category : #generated }
HTMLParser class >> transitionTable [
^#(
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 5 0 6 0 6 0 6 0 7 0 6 0 8 0 6 0 9 0 6 0 10 0 9 0 23 0 13 0 42 0 6 0 44] 
#[0 0 0 0 44] 
#[1 0 10 0 1 0 10 0 2 0 10 0 3 0 10 0 5 0 10 0 6 0 10 0 7 0 10 0 8 0 10 0 9 0 10 0 10 0 17 0 24 0 10 0 44] 
#[1 0 10 0 1 0 10 0 2 0 21 0 3 0 10 0 5 0 7 0 6 0 11 0 7 0 10 0 8 0 10 0 9 0 10 0 10 0 33 0 24 0 37 0 26 0 10 0 44] 
#[1 0 10 0 1 0 10 0 2 0 10 0 5 0 10 0 6 0 10 0 7 0 10 0 8 0 10 0 9 0 10 0 10 0 41 0 24 0 10 0 44] 
#[0 0 14 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 44] 
#[0 0 18 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 44] 
#[1 0 10 0 1 0 10 0 2 0 45 0 5 0 7 0 6 0 11 0 7 0 10 0 8 0 10 0 9 0 10 0 10 0 49 0 24 0 37 0 26 0 10 0 44] 
#[0 0 22 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 44] 
#[1 0 10 0 1 0 10 0 2 0 53 0 5 0 7 0 6 0 11 0 7 0 10 0 8 0 10 0 9 0 10 0 10 0 57 0 24 0 37 0 26 0 10 0 44] 
#[1 0 10 0 1 0 10 0 2 0 10 0 6 0 10 0 7 0 10 0 8 0 10 0 9 0 10 0 10 0 61 0 24 0 10 0 44] 
#[1 0 26 0 1 0 26 0 2 0 15 0 6 0 19 0 7 0 26 0 8 0 26 0 9 0 26 0 10 0 65 0 25 0 37 0 26 0 26 0 44] 
#[1 0 10 0 1 0 10 0 2 0 10 0 6 0 10 0 7 0 10 0 8 0 10 0 9 0 10 0 10 0 69 0 24 0 10 0 44] 
#[1 0 26 0 1 0 26 0 2 0 15 0 6 0 19 0 7 0 26 0 8 0 26 0 9 0 26 0 10 0 73 0 25 0 37 0 26 0 26 0 44] 
#[1 0 26 0 1 0 26 0 2 0 15 0 6 0 19 0 7 0 26 0 8 0 26 0 9 0 26 0 10 0 77 0 25 0 37 0 26 0 26 0 44] 
#[1 0 30 0 1 0 30 0 2 0 30 0 6 0 30 0 7 0 30 0 8 0 30 0 9 0 30 0 10 0 81 0 27 0 85 0 28 0 34 0 44] 
#[1 0 26 0 1 0 26 0 2 0 15 0 6 0 19 0 7 0 26 0 8 0 26 0 9 0 26 0 10 0 89 0 25 0 37 0 26 0 26 0 44] 
#[1 0 30 0 1 0 30 0 2 0 30 0 6 0 30 0 7 0 30 0 8 0 30 0 9 0 30 0 10 0 81 0 27 0 85 0 28 0 38 0 44] 
#[1 0 30 0 1 0 30 0 2 0 30 0 6 0 30 0 7 0 30 0 8 0 30 0 9 0 30 0 10 0 81 0 27 0 85 0 28 0 42 0 44] 
#[0 0 46 0 1 0 2 0 6 0 7 0 8 0 9 0 10 0 44] 
#[1 0 125 0 1 0 125 0 2 0 117 0 6 0 121 0 7 0 109 0 8 0 113 0 9 0 50 0 10 0 117 0 29 0 121 0 37 0 125 0 38 0 117 0 39 0 117 0 40 0 137 0 41] 
#[1 0 30 0 1 0 30 0 2 0 30 0 6 0 30 0 7 0 30 0 8 0 30 0 9 0 30 0 10 0 81 0 27 0 85 0 28 0 54 0 44] 
#[0 0 58 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[0 0 62 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[0 0 66 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[0 0 70 0 1 0 2 0 6 0 7 0 8 0 9 0 10 0 44] 
#[1 0 141 0 17 0 145 0 18] 
#[1 0 149 0 19 0 153 0 20] 
#[1 0 30 0 1 0 30 0 2 0 30 0 6 0 30 0 7 0 30 0 8 0 30 0 9 0 30 0 10 0 157 0 28 0 30 0 44] 
#[0 0 74 0 1 0 2 0 6 0 7 0 8 0 9 0 10 0 44] 
#[0 0 78 0 1 0 2 0 6 0 7 0 8 0 9 0 10 0 44] 
#[0 0 82 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[0 0 86 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[0 0 161 0 10] 
#[0 0 90 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[0 0 94 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[0 0 98 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[0 0 102 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[1 0 23 0 1 0 27 0 2 0 106 0 6 0 31 0 7 0 106 0 8 0 106 0 9 0 106 0 10 0 121 0 37 0 125 0 38 0 106 0 44] 
#[0 0 165 0 16] 
#[1 0 110 0 7 0 110 0 12 0 110 0 13 0 169 0 31] 
#[1 0 173 0 7 0 6 0 12 0 6 0 13 0 177 0 30 0 181 0 42] 
#[1 0 6 0 12 0 6 0 13 0 185 0 16 0 189 0 35 0 193 0 42] 
#[0 0 114 0 7 0 12 0 13] 
#[1 0 197 0 12 0 201 0 13] 
#[1 0 118 0 7 0 118 0 12 0 118 0 13 0 122 0 15 0 205 0 43] 
#[0 0 126 0 7 0 12 0 13] 
#[1 0 209 0 12 0 213 0 13] 
#[1 0 35 0 1 0 35 0 2 0 35 0 4 0 35 0 6 0 39 0 7 0 35 0 8 0 35 0 9 0 35 0 10 0 43 0 11 0 225 0 32 0 229 0 34 0 233 0 36 0 130 0 44] 
#[0 0 138 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[0 0 237 0 15] 
#[1 0 47 0 1 0 47 0 2 0 47 0 4 0 47 0 6 0 51 0 7 0 47 0 8 0 47 0 9 0 47 0 10 0 55 0 11 0 241 0 32 0 229 0 34 0 233 0 36 0 142 0 44] 
#[0 0 146 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[0 0 150 0 1 0 2 0 4 0 6 0 8 0 9 0 10] 
#[0 0 154 0 1 0 2 0 4 0 6 0 8 0 9 0 10] 
#[1 0 50 0 10 0 245 0 41] 
#[1 1 5 0 1 1 5 0 2 0 249 0 4 0 253 0 6 0 109 0 8 0 113 0 9 0 59 0 10 0 253 0 29 1 1 0 33 1 5 0 38 0 253 0 39 0 253 0 40 0 137 0 41] 
#[1 0 134 0 1 0 134 0 2 0 134 0 4 0 134 0 6 0 134 0 8 0 134 0 9 0 134 0 10 1 9 0 34] 
#[1 0 50 0 21 1 13 0 41] 
#[1 0 50 0 10 1 17 0 41] 
#[0 1 21 0 10] 
#[1 0 162 0 1 0 162 0 2 0 162 0 4 0 162 0 6 1 25 0 7 0 162 0 8 0 162 0 9 0 162 0 10 1 25 0 11 1 25 0 36] 
#[1 0 166 0 1 0 166 0 2 0 166 0 4 0 166 0 6 1 29 0 7 0 166 0 8 0 166 0 9 0 166 0 10 1 29 0 11 1 29 0 36] 
#[0 0 170 0 1 0 2 0 4 0 6 0 8 0 9 0 10] 
#[1 0 174 0 1 0 174 0 2 0 174 0 4 0 174 0 6 1 33 0 7 0 174 0 8 0 174 0 9 0 174 0 10 1 33 0 11 1 33 0 36] 
#[1 1 5 0 1 1 5 0 2 0 249 0 4 0 253 0 6 0 109 0 8 0 113 0 9 0 63 0 10 0 253 0 29 1 1 0 33 1 5 0 38 0 253 0 39 0 253 0 40 0 137 0 41] 
#[0 1 37 0 21] 
#[0 1 41 0 10] 
#[0 1 45 0 14] 
#[0 0 182 0 1 0 2 0 4 0 6 0 8 0 9 0 10] 
#[0 0 186 0 1 0 2 0 4 0 6 0 8 0 9 0 10] 
#[0 0 190 0 1 0 2 0 4 0 6 0 8 0 9 0 10] 
#[0 0 194 0 7 0 12 0 13] 
#[0 1 49 0 14] 
#[0 1 53 0 16] 
#[0 1 57 0 16] 
#[1 1 61 0 7 0 6 0 12 1 65 0 42] 
#[1 1 69 0 7 0 6 0 12 1 73 0 42] 
#[1 0 6 0 12 1 77 0 42] 
#[0 1 81 0 12] 
#[1 0 6 0 12 1 85 0 42] 
#[0 1 89 0 12] 
#[0 1 93 0 12] 
#[0 0 198 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[0 1 97 0 12] 
#[0 0 202 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[0 0 206 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44] 
#[0 0 210 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 44]
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
	result addTokens: ((nodes at: 1) at: 1) to: result _comments.
	result addObjects: ((nodes at: 1) at: 2) to: result elements.
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForContent2: nodes [

	| result |
	result := HTMLContentNode new.
	result addTokens: ((nodes at: 2) at: 1) to: result _comments.
	result addObjects: ((nodes at: 2) at: 2) to: result elements.
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
HTMLParser >> reduceActionFor__SEA_WS__Attribute__htmlAttribute___1: nodes [

	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionFor__SEA_WS__Attribute__htmlAttribute___2: nodes [

	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionFor__htmlComment__comment____htmlElement__element_____CDATA____htmlChardata__1: nodes [

	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionFor__htmlComment__comment____htmlElement__element_____CDATA____htmlChardata__3: nodes [

	| result |
	result := Array new: 2.
	result at: 2 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionFor__htmlComment__comment____htmlElement__element_____CDATA____htmlChardata__5: nodes [

	| result |
	result := Array new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionFor__htmlComment__comment____htmlElement__element_____CDATA____htmlChardata___2: nodes [

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
	result addObjects: ((nodes at: 5) at: 1) to: result elements.
	result addTokens: ((nodes at: 5) at: 2) to: result _comments.
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlDocument3: nodes [

	| result |
	result := HTMLDocumentNode new.
	result addObjects: ((nodes at: 6) at: 1) to: result elements.
	result addTokens: ((nodes at: 6) at: 2) to: result _comments.
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlDocument4: nodes [

	| result |
	result := HTMLDocumentNode new.
	result addObjects: ((nodes at: 7) at: 1) to: result elements.
	result addTokens: ((nodes at: 7) at: 2) to: result _comments.
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
	result beginTagClose: (nodes at: 6).
	result _children: (nodes at: 7).
	result endTagOpen: (nodes at: 9).
	result endTagOpenName: (nodes at: 11).
	result endTagClose: (nodes at: 14).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement4: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result htmlAttributes.
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement5: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result htmlAttributes.
	result beginTagClose: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement6: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result htmlAttributes.
	result beginTagClose: (nodes at: 7).
	result _children: (nodes at: 8).
	result endTagOpen: (nodes at: 10).
	result endTagOpenName: (nodes at: 12).
	result endTagClose: (nodes at: 14).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement7: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result htmlAttributes.
	result beginTagClose: (nodes at: 7).
	result _children: (nodes at: 8).
	result endTagOpen: (nodes at: 10).
	result endTagOpenName: (nodes at: 12).
	result endTagClose: (nodes at: 15).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElements1: nodes [

	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElements_1: nodes [

	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElements_2: nodes [

	| result |
	result := nodes at: 1.
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self add: ((nodes at: 2) at: 2) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlMisc1: nodes [

	| result |
	result := HTMLCommentNode new.
	result comment: (nodes at: 1).
	^ result
]
