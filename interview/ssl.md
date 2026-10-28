# TLS/SSL interview questions

1. **What is SSL, and what is TLS?**

SSL is the older, deprecated protocol family; TLS is its secure successor and is what modern HTTPS uses.

2. **What does HTTPS provide?**

Encryption in transit, integrity protection, and server authentication when the certificate is trusted and validated.

3. **What is a TLS certificate?**

A digitally signed document binding a public key to a hostname or identity for a validity period.

4. **What is a public/private key pair?**

Related cryptographic keys: the public key can be shared, while the private key must be kept secret and controlled by its owner.

5. **What is a Certificate Authority (CA)?**

An entity trusted to validate identities and sign certificates; operating systems and browsers maintain trusted CA stores.

6. **What is a certificate chain?**

A sequence of signatures linking a server certificate through intermediate certificates to a trusted root CA.

7. **What is a self-signed certificate?**

A certificate signed by its own key rather than a trusted CA; useful in development but not automatically trusted by clients.

8. **What is the Subject Alternative Name (SAN), and why does it matter?**

SAN lists hostnames/IP addresses a certificate covers; modern clients validate the requested hostname against SAN.

9. **What happens during a simplified TLS handshake?**

The client and server negotiate parameters, the server presents its certificate, the client validates it, and both establish shared session keys.

10. **Does a certificate encrypt all HTTPS traffic?**

 No. It authenticates the server and helps establish session keys; symmetric session keys encrypt the application traffic.

11. **What is TLS termination at a reverse proxy?**

 The proxy handles HTTPS from clients, decrypts the request, and forwards it to a backend, often over a private network.

12. **Why must a private key be protected?**

 Anyone who obtains it may impersonate the server or compromise its security; do not commit it or bake it into public images.

13. **Why does a browser warn about this project's certificate?**

 It is self-signed, so the browser does not trust its issuer by default; matching `localhost` SAN alone does not establish trust.

14. **What causes a hostname/certificate mismatch?**

 The requested hostname or IP is missing from the certificate's SAN entries.

15. **What happens when a certificate expires?**

 Clients generally reject it, so it must be renewed and deployed before its validity period ends.

16. **What does an HTTP-to-HTTPS redirect do, and what does it not do?**

 It tells clients to retry using HTTPS; the redirect itself does not encrypt the original HTTP request.

17. **What is mutual TLS (mTLS)?**

 A TLS setup where the server verifies a client certificate as well as the client verifying the server certificate.

18. **How can you check a certificate's identity and validity dates?**

 Use `openssl x509 -in certificate.crt -noout -subject -dates -ext subjectAltName`.

19. **How can you confirm a certificate matches its private key?**

 Compare their public-key fingerprints using OpenSSL; checking each file parses successfully is not enough to prove they are a pair.

20. **What is the difference between encryption and certificate trust?**

 Encryption protects traffic from eavesdropping; trust validation checks that the peer's certificate chains to an accepted issuer and matches the requested name.
