Dockerfile of forensic tool for memory analyst  - Rekall

```
docker run --rm -it -v /opt/dump:/data monaxgt/rekall -q --cache_dir /tmp -f memory.raw
```
