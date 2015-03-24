# hbase-docker
Simple Docker build for hbase.
CentOS, HBase v1.0.0

Pull Image
----------
`sudo docker pull adaminspace/hbase`

Run Container (exposing rest port)
-------------
Run: `sudo docker run -d -p 8080:8080 --name myhbase adaminspace/hbase`
Check logs (ctrl+C to exit): `sudo docker logs -f myhbase`

Test the REST server
-----------------
Enter container: `sudo docker exec -it myhbase bash`

Start hbase shell: `hbase shell`

Add a table: `create 'mytable','cf1'`

Exit shell: `quit`

Start REST server: `hbase rest start`

Exit container: `exit`

Test: `curl localhost:8080` (it should return 'mytable' as the list of tables)
