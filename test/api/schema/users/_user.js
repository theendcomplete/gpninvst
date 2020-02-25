exports.user = {
  type: "object",
  required: [
    "id",
    "login",
    "email",
    "role_code",
    "status_code",
    "created_at",
    "updated_at",
    "archived_at",
    "first_name",
    "last_name"
  ],
  properties: {
    id: {
      type: "integer",
      examples: [7]
    },
    login: {
      type: "string",
      examples: ["amtd"],
      pattern: "^(.*)$"
    },
    email: {
      type: "string",
      examples: ["am@trinitydigital.ru"],
      pattern: "^(.*)$"
    },
    role_code: {
      type: "string",
      enum: ["admin", "client"],
      examples: ["admin"],
      pattern: "^(.*)$"
    },
    status_code: {
      type: "string",
      enum: ["registered", "active", "blocked"],
      examples: ["active"],
      pattern: "^(.*)$"
    },
    created_at: {
      type: "string",
      pattern: "^(.*)$",
      examples: ["2019-06-14T10:30:12+03:00"]
    },
    updated_at: {
      type: "string",
      pattern: "^(.*)$",
      examples: ["2019-06-27T14:14:26+03:00"]
    },
    archived_at: {
      type: ["string", "null"],
      pattern: "^(.*)$",
      examples: [null]
    },
    first_name: {
      type: ["string", "null"],
      pattern: "^(.*)$",
      examples: ["TestFirstName"]
    },
    last_name: {
      type: ["string", "null"],
      pattern: "^(.*)$",
      examples: ["TestLastName"]
    }
  }
};
