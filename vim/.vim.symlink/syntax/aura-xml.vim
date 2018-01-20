" Language: aura-xml

syntax include @JS syntax/javascript.vim
unlet b:current_syntax
runtime! syntax/xml.vim

" TODO: build list of built-in tags with special highlighting
" higihlight visualforce tags as html tags
" syn match htmlTagName contained "\(aura\|ui\):[a-z]\+[A-Za-z]*"

" Fix syntax breakage when using '&{'in the code looking something like this:
" <apex:outputLink value="/path?param=1&{!mergeVar}">link</apex:outputLink>
syntax match AuraExpression contained "&{"

" Highlight expressions inside attribute values
" Example:
"   <basics1:xmeterBug value="0.0" native="{!v.native}"/><br/>

syn region xmlString contained start=+"+ end=+"+ contains=xmlEntity,@Spell,AuraExpression display
syn region xmlString contained start=+'+ end=+'+ contains=xmlEntity,@Spell,AuraExpression display

syntax region AuraExpression matchgroup=AuraExpressionBody start="{!" end="}" contains=@JS
syntax region AuraExpression matchgroup=AuraExpressionBody start="{#" end="}" contains=@JS
