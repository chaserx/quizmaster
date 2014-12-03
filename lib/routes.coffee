# Router.route('/');

Router.configure
  layoutTemplate: 'layout'

Router.route "/quiz/new",
  name: 'quiz.new'
  template: 'quiz_new'
  onBeforeAction: ->
    if !Meteor.user()
      Router.go('/')
    else
      this.next()
      Session.set("selectedQuestionId", undefined)
  waitOn: ->
    Meteor.subscribe "quizes", Meteor.userId(), sort: {createdAt: -1}

Router.route "/quiz/:_id",
  name: 'quiz.show'
  template: 'quiz_show'
  onBeforeAction: ->
    if !Meteor.user()
      Router.go('/')
    else
      this.next()
  waitOn: ->
    Meteor.subscribe "quizes", Meteor.userId()
    # Meteor.subscribe "quizes"
  data: ->
    Quizes.findOne @params._id

Router.route "/quiz/:_id/edit",
  name: 'quiz.edit'
  template: 'quiz_edit'
  onBeforeAction: ->
    if !Meteor.user()
      Router.go('/')
    else
      this.next()
  waitOn: ->
    Meteor.subscribe "quizes", Meteor.userId()

    # Meteor.subscribe "quizes", Meteor.userId(), sort: {createdAt: -1}
    # Meteor.subscribe "quizes"
  data: ->
    Quizes.findOne @params._id

 #
 # Router.route "/quiz/:_quiz_id/question/:_question_id",
 #   name: 'question.show'
 #   template: 'question_show'
 #   onBeforeAction: ->
 #     if !Meteor.user()
 #       Router.go('/')
 #     else
 #       this.next()
 #       Session.set("selectedQuestionId", @params._id)
 #       console.log @params
 #   waitOn: ->
 #     Meteor.subscribe "quizes", Meteor.userId(), sort: {createdAt: -1}
 #     Meteor.subscribe "questions", Meteor.userId(), sort: {createdAt: -1}
 #   data: ->
 #     quiz: Questions.findOne @params._id
 #     id: @params._id
 #     selectedQuestionId: @params._id
