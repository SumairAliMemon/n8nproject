FROM n8nio/n8n

ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http

# Supabase Configuration
ENV NEXT_PUBLIC_SUPABASE_URL=https://lqiwatzuivdvwjtqrpor.supabase.co
ENV NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxxaXdhdHp1aXZkdndqdHFycG9yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM3MjAzMTQsImV4cCI6MjA2OTI5NjMxNH0.v0CAxbq9zuaL-3k0qRWcl9o0D2wNeToeGfArmvCli0s
ENV SUPABASE_URL=https://lqiwatzuivdvwjtqrpor.supabase.co
ENV SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxxaXdhdHp1aXZkdndqdHFycG9yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM3MjAzMTQsImV4cCI6MjA2OTI5NjMxNH0.v0CAxbq9zuaL-3k0qRWcl9o0D2wNeToeGfArmvCli0s
ENV SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxxaXdhdHp1aXZkdndqdHFycG9yIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1MzcyMDMxNCwiZXhwIjoyMDY5Mjk2MzE0fQ.T7EtME0h92gXJE_2cmc5FGDjV47T78VlmdD8a_HfDVs
ENV SUPABASE_JWT_SECRET=A6WzeDZ+FyZ2HrDeSNcPG/3OUS6ytSbPwac5oGCDQqi3Z50WNIo+YtpUbtxVzyNRCMSpHOxTTyrNyURrcSG11g==

# API Keys
ENV GEMINI_API_KEY=AIzaSyApeU7dGzKFodIYkqOUOM0-SetHQ-jVPXI

# Database Configuration
ENV POSTGRES_URL=postgres://postgres.lqiwatzuivdvwjtqrpor:XM5NCAsoUnxliJJm@aws-0-us-east-1.pooler.supabase.com:6543/postgres?sslmode=require&supa=base-pooler.x
ENV POSTGRES_PRISMA_URL=postgres://postgres.lqiwatzuivdvwjtqrpor:XM5NCAsoUnxliJJm@aws-0-us-east-1.pooler.supabase.com:6543/postgres?sslmode=require&pgbouncer=true
ENV POSTGRES_URL_NON_POOLING=postgres://postgres.lqiwatzuivdvwjtqrpor:XM5NCAsoUnxliJJm@aws-0-us-east-1.pooler.supabase.com:5432/postgres?sslmode=require
ENV POSTGRES_USER=postgres
ENV POSTGRES_HOST=db.lqiwatzuivdvwjtqrpor.supabase.co
ENV POSTGRES_PASSWORD=XM5NCAsoUnxliJJm
ENV POSTGRES_DATABASE=postgres

# Copy your exported workflow
COPY workflow.json /app/workflow.json

# Import the workflow then start n8n
CMD ["sh", "-c", "n8n import:workflow --input=/app/workflow.json && n8n start"]
