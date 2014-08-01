/* cmm-request-pages - 0.0.1
 * A javascript app for rendering CoverMyMeds API Prior Authorization request pages.
 * 
 */
this["JST"] = this["JST"] || {};

this["JST"]["action-button"] = function(obj) {
obj || (obj = {});
var __t, __p = '', __e = _.escape;
with (obj) {
__p += '<button class=\'' +
((__t = ( action.slug() )) == null ? '' : __t) +
' btn\'>' +
((__t = ( action.title )) == null ? '' : __t) +
'</button>\n';

}
return __p
};

this["JST"]["action-link"] = function(obj) {
obj || (obj = {});
var __t, __p = '', __e = _.escape;
with (obj) {
__p += '<a class=\'' +
((__t = ( action.slug )) == null ? '' : __t) +
' btn\' href=\'' +
((__t = ( action.href )) == null ? '' : __t) +
'\'>' +
((__t = ( action.title )) == null ? '' : __t) +
'</a>\n';

}
return __p
};

this["JST"]["checkbox-question"] = function(obj) {
obj || (obj = {});
var __t, __p = '', __e = _.escape;
with (obj) {
__p += '<div class="question checkbox ' +
((__t = ( question.isRequired() )) == null ? '' : __t) +
'">\n  <label for="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'">\n\n    <input type="checkbox"\n           id="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'"\n           name="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'"\n           value="' +
((__t = ( question.value )) == null ? '' : __t) +
'"\n           placeholder="' +
((__t = ( question.placeholder() )) == null ? '' : __t) +
'"\n           ' +
((__t = ( question.isRequired() )) == null ? '' : __t) +
'\n    />\n    ' +
((__t = ( question.questionText() )) == null ? '' : __t) +
'\n\n  </label>\n</div>\n\n';

}
return __p
};

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

this["JST"]["date-question"] = function(obj) {
obj || (obj = {});
var __t, __p = '', __e = _.escape;
with (obj) {
__p += '<div class="question date ' +
((__t = ( question.isRequired() )) == null ? '' : __t) +
'">\n  <label for="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'">\n    ' +
((__t = ( question.questionText() )) == null ? '' : __t) +
'\n  </label>\n\n  <input type="date"\n         id="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'"\n         name="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'"\n         value="' +
((__t = ( question.value )) == null ? '' : __t) +
'"\n         ' +
((__t = ( question.isRequired() )) == null ? '' : __t) +
'\n  />\n</div>\n';

}
return __p
};

this["JST"]["file-question"] = function(obj) {
obj || (obj = {});
var __t, __p = '', __e = _.escape;
with (obj) {
__p += '<div class="question file ' +
((__t = ( question.isRequired() )) == null ? '' : __t) +
'">\n  <label for="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'">\n    ' +
((__t = ( question.questionText() )) == null ? '' : __t) +
'\n  </label>\n\n  <input type="file"\n         id="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'"\n         name="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'"\n         value="' +
((__t = ( question.value )) == null ? '' : __t) +
'"\n         ' +
((__t = ( question.isRequired() )) == null ? '' : __t) +
'\n  />\n</div>\n\n';

}
return __p
};

this["JST"]["form"] = function(obj) {
obj || (obj = {});
var __t, __p = '', __e = _.escape, __j = Array.prototype.join;
function print() { __p += __j.call(arguments, '') }
with (obj) {
__p += '<form class=\'request-pages-form\' method="POST">\n  ';
 form.questionSets.forEach( function(questionSet) { ;
__p += '\n    ' +
((__t = ( questionSet.render() )) == null ? '' : __t) +
'\n  ';
 }); ;
__p += '\n\n  <fieldset class=\'controls\'>\n    <input type=\'hidden\' class=\'form_action\' name=\'form_action\' value=\'\' />\n\n    ';
 form.actions.forEach( function(action) { ;
__p += '\n      ' +
((__t = ( action.render() )) == null ? '' : __t) +
'\n    ';
 }); ;
__p += '\n  </fieldset>\n</form>\n';

}
return __p
};

this["JST"]["free-area-question"] = function(obj) {
obj || (obj = {});
var __t, __p = '', __e = _.escape;
with (obj) {
__p += '<div class="question free-area ' +
((__t = ( question.isRequired() )) == null ? '' : __t) +
'">\n  <label for="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'">\n    ' +
((__t = ( question.questionText() )) == null ? '' : __t) +
'\n  </label>\n\n  <textarea\n    id="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'"\n    name="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'"\n    placeholder="' +
((__t = ( question.placeholder() )) == null ? '' : __t) +
'"\n    ' +
((__t = ( question.isRequired() )) == null ? '' : __t) +
' >\n\n    ' +
((__t = ( question.value )) == null ? '' : __t) +
'\n\n  </textarea>\n</div>\n';

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
((__t = ( question.placeholder() )) == null ? '' : __t) +
'"\n         ' +
((__t = ( question.isRequired() )) == null ? '' : __t) +
'\n  />\n</div>\n';

}
return __p
};

this["JST"]["hidden-question"] = function(obj) {
obj || (obj = {});
var __t, __p = '', __e = _.escape;
with (obj) {
__p += '<input type="hidden"\n  id="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'"\n  name="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'"\n  value="' +
((__t = ( question.value )) == null ? '' : __t) +
'"\n/>\n';

}
return __p
};

this["JST"]["numeric-question"] = function(obj) {
obj || (obj = {});
var __t, __p = '', __e = _.escape;
with (obj) {
__p += '<div class="question numeric ' +
((__t = ( question.isRequired() )) == null ? '' : __t) +
'">\n  <label for="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'">\n    ' +
((__t = ( question.questionText() )) == null ? '' : __t) +
'\n  </label>\n\n  <input type="number"\n         id="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'"\n         name="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'"\n         value="' +
((__t = ( question.value )) == null ? '' : __t) +
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

this["JST"]["statement-question"] = function(obj) {
obj || (obj = {});
var __t, __p = '', __e = _.escape;
with (obj) {
__p += '<div class="question statement">\n  <label for="' +
((__t = ( question.questionId() )) == null ? '' : __t) +
'">\n    ' +
((__t = ( question.questionText() )) == null ? '' : __t) +
'\n  </label>\n\n  <p>\n    ' +
((__t = ( question.content_html() )) == null ? '' : __t) +
'\n  </p>\n</div>\n';

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

  }, this);

  $.get(this._resourceUrl(), this._getSuccessCallback);

};

window.RequestPages.Form = function(requestPages) {
  this.currentValues = requestPages['data']['pa_request'];

  this.template = 'form';

  this.questionSets = [];
  requestPages['forms']['pa_request']['question_sets'].forEach(
    _.bind(function(questionSet) {
      this.questionSets.push(
        new RequestPages.QuestionSet(questionSet, this.currentValues)
      );

    }, this));

  this.actions = [];
  requestPages['actions'].forEach(_.bind(function(action) {
    this.actions.push( new RequestPages.Form.Action(action) );

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

window.RequestPages.Form.Action = function(actionJson) {
  this.ref    = actionJson[ 'ref'    ];
  this.title  = actionJson[ 'title'  ];
  this.href   = actionJson[ 'href'   ];
  this.method = actionJson[ 'method' ];

  this.template = 'action-button';

  this.slug = _.bind(function() {
    return this.title.toLowerCase().replace(/[\s\/]+/g, '_');
  }, this);

  this._addHandler = _.bind(function() {
    var btnSelector = 'button.' + this.slug();
    $('.request-pages').on('click', btnSelector, _.bind(function(e) {
      $('input.form_action').val(this.title);
    }, this));
  }, this);

  this.render = _.bind(function() {
    this._addHandler();
    return JST[this.template]({ action: this });
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
      case 'DATE':
        return RequestPages.Question.Date;
      case 'NUMERIC':
        return RequestPages.Question.Numeric;
      case 'STATEMENT':
        return RequestPages.Question.Statement;
      case 'HIDDEN':
        return RequestPages.Question.Hidden;
      case 'FILE':
        return RequestPages.Question.File;
      case 'CHECKBOX':
        return RequestPages.Question.Checkbox;
      case 'FREE_AREA':
        return RequestPages.Question.FreeArea;
      default:
        return function(question) { return question; };
    }
  })();

  return questionFactory(new RequestPages.Question(questionJson, currentValue));

};

window.RequestPages.Question.init = function() {};

window.RequestPages.Question.Checkbox = function(question) {

  question.template = 'checkbox-question';

  return question;
};

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

window.RequestPages.Question.Date = function(question) {

  question.template = 'date-question';

  return question;
};

window.RequestPages.Question.File = function(question) {

  question.template = 'file-question';

  return question;
};

window.RequestPages.Question.FreeArea = function(question) {

  question.template = 'free-area-question';

  question.placeholder = _.bind(function() {
    return this.dna.placeholder;
  }, question);

  return question;
};

window.RequestPages.Question.FreeText = function(question) {

  question.template = 'free-text-question';

  question.placeholder = _.bind(function() {
    return this.dna.placeholder;
  }, question);

  return question;
};

window.RequestPages.Question.Hidden = function(question) {

  question.template = 'hidden-question';

  return question;
};

window.RequestPages.Question.Numeric = function(question) {

  question.template = 'numeric-question';

  return question;
};

window.RequestPages.Question.Statement = function(question) {

  question.template = 'statement-question';

  question.content_plain = _.bind(function() {
    return this.dna.content_plain;
  }, question);

  question.content_html = _.bind(function() {
    return this.dna.content_html;
  }, question);

  return question;
};
