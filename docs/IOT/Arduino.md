# Arduino

## 433ghz
Add the required terminating zero byte of an ASCII C-string.

```cpp
if (driver.recv(buf, &buflen)) // Non-blocking
{
  // Message with a good checksum received, terminate and print it
  buf[buflen]=0;
  Serial.println( (char *) buf);
}
```
