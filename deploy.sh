#!/bin/bash
echo "Deploying bot to Heroku..."

# Create Heroku app if it doesn't exist
heroku apps | grep -q "invbot-telegram" || heroku create invbot-telegram

# Set the BOT_TOKEN variable on Heroku
echo "Setting BOT_TOKEN..."
heroku config:set BOT_TOKEN=7154242840:AAFKxPZPmUfFkrQidkFg77CavcmU1ki8JLE

# Push the code to Heroku
echo "Pushing code to Heroku..."
git add .
git commit -m "Deploy with embedded token" || true
git push heroku main || git push heroku master

# Scale the worker dyno
echo "Scaling worker dyno..."
heroku ps:scale worker=1

echo "Deployment complete!"
echo "Run 'heroku logs --tail' to view logs" 