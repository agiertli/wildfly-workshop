echo "number of requests"
echo $1

for i in $(seq 1 $1);  do
echo "executing request $i"
curl http://localhost:8080/task3-binaries/GetData &
done
