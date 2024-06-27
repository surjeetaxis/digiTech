module.exports = [
  {
    context: ["/http://localhost:8080/api/**"],
    target: "http://localhost:8080",
    secure: false,
  },
];
