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

## Preferences library
In ESP32 there is no EEPROM. Preferences is an Arduino library that uses ESP-IDF's NVS, which has wear levelling

## Quadrature Encoders
A quadrature encoder is an encoder that has two output channels, with one being offset by 90 electrical degrees, or one quarter of a cycle

With quadrature output, three types of encoding can be used: X1, X2, or X4. The difference between these encoding types is simply which edges of which channel are counted during movement, but their influence on encoder resolution is significant.
