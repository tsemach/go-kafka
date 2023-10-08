#### from: https://yusufs.medium.com/getting-started-with-kafka-in-golang-14ccab5fa26
# Running the kafka docker 

## Run the cluster
Run docker compose to startup the cluster

````bash
MY_IP=your-ip docker-compose up -d .
````

## Create a Topic
Run the following to create a topic name `foo`

````bash
docker run --net=host --rm confluentinc/cp-kafka:5.0.0 kafka-topics --create --topic foo --partitions 4 --replication-factor 2 --if-not-exists --zookeeper localhost:32181
````

## Install Kafkacat

Install kafkacat using `apt install kafkacat` then run the following command to test the topic `foo` to start the listner 
````bash
kcat -C -b localhost:19092,localhost:29092,localhost:39092 -t foo -p 0
````bash

On other terminal run the consumer
````bash 
echo 'publish to partition 0' | kcat -P -b localhost:19092,localhost:29092,localhost:39092 -t foo -p 0
````
