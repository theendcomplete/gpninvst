exports.response = {
  type: "object",
  required: [
    "login",
    "email",
    "role_code",
    "status_code",
    "first_name",
    "last_name"
  ],
  properties: require("../_user").user.properties
};
