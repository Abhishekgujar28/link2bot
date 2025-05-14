# Telegram Invite Link Bot

A Telegram bot that creates invite links for channels and generates unique referral codes.

## Features

- Creates invite links for Telegram channels
- Generates unique referral codes for channels
- Allows users to join channels via invite links
- Admin interface for channel management

## Heroku Deployment

### Prerequisites
- A verified Heroku account (requires adding payment information)
- Heroku CLI installed
- Git installed

### Step-by-Step Deployment

1. Login to Heroku:
   ```
   heroku login
   ```

2. Create a new Heroku app:
   ```
   heroku create your-app-name
   ```
   Note: Replace "your-app-name" with a unique name for your app.

3. **IMPORTANT**: Set up the bot token as a config variable:
   ```
   heroku config:set BOT_TOKEN=your_bot_token
   ```
   Replace "your_bot_token" with the token you received from BotFather.
   This step is critical - the bot won't work without properly setting this environment variable!

4. Add Heroku as a remote to your Git repository:
   ```
   git remote add heroku https://git.heroku.com/your-app-name.git
   ```
   Note: Replace "your-app-name" with the name you chose in step 2.

5. Commit your changes:
   ```
   git add .
   git commit -m "Ready for Heroku deployment"
   ```

6. Push your code to Heroku:
   ```
   git push heroku main
   ```
   Or if you're using the master branch:
   ```
   git push heroku master
   ```

7. Scale up the worker dyno:
   ```
   heroku ps:scale worker=1
   ```

8. Check the logs to ensure the bot is running:
   ```
   heroku logs --tail
   ```

### Using the deploy.bat Script (Windows)

For Windows users, a `deploy.bat` script is provided for easy deployment. Before running:
1. Ensure you're logged in to Heroku (`heroku login`)
2. Make sure you have a Heroku app created and added as a remote
3. Run the script:
   ```
   deploy.bat
   ```

## Troubleshooting

If you're getting an "InvalidToken" error:
1. Make sure you've correctly set the BOT_TOKEN config variable on Heroku
2. Verify the token by logging into the Heroku dashboard and checking the config vars
3. Try setting the token again with: `heroku config:set BOT_TOKEN=your_bot_token`
4. Check the logs to see detailed error messages: `heroku logs --tail`

### Common Heroku Issues

- **Verification Required**: You must verify your Heroku account by adding payment information before creating apps.
- **Application Error**: Check logs with `heroku logs --tail` to identify the issue.
- **H14 - No web processes running**: This is normal for this bot as it uses a worker process, not a web process.
- **R14 - Memory quota exceeded**: Consider upgrading your dyno if this happens frequently. 