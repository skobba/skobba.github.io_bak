# Model View Template (MVT)
Pattern similar to MVC. Django uses MVT pattern.

|       | Model View Controller (MVC)                                                    | Model View Template (MVT)                                            |
| ----- | ------------------------------------------------------------------------------ | -------------------------------------------------------------------- |
| 1.    | MVC has controller that drives both Model and View.                            | MVT has Views for receiving HTTP request and returning HTTP response.|
| 2.    | View tells how the user data will be presented.                                | Templates are used in MVT for that purpose.                          |
| 3.    | In MVC, we have to write all the control specific code.                        | Controller part is managed by the framework itself.                  |
| 4.    | Highly coupled                                                                 | Loosely coupled                                                      |
| 5.    | Modifications are difficult                                                    | Modifications are easy                                               |
| 6.    | Suitable for development of large applications but not for small applications. | Suitable both small and large applications.                          |
| 7.    | Flow is clearly defined thus easy to understand.                               | Flow is sometimes harder to understand as compared to MVC.           |
| 8.    | It doesn’t involve mapping of URLs.                                            | URL pattern mapping takes place.                                     |
| 9.    | Examples are ASP.NET MVC, Spring MVC etc.                                      | Django uses MVT pattern.                                             |
