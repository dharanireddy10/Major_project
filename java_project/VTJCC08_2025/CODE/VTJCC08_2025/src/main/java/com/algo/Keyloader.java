package com.algo;

import java.util.Base64;

public class Keyloader {
	public static byte[] loadBase64Key(String envName) {
        String b64 = System.getenv(envName);
        if (b64 == null || b64.trim().isEmpty()) {
            throw new RuntimeException(envName + " is not set. Please set it to a base64 key.");
        }
        return Base64.getDecoder().decode(b64);
    }
}
