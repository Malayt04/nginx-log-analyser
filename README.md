# 🧾 NGINX Log Analyzer

A simple shell script to analyze NGINX access logs and display key statistics.  
This tool helps you understand request patterns and traffic data using basic Unix commands like `awk`, `sort`, `uniq`, `head`, and `sed`.

---

## 📌 Features

- 🔍 Top 5 IP addresses with the most requests
- 📈 Top 5 most requested paths
- 📊 Top 5 HTTP response status codes
- 🧑‍💻 Top 5 user agents (browsers/tools accessing the server)

---

## 📂 Log Format

The script expects a standard NGINX access log format like this:

