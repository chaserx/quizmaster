Template.responses.helpers({
  response: function() {
    return Session.get("response");
  }
});
Template.insertResponseForm.events({
  'keydown input' : function(e){
    console.log(String.fromCharCode(event.keyCode));
    Session.set("response", String.fromCharCode(event.keyCode));
  }
});
