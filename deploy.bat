@echo off
echo Deploying bot to Heroku...

REM Check if the app exists and create it if not
heroku apps | findstr "invbot-telegram" >nul 2>&1
if errorlevel 1 (
    echo Creating Heroku app...
    heroku create invbot-telegram
)

REM Set the BOT_TOKEN variable on Heroku
echo Setting BOT_TOKEN...
heroku config:set BOT_TOKEN=7154242840:AAFKxPZPmUfFkrQidkFg77CavcmU1ki8JLE

REM Push the code to Heroku
echo Pushing code to Heroku...
git add .
git commit -m "Deploy with embedded token"
git push heroku main 2>nul || git push heroku master

REM Scale the worker dyno
echo Scaling worker dyno...
heroku ps:scale worker=1

echo Deployment complete!
echo Run 'heroku logs --tail' to view logs 