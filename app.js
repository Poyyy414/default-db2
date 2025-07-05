require('dotenv').config();

const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

// Routes
const authRoutes = require('./routes/authRoutes');
const userRoutes = require('./routes/userRoutes');
const deptRoutes = require('./routes/deptRoutes');
const courseRoutes = require('./routes/courseRoutes');
const studentRoutes = require('./routes/studentRoutes');

const app = express();

app.use(cors());
app.use(bodyParser.json());

// Root endpoint
app.get('/', (req, res) => {
  res.send('John Paul Cambiado');
});

// API routes
app.use('/api/auth', authRoutes);
app.use('/api/user', userRoutes);
app.use('/api/dept', deptRoutes);
app.use('/api/course', courseRoutes);
app.use('/api/student', studentRoutes);


// Start server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log('Server is operating on port', PORT);
});
