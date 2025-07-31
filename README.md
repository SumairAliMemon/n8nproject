"# Gemini Pitch API

A standalone Node.js API that generates professional content using Google's Gemini AI.

## Features

- RESTful API endpoint for text generation
- Integration with Google Gemini 2.0 Flash API
- Clean JSON response format
- Environment-based configuration
- CORS enabled for web applications

## Deployment on Render

### Option 1: Using render.yaml (Recommended)

1. **Push your code to GitHub**
2. **Connect to Render:**
   - Go to [Render Dashboard](https://dashboard.render.com/)
   - Click "New" → "Web Service"
   - Connect your GitHub repository
3. **Render will automatically detect the `render.yaml` file and deploy**

### Option 2: Manual Setup

1. **Create new Web Service on Render**
2. **Connect your GitHub repo**
3. **Configure:**
   - **Runtime:** Docker
   - **Dockerfile Path:** `./Dockerfile`
   - **Port:** 5678
4. **Add Environment Variables:**
   ```
   PORT=5678
   NODE_ENV=production
   GEMINI_API_KEY=your-gemini-api-key
   ```

## API Usage

### Health Check
```
GET https://your-app-name.onrender.com/
```

### Generate Content
```
POST https://your-app-name.onrender.com/webhook/generate-pitch
```

```
POST https://your-app-name.onrender.com/pitch
```

### Request Body
```json
{
  "text": "Generate a professional pitch for a software engineer position"
}
```

### Response
```json
{
  "status": "success",
  "reply": "Your generated content from Gemini AI..."
}
```

## Example Usage

### Using curl
```bash
curl -X POST https://your-app-name.onrender.com/pitch \
  -H "Content-Type: application/json" \
  -d '{
    "text": "Create a professional LinkedIn post about learning React.js"
  }'
```

### Using JavaScript (fetch)
```javascript
const response = await fetch('https://your-app-name.onrender.com/pitch', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    text: 'Write a cover letter for a data scientist position'
  })
});

const data = await response.json();
console.log(data.reply);
```

## Local Development

1. **Clone the repository**
2. **Install dependencies:**
   ```bash
   npm install
   ```
3. **Copy environment variables:**
   ```bash
   cp .env.example .env
   ```
4. **Update `.env` with your Gemini API key**
5. **Run the server:**
   ```bash
   npm start
   ```
6. **Access API at:** `http://localhost:5678`

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PORT` | Server port | 5678 |
| `NODE_ENV` | Environment | production |
| `GEMINI_API_KEY` | Your Google Gemini API key | Required |

## Security Notes

- Keep your Gemini API key secure
- Use environment variables for sensitive data
- Don't commit `.env` file to version control
- Consider implementing rate limiting for production use" 
