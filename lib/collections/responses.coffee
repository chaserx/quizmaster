@Responses = new Mongo.Collection("responses")
@Responses.attachSchema new SimpleSchema
  playerID:
    type: String
    label: "Player:"
    max: 200
  questionID:
    type: String
    label: "Question:"
    max: 200

@Responses.allow
  insert: (userId, doc) ->
    userId && (doc.userId == userId)

  update: (userId, doc, fieldNames, modifier) ->
    userId && (doc.userId == userId)

  remove: (userId, doc, fieldNames, modifier) ->
    userId && (doc.userId == userId)
