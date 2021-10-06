# PKCE

# Generator

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="js,result" data-slug-hash="GREVqVX" data-user="skobba" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/skobba/pen/GREVqVX">
  pkce generator</a> by Gjermund Skobba (<a href="https://codepen.io/skobba">@skobba</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

# Generator (kpce.html)
```html
<!DOCTYPE html>
<html>

<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.min.js"></script>
    <script>
        function generateCodeVerifier() {
            var code_verifier = generateRandomString(43)
            document.getElementById("code_verifier").value = code_verifier
        }
        function generateRandomString(length) {
            var text = "";
            var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~";
            for (var i = 0; i < length; i++) {
                text += possible.charAt(Math.floor(Math.random() * possible.length));
            }
            return text;
        }
        function generateCodeChallenge(code_verifier) {
            return code_challenge = base64URL(CryptoJS.SHA256(code_verifier))
        }

        function base64URL(string) {
            return string.toString(CryptoJS.enc.Base64).replace(/=/g, '').replace(/\+/g, '-').replace(/\//g, '_')
        }

        function submit() {
            var code_verifier = document.getElementById("code_verifier").value
            var code_challenge = generateCodeChallenge(code_verifier)
            document.getElementById("code_challenge").innerHTML = code_challenge
            document.getElementById("code_challenge_div").style.display ="block"
        }
    </script>
</head>

<body>
    <div>
        <label for="code_verifier">Code Verifier: </label>
        <input type="text" id="code_verifier" name="code_verifier" size="38">
    </div>
    <br>
    <div style="display:none" id="code_challenge_div">
        Code Challenge:
        <span id="code_challenge">

        </span>
    </div>
    <br>
    <div>
        <button onclick="generateCodeVerifier()">Generate Code Verifier</button>
        <button onclick="submit()">Generate Code Challenge</button>
    </div>
</body>

</html>
```
