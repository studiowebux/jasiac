# Network

It configures the network interfaces with bridge and VLANs

## Requirements

None

## Role Variables

Default configuration:

```yaml
interface_wan: "eth0"
interface_lan: "eth1"
bridge_wan: "br2"
bridge_lan: "br0" # act as a trunk
network:
  noip:
    - vlanid: 170
      bridge: "{{ bridge_lan }}"
      conn: "{{ bridge_lan }}.70"
      networkName: "SECURE"
    - vlanid: 130
      bridge: "{{ bridge_lan }}"
      conn: "{{ bridge_lan }}.30"
      networkName: "LAB01"
    - vlanid: 120
      bridge: "{{ bridge_lan }}"
      conn: "{{ bridge_lan }}.20"
      networkName: "LAN"
  static:
    - vlanid: 110
      bridge: "{{ bridge_lan }}"
      conn: "{{ bridge_lan }}.10"
      networkName: "CORPO"
      staticIP: "192.168.110.10/24"
```

## Dependencies

The dependency is installed automatically while using this role.

- bridge-utils

## Example Playbook

```yaml
- name: Configure Network
  hosts: physical
  become: yes
  roles:
    - { role: roles/network }
```

## License

MIT

## Author Information

Tommy Gingras @ Studio Webux S.E.N.C ([Webux Lab](https://webuxlab.com) - _A [Studio Webux](https://studiowebux.com) Project_)
