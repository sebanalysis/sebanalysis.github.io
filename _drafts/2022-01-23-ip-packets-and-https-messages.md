Three conventions

- GAN international. Same as wan, sattelities with IP 
- WAN Region, city company, isp, vpn internal - frame-relay (on leased line), IP on leased. bandwidth, Vpns use pptp or l2tp. Connects IP addresss.
- LAN home office - ethernet with ethernet frames. Connects max addresses.

IP has header (series of numerical values) and payload which is ASCII encoded it is the 'Transport layer'. Ethernet protocol only allows 1500bytes per packet so even though IP supports 65 kb, it is limited to 1.5kb packet sizes. Maximum transport unit mtu. If an http response is larger than 1.5kb the payload is simply split across multiple tcp packets. The header only appears in the first packet. Http just rides on tcp and tco does the package reassembly using the packet numbers in the tco headers.

Http request or response (a type of rest api request ) sits in the payload. Has a space separated string for header which says content type. And encoding of payload. then body of raw text. Application layers
```
50 00 00 28 8a e7 00 00 01 06 00 00 00 00 00 00 
```

> Body  == Payload

This would be followed by the payload bytes which are typically an http header and payload. This is an http response:
```
HTTP/1.1 200 OK
Server: Apache/2.4.29
Content-Type: text/html; charset=UTF-8
Content-Length: 1234
```

Followed by the http payload. Still in the tcp packet. An example web
```
<!DOCTYPE html>
<html>
<head>
    <title>Example Webpage</title>
</head>
<body>
    <h1>Welcome to Example Webpage</h1>
    <p>This is a sample webpage for demonstration purposes.</p>
    <ul>
        <li>Item 1</li>
        <li>Item 2</li>
        <li>Item 3</li>
    </ul>
</body>
</html>

```

This example shows a TCP header with the following fields:

    Source port: 80 (decimal) or 0x50 (hexadecimal)
    Destination port: 1234 (decimal) or 0x04D2 (hexadecimal)
    Sequence number: 0x00000000 (hexadecimal)
    Acknowledgment number: 0x00000000 (hexadecimal)
    Data offset: 5 (5 x 4 = 20 bytes)
    Flags: 0x02 (SYN flag)
    Window: 0x0000 (0 bytes)
    Checksum: 0x0000 (not computed)
    Urgent Pointer: 0x0000 (no urgent data)

There are two types of http messages: requests sent by the client to trigger an action on the server, and responses, the answer from the server.

HTTP requests, and responses habe ascii encoded headers and, share similar structure and are composed of:

- A start-line describing the requests to be implemented, or its status of whether successful or a failure. This start-line is always a single line.
- An optional set of space separated HTTP headers specifying the request, or describing the body included in the message.  There is no general limit on the size of an http header (like with IP header). HTTP header is actually just a dictionary of keyvalye pairs separated with `: `  and linebreaks.  But some content delivery organisations impose a limit. For example, at akamai, the maximum total size of the HTTP origin response headers is **8192 bytes**
 - A blank line indicating all meta-information for the request has been sent. 
- An optional body containing data associated with the request (like content of an HTML form), or the document associated with a response. The presence of the body and its size is specified by the start-line and HTTP headers.


The most commonly used HTTP request methods are GET, POST, PUT, PATCH, and DELETE. These are equivalent to the CRUD operations (create, read, update, and delete).

GET: GET request is used to read/retrieve data from a web server. GET returns an HTTP status code of 200 (OK) if the data is successfully retrieved from the server.

POST: POST request is used to send data (file, form data, etc.) to the server. On successful creation, it returns an HTTP status code of 201.

PUT: A PUT request is used to modify the data on the server. It replaces the entire content at a particular location with data that is passed in the body payload. If there are no resources that match the request, it will generate one.

PATCH: PATCH is similar to PUT request, but the only difference is, it modifies a part of the data. It will only replace the content that you want to update.

DELETE: A DELETE request is used to delete the data on the server at a specified location.


You can send an http request using curl client url

## Certificates

In order to authne
Set up the curl agent to use a PEM cert with:

`curl --cacert C:\Users\Seb\ca-root.pem`

## VPN Connection

A P2S (Point-to-Site) client certificate is a type of digital certificate that is used to authenticate a client when connecting to a Point-to-Site (P2S) VPN (Virtual Private Network) on Azure. P2S VPNs allow clients to connect to a virtual network over the Internet, using a secure SSL/TLS connection.

A PEM certificate file usually contains the following in the following order:

-   The certificate itself (often called the "leaf certificate")
-   Any intermediate certificates (if applicable)
-   The root certificate (or "CA certificate")

When connecting to an OpenVPN server using the Point-to-Site (P2S) configuration, a number of different components are required to establish a secure and authenticated connection. These include:

1.  P2S CA root or certificate (`<ca>`) - This certificate is used to establish trust in the certificate chain. It is the top-most certificate in the chain of trust and is used to validate the authenticity of all other certificates that are signed by the same CA. The `<ca>` file contains the root certificate of the CA that issued the client certificate. The Cerificate authority is normally an organisation like Microsoft Azure VPN Gateway, AWS or Google that provides the certificate to clients on request.
    
2.  Pre-Shared Key (`<tls-auth>`) - This key is used to add an additional layer of security to the SSL/TLS connection. The `<tls-auth>` file contains a shared secret that is used to authenticate the client and server. The key is used to encrypt and decrypt the traffic between the client and server, and helps to prevent man-in-the-middle attacks.
    
3.  P2S client certificate in PEM format `(<cert>)` - This certificate is used to authenticate the client to the VPN server. The `<cert>` file contains the client's public key, which is used to encrypt the connection, and a private key, which is used to decrypt the connection. The certificate also includes information about the client, such as the client's name and location.

## MIME types

**A MIME type consists of two parts: a type and a subtype.**

These are some categories:

>multipart/form-data
>text/xml
>text/csv
>text/plain
>application/xml
>application/zip
>application/pdf

Often in an http header under 'content-type' you need to specify the MIME type. Two common formats in a post request are:

`multipart/form-data`. Otherwise, use `application/x-www-form-urlencoded`


## cURL

In an HTTP header, the "Accept" field is used to specify the format of the data that the client is willing to accept in the response from the server.

The "Content-Type" HTTP header is used to specify the format of the data in the request body. When the "Content-Type" is set to "application/x-www-form-urlencoded" it tells the server that the data in the request body is in the format of key-value pairs separated by an "&" symbol and encoded using the %xx URL encoding. If you are sending large data that needs to be sent in multiple I



It is necessary if you are sending data in the request body,


When the "Accept" field is set to "_/_", it means that the client is willing to accept any type of data that the server can provide. This is a wildcard value, and it tells the server that the client is not picky about the format of the response.

On the other hand, when the "Accept" field is set to "application/json", it means that the client is specifically requesting a response in the JSON format. JSON (JavaScript Object Notation) is a lightweight data-interchange format that is easy for humans to read and write and easy for machines to parse and generate.


The standard way of sending an authorization token as part of an API HTTP request is to include it in the headers of the request. Specifically, the token is typically included in the "Authorization" header, along with a keyword indicating the type of token being sent. The most commonly used keyword is "Bearer". Here's an example of how it would look in a curl request:


```powershell
curl -X GET https://api.example.com/resource \ -H "Authorization: Bearer <token>"
```

In general, tokens are set to expire after a certain period of time for security reasons. This is because if a token is compromised, it will only be useful for a limited time, reducing the potential damage that can be done.

The expiration time of a token can be set in seconds, minutes, hours or even days depending on the API. Some APIs have short-lived tokens, which expire in minutes or hours, while others have long-lived tokens that can last for several days or even months. It's important to check the API documentation to know the expiration time of the token you are working with.

### -k flag

If you're connecting to some small unknown network, you need to use the -k flag 

 -k  Specifies that the curl program not attempt to verify the server certificate against the list of certificate authorities included with the curl software.

The switch uses self-signed certificates. By default, the curl program attempts to verify certificates against its list of certificate authorities, and attempts to verify self-signed certificates will fail. Therefore you must use the –k option to disable attempts to verify self-signed certificates against a certificate authority.