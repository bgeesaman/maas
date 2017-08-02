# MAAS (Metal as a Service)

DNSMasq based Mac Netboot and PC PXE docker container.  Runs DNS, DHCP, TFTP, and provides Grub2 bootable images for both Mac and PC hardware.

## Getting Started

Clone the repo, edit the configuration files as needed, and then run ```./buildandrun.sh```

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

The bits that allowed my Mac hardware to Netboot alongside the PCs came directly from the following:

* [bennettp123](https://bennettp123.com/2012/05/05/booting-imac-12,1-from-isc-dhcp)
* [jekkos](https://github.com/jekkos/netboot-osx/blob/master/dnsmasq.conf)
