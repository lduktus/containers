Wolfi based container for Syncthing. It builds the latest release from source. The binary is placed in the users (nonroot) home directory, this should allow for auto-updating syncthing.

**N. B.:** there is an [official container](https://hub.docker.com/r/syncthing/syncthing), you may prefer this one.

# Usage

```sh
docker run -d \
  -p 8384:8384 \
  -p 22000:22000 \
  -p 21027:21027/udp \
  -v /path/to/config:/home/nonroot/.config:Z \
  -v /path/to/dir1:/home/nonroot/Sync:Z \
  -v /path/to/dir2:/home/nonroot/Images \
  --userns keep-id \
  --name syncthing-wolfi \
  syncthing
```

You can alternatively use `--network host`, which should allow faster discovery though it weakens sandboxing.[^2] See the example [Quadlet](./quadlet/syncthing.container) for Systemd integration.

# Environment Variables

- `STHOMEDIR`: defaults to `/home/nonroot/.config`
- `STGUIADDRESS`: defaults to 0000:8384

# Exposed Ports

- `8384`: Syncthing GUI
- `22000/tcp`: Syncthing Protocol
- `22000/udp`: Syncthing Protocol
- `21027/udp`: Syncthing Discovery

# References

- [Syncthing Documentation](https://docs.syncthing.net/)
- [Syncthing on a immutable OS](https://mmarco94.github.io/linux-guides/immutable-os/syncthing.html)