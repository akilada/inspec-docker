Inspec Docker 
===

This is inspired from original `checf/inspec` image.  

What's new
===

* Added additional line to install `inspec-iggy` plugin
* Auto accept checf license

How to run
===

```
Docker build -t inspec:4.16.0 .
docker run -t -d -v <inspec_profile_path>:/share inspec:4.16.0
docker exec -it <container_id> /bin/sh
```

