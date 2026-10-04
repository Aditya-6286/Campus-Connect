const http = require("node:http");

const PORT = process.env.PORT || 3000;

const server = http.createServer((req, res) => {
  res.setHeader("Content-Type", "application/json; charset=utf-8");

  if (req.url === "/api/health") {
    res.writeHead(200);
    res.end(JSON.stringify({
      status: "ok",
      service: "campus-connect",
      timestamp: new Date().toISOString()
    }));
    return;
  }

  res.writeHead(404);
  res.end(JSON.stringify({
    error: "Not Found",
    message: "The requested route does not exist."
  }));
});

server.listen(PORT, () => {
  console.log(`Campus Connect API listening on port ${PORT}`);
});
