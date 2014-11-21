Session.set("response", "?");
Session.set("questionID", 1);

$(document).ready(function() {
  $('form:first *:input[type!=hidden]:first').focus();
});

Template.response.helpers({
  response: function() {
    return Session.get("response");
  },
  questionID: function() {
    return Session.get("questionID");
  }
});

Template.responseList.helpers({
  responses: function() {
    return Responses.find({});
  }
});

Template.insertResponseForm.helpers({
  defaultQuestionID: function() {
    return Session.get("questionID");
  }
});

Template.insertResponseForm.events({
  'keydown input': function(e){
    console.log(String.fromCharCode(event.keyCode));
    Session.set("response", String.fromCharCode(event.keyCode));
  }
});

Template.advanceQuestion.events({
  'click button': function() {
    Session.set("questionID", Session.get("questionID") + 1);
    Session.set("response", "?");
    $('#insertResponseForm')[0].reset();
    $('form:first *:input[type!=hidden]:first').focus();
  }
});

Template.resetForm.events({
  'click button': function() {
    Session.set("response", "?");
    $('#insertResponseForm')[0].reset();
    $('form:first *:input[type!=hidden]:first').focus();
  }
});

Meteor.subscribe("responses");
