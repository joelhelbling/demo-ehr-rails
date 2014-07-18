this["JST"] = this["JST"] || {};

this["JST"]["choice-question"] = function(obj) {
obj || (obj = {});
var __t, __p = '', __e = _.escape, __j = Array.prototype.join;
function print() { __p += __j.call(arguments, '') }
with (obj) {
__p += '<div class="question choice ' +
((__t = ( question.isRequired() )) == null ? '' : __t) +
'">\n  <label for="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'">\n    ' +
((__t = ( question.questionText() )) == null ? '' : __t) +
'\n  </label>\n\n  <select id="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'"\n          name="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'"\n          ' +
((__t = ( question.selectMultiple() )) == null ? '' : __t) +
' >\n    ';
 question.choices.forEach( function(choice){ ;
__p += '\n      <option value="' +
((__t = ( choice.choice_id )) == null ? '' : __t) +
'"\n              ' +
((__t = ( question.isSelected(choice) )) == null ? '' : __t) +
' >\n        ' +
((__t = ( choice.choice_text )) == null ? '' : __t) +
'\n      </option>\n    ';
 }); ;
__p += '\n  </select>\n\n</div>\n';

}
return __p
};

this["JST"]["form"] = function(obj) {
obj || (obj = {});
var __t, __p = '', __e = _.escape, __j = Array.prototype.join;
function print() { __p += __j.call(arguments, '') }
with (obj) {
__p += '<form class=\'request-pages-form\'>\n  ';
 form.questionSets.forEach( function(questionSet) { ;
__p += '\n    ' +
((__t = ( questionSet.render() )) == null ? '' : __t) +
'\n  ';
 }); ;
__p += '\n\n  <fieldset class=\'controls\'>\n    <button class=\'request-pages cancel btn\'>Cancel</button>\n    <button class=\'request-pages submit btn default\'>Save Changes</button>\n  </fieldset>\n</form>\n';

}
return __p
};

this["JST"]["free-text-question"] = function(obj) {
obj || (obj = {});
var __t, __p = '', __e = _.escape;
with (obj) {
__p += '<div class="question free-text ' +
((__t = ( question.isRequired() )) == null ? '' : __t) +
'">\n  <label for="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'">\n    ' +
((__t = ( question.questionText() )) == null ? '' : __t) +
'\n  </label>\n\n  <input type="text"\n         id="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'"\n         name="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'"\n         value="' +
((__t = ( question.value )) == null ? '' : __t) +
'"\n         placeholder="' +
((__t = ( question.helpText() )) == null ? '' : __t) +
'"\n         ' +
((__t = ( question.isRequired() )) == null ? '' : __t) +
'\n  />\n</div>\n';

}
return __p
};

this["JST"]["question-set"] = function(obj) {
obj || (obj = {});
var __t, __p = '', __e = _.escape, __j = Array.prototype.join;
function print() { __p += __j.call(arguments, '') }
with (obj) {
__p += '<fieldset class=\'question-set\'>\n  <legend>' +
((__t = ( questionSet.title )) == null ? '' : __t) +
'</legend>\n  ';
 questionSet.questions.forEach( function(question) { ;
__p += '\n    ' +
((__t = ( question.render() )) == null ? '' : __t) +
'\n  ';
 }); ;
__p += '\n</fieldset>\n';

}
return __p
};

this["JST"]["unknown-question"] = function(obj) {
obj || (obj = {});
var __t, __p = '', __e = _.escape;
with (obj) {
__p += '<div class="question">\n  Something went wrong (I don\'t know how to display a question of type "' +
((__t = ( question.questionType() )) == null ? '' : __t) +
'").\n</div>\n';

}
return __p
};