/* cmm-request-pages - 0.0.1
 * A javascript app for rendering CoverMyMeds API Prior Authorization request pages.
 * 
 */
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
 question.choices().forEach( function(choice){ ;
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
window.RequestPages = function(patientId, prescriptionId, paRequestId) {

  this.patientId      = patientId;
  this.prescriptionId = prescriptionId;
  this.paRequestId    = paRequestId;

  this.selector       = '.request-pages';

  this._resourceUrl = _.bind(function() {
    return '/patients/'      + this.patientId      +
           '/prescriptions/' + this.prescriptionId +
           '/pa_requests/'   + this.paRequestId    +
           '/request_pages.json';

  }, this);

  this._getSuccessCallback = _.bind(function(data) {
    this.form = new RequestPages.Form(data['request_page']);
    $(this.selector).html(this.form.render());
    return this._setupFormHandlers();

  }, this);

  this._setupFormHandlers = _.bind(function(){}, this);

  $.get(this._resourceUrl(), this._getSuccessCallback);

};

window.RequestPages.Form = function(requestPages) {
  this.currentValues = requestPages['data']['pa_request'];

  this.template = 'form';

  this.questionSets = [];
  requestPages['forms']['pa_request']['question_sets'].forEach(
    _.bind(function(questionSet) {
      this.questionSets.push(new RequestPages.QuestionSet(questionSet, this.currentValues));
    }, this));

  this.find_question_by_id = _.bind(function(questionId) {
    var foundQuestion = {};
    this.questionSets.forEach(_.bind(function(questionSet) {
      questionSet.questions.forEach(_.bind(function(question) {
        if (question.questionId() === questionId) {
          return foundQuestion = question;
        }
      }, this));
    }, this));
    return foundQuestion;
  }, this);

  this.render = _.bind(function() {
    return JST[this.template]({ form: this });
  }, this);

};

window.RequestPages.QuestionSet = function(questionSetJson, currentValues) {
  this.title = questionSetJson['title'];

  this.template = 'question-set';

  this.questions = [];
  questionSetJson['questions'].forEach(_.bind(function(questionJson) {
    var currentValue;
    currentValue = currentValues[questionJson['question_id']];
    return this.questions.push(RequestPages.Question.create(questionJson, currentValue));
  }, this));

  this.render = _.bind(function() {
    return JST[this.template]({ questionSet: this });
  }, this);

};

window.RequestPages.Question = function(questionJson, currentValue) {
  if (currentValue == null) {
    currentValue = '';
  }
  this.dna = questionJson;
  this.value = currentValue;

  this.template = 'unknown-question';

  this.questionType = _.bind(function() { return this.dna.question_type; }, this);
  this.questionText = _.bind(function() { return this.dna.question_text; }, this);
  this.questionId   = _.bind(function() { return this.dna.question_id;   }, this);
  this.helpText     = _.bind(function() { return this.dna.help_text;     }, this);
  this.defaultNextQuestionId =
    _.bind(function() { return this.dna.default_next_question_id; }, this);


  this.isRequired = _.bind(function() {
    if (this.dna.flag === 'REQUIRED') {
      return 'required';
    } else {
      return '';
    }
  }, this);

  this.render = _.bind(function() {
    return JST[this.template]({
      question: this
    });
  }, this);

};

window.RequestPages.Question.create = function(questionJson, currentValue) {
  if (currentValue == null) {
    currentValue = '';
  }

  var questionFactory = (function() {
    switch (questionJson['question_type']) {
      case 'FREE_TEXT':
        return RequestPages.Question.FreeText;
      case 'CHOICE':
        return RequestPages.Question.Choice;
      default:
        return function(question) { return question; };
    }
  })();

  return questionFactory(new RequestPages.Question(questionJson, currentValue));

};

window.RequestPages.Question.init = function() {};

window.RequestPages.Question.Choice = function(question) {

  question.template = 'choice-question';

  question.selectMultiple = _.bind(function() {
    if (this.dna.select_multiple) {
      return 'multiple';
    } else {
      return '';
    }
  }, question);

  question.choices = _.bind(function() {
    return this.dna.choices;
  }, question);

  question.isSelected = _.bind(function(choice) {
    if (choice.choice_id === this.value) {
      return 'selected';
    } else {
      return '';
    }
  }, question);

  return question;
};

window.RequestPages.Question.FreeText = function(question) {

  question.template = 'free-text-question';

  question.placeholder = _.bind(function() { return this.dna.placeholder; }, question);

  return question;
};
