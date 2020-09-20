# Production VM

To add nginx as a proxy : 

```bash
docker run -d -p 80:80 --name nginx-proxy --restart=always -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
```

I use the jwilder version because it offers a complete solution

Then to launch application, you must use the structure define in the documentation : 
https://github.com/nginx-proxy/nginx-proxy

