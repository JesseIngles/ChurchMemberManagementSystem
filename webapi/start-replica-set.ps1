Start-Process -NoNewWindow -FilePath "C:\Program Files\MongoDB\Server\7.0\bin\mongod.exe" -ArgumentList "--replSet rs0 --logpath C:\data\replicaone\1.log --dbpath C:\data\replicaone --port 27018"
Start-Process -NoNewWindow -FilePath "C:\Program Files\MongoDB\Server\7.0\bin\mongod.exe" -ArgumentList "--replSet rs0 --logpath C:\data\replicatwo\1.log --dbpath C:\data\replicatwo --port 27019"
Start-Process -NoNewWindow -FilePath "C:\Program Files\MongoDB\Server\7.0\bin\mongod.exe" -ArgumentList "--replSet rs0 --logpath C:\data\replicatheree\1.log --dbpath C:\data\replicatheree --port 27020"
