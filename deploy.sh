docker build -t jjboaventura/multi-client:latest -t jjboaventura/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t jjboaventura/multi-server:latest -t jjboaventura/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t jjboaventura/multi-worker:latest -t jjboaventura/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push jjboaventura/multi-client:latest
docker push jjboaventura/multi-server:latest
docker push jjboaventura/multi-worker:latest

docker push jjboaventura/multi-client:$SHA
docker push jjboaventura/multi-server:$SHA
docker push jjboaventura/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=jjboaventura/multi-server:$SHA
kubectl set image deployments/client-deployment client=jjboaventura/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=jjboaventura/multi-worker:$SHA
