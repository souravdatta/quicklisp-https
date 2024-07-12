## Quicklisp HTTPS Patch

Quicklisp (https://www.quicklisp.org/beta/) is a great tool for downloading Common Lisp libraries. However, it works with HTTP only. HTTP is inherently insecure to man in the middle attacks. This little patch is meant to address this problem.

#### How it works
Quicklisp uses its own Lisp code to download the required packages (commonly as gzipped files), from the designated URLs. These repos all provide HTTPS endpoints as well. But since Quicklisp code is meant to work with all Lisps and most platforms, it can only
download with HTTP urls currently. This patch uses system `wget` to mitigate the problem.

#### How to install
Once you have a working Quicklisp installed on your system,
1. Make sure you have `wget` installed. Alternatively you can use anything you like (e.g. `curl`).
2. Download the `http.lisp` file and replace Quicklisp's own http.lisp with it. Make sure you take a backup before replacing.
3. Open the new http.lisp and search for `Note to programmer`.
4. Here, you can change the path to your WGET or CURL or any other program that supports downloading https urls.
5. That's all there is.

#### What to expect
When installing systems with Quicklisp next time, you should see messages like this:
```
WARNING: Using system WGET instead of native Lisp code
INFO: URL http://beta.quicklisp.org/archive/drakma/2019-11-30/drakma-v2.0.7.tgz
WARNING: Switching to HTTPS
INFO: New URL https://beta.quicklisp.org/archive/drakma/2019-11-30/drakma-v2.0.7.tgz
```
