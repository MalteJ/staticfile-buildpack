# ------------------------------------------------------------------------------------------------
# Copyright 2013 Jordon Bedwell.
# Apache License.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file
# except  in compliance with the License. You may obtain a copy of the License at:
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the
# License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
# either express or implied. See the License for the specific language governing permissions
# and  limitations under the License.
# ------------------------------------------------------------------------------------------------
export APP_ROOT=$HOME

cd $APP_ROOT

conf_file=$APP_ROOT/apache2/conf/httpd.conf
if [ -f $APP_ROOT/htdocs/httpd.conf ]
then
  conf_file=$APP_ROOT/htdocs/httpd.conf
fi

mv $conf_file $APP_ROOT/apache2/orig.conf
erb $APP_ROOT/apache2/orig.conf > $conf_file

#cat $conf_file

# ------------------------------------------------------------------------------------------------

touch $APP_ROOT/apache2/logs/access_log
touch $APP_ROOT/apache2/logs/error_log

(tail -f -n 0 $APP_ROOT/apache2/logs/*log &)
exec $APP_ROOT/apache2/bin/httpd -DFOREGROUND -f $APP_ROOT/apache2/conf/httpd.conf

# ------------------------------------------------------------------------------------------------
