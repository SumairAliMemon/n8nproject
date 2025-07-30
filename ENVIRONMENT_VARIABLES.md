# Environment Variables for Render Deployment

Copy these environment variables to your Render service settings:

## Basic n8n Configuration:

```
N8N_PORT=5678
N8N_HOST=0.0.0.0
N8N_PROTOCOL=http
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=adminpassword
WEBHOOK_URL=https://n8nproject-1.onrender.com/
```

## API Keys:

```
GEMINI_API_KEY=AIzaSyApeU7dGzKFodIYkqOUOM0-SetHQ-jVPXI
```

## Database Configuration (PostgreSQL):

```
DB_TYPE=postgresdb
DB_POSTGRESDB_HOST=db.lqiwatzuivdvwjtqrpor.supabase.co
DB_POSTGRESDB_PORT=5432
DB_POSTGRESDB_DATABASE=postgres
DB_POSTGRESDB_USER=postgres.lqiwatzuivdvwjtqrpor
DB_POSTGRESDB_PASSWORD=XM5NCAsoUnxliJJm
```

## Supabase Configuration:

```
NEXT_PUBLIC_SUPABASE_URL=https://lqiwatzuivdvwjtqrpor.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxxaXdhdHp1aXZkdndqdHFycG9yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM3MjAzMTQsImV4cCI6MjA2OTI5NjMxNH0.v0CAxbq9zuaL-3k0qRWcl9o0D2wNeToeGfArmvCli0s
SUPABASE_URL=https://lqiwatzuivdvwjtqrpor.supabase.co
SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxxaXdhdHp1aXZkdndqdHFycG9yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM3MjAzMTQsImV4cCI6MjA2OTI5NjMxNH0.v0CAxbq9zuaL-3k0qRWcl9o0D2wNeToeGfArmvCli0s
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxxaXdhdHp1aXZkdndqdHFycG9yIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1MzcyMDMxNCwiZXhwIjoyMDY5Mjk2MzE0fQ.T7EtME0h92gXJE_2cmc5FGDjV47T78VlmdD8a_HfDVs
SUPABASE_JWT_SECRET=A6WzeDZ+FyZ2HrDeSNcPG/3OUS6ytSbPwac5oGCDQqi3Z50WNIo+YtpUbtxVzyNRCMSpHOxTTyrNyURrcSG11g==
```

## Database URLs (for different connection types):

```
POSTGRES_URL=postgres://postgres.lqiwatzuivdvwjtqrpor:XM5NCAsoUnxliJJm@aws-0-us-east-1.pooler.supabase.com:6543/postgres?sslmode=require&supa=base-pooler.x
POSTGRES_PRISMA_URL=postgres://postgres.lqiwatzuivdvwjtqrpor:XM5NCAsoUnxliJJm@aws-0-us-east-1.pooler.supabase.com:6543/postgres?sslmode=require&pgbouncer=true
POSTGRES_URL_NON_POOLING=postgres://postgres.lqiwatzuivdvwjtqrpor:XM5NCAsoUnxliJJm@aws-0-us-east-1.pooler.supabase.com:5432/postgres?sslmode=require
POSTGRES_USER=postgres
POSTGRES_HOST=db.lqiwatzuivdvwjtqrpor.supabase.co
POSTGRES_PASSWORD=XM5NCAsoUnxliJJm
POSTGRES_DATABASE=postgres
```

## How to add in Render:
1. Go to your service → Environment tab
2. Copy and paste each variable as Key-Value pairs
3. Click "Save Changes"
4. Deploy your service

## Security Recommendations:
- Change `N8N_BASIC_AUTH_USER` from "admin" to something secure
- Change `N8N_BASIC_AUTH_PASSWORD` from "adminpassword" to a strong password
- Keep this file private and don't share your API keys

## Quick Copy Format (for bulk paste):
```
N8N_PORT=5678
N8N_HOST=0.0.0.0
N8N_PROTOCOL=http
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=adminpassword
WEBHOOK_URL=https://n8nproject-1.onrender.com/
GEMINI_API_KEY=AIzaSyApeU7dGzKFodIYkqOUOM0-SetHQ-jVPXI
DB_TYPE=postgresdb
DB_POSTGRESDB_HOST=db.lqiwatzuivdvwjtqrpor.supabase.co
DB_POSTGRESDB_PORT=5432
DB_POSTGRESDB_DATABASE=postgres
DB_POSTGRESDB_USER=postgres.lqiwatzuivdvwjtqrpor
DB_POSTGRESDB_PASSWORD=XM5NCAsoUnxliJJm
NEXT_PUBLIC_SUPABASE_URL=https://lqiwatzuivdvwjtqrpor.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxxaXdhdHp1aXZkdndqdHFycG9yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM3MjAzMTQsImV4cCI6MjA2OTI5NjMxNH0.v0CAxbq9zuaL-3k0qRWcl9o0D2wNeToeGfArmvCli0s
SUPABASE_URL=https://lqiwatzuivdvwjtqrpor.supabase.co
SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxxaXdhdHp1aXZkdndqdHFycG9yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM3MjAzMTQsImV4cCI6MjA2OTI5NjMxNH0.v0CAxbq9zuaL-3k0qRWcl9o0D2wNeToeGfArmvCli0s
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxxaXdhdHp1aXZkdndqdHFycG9yIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1MzcyMDMxNCwiZXhwIjoyMDY5Mjk2MzE0fQ.T7EtME0h92gXJE_2cmc5FGDjV47T78VlmdD8a_HfDVs
SUPABASE_JWT_SECRET=A6WzeDZ+FyZ2HrDeSNcPG/3OUS6ytSbPwac5oGCDQqi3Z50WNIo+YtpUbtxVzyNRCMSpHOxTTyrNyURrcSG11g==
POSTGRES_URL=postgres://postgres.lqiwatzuivdvwjtqrpor:XM5NCAsoUnxliJJm@aws-0-us-east-1.pooler.supabase.com:6543/postgres?sslmode=require&supa=base-pooler.x
POSTGRES_PRISMA_URL=postgres://postgres.lqiwatzuivdvwjtqrpor:XM5NCAsoUnxliJJm@aws-0-us-east-1.pooler.supabase.com:6543/postgres?sslmode=require&pgbouncer=true
POSTGRES_URL_NON_POOLING=postgres://postgres.lqiwatzuivdvwjtqrpor:XM5NCAsoUnxliJJm@aws-0-us-east-1.pooler.supabase.com:5432/postgres?sslmode=require
POSTGRES_USER=postgres
POSTGRES_HOST=db.lqiwatzuivdvwjtqrpor.supabase.co
POSTGRES_PASSWORD=XM5NCAsoUnxliJJm
POSTGRES_DATABASE=postgres
```
