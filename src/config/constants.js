const APP_NAME = "Campus Connect";
const API_PREFIX = "/api";
const SUPPORTED_ROLES = Object.freeze(["student", "faculty", "admin"]);
const EVENT_CATEGORIES = Object.freeze([
  "academic",
  "club",
  "cultural",
  "sports",
  "career"
]);

module.exports = {
  APP_NAME,
  API_PREFIX,
  SUPPORTED_ROLES,
  EVENT_CATEGORIES
};
