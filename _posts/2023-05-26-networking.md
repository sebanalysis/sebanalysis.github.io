You have 'network area connections': local-, metropolitan- and wide- Area Networks which are internet networks nested inside each other, each of which has an edge router to the parent network. 

Then you have the network layers, which are nested communication protocols, that travel on these networks and communicate from the 'application layer' (the HTML internet page shown in the browser) down to the machine code executing on the computer processors.

Network area connections and network layers are completely distinct and are different parts of what we mean by 'networking'.

## Network Area Connections

In networking, different types of area connections refer to the geographical scope or coverage of a network. The three main types of area connections are:

1. Local Area Network (LAN): A LAN is a network that covers a limited geographic area, typically within a single building or a small group of nearby buildings. LANs are commonly used in homes, offices, schools, and small businesses. Ethernet is a commonly used technology for LANs. Uses Ethernet and Wi-Fi.

2. Metropolitan Area Network (MAN): A MAN is a network that spans a larger geographic area than a LAN, typically covering a city or a metropolitan area. MANs are designed to interconnect multiple LANs and provide connectivity across a broader region. Fiber optic networks, broadband technologies, and wireless connections can be used for MANs. - Doesn't use Ethernet or Wi-Fi.

3. Wide Area Network (WAN): A WAN is a network that covers a wide geographical area, such as a country, continent, or even globally. WANs are used to connect geographically dispersed LANs or MANs. The internet itself is an example of a global WAN. WAN connections can include leased lines, dedicated connections, virtual private networks (VPNs), and public networks. - Doesn't use Ethernet or Wi-Fi.

## Network Layers

There are two leading models which describe networking: 
2. The Internet protocol suite, normally called the TCP/IP model (Transmission Control Protocol and Internet Protocol Model). This predates the OSI model by a few years. Published by the IETF (Internet Engineering Task Force) in 1981. It uses 'request for comments' (RFC) documents to publish the protocol standards.
1. The more general and comprehensive theoretical framework: OSI (Open Systems Interconnection) model. Standardized by ISO in 1984.

Example Protocols| OSI|TCP/IP
-|-|-
HTTP, UTF-8, n/a| 7-Application, 6-Presentation and 5-Session Layers | Application Layer
TCP|4-Transport Layer | Transport Layer
IP|3-Network Layer | Internet Layer
Wi-Fi, USB|2-Data-link and 1-Physical Layers | Link Layer


As always, I find it helpful to make a hierarchical diagram:

> USB 
>>Wi-Fi
>>>IP
>>>>TCP
>>>>UTF-8
>>>>>HTTP


I find this makes it far easier to visualize, when you have the specific examples, so I have listed them below. I find that most of the time when you are talking about 'networking', you really mean IP, the OSI '4-Network' layer or TCP/IP 'internet' layer.
### TCP/IP Application Layer
#### HTTPS and HTML - OSI Layer 7-Application 

_Function_: Directly interacts with end-user applications. It provides network services to user processes.

- **Protocols/Services**:
    - **Web**: HTTP, HTTPS
    - **File Transfer**: FTP, TFTP
    - **Email**: SMTP, IMAP, POP3
    - **Remote Access**: SSH, Telnet, RDP
    - **Name Resolution**: DNS
    - **Others**: SNMP (Simple Network Management Protocol), DHCP (Dynamic Host Configuration Protocol), LDAP (Lightweight Directory Access Protocol)

#### UTF-8 - OSI Layer 6-Presentation

_Function_: Translates data between the application and transport layers. It deals with data encryption, compression, and translation services.

- **Protocols/Standards**: SSL/TLS, JPEG, GIF, MPEG, EBCDIC, ASCII, UTF-8, UTF-16

#### n/a - OSI Layer 5-Session

The Session Layer, as conceptualized in the OSI (Open Systems Interconnection) model, hasn't exactly become "redundant," but its distinct functions are often blurred or integrated into other layers in modern networking, especially within the context of the TCP/IP model.

_Function_: Manages communication sessions.

- **Protocols**: NetBIOS, RPC (Remote Procedure Call), PPTP (Point-to-Point Tunneling Protocol), SMB (Server Message Block)

---
### TCP/IP Transport Layer

#### TCP - OSI Layer 4-Transport


_Function_: Responsible for end-to-end communication, flow control, and error correction.

- **Connection Types/Protocols**:
    - **Connection-Oriented**: TCP (Transmission Control Protocol)
    - **Connectionless**: UDP (User Datagram Protocol)
    - **Others**: SCTP (Stream Control Transmission Protocol), DCCP (Datagram Congestion Control Protocol)

This layer uses TCP encryption (previously SSL) behind all the HTTPS requests running on it. SSL encryption is still used for direct server-client connections with databases. SSL had vulnerabilities. Before, http traffic was unencryped.

---
### TCP/IP Network Layer 
#### IP - OSI Layer 3-Network

_Function_: Deals with logical addressing and routing of packets between different networks.

- **Connection Types/Protocols**:
    - **IP Protocols**: IPv4, IPv6, ICMP (Internet Control Message Protocol), IGMP (Internet Group Management Protocol)
    - **Routing Protocols**: OSPF, BGP, RIP, EIGRP, IS-IS


---

### TCP/IP Link Layer
#### Wi-Fi - OSI Layer 2-Data Link

_Function_: Responsible for creating a reliable link between two directly connected nodes. It deals with MAC addresses and frame formatting.

- **Connection Types/Protocols**:
    - **LAN (Local Area Network)**: Ethernet (IEEE 802.3), Wi-Fi (IEEE 802.11), Token Ring
    - **WAN (Wide Area Network)**: PPP (Point-to-Point Protocol), HDLC (High-Level Data Link Control)
    - **Others**: ARP (Address Resolution Protocol), RARP (Reverse Address Resolution Protocol), MAC (Media Access Control)

#### Cables - OSI Layer 1-Physical

Not our problem.

_Function_: Deals with the transmission of raw bits over a medium.

- **Connection Types/Protocols**:
    - **Copper cables**: Ethernet, USB
    - **Optical**: SONET, Fiber Channel
    - **Wireless**: IEEE 802.11 (Wi-Fi standards), Bluetooth, Zigbee

### Network Area Connections Key points 

HTTP travels over TCP which travels over IP which travels over Wi-Fi or Ethernet (in LAN) then other protocols in the global network, once outside of your edge router.

Local-hosting a database, website, email server or anything else at the “loopback address”: `https://127.0.0.1` or `http://localhost/` does not use network protocols at all. It typically uses the Unix domain socket protocol. Any address from `127.0.0.1` through `127.255.255.255` can be used as a loopback address, and packets destined to any of these addresses will be looped back inside the host. By default, `localhost` resolves to the IP address `127.0.0.1` in IPv4. In IPv6, `localhost` resolves to `::1`.

If you use any other address on the over LAN, it each machine will of course connect via the TCP/IP network protocol.
