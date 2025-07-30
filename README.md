"# n8n Pitch Generator

A simple n8n workflow that generates professional pitches using Google's Gemini AI API.

## Features

- HTTP trigger endpoint for generating pitches
- Integration with Google Gemini AI API
- Clean JSON response format
- Environment-based configuration

## Deployment on Render

### Option 1: Using render.yaml (Recommended)

1. **Push your code to GitHub**
2. **Connect to Render:**
   - Go to [Render Dashboard](https://dashboard.render.com/)
   - Click "New" → "Web Service"
   - Connect your GitHub repository
3. **Render will automatically detect the `render.yaml` file and deploy**
4. **Update environment variables:**
   - Go to your service settings
   - Update `WEBHOOK_URL` with your actual Render URL
   - Change `N8N_BASIC_AUTH_USER` and `N8N_BASIC_AUTH_PASSWORD` for security

### Option 2: Manual Setup

1. **Create new Web Service on Render**
2. **Connect your GitHub repo**
3. **Configure:**
   - **Runtime:** Docker
   - **Dockerfile Path:** `./dockerfile`
   - **Port:** 5678
4. **Add Environment Variables:**
   ```
   N8N_PORT=5678
   N8N_HOST=0.0.0.0
   N8N_PROTOCOL=http
   N8N_BASIC_AUTH_ACTIVE=true
   N8N_BASIC_AUTH_USER=your-username
   N8N_BASIC_AUTH_PASSWORD=your-password
   WEBHOOK_URL=https://your-app-name.onrender.com/
   GEMINI_API_KEY=your-gemini-api-key
   ```

## API Usage

### Endpoint
```
POST https://your-app-name.onrender.com/webhook/generate-pitch
```

### Request Body
```json
{
    "job_description": "Software Engineer position at tech startup",
    "user_data": {
        "name": "John Doe",
        "skills": ["JavaScript", "React", "Node.js"],
        "experience": "3 years"
    }
}
```

### Response
```json
{
    "pitch": "Dear Hiring Manager, I am excited to apply for the Software Engineer position..."
}
```

## Local Development

1. **Clone the repository**
2. **Copy environment variables:**
   ```bash
   cp .env.example .env
   ```
3. **Update `.env` with your actual values**
4. **Run with Docker Compose:**
   ```bash
   docker-compose up
   ```
5. **Access n8n at:** `http://localhost:5678`

## Environment Variables

| Variable | Description |
|----------|-------------|
| `N8N_BASIC_AUTH_USER` | Username for n8n basic auth |
| `N8N_BASIC_AUTH_PASSWORD` | Password for n8n basic auth |
| `GEMINI_API_KEY` | Your Google Gemini API key |
| `WEBHOOK_URL` | Your deployment URL |

## Security Notes

- Always change default authentication credentials
- Keep your API keys secure
- Use environment variables for sensitive data
- Don't commit `.env` file to version control" 
