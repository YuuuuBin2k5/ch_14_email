# Bước 1: Chọn image Tomcat 10 / JDK 17
FROM tomcat:10.1-jdk17

# Bước 3: Copy file .war vào và đổi tên thành ROOT.war
# Tomcat sẽ tự động giải nén nó khi khởi động
COPY dist/ch_14_email.war /usr/local/tomcat/webapps/ROOT.war

