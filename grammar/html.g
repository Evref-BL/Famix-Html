%glr;
%prefix HTML ;
%suffix Node ;
%root Program ;

/*parser grammar HTMLParser;*/

htmlDocument
    : scriptletOrSeaWs* <XML>? scriptletOrSeaWs* <DTD>? scriptletOrSeaWs* htmlElements*
    ;

scriptletOrSeaWs
    : <SCRIPTLET>
    | <SEA_WS>
    ;

htmlElements
    : htmlMisc* htmlElement htmlMisc*
    ;

htmlElement
    : <TAG_OPEN> <TAG_NAME> htmlAttribute*
      (<TAG_CLOSE> (htmlContent <TAG_OPEN> <TAG_SLASH> <TAG_NAME> <TAG_CLOSE>)? | <TAG_SLASH_CLOSE>)
    | <SCRIPTLET>
    | script
    | style
    ;

htmlContent
    : htmlChardata? ((htmlElement | <CDATA> | htmlComment) htmlChardata?)*
    ;

htmlAttribute
    : <TAG_NAME> (<TAG_EQUALS> <ATTVALUE_VALUE>)?
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
    : \<\!\-\- .*/* TODO: ? */ \-\-\>
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
    : \< /* TODO: -> pushMode(TAG)*/
    ;

<HTML_TEXT>
    : [^\<]+
    ;


/* tag declarations */



TAG <TAG_CLOSE>
    : \> /* TODO: -> popMode*/
    ;

TAG <TAG_SLASH_CLOSE>
    : \/\> /* TODO: -> popMode*/
    ;

TAG <TAG_SLASH>
    : \/
    ;


/* lexing mode for attribute values */

TAG <TAG_EQUALS>
    : \= /* TODO: -> pushMode(ATTVALUE)*/
    ;

TAG <TAG_NAME>
    : <TAG_NameStartChar> <TAG_NameChar>*
    ;

TAG <TAG_WHITESPACE>
    : [\ \t\r\n] /* TODO: -> channel(HIDDEN)*/
    ;

TAG <HEXDIGIT>
    : [a-fA-F0-9]
    ;

TAG <DIGIT>
    : [0-9]
    ;

TAG <TAG_NameChar>
    : <TAG_NameStartChar>
    | \-
    | _
    | \.
    | <DIGIT>
    | \x00B7
    | [\x0300-\x036F]
    | [\x203F-\x2040]
    ;

TAG <TAG_NameStartChar>
    : [\:a-zA-Z]
    | [\x2070-\x218F]
    | [\x2C00-\x2FEF]
    | [\x3001-\xD7FF]
    | [\xF900-\xFDCF]
    | [\xFDF0-\xFFFD]
    ;


/* <scripts> */



SCRIPT <SCRIPT_BODY>
    : .*/* TODO: ? */ \<\/script\> /* TODO: -> popMode*/
    ;

SCRIPT <SCRIPT_SHORT_BODY>
    : .*/* TODO: ? */ \<\/\> /* TODO: -> popMode*/
    ;


/* <styles> */



STYLE <STYLE_BODY>
    : .*/* TODO: ? */ \<\/style\> /* TODO: -> popMode*/
    ;

STYLE <STYLE_SHORT_BODY>
    : .*/* TODO: ? */ \<\/\> /* TODO: -> popMode*/
    ;


/* attribute values */



/* an attribute value may have spaces b/t the '=' and the value*/

ATTVALUE <ATTVALUE_VALUE>
    : \ * <ATTRIBUTE> /* TODO: -> popMode*/
    ;

ATTVALUE <ATTRIBUTE>
    : <DOUBLE_QUOTE_STRING>
    | <SINGLE_QUOTE_STRING>
    | <ATTCHARS>
    | <HEXCHARS>
    | <DECCHARS>
    ;

ATTVALUE <ATTCHARS>
    : <ATTCHAR>+ \ ?
    ;

ATTVALUE <ATTCHAR>
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

ATTVALUE <HEXCHARS>
    : \# [0-9a-fA-F]+
    ;

ATTVALUE <DECCHARS>
    : [0-9]+ \%?
    ;

ATTVALUE <DOUBLE_QUOTE_STRING>
    : \" [^\<\"]* \"
    ;

ATTVALUE <SINGLE_QUOTE_STRING>
    : \' [^\<\']* \'
    ;



