package com.demo.util;

import java.security.MessageDigest;

public class Md5 {
    private static final char[] DIGITS = {'0', '1', '2', '3', '4', '5', '6',
            '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    public final static String Md5(String s) {
        char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'a', 'b', 'c', 'd', 'e', 'f'};
        try {
            byte[] strTemp = s.getBytes("UTF-8");
            MessageDigest mdTemp = MessageDigest.getInstance("MD5");
            mdTemp.update(strTemp);
            byte[] md = mdTemp.digest();
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            return null;
        }
    }

    public final static String Md5(String s, String encoding) {
        char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'a', 'b', 'c', 'd', 'e', 'f'};
        try {
            byte[] strTemp = s.getBytes(encoding);
            MessageDigest mdTemp = MessageDigest.getInstance("MD5");
            mdTemp.update(strTemp);
            byte[] md = mdTemp.digest();
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            return null;
        }
    }

    // public static String getIdKeyBody(String timeTag, String key, String
    // body) {
    // StringBuilder sb = new StringBuilder(64);
    // String finalStr = sb.append(timeTag).append(key).append(body).toString();
    // byte[] bytes = getMD5Bytes(finalStr);
    // return new String(encodeHex(bytes));
    //
    // }

    // public static char[] encodeHex(byte[] data) {
    // int l = data.length;
    // char[] out = new char[l << 1];
    // for (int i = 0, j = 0; i < l; i++) {
    // out[j++] = DIGITS[(0xF0 & data[i]) >>> 4];
    // out[j++] = DIGITS[0x0F & data[i]];
    // }
    // return out;
    // }
    //
    // public static byte[] getMD5Bytes1(String str) {
    // try {
    // MessageDigest msgDigest = MessageDigest.getInstance("MD5");
    // msgDigest.update(str.getBytes("UTF-8"));
    // return msgDigest.digest();
    // } catch (NoSuchAlgorithmException e) {
    // e.printStackTrace();
    // return null;
    // } catch (UnsupportedEncodingException e) {
    // e.printStackTrace();
    // return null;
    // }
    // }
    //
    // public static byte[] getMD5Bytes(String str,String encoding) {
    // try {
    // MessageDigest msgDigest = MessageDigest.getInstance("MD5");
    // msgDigest.update(str.getBytes("UTF-8"));
    // return msgDigest.digest();
    // } catch (NoSuchAlgorithmException e) {
    // e.printStackTrace();
    // return null;
    // } catch (UnsupportedEncodingException e) {
    // e.printStackTrace();
    // return null;
    // }
    // }

    public static void main(String[] args) {
//        System.out.println(DateUtils.formatDate2Str(new Date(), "yyyyMMddHHmmss"));
        // 308d5ff8e759a8324164f2d778c9ecb6
        // 8a4a5353607aad1d60e79cee562d6e5d
        System.out.println(Md5.Md5("adminfogslink"));
        // 46f94c8de14fb36680850768ff1b7f2a
        // 46f94c8de14fb36680850768ff1b7f2a
//        System.out.println(Md5("appid=wx1e20118757e11f77&body=orderinfo&mch_id=1248870801&nonce_str=k22haks4i4b0vrniv5si7moc18jwtnf8&notify_url=http://www.tixian365.com/m/wechat_test/notifyPayResult.htm&openid=oiYsat30bo5w46TLIuwavPznik1U&out_trade_no=203&spbill_create_ip=101.226.61.193&total_fee=1350&trade_type=JSAPI&key=bc0faf9a4c71627663361021f5eb96c3"));
//        System.out.println(Md5("appid=wx1e20118757e11f77&body=orderinfo&mch_id=1248870801&nonce_str=k22haks4i4b0vrniv5si7moc18jwtnf8&notify_url=http://www.tixian365.com/m/wechat_test/notifyPayResult.htm&openid=oiYsat30bo5w46TLIuwavPznik1U&out_trade_no=203&spbill_create_ip=101.226.61.193&total_fee=1350&trade_type=JSAPI&key=bc0faf9a4c71627663361021f5eb96c3"));
    }

}