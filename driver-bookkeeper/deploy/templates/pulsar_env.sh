#!/usr/bin/env bash
#
# Copyright © 2017 OpenMessaging Project (${email})
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

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
#

# Set JAVA_HOME here to override the environment setting
# JAVA_HOME=

# default settings for starting pulsar broker

# Log4j configuration file
# PULSAR_LOG_CONF=

# Logs location
# PULSAR_LOG_DIR=

# Configuration file of settings used in broker server
# PULSAR_BROKER_CONF=

# Configuration file of settings used in bookie server
# PULSAR_BOOKKEEPER_CONF=

# Configuration file of settings used in zookeeper server
# PULSAR_ZK_CONF=

# Configuration file of settings used in global zookeeper server
# PULSAR_GLOBAL_ZK_CONF=

# Extra options to be passed to the jvm
PULSAR_MEM=" -Xms{{ max_heap_memory }} -Xmx{{ max_heap_memory }} -XX:MaxDirectMemorySize={{ max_direct_memory }}"

# Garbage collection options
PULSAR_GC=" -XX:+UseG1GC -XX:MaxGCPauseMillis=10 -XX:+ParallelRefProcEnabled -XX:+UnlockExperimentalVMOptions -XX:+AggressiveOpts -XX:+DoEscapeAnalysis -XX:ParallelGCThreads=32 -XX:ConcGCThreads=32 -XX:G1NewSizePercent=50 -XX:+DisableExplicitGC -XX:-ResizePLAB"
PULSAR_GC="${PULSAR_GC} -XX:+PerfDisableSharedMem -XX:+AlwaysPreTouch -XX:-UseBiasedLocking"
PULSAR_GC="${PULSAR_GC} -XX:+PrintGCDetails -XX:+PrintGCApplicationStoppedTime  -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=5 -XX:GCLogFileSize=64m -Xloggc:/dev/shm/gc_%p.log"

# Extra options to be passed to the jvm
PULSAR_EXTRA_OPTS="${PULSAR_EXTRA_OPTS} ${PULSAR_MEM} ${PULSAR_GC} -Dio.netty.leakDetectionLevel=disabled -Dio.netty.recycler.maxCapacity.default=1000 -Dio.netty.recycler.linkCapacity=1024"

# Add extra paths to the bookkeeper classpath
# PULSAR_EXTRA_CLASSPATH=

#Folder where the Bookie server PID file should be stored
#PULSAR_PID_DIR=

#Wait time before forcefully kill the pulser server instance, if the stop is not successful
#PULSAR_STOP_TIMEOUT=
