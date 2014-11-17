Meteor.publish 'responses', (options={}) ->
  Responses.find options
