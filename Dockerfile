FROM phusion/baseimage

RUN apt-get update && apt-get -y --no-install-recommends install dnsmasq grub2-common grub-imageboot grub-pc-bin grub-efi wget net-tools

COPY files/start.sh /start.sh
COPY files/grub/* /
COPY files/dnsmasq.conf /etc/dnsmasq.conf

EXPOSE 53
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
