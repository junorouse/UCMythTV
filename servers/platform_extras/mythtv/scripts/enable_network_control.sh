#!/bin/bash

# Enable 'network control' in MythTV
# Copyright (C) 2011 British Broadcasting Corporation    
#
# This code may be used under the terms of either of the following  
# licences:  
#       
# 1) GPLv2:  
# 
#   This program is free software; you can redistribute it and/or modify  
#   it under the terms of the GNU General Public License as published by  
#   the Free Software Foundation; either version 2 of the License, or  
#   (at your option) any later version.  
# 
#   This program is distributed in the hope that it will be useful,  
#   but WITHOUT ANY WARRANTY; without even the implied warranty of  
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the  
#   GNU General Public License for more details.  
# 
#   You should have received a copy of the GNU General Public License along  
#   with this program; if not, write to the Free Software Foundation, Inc.,  
#   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.  
#
#
# 2) Apache 2.0:  
#                                         
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#


MYSQLPWD=`grep DBPassword ~/.mythtv/mysql.txt | perl -pe "s/DBPassword=(.+)/\1/"`

echo 'UPDATE settings SET data=1 WHERE value="NetworkControlEnabled" AND hostname="'`hostname`'";' | mysql --user=mythtv --password=$MYSQLPWD mythconverg
echo 'INSERT settings SET data=1,value="VideoBookMarkPrompt",hostname="'`hostname`'";' | mysql --user=mythtv --password=$MYSQLPWD mythconverg
echo 'UPDATE settings SET data="ALSA:plughw:1,3" WHERE value="AudioOutputDevice";' | mysql --user=mythtv --password=$MYSQLPWD mythconverg
echo 'UPDATE settings SET data="MythCenter-wide" WHERE value="Theme";' | mysql --user=mythtv --password=$MYSQLPWD mythconverg

