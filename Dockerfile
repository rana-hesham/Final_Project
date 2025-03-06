#
#    Copyright 2010-2025 the original author or authors.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#       https://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
#

FROM  maven:3-jdk-11 as maven_builder

WORKDIR /app

COPY . /app

RUN ["mvn","clean","compile","package"]

FROM tomcat:8.5.43-jdk8

COPY --from=maven_builder /app/*/jpetstore.war /usr/local/tomcat/webapps

EXPOSE 8080

CMD ["catalina.sh", "run"]
