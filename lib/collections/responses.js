Responses = new Mongo.Collection("responses");
Responses.attachSchema(new SimpleSchema({
  playerID: {
    type: String,
    label: "Player:",
    max: 200
  }
}));
