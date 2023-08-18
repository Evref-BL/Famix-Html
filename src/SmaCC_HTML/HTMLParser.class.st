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
#[ 0 74 0 78] 
#[ 0 86 0 90] 
#[ 0 93 0 118] 
#[ 0 97 0 118] 
#[ 0 105 0 118] 
#[ 0 118 0 169] 
#[ 0 134 0 138] 
#[ 0 134 0 249] 
#[ 0 134 0 138 0 253] 
#[ 0 146 1 17] 
#[ 0 138 0 150] 
#[ 0 150 0 249] 
#[ 0 138 0 150 0 253] 
#[ 0 138 0 158] 
#[ 0 158 0 249] 
#[ 0 138 0 158 0 253] 
#[ 0 50 0 174] 
#[ 0 138 0 186] 
#[ 0 186 0 249] 
#[ 0 138 0 186 0 253] 
#[ 0 194 0 253] 
#[ 0 198 0 253] 
#[ 0 90 0 206] 
#[ 0 90 0 249] 
#[ 0 90 0 206 0 253] 
#[ 0 50 0 210]
	).
]

{ #category : #'generated-accessing' }
HTMLParser class >> cacheId [
	^'2023-08-18T13:56:25.331+02:00'
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
    :  StartTag <TAG_OPEN> 'beginTagOpen' <TAG_NAME> 'tagOpenName' (Attributes 'attributes')?  <SEA_WS>?
      (RetDefault <TAG_CLOSE> 'beginTagClose' (Content 'children' StartTag <TAG_OPEN> 'endTagOpen' <TAG_SLASH> <TAG_NAME> 'endTagOpenName' <SEA_WS>?  RetDefault <TAG_CLOSE> 'endTagClose' )? | RetDefault <TAG_SLASH_CLOSE>) {{ Element }}
    | <SCRIPTLET>
    | script
    | style
    | <HTML_TEXT>
    | htmlComment 'comment' {{Comment}}
    ;

Content
    : htmlChardata? ((htmlComment 'comment' | htmlElement 'element' | <CDATA> ) htmlChardata?)* {{}}
    ;

Attributes
   :   <SEA_WS> Attribute 'htmlAttribute' (<SEA_WS>? Attribute 'htmlAttribute')* {{}}
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
    | <HTML_TEXT>
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
    : \<!\-\- (.?[^\-]|(\-)*[^\>\-])* \-*\-\-\>
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
	#(44 0 #reduceActionForRetDefault1: 2456577 true) 
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
	#(43 0 #reduceActionForStartTag1: 2414593 true) 
	#(23 7 #reduceActionForhtmlDocument4: 157700 false) 
	#(40 1 #liftFirstValue: 1421313 false) 
	#(40 1 #liftFirstValue: 1421314 false) 
	#(29 1 #liftFirstValue: 423949 false) 
	#(39 1 #liftFirstValue: 1330179 false) 
	#(29 1 #liftFirstValue: 423952 false) 
	#(39 1 #liftFirstValue: 1330178 false) 
	#(28 2 #liftFirstValue: 373762 false) 
	#(39 1 #reduceActionForhtmlMisc1: 1330177 false) 
	#(29 1 #reduceActionForhtmlMisc1: 423953 false) 
	#(29 1 #liftFirstValue: 423950 false) 
	#(29 1 #liftFirstValue: 423951 false) 
	#(41 2 #liftFirstValue: 1496065 false) 
	#(41 2 #liftFirstValue: 1496066 false) 
	#(42 2 #liftFirstValue: 1569793 false) 
	#(42 2 #liftFirstValue: 1569794 false) 
	#(27 3 #reduceActionForhtmlElements1: 354305 false) 
	#(37 1 #reduceActionForAttribute1: 1120257 false) 
	#(45 0 #reduceActionForStartATTVALUE1: 3662849 true) 
	#(36 0 #reduceActionFor__SEA_WS___Attribute__htmlAttribute___1: 1069057 false) 
	#(29 5 #reduceActionForhtmlElement1: 423937 false) 
	#(33 0 #reduceActionForhtmlElements_1: 924673 false) 
	#(29 5 #reduceActionForhtmlElement3: 423939 false) 
	#(34 3 #reduceActionForAttributes1: 1014785 false) 
	#(29 6 #reduceActionForhtmlElement4: 423940 false) 
	#(29 6 #reduceActionForhtmlElement3: 423942 false) 
	#(29 6 #reduceActionForhtmlElement7: 423943 false) 
	#(29 6 #reduceActionForhtmlElement9: 423945 false) 
	#(38 1 #liftFirstValue: 1275906 false) 
	#(38 1 #liftFirstValue: 1275905 false) 
	#(31 1 #reduceActionForContent1: 896001 false) 
	#(36 2 #reduceActionFor__SEA_WS___Attribute__htmlAttribute___2: 1069058 false) 
	#(35 1 #liftFirstValue: 1069057 false) 
	#(29 7 #reduceActionForhtmlElement10: 423946 false) 
	#(29 7 #reduceActionForhtmlElement9: 423948 false) 
	#(32 1 #reduceActionFor__htmlComment__comment____htmlElement__element_____CDATA____htmlChardata__5: 924677 false) 
	#(32 1 #reduceActionFor__htmlComment__comment____htmlElement__element_____CDATA____htmlChardata__3: 924675 false) 
	#(33 2 #reduceActionFor__htmlComment__comment____htmlElement__element_____CDATA____htmlChardata___2: 924674 false) 
	#(32 1 #reduceActionFor__htmlComment__comment____htmlElement__element_____CDATA____htmlChardata__1: 924673 false) 
	#(31 2 #reduceActionForContent2: 896002 false) 
	#(35 2 #liftSecondValue: 1069058 false) 
	#(32 2 #reduceActionFor__htmlComment__comment____htmlElement__element_____CDATA____htmlChardata__5: 924678 false) 
	#(32 2 #reduceActionFor__htmlComment__comment____htmlElement__element_____CDATA____htmlChardata__3: 924676 false) 
	#(32 2 #reduceActionFor__htmlComment__comment____htmlElement__element_____CDATA____htmlChardata__1: 924674 false) 
	#(37 5 #reduceActionForAttribute2: 1120258 false) 
	#(30 0 #nil 686081 false) 
	#(30 1 #liftFirstValue: 686082 false) 
	#(29 13 #reduceActionForhtmlElement2: 423938 false) 
	#(29 14 #reduceActionForhtmlElement5: 423941 false) 
	#(29 14 #reduceActionForhtmlElement8: 423944 false) 
	#(29 15 #reduceActionForhtmlElement11: 423947 false)
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
	     'htmlElements' 'htmlMisc*' 'htmlElement' '<SEA_WS>?' 'Content'
	     '((htmlComment ''comment'' | htmlElement ''element'' | <CDATA> ) htmlChardata?)'
	     '((htmlComment ''comment'' | htmlElement ''element'' | <CDATA> ) htmlChardata?)*'
	     'Attributes' '(<SEA_WS>? Attribute ''htmlAttribute'')'
	     '(<SEA_WS>? Attribute ''htmlAttribute'')*'
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
	     nil #Object #SmaCCToken #HTMLContentNode #OrderedCollection
	     #OrderedCollection #HTMLAttributesNode #HTMLAttributeNode
	     #OrderedCollection #HTMLAttributeNode #SmaCCToken #Object
	     #SmaCCToken #SmaCCToken #SmaCCToken #ByteSymbol #ByteSymbol
	     #ByteSymbol #SmaCCToken #SmaCCErrorNode )
]

{ #category : #generated }
HTMLParser class >> transitionTable [
^#(
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 5 0 6 0 6 0 6 0 7 0 6 0 8 0 6 0 9 0 6 0 10 0 6 0 11 0 9 0 23 0 13 0 44 0 6 0 46] 
#[0 0 0 0 46] 
#[1 0 10 0 1 0 10 0 2 0 10 0 3 0 10 0 5 0 10 0 6 0 10 0 7 0 10 0 8 0 10 0 9 0 10 0 10 0 10 0 11 0 17 0 24 0 10 0 46] 
#[1 0 10 0 1 0 10 0 2 0 21 0 3 0 10 0 5 0 7 0 6 0 11 0 7 0 10 0 8 0 10 0 9 0 10 0 10 0 10 0 11 0 33 0 24 0 37 0 26 0 10 0 46] 
#[1 0 10 0 1 0 10 0 2 0 10 0 5 0 10 0 6 0 10 0 7 0 10 0 8 0 10 0 9 0 10 0 10 0 10 0 11 0 41 0 24 0 10 0 46] 
#[0 0 14 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[0 0 18 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[1 0 10 0 1 0 10 0 2 0 45 0 5 0 7 0 6 0 11 0 7 0 10 0 8 0 10 0 9 0 10 0 10 0 10 0 11 0 49 0 24 0 37 0 26 0 10 0 46] 
#[0 0 22 0 1 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[1 0 10 0 1 0 10 0 2 0 53 0 5 0 7 0 6 0 11 0 7 0 10 0 8 0 10 0 9 0 10 0 10 0 10 0 11 0 57 0 24 0 37 0 26 0 10 0 46] 
#[1 0 10 0 1 0 10 0 2 0 10 0 6 0 10 0 7 0 10 0 8 0 10 0 9 0 10 0 10 0 10 0 11 0 61 0 24 0 10 0 46] 
#[1 0 26 0 1 0 26 0 2 0 15 0 6 0 19 0 7 0 26 0 8 0 26 0 9 0 26 0 10 0 26 0 11 0 65 0 25 0 37 0 26 0 26 0 46] 
#[1 0 10 0 1 0 10 0 2 0 10 0 6 0 10 0 7 0 10 0 8 0 10 0 9 0 10 0 10 0 10 0 11 0 69 0 24 0 10 0 46] 
#[1 0 26 0 1 0 26 0 2 0 15 0 6 0 19 0 7 0 26 0 8 0 26 0 9 0 26 0 10 0 26 0 11 0 73 0 25 0 37 0 26 0 26 0 46] 
#[1 0 26 0 1 0 26 0 2 0 15 0 6 0 19 0 7 0 26 0 8 0 26 0 9 0 26 0 10 0 26 0 11 0 77 0 25 0 37 0 26 0 26 0 46] 
#[1 0 30 0 1 0 30 0 2 0 30 0 6 0 30 0 7 0 30 0 8 0 30 0 9 0 30 0 10 0 30 0 11 0 81 0 27 0 85 0 28 0 34 0 46] 
#[1 0 26 0 1 0 26 0 2 0 15 0 6 0 19 0 7 0 26 0 8 0 26 0 9 0 26 0 10 0 26 0 11 0 89 0 25 0 37 0 26 0 26 0 46] 
#[1 0 30 0 1 0 30 0 2 0 30 0 6 0 30 0 7 0 30 0 8 0 30 0 9 0 30 0 10 0 30 0 11 0 81 0 27 0 85 0 28 0 38 0 46] 
#[1 0 30 0 1 0 30 0 2 0 30 0 6 0 30 0 7 0 30 0 8 0 30 0 9 0 30 0 10 0 30 0 11 0 81 0 27 0 85 0 28 0 42 0 46] 
#[0 0 46 0 1 0 2 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[1 0 129 0 1 0 129 0 2 0 121 0 6 0 125 0 7 0 109 0 8 0 113 0 9 0 50 0 10 0 117 0 11 0 121 0 29 0 125 0 39 0 129 0 40 0 121 0 41 0 121 0 42 0 141 0 43] 
#[1 0 30 0 1 0 30 0 2 0 30 0 6 0 30 0 7 0 30 0 8 0 30 0 9 0 30 0 10 0 30 0 11 0 81 0 27 0 85 0 28 0 54 0 46] 
#[0 0 58 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[0 0 62 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[0 0 66 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[0 0 70 0 1 0 2 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[1 0 145 0 17 0 149 0 18] 
#[1 0 153 0 19 0 157 0 20] 
#[1 0 23 0 1 0 23 0 2 0 23 0 6 0 23 0 7 0 23 0 8 0 23 0 9 0 23 0 10 0 23 0 11 0 74 0 46] 
#[1 0 30 0 1 0 30 0 2 0 30 0 6 0 30 0 7 0 30 0 8 0 30 0 9 0 30 0 10 0 30 0 11 0 161 0 28 0 30 0 46] 
#[0 0 82 0 1 0 2 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[1 0 27 0 1 0 27 0 2 0 27 0 6 0 27 0 7 0 27 0 8 0 27 0 9 0 27 0 10 0 27 0 11 0 90 0 46] 
#[0 0 94 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[0 0 98 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[0 0 165 0 10] 
#[0 0 102 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[0 0 106 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[0 0 110 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[0 0 114 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[1 0 31 0 1 0 35 0 2 0 118 0 6 0 39 0 7 0 118 0 8 0 118 0 9 0 118 0 10 0 43 0 11 0 125 0 39 0 173 0 40 0 118 0 46] 
#[0 0 177 0 16] 
#[0 0 78 0 1 0 2 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[0 0 86 0 1 0 2 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[1 0 181 0 7 0 6 0 12 0 6 0 13 0 185 0 34 0 189 0 44] 
#[1 0 6 0 12 0 6 0 13 0 193 0 16 0 197 0 37 0 201 0 44] 
#[1 0 205 0 7 0 6 0 12 0 6 0 13 0 209 0 44] 
#[1 0 213 0 12 0 217 0 13] 
#[1 0 122 0 7 0 122 0 12 0 122 0 13 0 126 0 15 0 122 0 16 0 221 0 45] 
#[1 0 130 0 7 0 130 0 12 0 130 0 13 0 130 0 16 0 225 0 36] 
#[1 0 229 0 12 0 233 0 13] 
#[1 0 6 0 12 0 6 0 13 0 237 0 44] 
#[1 0 241 0 12 0 245 0 13] 
#[1 0 47 0 1 0 47 0 2 0 47 0 4 0 47 0 6 0 51 0 7 0 47 0 8 0 47 0 9 0 47 0 10 0 55 0 11 1 1 0 31 1 5 0 33 1 9 0 38 0 134 0 46] 
#[0 0 142 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[0 1 13 0 15] 
#[1 0 59 0 7 0 146 0 12 0 146 0 13 0 193 0 16 1 21 0 35 1 21 0 37] 
#[1 0 63 0 1 0 63 0 2 0 63 0 4 0 63 0 6 0 67 0 7 0 63 0 8 0 63 0 9 0 63 0 10 0 71 0 11 1 29 0 31 1 5 0 33 1 9 0 38 0 150 0 46] 
#[0 0 154 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[1 1 33 0 12 1 37 0 13] 
#[1 0 75 0 1 0 75 0 2 0 75 0 4 0 75 0 6 0 79 0 7 0 75 0 8 0 75 0 9 0 75 0 10 0 83 0 11 1 41 0 31 1 5 0 33 1 9 0 38 0 158 0 46] 
#[0 0 162 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[0 0 166 0 1 0 2 0 4 0 6 0 8 0 9 0 10 0 11] 
#[0 0 170 0 1 0 2 0 4 0 6 0 8 0 9 0 10 0 11] 
#[1 0 50 0 10 1 45 0 43] 
#[1 1 65 0 1 1 65 0 2 1 49 0 4 1 57 0 6 0 109 0 8 0 113 0 9 0 87 0 10 1 57 0 11 1 57 0 29 1 61 0 32 1 65 0 40 1 57 0 41 1 57 0 42 0 141 0 43] 
#[1 0 138 0 1 0 138 0 2 0 138 0 4 0 138 0 6 0 138 0 8 0 138 0 9 0 138 0 10 0 138 0 11 1 69 0 33] 
#[1 0 50 0 21 1 73 0 43] 
#[1 0 193 0 16 1 77 0 37] 
#[0 0 178 0 7 0 12 0 13 0 16] 
#[0 0 182 0 7 0 12 0 13 0 16] 
#[1 0 50 0 10 1 81 0 43] 
#[1 0 91 0 1 0 91 0 2 0 91 0 4 0 91 0 6 0 95 0 7 0 91 0 8 0 91 0 9 0 91 0 10 0 99 0 11 1 85 0 31 1 5 0 33 1 9 0 38 0 186 0 46] 
#[0 0 190 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[1 0 50 0 10 1 89 0 43] 
#[0 1 93 0 10] 
#[1 0 194 0 1 0 194 0 2 0 194 0 4 0 194 0 6 1 97 0 7 0 194 0 8 0 194 0 9 0 194 0 10 0 103 0 11 1 97 0 38] 
#[0 0 74 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11] 
#[1 0 198 0 1 0 198 0 2 0 198 0 4 0 198 0 6 1 101 0 7 0 198 0 8 0 198 0 9 0 198 0 10 0 107 0 11 1 101 0 38] 
#[0 0 202 0 1 0 2 0 4 0 6 0 8 0 9 0 10 0 11] 
#[1 0 111 0 1 0 111 0 2 0 111 0 4 0 111 0 6 0 115 0 7 0 111 0 8 0 111 0 9 0 111 0 10 0 119 0 11 1 105 0 38] 
#[1 1 65 0 1 1 65 0 2 1 49 0 4 1 57 0 6 0 109 0 8 0 113 0 9 0 123 0 10 1 57 0 11 1 57 0 29 1 61 0 32 1 65 0 40 1 57 0 41 1 57 0 42 0 141 0 43] 
#[0 1 109 0 21] 
#[0 0 214 0 7 0 12 0 13 0 16] 
#[0 1 113 0 10] 
#[1 0 50 0 10 1 117 0 43] 
#[0 1 121 0 10] 
#[0 1 125 0 14] 
#[0 0 218 0 1 0 2 0 4 0 6 0 8 0 9 0 10 0 11] 
#[0 0 222 0 1 0 2 0 4 0 6 0 8 0 9 0 10 0 11] 
#[0 0 226 0 1 0 2 0 4 0 6 0 8 0 9 0 10 0 11] 
#[0 0 230 0 7 0 12 0 13 0 16] 
#[0 1 129 0 14] 
#[0 1 133 0 10] 
#[0 1 137 0 14] 
#[0 1 141 0 16] 
#[0 1 145 0 16] 
#[0 1 149 0 14] 
#[0 1 153 0 16] 
#[1 1 161 0 7 0 234 0 12 1 161 0 30] 
#[1 1 165 0 7 0 234 0 12 1 165 0 30] 
#[0 1 169 0 16] 
#[1 1 173 0 7 0 234 0 12 1 173 0 30] 
#[0 0 238 0 12] 
#[1 0 6 0 12 1 177 0 44] 
#[1 0 6 0 12 1 181 0 44] 
#[1 1 185 0 7 0 234 0 12 1 185 0 30] 
#[1 0 6 0 12 1 189 0 44] 
#[0 1 193 0 12] 
#[0 1 197 0 12] 
#[1 0 6 0 12 1 201 0 44] 
#[0 1 205 0 12] 
#[0 0 242 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[0 0 246 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[0 1 209 0 12] 
#[0 0 250 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 46] 
#[0 0 254 0 1 0 2 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 46]
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
HTMLParser >> reduceActionForAttributes1: nodes [

	| result |
	result := HTMLAttributesNode new.
	result addNode: (nodes at: 2) to: result htmlAttributes.
	result addNodes: (nodes at: 3) to: result htmlAttributes.
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
HTMLParser >> reduceActionFor__SEA_WS___Attribute__htmlAttribute___1: nodes [

	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionFor__SEA_WS___Attribute__htmlAttribute___2: nodes [

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
HTMLParser >> reduceActionForhtmlElement10: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result _attributes: (nodes at: 4).
	result beginTagClose: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement11: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result _attributes: (nodes at: 4).
	result beginTagClose: (nodes at: 7).
	result _children: (nodes at: 8).
	result endTagOpen: (nodes at: 10).
	result endTagOpenName: (nodes at: 12).
	result endTagClose: (nodes at: 15).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement1: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result beginTagClose: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement2: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result beginTagClose: (nodes at: 5).
	result _children: (nodes at: 6).
	result endTagOpen: (nodes at: 8).
	result endTagOpenName: (nodes at: 10).
	result endTagClose: (nodes at: 13).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement3: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement4: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result beginTagClose: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement5: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result beginTagClose: (nodes at: 6).
	result _children: (nodes at: 7).
	result endTagOpen: (nodes at: 9).
	result endTagOpenName: (nodes at: 11).
	result endTagClose: (nodes at: 14).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement7: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result _attributes: (nodes at: 4).
	result beginTagClose: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement8: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result _attributes: (nodes at: 4).
	result beginTagClose: (nodes at: 6).
	result _children: (nodes at: 7).
	result endTagOpen: (nodes at: 9).
	result endTagOpenName: (nodes at: 11).
	result endTagClose: (nodes at: 14).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement9: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result _attributes: (nodes at: 4).
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
