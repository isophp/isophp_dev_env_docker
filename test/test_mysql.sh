COUNT = `mysql --user="$user" --password="$password" --database="$database" \
  --execute="SELECT COUNT(*) FROM table_name;"`
if [[ $COUNT -ne 1 ]]; then
  exit 1
fi