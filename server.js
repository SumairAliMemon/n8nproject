const express = require('express');
const axios = require('axios');
const cors = require('cors');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 5678;

// Middleware
app.use(cors());
app.use(express.json());

// Health check endpoint
app.get('/', (req, res) => {
  res.json({
    status: 'success',
    message: 'Gemini Pitch API is running',
    endpoint: 'POST /pitch'
  });
});

// Main pitch endpoint - exactly like your n8n workflow
app.post('/pitch', async (req, res) => {
  try {
    const { text } = req.body;

    if (!text) {
      return res.status(400).json({
        status: 'error',
        message: 'Missing required field: text'
      });
    }

    // Call Gemini API (same as your n8n HTTP Request node)
    const geminiResponse = await axios.post(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent',
      {
        contents: [
          {
            parts: [
              {
                text: text
              }
            ]
          }
        ]
      },
      {
        headers: {
          'Content-Type': 'application/json',
          'X-goog-api-key': process.env.GEMINI_API_KEY
        }
      }
    );

    // Extract reply (same as your Extract Reply function node)
    const reply = geminiResponse.data.candidates[0].content.parts[0].text;

    // Return response (same as your webhook response)
    res.json({
      reply: reply
    });

  } catch (error) {
    console.error('Error:', error.response?.data || error.message);
    
    res.status(500).json({
      status: 'error',
      message: 'Failed to generate response',
      error: process.env.NODE_ENV === 'development' ? error.message : 'Internal server error'
    });
  }
});

// Start server
app.listen(PORT, '0.0.0.0', () => {
  console.log(`🚀 Pitch API running on port ${PORT}`);
  console.log(`📡 Health: http://localhost:${PORT}/`);
  console.log(`🎯 Endpoint: POST http://localhost:${PORT}/pitch`);
});

module.exports = app;
