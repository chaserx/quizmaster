Meteor.publish 'quizes', (userId) ->
  Quizes.find({ userId: userId })

Meteor.publish 'responses', (options={}) ->
  Responses.find options
