const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello from Docker CI/CD pipeline!');
});

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);

  // Add this polyfill at the top of your app.js
if (!Object.hasOwn) {
  Object.hasOwn = (obj, prop) => Object.prototype.hasOwnProperty.call(obj, prop);
}

// Rest of your code
const express = require('express');
// ...
});
