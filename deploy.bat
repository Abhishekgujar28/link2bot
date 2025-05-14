@echo off
echo Deploying bot to Heroku...

REM Set the BOT_TOKEN variable on Heroku
echo Setting BOT_TOKEN...
heroku config:set BOT_TOKEN=7154242840:AAFKxPZPmUfFkrQidkFg77CavcmU1ki8JLE

REM Push the code to Heroku
echo Pushing code to Heroku...
git add .
git commit -m "Deploy"
git push heroku main

REM Scale the worker dyno
echo Scaling worker dyno...
heroku ps:scale worker=1

echo Deployment complete!
echo Logs will be shown below:
heroku logs --tail 