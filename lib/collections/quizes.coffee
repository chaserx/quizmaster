@Quizes = new Mongo.Collection("quizes")

quizes_schema = new SimpleSchema
  userId:
    type: String
    denyUpdate: true
    autoValue: ->
      if @isInsert
        Meteor.userId()

  createdAt:
    type: Date
    denyUpdate: true
    autoValue: ->
      if @isInsert
        new Date()

  updatedAt:
    type: Date
    denyInsert: true
    optional: true
    autoValue: ->
      if @isUpdate
        new Date()

  title:
    type: String
    max: 100
    optional: true

  date:
    type: Date
    optional: true

@Quizes.attachSchema(quizes_schema, {transform: true})

@Quizes.allow
  insert: (userId, doc) ->
    userId && (doc.userId == userId)

  update: (userId, doc, fieldNames, modifier) ->
    userId && (doc.userId == userId)

  remove: (userId, doc, fieldNames, modifier) ->
    userId && (doc.userId == userId)
