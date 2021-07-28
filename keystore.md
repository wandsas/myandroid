
# Generate key
keytool -genkey -v \
    -keystore ~/.crosshatcher.keystore \
    -storetype pkcs12 \
    -alias k9mail \
    -keyalg RSA \
    -keysize 4096 \
    -sigalg SHA512withRSA \
    -validity 10000 \
    -dname "cn=crosshatcher"

# Verify key
keytool -export-cert \
    -alias k9mail     \
    -keystore ~/.crosshatcher.keystore | sha256sum
