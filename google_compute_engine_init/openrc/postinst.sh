#!/bin/sh
# Copyright 2016 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if ! [ -d /etc/runlevels/reboot ]; then
  install -d /etc/runlevels/reboot
fi

rc-update add google-accounts-daemon defaults
rc-update add google-clock-skew-daemon defaults
rc-update add google-instance-setup defaults
rc-update add google-ip-forwarding-daemon defaults
rc-update add google-network-setup defaults
rc-update add google-shutdown-scripts shutdown reboot
rc-update add google-startup-scripts defaults

# Run instance setup.
/etc/init.d/google-instance-setup start

# Enable network interfaces.
/etc/init.d/google-network-setup start
