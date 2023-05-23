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
#[ 0 130 0 201] 
#[ 0 130 0 205] 
#[ 0 46 0 150] 
#[ 0 46 0 170]
	).
]

{ #category : #'generated-accessing' }
HTMLParser class >> cacheId [
	^'2023-05-23T07:16:03.082+02:00'
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

<whitespace> : \s+;


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
    :  StartTag <TAG_OPEN> 'beginTagOpen' <TAG_NAME> 'tagOpenName' (Attribute 'htmlAttribute')*
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
	#(25 0 #nil 200705 false) 
	#(27 1 #liftFirstValue: 308225 false) 
	#(27 1 #liftFirstValue: 308226 false) 
	#(25 2 #liftFirstValue: 200706 false) 
	#(26 0 #reduceActionForhtmlElements_1: 270337 false) 
	#(29 0 #nil 386049 false) 
	#(24 4 #reduceActionForhtmlDocument1: 181249 false) 
	#(24 5 #reduceActionForhtmlDocument3: 181251 false) 
	#(24 5 #reduceActionForhtmlDocument3: 181250 false) 
	#(26 2 #reduceActionForhtmlElements_2: 270338 false) 
	#(42 0 #reduceActionForStartTag1: 2083841 true) 
	#(24 6 #reduceActionForhtmlDocument4: 181252 false) 
	#(39 1 #liftFirstValue: 1207297 false) 
	#(39 1 #liftFirstValue: 1207298 false) 
	#(30 1 #liftFirstValue: 436228 false) 
	#(38 1 #liftFirstValue: 1157122 false) 
	#(29 2 #liftFirstValue: 386050 false) 
	#(38 1 #liftFirstValue: 1157121 false) 
	#(30 1 #liftFirstValue: 436229 false) 
	#(30 1 #liftFirstValue: 436230 false) 
	#(40 2 #liftFirstValue: 1282049 false) 
	#(40 2 #liftFirstValue: 1282050 false) 
	#(41 2 #liftFirstValue: 1355777 false) 
	#(41 2 #liftFirstValue: 1355778 false) 
	#(28 3 #liftSecondValue: 366593 false) 
	#(32 0 #reduceActionForhtmlElements_1: 517121 false) 
	#(43 0 #reduceActionForRetDefault1: 2125825 true) 
	#(36 1 #reduceActionForAttribute1: 947201 false) 
	#(44 0 #reduceActionForStartATTVALUE1: 3360769 true) 
	#(32 2 #reduceActionForhtmlElements_2: 517122 false) 
	#(31 1 #liftFirstValue: 517121 false) 
	#(30 6 #reduceActionForhtmlElement1: 436225 false) 
	#(35 0 #reduceActionFor__htmlElement__element_____CDATA____htmlComment__comment____htmlChardata___1: 857089 false) 
	#(30 6 #reduceActionForhtmlElement3: 436227 false) 
	#(37 1 #liftFirstValue: 1102850 false) 
	#(37 1 #liftFirstValue: 1102849 false) 
	#(33 1 #reduceActionForContent1: 828417 false) 
	#(34 1 #reduceActionFor__htmlElement__element_____CDATA____htmlComment__comment____htmlChardata__3: 857091 false) 
	#(34 1 #reduceActionFor__htmlElement__element_____CDATA____htmlComment__comment____htmlChardata__1: 857089 false) 
	#(35 2 #reduceActionFor__htmlElement__element_____CDATA____htmlComment__comment____htmlChardata___2: 857090 false) 
	#(34 1 #reduceActionFor__htmlElement__element_____CDATA____htmlComment__comment____htmlChardata__5: 857093 false) 
	#(33 2 #reduceActionForContent2: 828418 false) 
	#(36 5 #reduceActionForAttribute2: 947202 false) 
	#(34 2 #reduceActionFor__htmlElement__element_____CDATA____htmlComment__comment____htmlChardata__3: 857092 false) 
	#(34 2 #reduceActionFor__htmlElement__element_____CDATA____htmlComment__comment____htmlChardata__1: 857090 false) 
	#(34 2 #reduceActionFor__htmlElement__element_____CDATA____htmlComment__comment____htmlChardata__5: 857094 false) 
	#(30 13 #reduceActionForhtmlElement2: 436226 false)
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

	^ #( '<whitespace>' '<HTML_COMMENT>' '<HTML_CONDITIONAL_COMMENT>'
	     '<XML>' '<CDATA>' '<DTD>' '<SCRIPTLET>' '<SEA_WS>' '<SCRIPT_OPEN>'
	     '<STYLE_OPEN>' '<TAG_OPEN>' '<HTML_TEXT>' '<TAG_CLOSE>'
	     '<TAG_SLASH_CLOSE>' '<TAG_SLASH>' '<TAG_EQUALS>' '<TAG_NAME>'
	     '<SCRIPT_BODY>' '<SCRIPT_SHORT_BODY>' '<STYLE_BODY>'
	     '<STYLE_SHORT_BODY>' '<ATTVALUE_VALUE>' 'B e g i n' 'htmlDocument'
	     'scriptletOrSeaWs*' 'htmlElements*' 'scriptletOrSeaWs'
	     'htmlElements' 'htmlMisc*' 'htmlElement' '(Attribute ''htmlAttribute'')'
	     '(Attribute ''htmlAttribute'')*'
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
	     #SmaCCToken #SmaCCToken #HTMLDocumentNode #HTMLDocumentNode
	     nil #OrderedCollection #SmaCCToken #Object nil #Object #HTMLAttributeNode
	     #OrderedCollection #HTMLContentNode #OrderedCollection
	     #OrderedCollection #HTMLAttributeNode #SmaCCToken #SmaCCToken
	     #SmaCCToken #SmaCCToken #SmaCCToken #ByteSymbol #ByteSymbol
	     #ByteSymbol #SmaCCToken #SmaCCErrorNode )
]

{ #category : #generated }
HTMLParser class >> transitionTable [
^#(
#[1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 6 0 6 0 7 0 6 0 8 0 6 0 9 0 6 0 10 0 6 0 11 0 9 0 24 0 13 0 25 0 6 0 45] 
#[0 0 0 0 45] 
#[1 0 6 0 2 0 6 0 3 0 17 0 4 0 6 0 6 0 7 0 7 0 11 0 8 0 6 0 9 0 6 0 10 0 6 0 11 0 29 0 25 0 33 0 27 0 6 0 45] 
#[1 0 6 0 2 0 6 0 3 0 6 0 6 0 6 0 7 0 6 0 8 0 6 0 9 0 6 0 10 0 6 0 11 0 37 0 25 0 6 0 45] 
#[0 0 10 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 45] 
#[0 0 14 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 45] 
#[1 0 6 0 2 0 6 0 3 0 41 0 6 0 7 0 7 0 11 0 8 0 6 0 9 0 6 0 10 0 6 0 11 0 45 0 25 0 33 0 27 0 6 0 45] 
#[0 0 18 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 45] 
#[1 0 6 0 2 0 6 0 3 0 49 0 6 0 7 0 7 0 11 0 8 0 6 0 9 0 6 0 10 0 6 0 11 0 53 0 25 0 33 0 27 0 6 0 45] 
#[1 0 6 0 2 0 6 0 3 0 6 0 7 0 6 0 8 0 6 0 9 0 6 0 10 0 6 0 11 0 57 0 25 0 6 0 45] 
#[1 0 22 0 2 0 22 0 3 0 15 0 7 0 19 0 8 0 22 0 9 0 22 0 10 0 22 0 11 0 61 0 26 0 33 0 27 0 22 0 45] 
#[1 0 6 0 2 0 6 0 3 0 6 0 7 0 6 0 8 0 6 0 9 0 6 0 10 0 6 0 11 0 65 0 25 0 6 0 45] 
#[1 0 22 0 2 0 22 0 3 0 15 0 7 0 19 0 8 0 22 0 9 0 22 0 10 0 22 0 11 0 69 0 26 0 33 0 27 0 22 0 45] 
#[1 0 22 0 2 0 22 0 3 0 15 0 7 0 19 0 8 0 22 0 9 0 22 0 10 0 22 0 11 0 73 0 26 0 33 0 27 0 22 0 45] 
#[1 0 26 0 2 0 26 0 3 0 26 0 7 0 26 0 8 0 26 0 9 0 26 0 10 0 26 0 11 0 77 0 28 0 81 0 29 0 30 0 45] 
#[1 0 22 0 2 0 22 0 3 0 15 0 7 0 19 0 8 0 22 0 9 0 22 0 10 0 22 0 11 0 85 0 26 0 33 0 27 0 22 0 45] 
#[1 0 26 0 2 0 26 0 3 0 26 0 7 0 26 0 8 0 26 0 9 0 26 0 10 0 26 0 11 0 77 0 28 0 81 0 29 0 34 0 45] 
#[1 0 26 0 2 0 26 0 3 0 26 0 7 0 26 0 8 0 26 0 9 0 26 0 10 0 26 0 11 0 77 0 28 0 81 0 29 0 38 0 45] 
#[0 0 42 0 2 0 3 0 7 0 8 0 9 0 10 0 11 0 45] 
#[1 0 117 0 2 0 117 0 3 0 113 0 7 0 117 0 8 0 105 0 9 0 109 0 10 0 46 0 11 0 113 0 30 0 117 0 38 0 117 0 39 0 113 0 40 0 113 0 41 0 133 0 42] 
#[1 0 26 0 2 0 26 0 3 0 26 0 7 0 26 0 8 0 26 0 9 0 26 0 10 0 26 0 11 0 77 0 28 0 81 0 29 0 50 0 45] 
#[0 0 54 0 2 0 3 0 5 0 7 0 8 0 9 0 10 0 11 0 12 0 45] 
#[0 0 58 0 2 0 3 0 5 0 7 0 8 0 9 0 10 0 11 0 12 0 45] 
#[0 0 62 0 2 0 3 0 5 0 7 0 8 0 9 0 10 0 11 0 12 0 45] 
#[0 0 66 0 2 0 3 0 7 0 8 0 9 0 10 0 11 0 45] 
#[1 0 137 0 18 0 141 0 19] 
#[1 0 145 0 20 0 149 0 21] 
#[1 0 26 0 2 0 26 0 3 0 26 0 7 0 26 0 8 0 26 0 9 0 26 0 10 0 26 0 11 0 153 0 29 0 26 0 45] 
#[0 0 70 0 2 0 3 0 7 0 8 0 9 0 10 0 11 0 45] 
#[0 0 74 0 2 0 3 0 7 0 8 0 9 0 10 0 11 0 45] 
#[0 0 78 0 2 0 3 0 5 0 7 0 8 0 9 0 10 0 11 0 12 0 45] 
#[0 0 82 0 2 0 3 0 5 0 7 0 8 0 9 0 10 0 11 0 12 0 45] 
#[0 0 157 0 11] 
#[0 0 86 0 2 0 3 0 5 0 7 0 8 0 9 0 10 0 11 0 12 0 45] 
#[0 0 90 0 2 0 3 0 5 0 7 0 8 0 9 0 10 0 11 0 12 0 45] 
#[0 0 94 0 2 0 3 0 5 0 7 0 8 0 9 0 10 0 11 0 12 0 45] 
#[0 0 98 0 2 0 3 0 5 0 7 0 8 0 9 0 10 0 11 0 12 0 45] 
#[1 0 23 0 2 0 27 0 3 0 102 0 7 0 31 0 8 0 102 0 9 0 102 0 10 0 102 0 11 0 117 0 38 0 117 0 39 0 102 0 45] 
#[0 0 161 0 17] 
#[1 0 106 0 13 0 106 0 14 0 106 0 17 0 165 0 32] 
#[1 0 110 0 13 0 110 0 14 0 169 0 17 0 173 0 31 0 173 0 36 0 181 0 43] 
#[1 0 114 0 13 0 114 0 14 0 118 0 16 0 114 0 17 0 185 0 44] 
#[0 0 122 0 13 0 14 0 17] 
#[0 0 126 0 13 0 14 0 17] 
#[1 0 189 0 13 0 193 0 14] 
#[0 0 197 0 16] 
#[1 0 35 0 2 0 35 0 3 0 35 0 5 0 35 0 7 0 39 0 8 0 35 0 9 0 35 0 10 0 35 0 11 0 43 0 12 0 209 0 33 0 213 0 35 0 217 0 37 0 130 0 45] 
#[0 0 138 0 2 0 3 0 5 0 7 0 8 0 9 0 10 0 11 0 12 0 45] 
#[1 0 46 0 22 0 221 0 42] 
#[0 0 142 0 2 0 3 0 5 0 7 0 9 0 10 0 11] 
#[0 0 146 0 2 0 3 0 5 0 7 0 9 0 10 0 11] 
#[1 0 46 0 11 0 225 0 42] 
#[1 0 241 0 2 0 241 0 3 0 229 0 5 0 233 0 7 0 105 0 9 0 109 0 10 0 47 0 11 0 233 0 30 0 237 0 34 0 241 0 39 0 233 0 40 0 233 0 41 0 133 0 42] 
#[1 0 134 0 2 0 134 0 3 0 134 0 5 0 134 0 7 0 134 0 9 0 134 0 10 0 134 0 11 0 245 0 35] 
#[0 0 249 0 22] 
#[0 0 253 0 11] 
#[1 0 154 0 2 0 154 0 3 0 154 0 5 0 154 0 7 1 1 0 8 0 154 0 9 0 154 0 10 0 154 0 11 1 1 0 12 1 1 0 37] 
#[1 0 158 0 2 0 158 0 3 0 158 0 5 0 158 0 7 1 5 0 8 0 158 0 9 0 158 0 10 0 158 0 11 1 5 0 12 1 5 0 37] 
#[0 0 162 0 2 0 3 0 5 0 7 0 9 0 10 0 11] 
#[1 0 166 0 2 0 166 0 3 0 166 0 5 0 166 0 7 1 9 0 8 0 166 0 9 0 166 0 10 0 166 0 11 1 9 0 12 1 9 0 37] 
#[1 0 241 0 2 0 241 0 3 0 229 0 5 0 233 0 7 0 105 0 9 0 109 0 10 0 51 0 11 0 233 0 30 0 237 0 34 0 241 0 39 0 233 0 40 0 233 0 41 0 133 0 42] 
#[0 0 174 0 13 0 14 0 17] 
#[0 1 13 0 15] 
#[0 0 178 0 2 0 3 0 5 0 7 0 9 0 10 0 11] 
#[0 0 182 0 2 0 3 0 5 0 7 0 9 0 10 0 11] 
#[0 0 186 0 2 0 3 0 5 0 7 0 9 0 10 0 11] 
#[0 1 17 0 17] 
#[1 0 110 0 13 1 21 0 43] 
#[0 1 25 0 13] 
#[0 0 190 0 2 0 3 0 5 0 7 0 8 0 9 0 10 0 11 0 12 0 45]
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
