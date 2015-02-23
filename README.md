#Heroku commands
git push heroku master
heroku addons:add newrelic
heroku addons:open newrelic

heroku pg:reset HEROKU_POSTGRESQL_CRIMSON_URL
heroku run rake db:migrate
heroku run rake db:seed

figaro heroku:set
heroku run rails c