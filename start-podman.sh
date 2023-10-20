#/bin/bash
PORT=$((1000 + $RANDOM % 65535))
SECRET_KEY=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 80 ; echo '')
cp credentials.ini vocab/credentials.ini
cd vocab
sed -i "s/PORT=5000/PORT=$PORT/g" credentials.ini
sed -i "s/secret_key = Replace this with random string; os.urandom can make one/secret_key = $SECRET_KEY/g" credentials.ini
./run_tests.sh
podman build -t project3 .
podman run -p 5000:$PORT --rm -it project3    