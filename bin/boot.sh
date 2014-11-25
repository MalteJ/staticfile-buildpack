export APP_ROOT=/app

if [ -f $APP_ROOT/apache2/htdocs/httpd.conf ]
then
  mv $APP_ROOT/apache2/htdocs/httpd.conf $APP_ROOT/apache2/conf/httpd.conf
fi

touch $APP_ROOT/apache2/logs/access_log
touch $APP_ROOT/apache2/logs/error_log

echo "My IP:"
curl ifconfig.me

(tail -f -n 0 $APP_ROOT/apache2/logs/*log &)
exec $APP_ROOT/apache2/bin/httpd -DFOREGROUND -f $APP_ROOT/apache2/conf/httpd.conf