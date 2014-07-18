(function() {
  var RequestPages,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  window.RequestPages = RequestPages = (function() {
    function RequestPages(patientId, prescriptionId, paRequestId) {
      this.update = __bind(this.update, this);
      this._setupFormHandlers = __bind(this._setupFormHandlers, this);
      this._getSuccessCallback = __bind(this._getSuccessCallback, this);
      this.patientId = patientId;
      this.prescriptionId = prescriptionId;
      this.paRequestId = paRequestId;
      $.get(this._resourceUrl(), this._getSuccessCallback);
    }

    RequestPages.prototype.selector = '.request-pages';

    RequestPages.prototype._resourceUrl = function() {
      return "/patients/" + this.patientId + "/prescriptions/" + this.prescriptionId + "/pa_requests/" + this.paRequestId + "/request_pages.json";
    };

    RequestPages.prototype._getSuccessCallback = function(data) {
      this.form = new RequestPages.Form(data['request_page']);
      $(this.selector).html(this.form.render());
      return this._setupFormHandlers();
    };

    RequestPages.prototype._setupFormHandlers = function() {
      var _this = this;
      return $("" + this.selector + " form").submit(function(event) {
        event.preventDefault();
        return _this.update();
      });
    };

    RequestPages.prototype.update = function() {
      return alert('Here is where we would send the form back to the demo app');
    };

    return RequestPages;

  })();

}).call(this);

(function() {
  var Form;

  window.RequestPages.Form = Form = (function() {
    function Form(requestPages) {
      var _this = this;
      this.currentValues = requestPages['data']['pa_request'];
      this.questionSets = [];
      requestPages['forms']['pa_request']['question_sets'].forEach(function(questionSet) {
        return _this.questionSets.push(new RequestPages.QuestionSet(questionSet, _this.currentValues));
      });
    }

    Form.prototype.find_question_by_id = function(questionId) {
      var _this = this;
      this.foundQuestion = {};
      this.questionSets.forEach(function(questionSet) {
        return questionSet.questions.forEach(function(question) {
          if (question.questionId() === questionId) {
            return _this.foundQuestion = question;
          }
        });
      });
      return this.foundQuestion;
    };

    Form.prototype.template = 'form';

    Form.prototype.render = function() {
      return JST[this.template]({
        form: this
      });
    };

    return Form;

  })();

}).call(this);

(function() {
  var QuestionSet;

  window.RequestPages.QuestionSet = QuestionSet = (function() {
    function QuestionSet(questionSetJson, currentValues) {
      var _this = this;
      this.title = questionSetJson['title'];
      this.questions = [];
      questionSetJson['questions'].forEach(function(questionJson) {
        var currentValue;
        currentValue = currentValues[questionJson['question_id']];
        return _this.questions.push(RequestPages.Question.create(questionJson, currentValue));
      });
    }

    QuestionSet.prototype.template = 'question-set';

    QuestionSet.prototype.render = function() {
      return JST[this.template]({
        questionSet: this
      });
    };

    return QuestionSet;

  })();

}).call(this);

(function() {
  var Question;

  window.RequestPages.Question = Question = (function() {
    Question.create = function(questionJson, currentValue) {
      var Type;
      if (currentValue == null) {
        currentValue = '';
      }
      Type = (function() {
        switch (questionJson['question_type']) {
          case 'FREE_TEXT':
            return RequestPages.Question.FreeText;
          case 'CHOICE':
            return RequestPages.Question.Choice;
          default:
            return RequestPages.Question;
        }
      })();
      return new Type(questionJson, currentValue);
    };

    function Question(questionJson, currentValue) {
      if (currentValue == null) {
        currentValue = '';
      }
      this.dna = questionJson;
      this.value = currentValue;
    }

    Question.prototype.template = 'unknown-question';

    Question.prototype.questionType = function() {
      return this.dna.question_type;
    };

    Question.prototype.questionText = function() {
      return this.dna.question_text;
    };

    Question.prototype.questionId = function() {
      return this.dna.question_id;
    };

    Question.prototype.defaultNextQuestionId = function() {
      return this.dna.default_next_question_id;
    };

    Question.prototype.helpText = function() {
      return this.dna.help_text;
    };

    Question.prototype.isRequired = function() {
      if (this.dna.flag === 'REQUIRED') {
        return 'required';
      } else {
        return '';
      }
    };

    Question.prototype.render = function() {
      return JST[this.template]({
        question: this
      });
    };

    return Question;

  })();

}).call(this);

(function() {
  var Choice, _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.RequestPages.Question.Choice = Choice = (function(_super) {
    __extends(Choice, _super);

    function Choice() {
      _ref = Choice.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    Choice.prototype.template = 'choice-question';

    Choice.prototype.selectMultiple = function() {
      if (this.dna.select_multiple) {
        return 'multiple';
      } else {
        return '';
      }
    };

    Choice.prototype.choices = function() {
      return this.dna.choices;
    };

    Choice.prototype.isSelected = function(choice) {
      if (choice.choice_id === this.value) {
        return 'selected';
      } else {
        return '';
      }
    };

    return Choice;

  })(RequestPages.Question);

}).call(this);

(function() {
  var FreeText, _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.RequestPages.Question.FreeText = FreeText = (function(_super) {
    __extends(FreeText, _super);

    function FreeText() {
      _ref = FreeText.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    FreeText.prototype.template = 'free-text-question';

    FreeText.prototype.placeholder = function() {
      return this.dna.placeholder;
    };

    return FreeText;

  })(RequestPages.Question);

}).call(this);
