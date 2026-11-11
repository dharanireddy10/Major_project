package com.algo;

import java.security.SecureRandom;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class AESUtil {
	private static final String AES = "AES";
    private static final String AES_GCM = "AES/GCM/NoPadding";
    private static final int GCM_TAG_LENGTH = 128;
    private static final int IV_LENGTH_BYTES = 12;
    private static final SecureRandom RANDOM = new SecureRandom();

    // Generate AES-256 key (base64)
    public static String generateBase64Key() throws Exception {
        KeyGenerator keyGen = KeyGenerator.getInstance(AES);
        keyGen.init(256);
        SecretKey key = keyGen.generateKey();
        return Base64.getEncoder().encodeToString(key.getEncoded());
    }

    // Encrypt bytes, return base64(iv + ciphertext)
    public static String encryptBase64(byte[] plaintext, String base64Key) throws Exception {
        byte[] keyBytes = Base64.getDecoder().decode(base64Key);
        SecretKeySpec keySpec = new SecretKeySpec(keyBytes, AES);

        byte[] iv = new byte[IV_LENGTH_BYTES];
        RANDOM.nextBytes(iv);

        Cipher cipher = Cipher.getInstance(AES_GCM);
        GCMParameterSpec spec = new GCMParameterSpec(GCM_TAG_LENGTH, iv);
        cipher.init(Cipher.ENCRYPT_MODE, keySpec, spec);

        byte[] cipherBytes = cipher.doFinal(plaintext);

        byte[] combined = new byte[iv.length + cipherBytes.length];
        System.arraycopy(iv, 0, combined, 0, iv.length);
        System.arraycopy(cipherBytes, 0, combined, iv.length, cipherBytes.length);

        return Base64.getEncoder().encodeToString(combined);
    }

    // Decrypt base64(iv + ciphertext)
    public static byte[] decryptFromBase64(String base64IvAndCiphertext, String base64Key) throws Exception {
        byte[] combined = Base64.getDecoder().decode(base64IvAndCiphertext);
        byte[] keyBytes = Base64.getDecoder().decode(base64Key);
        SecretKeySpec keySpec = new SecretKeySpec(keyBytes, AES);

        byte[] iv = new byte[IV_LENGTH_BYTES];
        System.arraycopy(combined, 0, iv, 0, IV_LENGTH_BYTES);

        byte[] ciphertext = new byte[combined.length - IV_LENGTH_BYTES];
        System.arraycopy(combined, IV_LENGTH_BYTES, ciphertext, 0, ciphertext.length);

        Cipher cipher = Cipher.getInstance(AES_GCM);
        GCMParameterSpec spec = new GCMParameterSpec(GCM_TAG_LENGTH, iv);
        cipher.init(Cipher.DECRYPT_MODE, keySpec, spec);

        return cipher.doFinal(ciphertext);
    }

}
