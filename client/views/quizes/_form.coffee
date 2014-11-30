AutoForm.hooks
  quizForm:
    after:
      insert: (error, result, template) ->
        if error
          FlashMessages.sendWarning(error.message)
        else
          Router.go("/quiz/#{result}")
          console.log result
          FlashMessages.sendSuccess("Created quiz.")
      update: (error, result, template) ->
        if error
          FlashMessages.sendWarning(error.message)
        else
          Router.go("/quiz/#{template.data.doc._id}")
          FlashMessages.sendSuccess("Saved.")
      remove: (error, result, template) ->
        if error
          FlashMessages.sendWarning(error.message)
        else
          Router.go("/")
          FlashMessages.sendSuccess("Removed quiz.")

Template.quiz_form.helpers
  method: ->
    if Session.get("selectedQuizId") then 'update' else 'insert'
  currentQuiz: ->
    Quizes.findOne({_id: @_id})
