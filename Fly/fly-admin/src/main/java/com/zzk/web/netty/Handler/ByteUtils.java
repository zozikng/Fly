package com.zzk.web.netty.Handler;

import com.fasterxml.jackson.databind.DeserializationConfig;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;

import javax.xml.bind.DatatypeConverter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.*;

@Slf4j
public class ByteUtils {
    private static ObjectMapper objectMapper = new ObjectMapper ();
    private static List<String> datePattern = new ArrayList<String> ();

    static {
        datePattern.add ("yyyy-MM-dd hh/mm/ss");
        datePattern.add ("yyyy-MM-dd hh:mm:ss");
        datePattern.add ("yyyy/MM/dd hh:mm:dd");
    }

    static {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat ();
        DeserializationConfig config = objectMapper.getDeserializationConfig ();
        for (String s : datePattern) {
            objectMapper.setDateFormat (new SimpleDateFormat (s));
        }
        objectMapper.setTimeZone (TimeZone.getTimeZone ("GMT+8"));
    }

    public static ObjectMapper InstanceObjectMapper() {
        return objectMapper;
    }



    public List<String> getDatePattern() {
        return datePattern;
    }

    public void setDatePattern(List<String> datePattern) {
        this.datePattern = datePattern;
    }

    /**
     * byte[] 转经度
     * @param locationByte
     * @return
     */
    public static String bytes2LngOrLat(byte[] locationByte) {

        String locationStirng = ByteUtils.byteHEX2StringDEC (locationByte);
        double locationDouble = Double.parseDouble (locationStirng);
        double location = locationDouble / (30000*60);

        return String.valueOf (location);
    }
    /**
     * byte[] 转日期时间
     *
     * @param dateByte
     * @param timeByte
     * @return
     */
    public static Date bytes2DateTime(byte[] dateByte, byte[] timeByte) {
        String year = Long.toString (ByteUtils.byteHEX2IntDEC (dateByte[0]) + 2000);
        String month = Long.toString (ByteUtils.byteHEX2IntDEC (dateByte[1]));
        String day = Long.toString (ByteUtils.byteHEX2IntDEC (dateByte[2]));
        String hour = Long.toString (ByteUtils.byteHEX2IntDEC (timeByte[0]));
        String minutes = Long.toString (ByteUtils.byteHEX2IntDEC (timeByte[1]));
        String seconds = Long.toString (ByteUtils.byteHEX2IntDEC (timeByte[2]));
        String time = year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + seconds;
        System.out.println (time);
        SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");


        Date date = null;
        try {
            date = sdf.parse (time);
        } catch (ParseException e) {
            e.printStackTrace ();
        }
        return date;
    }

    /**
     * byte 16进制转为boolean
     */
    public static boolean byte2Boolean(byte b) {
        return b == 1 ? true : false;
    }

    /**
     * byte 16进制转为10进制int
     */
    public static long byteHEX2IntDEC(byte b) {
        return Long.parseLong (String.format ("%02x", b), 16);
    }


    /**
     * byte[] 16进制转为10进制String
     */
    public static String byteHEX2StringDEC(byte[] b) {
        String hexString = DatatypeConverter.printHexBinary (b); // 将字节数组转为十六进制字符串
        String decimalNumber = String.valueOf (Long.parseLong (hexString, 16));
        return decimalNumber;
    }

    /**
     * byte[] 转为16进制String
     */
    public static String bytes2HexString(byte[] b) {
        String ret = "";
        for (int i = 0; i < b.length; i++) {
            String hex = Long.toHexString (b[i] & 0xFF);
            if (hex.length () == 1 && i != 0) {
                hex = '0' + hex;
            }
            ret += hex.toUpperCase ();
        }
        return ret;
    }

    /**
     * 从一个byte[]数组中截取一部分
     *
     * @param src
     * @param begin
     * @param count
     * @return
     */
    public static byte[] subBytes(byte[] src, int begin, int count) {
        byte[] bs = new byte[count];
        for (int i = begin; i < begin + count; i++)
            bs[i - begin] = src[i];
        return bs;
    }

    // 转化十六进制编码为字符串
    public static String toStringHex(String s) {
        byte[] baKeyword = new byte[s.length () / 2];
        for (int i = 0; i < baKeyword.length; i++) {
            try {
                baKeyword[i] = (byte) (0xff & Long.parseLong (s.substring (i * 2, i * 2 + 2), 16));
            } catch (Exception e) {
                e.printStackTrace ();
            }
        }

        try {
            s = new String (baKeyword, "utf-8");//UTF-16le:Not
        } catch (Exception e1) {
            e1.printStackTrace ();
        }
        return s;
    }


}
