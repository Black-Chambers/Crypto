# How to Generate Software License Keys and Verify Them
> Learn how to generate software license keys and verify them using a Crypto API. The keys can be activated offline and do not require a database.

You are running a small software business that [sells digital downloads](https://www.labnol.org/internet/sell-digital-products-online/28554/) - apps, plugins, or even templates. When the buyer completes the purchase, you need to provide them with a license key that they can use to activate and validate the software.

Here’s how you can implement such a licensing system in your software:

1. Generate a public and private key pair using the RSA algorithm.
2. Sign a message with the private key. The message contains the buyer’s email address and the software SKU.
3. The signed message is the license key that is sent back to the buyer’s email address.
4. When the buyer activates the software, the license key is verified using the public key.

## The Advantages

The advantage here is that the public key can be included in the software’s source code, there’s no need to use a database, and the buyer can verify the license key offline without the need to connect to your server.

Let’s now go through the implementation steps in detail.

### 1. Generate Public and Private Key Pair

[!\[RSA Private and Public Keys\](https://www.labnol.org/static/c8c558020e8d9ae9c166f87596e15a9b/16546/113912.png "RSA Private and Public Keys")](https://www.labnol.org/static/c8c558020e8d9ae9c166f87596e15a9b/779c2/113912.png)

We’ll generate a public and private key pair using the RSA algorithm. Launch the terminal and run the following [openssl command](https://openssl-library.org/source/index.html).

`openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out private_key.pem`

It will generate a 2048-bit RSA private key and save it to a file called `private_key.pem` in the current folder. Next, we’ll write a command to generate a public key from the private key.

`openssl rsa -pubout -in private_key.pem -out public_key.pem`

Now that we have our keys, let’s print them to the console as we’ll need them in the next step.

    `openssl pkey -in private_key.pem && openssl pkey -pubin -in public_key.pem`

### 2. Generate a License Key

We’ll write a simple Node.js script to generate a license key. It uses the `crypto` module to sign the message with the private key and the `fs` module to read the private key from the file system.

```
const crypto = require('crypto');
const fs = require('fs');

// Read private key from file system
const privateKey = fs.readFileSync('private_key.pem', 'utf8');

const buyerEmailAddress = 'amit@labnol.org';
const data = Buffer.from(buyerEmailAddress);

const signature = crypto.sign('sha256', data, {
  key: privateKey,
  padding: crypto.constants.RSA_PKCS1_PSS_PADDING,
});

// Convert the signature to base64
const licenseKey = signature.toString('base64');

// Output the result
console.log(licenseKey);
```

### 3. Verify a License Key

The license key generated in the previous step is sent to the buyer’s email address and we need to verify it when the buyer activates the software.

This again is a simple Node.js script that uses the `crypto` module to verify the license key with the public key.

 ```
    const crypto = require('crypto');
    const fs = require('fs');

    const buyerEmailAddress = '<<buyer email address>>';
    const licenseKey = '<<license key>>';

    const publicKey = fs.readFileSync('public_key.pem', 'utf8');
    const signatureBuffer = Buffer.from(licenseKey, 'base64');

    const licenseStatus = crypto.verify(
       'sha256',
       Buffer.from(buyerEmailAddress),
       {
         key: Buffer.from(publicKey),
         padding: crypto.constants.RSA_PKCS1_PSS_PADDING,
       },
    signatureBuffer);

    console.log(licenseStatus ? 'Activated' : 'Invalid license key');
 ```

## License Activation in Google Apps Script

If you are planning to include activation inside [Google Workspace add-ons](https://digitalinspiration.com/), you can build a Google Cloud Function or a Google Cloud Run service to handle the license activation.

Your Apps Script code can make a [UrlFetch POST request](https://www.labnol.org/urlfetch) to the web service with the license key and get back the activation status. In such a case, the public key need not be embedded in the script. Also, the user’s email address can be easily retrieved using the `Session.getActiveUser().getEmail()` method.

## The Limitations

This is obviously a basic implementation of a software licensing system that doesn’t handle all the edge cases. It can be a starting point but there are many other things to consider like:

- How to set expiration dates for the license keys.
- How to revoke a license key.
- How to prevent key sharing between users.

-----

Credit: [Amit Agarwal](https://www.labnol.org/about) is a Google Developer Expert in Google Workspace and Google Apps Script. He holds an engineering degree in Computer Science (I.I.T.) and is the first professional blogger in India.<br>
October 07, 2024<br>
Source: [How to Generate Software License Keys and Verify Them - Digital Inspiration](https://www.labnol.org/verify-software-license-keys-241007)
