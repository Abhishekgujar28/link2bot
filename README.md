# Telegram Invite Link Bot

A Telegram bot that creates invite links for channels and generates unique referral codes.

## Features

- Creates invite links for Telegram channels
- Generates unique referral codes for channels
- Allows users to join channels via invite links
- Admin interface for channel management

## Heroku Deployment

1. Make sure you have the Heroku CLI installed
2. Login to Heroku:
   ```
   heroku login
   ```

3. Create a new Heroku app:
   ```
   heroku create your-app-name
   ```

4. Set up the bot token as a config variable:
   ```
   heroku config:set BOT_TOKEN=your_bot_token
   ```

5. Push your code to Heroku:
   ```
   git push heroku main
   ```

6. Scale up the worker dyno:
   ```
   heroku ps:scale worker=1
   ```

7. Check the logs to ensure the bot is running:
   ```
   heroku logs --tail
   ``` 