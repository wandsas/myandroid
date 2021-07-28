
# Generate key
keytool -genkey -v \
    -keystore ~/.keystore \
    -storetype pkcs12 \
    -alias open-keychain \
    -keyalg RSA \
    -keysize 4096 \
    -sigalg SHA512withRSA \
    -validity 10000 \
    -dname "cn=crosshatcher"

# Verify key
keytool -export-cert -alias open-keychain | sha256sum
