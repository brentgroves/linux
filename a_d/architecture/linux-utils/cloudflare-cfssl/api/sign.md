curl -d '{"certificate_request": "-----BEGIN CERTIFICATE REQUEST-----\nMIIBUjCB+QIBADBqMQswCQYDVQQGEwJVUzEUMBIGA1UEChMLZXhhbXBsZS5jb20x\nFjAUBgNVBAcTDVNhbiBGcmFuY2lzY28xEzARBgNVBAgTCkNhbGlmb3JuaWExGDAW\nBgNVBAMTD3d3dy5leGFtcGxlLmNvbTBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IA\nBK/CtZaQ4VliKE+DLIVGLwtSxJgtUKRzGvN1EwI3HRgKDQ3l3urBIzHtUcdMq6HZ\nb8jX0O9fXYUOf4XWggrLk1agLTArBgkqhkiG9w0BCQ4xHjAcMBoGA1UdEQQTMBGC\nD3d3dy5leGFtcGxlLmNvbTAKBggqhkjOPQQDAgNIADBFAiAcvfhXnsLtzep2sKSa\n36W7G9PRbHh8zVGlw3Hph8jR1QIhAKfrgplKwXcUctU5grjQ8KXkJV8RxQUo5KKs\ngFnXYtkb\n-----END CERTIFICATE REQUEST-----\n"}' \
          localhost:8080/api/v1/cfssl/sign  \
          | python -m json.tool