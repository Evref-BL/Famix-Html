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
#[ 0 86 0 90] 
#[ 0 93 0 114] 
#[ 0 97 0 114] 
#[ 0 105 0 114] 
#[ 0 113 0 114] 
#[ 0 126 1 37] 
#[ 0 146 1 117] 
#[ 0 30 0 54]
	).
]

{ #category : #'generated-accessing' }
HTMLParser class >> cacheId [
	^'2023-10-17T17:59:49.381+02:00'
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
    : VoidElement  {{ Element }}
    |  StartTag <TAG_OPEN> 'beginTagOpen' <TAG_NAME> 'tagOpenName' (Attributes 'attributes')?  <SEA_WS>?
	(<TAG_SLASH> RetDefault <TAG_CLOSE> |
	RetDefault <TAG_CLOSE> 'beginTagClose' (htmlElements 'children')* StartTag <TAG_OPEN> 'endTagOpen' <TAG_SLASH> <TAG_NAME> 'endTagOpenName' <SEA_WS>?  RetDefault <TAG_CLOSE> 'endTagClose') {{ Element }}
    | <SCRIPTLET>
    | Script
    | style
    | htmlMisc
    ;

VoidElement
   : StartTag <TAG_OPEN>  'beginTagOpen' <VOID_TAG_NAME> 'tagOpenName' (Attributes 'attributes')?  <SEA_WS>? <TAG_SLASH>? RetDefault <TAG_CLOSE>
   ;

Attributes
   :   <SEA_WS> Attribute 'htmlAttribute' (<SEA_WS>? Attribute 'htmlAttribute')* {{}}
   ;

Attribute
    :  <TAG_NAME> 'attributeName' (<SEA_WS>? StartATTVALUE <TAG_EQUALS> 'attributeEqualSymbol' <SEA_WS>? StartTag <ATTVALUE_VALUE> 'attributeValue' )? {{}}
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

Script
    : StartScript <SCRIPT_OPEN> RetDefault (<SCRIPT_BODY> | <SCRIPT_SHORT_BODY>)
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
    : \<script [^\>]*\> 
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

tag <VOID_TAG_NAME>
   : area
   | base
   | br
   | col
   | embed
   | hr
   | img
   | input
   | link
   | meta
   | param
   | source
   | track
   | wbr
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
	| \*
	;

tag <Attribute_tag_suffix>
	: \)? \]?
	;

/* <scripts> */

StartScript
	: [self scope: #script. #script]
	;

script <SCRIPT_BODY>
    : .*\<\/script\>
    ;

script <SCRIPT_SHORT_BODY>
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
    : <ATTRIBUTE>
    ;

attvalue <ATTRIBUTE>
    : <DOUBLE_QUOTE_STRING>
    | <SINGLE_QUOTE_STRING>
    | <ATTCHARS>
    | <HEXCHARS>
    | <DECCHARS>
    ;

attvalue <ATTCHARS>
    : <ATTCHAR>+
    ;

attvalue <ATTCHAR>
    : [0-9a-zA-Z]
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
	#(42 0 #reduceActionForRetDefault1: 2505729 true) 
	#(23 0 #nil 188417 false) 
	#(25 1 #liftFirstValue: 295937 false) 
	#(25 1 #liftFirstValue: 295938 false) 
	#(23 2 #liftFirstValue: 188418 false) 
	#(24 0 #reduceActionForhtmlElements_1: 258049 false) 
	#(27 0 #nil 373761 false) 
	#(22 5 #reduceActionForhtmlDocument1: 157697 false) 
	#(22 6 #reduceActionForhtmlDocument3: 157699 false) 
	#(22 6 #reduceActionForhtmlDocument3: 157698 false) 
	#(24 2 #reduceActionForhtmlElements_2: 258050 false) 
	#(43 0 #reduceActionForStartScript1: 3397633 true) 
	#(41 0 #reduceActionForStartTag1: 2463745 true) 
	#(22 7 #reduceActionForhtmlDocument4: 157700 false) 
	#(38 1 #liftFirstValue: 1486849 false) 
	#(38 1 #liftFirstValue: 1486850 false) 
	#(28 1 #liftFirstValue: 423950 false) 
	#(37 1 #liftFirstValue: 1395715 false) 
	#(37 1 #liftFirstValue: 1395714 false) 
	#(28 1 #reduceActionForhtmlElement1: 423937 false) 
	#(28 1 #liftFirstValue: 423953 false) 
	#(27 2 #liftFirstValue: 373762 false) 
	#(37 1 #reduceActionForhtmlMisc1: 1395713 false) 
	#(28 1 #liftFirstValue: 423951 false) 
	#(28 1 #liftFirstValue: 423952 false) 
	#(40 2 #liftFirstValue: 1658881 false) 
	#(40 2 #liftFirstValue: 1658882 false) 
	#(26 3 #reduceActionForhtmlElements1: 354305 false) 
	#(39 4 #liftFirstValue: 1561601 false) 
	#(39 4 #liftFirstValue: 1561602 false) 
	#(35 1 #reduceActionForAttribute1: 1164289 false) 
	#(44 0 #reduceActionForStartATTVALUE1: 3868673 true) 
	#(34 0 #reduceActionFor__SEA_WS___Attribute__htmlAttribute___1: 1113089 false) 
	#(30 0 #reduceActionFor__SEA_WS___Attribute__htmlAttribute___1: 658433 false) 
	#(31 5 #reduceActionForVoidElement1: 891905 false) 
	#(32 3 #reduceActionForAttributes1: 1058817 false) 
	#(28 6 #reduceActionForhtmlElement2: 423938 false) 
	#(31 6 #reduceActionForVoidElement1: 891907 false) 
	#(31 6 #reduceActionForVoidElement1: 891906 false) 
	#(31 6 #reduceActionForVoidElement5: 891909 false) 
	#(28 7 #reduceActionForhtmlElement2: 423941 false) 
	#(34 2 #reduceActionFor__SEA_WS___Attribute__htmlAttribute___2: 1113090 false) 
	#(33 1 #liftFirstValue: 1113089 false) 
	#(28 7 #reduceActionForhtmlElement8: 423944 false) 
	#(29 1 #liftFirstValue: 658433 false) 
	#(30 2 #reduceActionFor__SEA_WS___Attribute__htmlAttribute___2: 658434 false) 
	#(31 7 #reduceActionForVoidElement1: 891908 false) 
	#(31 7 #reduceActionForVoidElement5: 891911 false) 
	#(31 7 #reduceActionForVoidElement5: 891910 false) 
	#(33 2 #liftSecondValue: 1113090 false) 
	#(28 8 #reduceActionForhtmlElement8: 423947 false) 
	#(31 8 #reduceActionForVoidElement5: 891912 false) 
	#(35 5 #reduceActionForAttribute2: 1164290 false) 
	#(35 6 #reduceActionForAttribute4: 1164292 false) 
	#(35 6 #reduceActionForAttribute3: 1164291 false) 
	#(35 7 #reduceActionForAttribute5: 1164293 false) 
	#(28 12 #reduceActionForhtmlElement3: 423939 false) 
	#(28 13 #reduceActionForhtmlElement6: 423942 false) 
	#(28 13 #reduceActionForhtmlElement9: 423945 false) 
	#(28 13 #reduceActionForhtmlElement4: 423940 false) 
	#(28 14 #reduceActionForhtmlElement7: 423943 false) 
	#(28 14 #reduceActionForhtmlElement12: 423948 false) 
	#(28 14 #reduceActionForhtmlElement10: 423946 false) 
	#(28 15 #reduceActionForhtmlElement13: 423949 false)
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
	     '<XML>' '<DTD>' '<SCRIPTLET>' '<SEA_WS>' '<SCRIPT_OPEN>'
	     '<STYLE_OPEN>' '<TAG_OPEN>' '<HTML_TEXT>' '<TAG_CLOSE>'
	     '<TAG_SLASH>' '<TAG_EQUALS>' '<TAG_NAME>' '<VOID_TAG_NAME>'
	     '<SCRIPT_BODY>' '<SCRIPT_SHORT_BODY>' '<STYLE_BODY>'
	     '<STYLE_SHORT_BODY>' '<ATTVALUE_VALUE>' 'B e g i n' 'htmlDocument'
	     'scriptletOrSeaWs*' 'htmlElements*' 'scriptletOrSeaWs'
	     'htmlElements' 'htmlMisc*' 'htmlElement' '(htmlElements ''children'')'
	     '(htmlElements ''children'')*' 'VoidElement' 'Attributes'
	     '(<SEA_WS>? Attribute ''htmlAttribute'')'
	     '(<SEA_WS>? Attribute ''htmlAttribute'')*'
	     'Attribute' 'htmlChardata' 'htmlMisc' 'htmlComment'
	     'Script' 'style' 'StartTag' 'RetDefault' 'StartScript'
	     'StartATTVALUE' 'E O F' 'error' )
]

{ #category : #generated }
HTMLParser class >> symbolTypes [

	^ #( #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken
	     #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken
	     #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken
	     #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken
	     #HTMLDocumentNode #HTMLDocumentNode nil #OrderedCollection
	     #SmaCCToken #OrderedCollection nil #Object #OrderedCollection
	     #OrderedCollection #OrderedCollection #HTMLAttributesNode
	     #HTMLAttributeNode #OrderedCollection #HTMLAttributeNode
	     #SmaCCToken #Object #SmaCCToken #ByteSymbol #SmaCCToken
	     #ByteSymbol #ByteSymbol #ByteSymbol #ByteSymbol #SmaCCToken
	     #SmaCCErrorNode )
]

{ #category : #generated }
HTMLParser class >> transitionTable [
^#(
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 6 0 6 0 7 0 6 0 8 0 6 0 9 0 6 0 10 0 9 0 22 0 13 0 42 0 6 0 45] 
#[0 0 0 0 45] 
#[1 0 10 0 1 0 10 0 2 0 10 0 3 0 10 0 4 0 10 0 5 0 10 0 6 0 10 0 7 0 10 0 8 0 10 0 9 0 10 0 10 0 17 0 23 0 10 0 45] 
#[1 0 10 0 1 0 10 0 2 0 21 0 3 0 10 0 4 0 7 0 5 0 11 0 6 0 10 0 7 0 10 0 8 0 10 0 9 0 10 0 10 0 33 0 23 0 37 0 25 0 10 0 45] 
#[1 0 10 0 1 0 10 0 2 0 10 0 4 0 10 0 5 0 10 0 6 0 10 0 7 0 10 0 8 0 10 0 9 0 10 0 10 0 41 0 23 0 10 0 45] 
#[0 0 14 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[0 0 18 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[1 0 10 0 1 0 10 0 2 0 45 0 4 0 7 0 5 0 11 0 6 0 10 0 7 0 10 0 8 0 10 0 9 0 10 0 10 0 49 0 23 0 37 0 25 0 10 0 45] 
#[0 0 22 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[1 0 10 0 1 0 10 0 2 0 53 0 4 0 7 0 5 0 11 0 6 0 10 0 7 0 10 0 8 0 10 0 9 0 10 0 10 0 57 0 23 0 37 0 25 0 10 0 45] 
#[1 0 10 0 1 0 10 0 2 0 10 0 5 0 10 0 6 0 10 0 7 0 10 0 8 0 10 0 9 0 10 0 10 0 61 0 23 0 10 0 45] 
#[1 0 26 0 1 0 26 0 2 0 15 0 5 0 19 0 6 0 26 0 7 0 26 0 8 0 26 0 9 0 26 0 10 0 65 0 24 0 37 0 25 0 26 0 45] 
#[1 0 10 0 1 0 10 0 2 0 10 0 5 0 10 0 6 0 10 0 7 0 10 0 8 0 10 0 9 0 10 0 10 0 69 0 23 0 10 0 45] 
#[1 0 26 0 1 0 26 0 2 0 15 0 5 0 19 0 6 0 26 0 7 0 26 0 8 0 26 0 9 0 26 0 10 0 73 0 24 0 37 0 25 0 26 0 45] 
#[1 0 26 0 1 0 26 0 2 0 15 0 5 0 19 0 6 0 26 0 7 0 26 0 8 0 26 0 9 0 26 0 10 0 77 0 24 0 37 0 25 0 26 0 45] 
#[1 0 30 0 1 0 30 0 2 0 30 0 5 0 30 0 6 0 30 0 7 0 30 0 8 0 30 0 9 0 30 0 10 0 81 0 26 0 85 0 27 0 34 0 45] 
#[1 0 26 0 1 0 26 0 2 0 15 0 5 0 19 0 6 0 26 0 7 0 26 0 8 0 26 0 9 0 26 0 10 0 89 0 24 0 37 0 25 0 26 0 45] 
#[1 0 30 0 1 0 30 0 2 0 30 0 5 0 30 0 6 0 30 0 7 0 30 0 8 0 30 0 9 0 30 0 10 0 81 0 26 0 85 0 27 0 38 0 45] 
#[1 0 30 0 1 0 30 0 2 0 30 0 5 0 30 0 6 0 30 0 7 0 30 0 8 0 30 0 9 0 30 0 10 0 81 0 26 0 85 0 27 0 42 0 45] 
#[0 0 46 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[1 0 129 0 1 0 129 0 2 0 117 0 5 0 125 0 6 0 50 0 7 0 109 0 8 0 54 0 9 0 125 0 10 0 117 0 28 0 121 0 31 0 125 0 37 0 129 0 38 0 117 0 39 0 117 0 40 0 141 0 41 0 145 0 43] 
#[1 0 30 0 1 0 30 0 2 0 30 0 5 0 30 0 6 0 30 0 7 0 30 0 8 0 30 0 9 0 30 0 10 0 81 0 26 0 85 0 27 0 58 0 45] 
#[0 0 62 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[0 0 66 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[0 0 70 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[0 0 74 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[1 0 149 0 18 0 153 0 19] 
#[0 0 78 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[1 0 30 0 1 0 30 0 2 0 30 0 5 0 30 0 6 0 30 0 7 0 30 0 8 0 30 0 9 0 30 0 10 0 157 0 27 0 30 0 45] 
#[0 0 82 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[1 0 23 0 1 0 23 0 2 0 23 0 5 0 23 0 6 0 23 0 7 0 23 0 8 0 23 0 9 0 23 0 10 0 86 0 45] 
#[0 0 94 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[0 0 98 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[0 0 102 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[0 0 161 0 9] 
#[0 0 165 0 7] 
#[0 0 106 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[0 0 110 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[1 0 27 0 1 0 31 0 2 0 114 0 5 0 35 0 6 0 114 0 7 0 114 0 8 0 114 0 9 0 39 0 10 0 169 0 37 0 129 0 38 0 114 0 45] 
#[1 0 173 0 14 0 177 0 15] 
#[1 0 6 0 16 0 6 0 17 0 181 0 42] 
#[0 0 90 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[1 0 185 0 6 0 6 0 11 0 189 0 12 0 193 0 32 0 197 0 42] 
#[1 0 201 0 6 0 6 0 11 0 205 0 12 0 209 0 32 0 213 0 42] 
#[1 0 217 0 16 0 221 0 17] 
#[1 0 6 0 11 0 225 0 12 0 229 0 14 0 233 0 35 0 237 0 42] 
#[1 0 6 0 11 0 241 0 42] 
#[1 0 245 0 6 0 6 0 11 0 249 0 12 0 253 0 42] 
#[0 1 1 0 11] 
#[1 0 6 0 11 1 5 0 12 0 229 0 14 0 233 0 35 1 9 0 42] 
#[1 0 6 0 11 1 13 0 42] 
#[1 1 17 0 6 0 6 0 11 1 21 0 12 1 25 0 42] 
#[0 1 29 0 11] 
#[0 0 118 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[0 0 122 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[1 0 6 0 11 1 33 0 42] 
#[1 0 43 0 6 0 126 0 11 0 126 0 12 0 130 0 13 0 126 0 14 1 41 0 44] 
#[1 0 134 0 6 0 134 0 11 0 134 0 12 0 134 0 14 1 45 0 34] 
#[0 1 49 0 11] 
#[0 1 53 0 11] 
#[1 0 6 0 11 1 57 0 12 1 61 0 42] 
#[1 0 6 0 11 1 65 0 42] 
#[0 1 69 0 11] 
#[1 0 138 0 1 0 138 0 2 0 138 0 5 0 138 0 6 0 138 0 7 0 138 0 8 0 138 0 9 0 138 0 10 1 73 0 30] 
#[1 0 6 0 11 1 77 0 42] 
#[0 1 81 0 11] 
#[0 1 85 0 11] 
#[1 0 6 0 11 1 89 0 12 1 93 0 42] 
#[1 0 6 0 11 1 97 0 42] 
#[0 1 101 0 11] 
#[0 0 142 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[0 1 105 0 11] 
#[1 0 130 0 13 1 109 0 44] 
#[0 1 113 0 13] 
#[1 0 47 0 6 0 146 0 11 0 146 0 12 0 229 0 14 1 121 0 33 1 121 0 35] 
#[1 0 138 0 1 0 138 0 2 0 138 0 5 0 138 0 6 0 138 0 7 0 138 0 8 0 138 0 9 0 138 0 10 1 129 0 30] 
#[0 0 150 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[1 0 6 0 11 1 133 0 42] 
#[0 1 137 0 11] 
#[0 1 141 0 11] 
#[1 0 138 0 1 0 138 0 2 0 138 0 5 0 138 0 6 0 138 0 7 0 138 0 8 0 138 0 9 0 138 0 10 1 145 0 30] 
#[1 0 30 0 1 0 30 0 2 0 30 0 5 0 30 0 6 0 30 0 7 0 30 0 8 0 51 0 9 0 30 0 10 1 153 0 26 0 85 0 27 1 153 0 29 1 157 0 41] 
#[0 1 161 0 11] 
#[0 0 154 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[0 0 158 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[1 0 6 0 11 1 165 0 42] 
#[0 1 169 0 11] 
#[0 1 173 0 11] 
#[0 0 162 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[0 0 166 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[0 1 177 0 13] 
#[1 1 181 0 6 0 54 0 20 1 185 0 41] 
#[1 0 229 0 14 1 189 0 35] 
#[0 0 170 0 6 0 11 0 12 0 14] 
#[0 0 174 0 6 0 11 0 12 0 14] 
#[1 0 30 0 1 0 30 0 2 0 30 0 5 0 30 0 6 0 30 0 7 0 30 0 8 0 51 0 9 0 30 0 10 1 153 0 26 0 85 0 27 1 153 0 29 1 193 0 41] 
#[0 1 197 0 11] 
#[1 0 138 0 1 0 138 0 2 0 138 0 5 0 138 0 6 0 138 0 7 0 138 0 8 0 138 0 9 0 138 0 10 1 201 0 30] 
#[0 0 178 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[1 0 30 0 1 0 30 0 2 0 30 0 5 0 30 0 6 0 30 0 7 0 30 0 8 0 51 0 9 0 30 0 10 1 153 0 26 0 85 0 27 1 153 0 29 1 205 0 41] 
#[0 0 182 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10] 
#[0 0 186 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10] 
#[0 1 209 0 9] 
#[0 0 190 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[0 1 213 0 11] 
#[0 0 194 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[0 0 198 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[1 1 217 0 6 0 54 0 20 1 221 0 41] 
#[1 0 54 0 20 1 225 0 41] 
#[0 1 229 0 20] 
#[0 0 202 0 6 0 11 0 12 0 14] 
#[0 1 233 0 9] 
#[0 0 206 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[1 0 30 0 1 0 30 0 2 0 30 0 5 0 30 0 6 0 30 0 7 0 30 0 8 0 51 0 9 0 30 0 10 1 153 0 26 0 85 0 27 1 153 0 29 1 237 0 41] 
#[0 1 241 0 9] 
#[0 1 245 0 12] 
#[0 0 210 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[1 0 54 0 20 1 249 0 41] 
#[0 1 253 0 20] 
#[0 2 1 0 20] 
#[0 0 214 0 6 0 11 0 12 0 14] 
#[0 2 5 0 12] 
#[0 2 9 0 9] 
#[0 2 13 0 12] 
#[0 2 17 0 14] 
#[0 2 21 0 20] 
#[0 0 218 0 6 0 11 0 12 0 14] 
#[0 0 222 0 6 0 11 0 12 0 14] 
#[0 2 25 0 14] 
#[0 2 29 0 12] 
#[0 2 33 0 14] 
#[1 2 37 0 6 0 6 0 11 2 41 0 42] 
#[0 0 226 0 6 0 11 0 12 0 14] 
#[1 2 45 0 6 0 6 0 11 2 49 0 42] 
#[0 2 53 0 14] 
#[1 2 57 0 6 0 6 0 11 2 61 0 42] 
#[1 0 6 0 11 2 65 0 42] 
#[0 2 69 0 11] 
#[1 0 6 0 11 2 73 0 42] 
#[0 2 77 0 11] 
#[1 2 81 0 6 0 6 0 11 2 85 0 42] 
#[1 0 6 0 11 2 89 0 42] 
#[0 2 93 0 11] 
#[0 2 97 0 11] 
#[0 0 230 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[0 2 101 0 11] 
#[0 0 234 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[1 0 6 0 11 2 105 0 42] 
#[0 2 109 0 11] 
#[0 2 113 0 11] 
#[0 0 238 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[0 0 242 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[0 0 246 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[0 2 117 0 11] 
#[0 0 250 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[0 0 254 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45] 
#[0 1 2 0 1 0 2 0 5 0 6 0 7 0 8 0 9 0 10 0 45]
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
HTMLParser >> reduceActionForAttribute3: nodes [

	| result |
	result := HTMLAttributeNode new.
	result attributeName: (nodes at: 1).
	result attributeEqualSymbol: (nodes at: 3).
	result attributeValue: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForAttribute4: nodes [

	| result |
	result := HTMLAttributeNode new.
	result attributeName: (nodes at: 1).
	result attributeEqualSymbol: (nodes at: 4).
	result attributeValue: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForAttribute5: nodes [

	| result |
	result := HTMLAttributeNode new.
	result attributeName: (nodes at: 1).
	result attributeEqualSymbol: (nodes at: 4).
	result attributeValue: (nodes at: 7).
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
HTMLParser >> reduceActionForStartScript1: nodes [

	self scope: #script.
	^ #script
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForStartTag1: nodes [

	self scope: #tag.
	^ #tag
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForVoidElement1: nodes [

	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 2).
	result at: 2 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForVoidElement5: nodes [

	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 2).
	result at: 2 put: (nodes at: 3).
	result at: 3 put: (nodes at: 4).
	^ result
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
	result beginTagClose: (nodes at: 6).
	result addObjects: (nodes at: 7) to: result childrens.
	result endTagOpen: (nodes at: 9).
	result endTagOpenName: (nodes at: 11).
	result endTagClose: (nodes at: 14).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement12: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result _attributes: (nodes at: 4).
	result beginTagClose: (nodes at: 7).
	result addObjects: (nodes at: 8) to: result childrens.
	result endTagOpen: (nodes at: 10).
	result endTagOpenName: (nodes at: 12).
	result endTagClose: (nodes at: 14).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement13: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result _attributes: (nodes at: 4).
	result beginTagClose: (nodes at: 7).
	result addObjects: (nodes at: 8) to: result childrens.
	result endTagOpen: (nodes at: 10).
	result endTagOpenName: (nodes at: 12).
	result endTagClose: (nodes at: 15).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement1: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: ((nodes at: 1) at: 1).
	result tagOpenName: ((nodes at: 1) at: 2).
	result _attributes: ((nodes at: 1) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement2: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement3: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result beginTagClose: (nodes at: 5).
	result addObjects: (nodes at: 6) to: result childrens.
	result endTagOpen: (nodes at: 8).
	result endTagOpenName: (nodes at: 10).
	result endTagClose: (nodes at: 12).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement4: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result beginTagClose: (nodes at: 5).
	result addObjects: (nodes at: 6) to: result childrens.
	result endTagOpen: (nodes at: 8).
	result endTagOpenName: (nodes at: 10).
	result endTagClose: (nodes at: 13).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement6: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result beginTagClose: (nodes at: 6).
	result addObjects: (nodes at: 7) to: result childrens.
	result endTagOpen: (nodes at: 9).
	result endTagOpenName: (nodes at: 11).
	result endTagClose: (nodes at: 13).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement7: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result beginTagClose: (nodes at: 6).
	result addObjects: (nodes at: 7) to: result childrens.
	result endTagOpen: (nodes at: 9).
	result endTagOpenName: (nodes at: 11).
	result endTagClose: (nodes at: 14).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement8: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result _attributes: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
HTMLParser >> reduceActionForhtmlElement9: nodes [

	| result |
	result := HTMLElementNode new.
	result beginTagOpen: (nodes at: 2).
	result tagOpenName: (nodes at: 3).
	result _attributes: (nodes at: 4).
	result beginTagClose: (nodes at: 6).
	result addObjects: (nodes at: 7) to: result childrens.
	result endTagOpen: (nodes at: 9).
	result endTagOpenName: (nodes at: 11).
	result endTagClose: (nodes at: 13).
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
