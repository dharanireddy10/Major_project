package com.algo;

import java.util.Base64;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

public class HmacUtil {
	public static String generateHmacBase64(byte[] data, String base64Key) throws Exception {
		byte[] keyBytes = Base64.getDecoder().decode(base64Key);
		SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "HmacSHA256");
		Mac mac = Mac.getInstance("HmacSHA256");
		mac.init(keySpec);
		byte[] macBytes = mac.doFinal(data);
		return Base64.getEncoder().encodeToString(macBytes);
	}
}
