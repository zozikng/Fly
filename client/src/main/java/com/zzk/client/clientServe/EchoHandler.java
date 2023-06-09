package com.zzk.client.clientServe;


import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.*;

public class EchoHandler extends ChannelInboundHandlerAdapter {

    //连接成功后发送消息测试
    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception {


        String fileName = "D:\\Project\\java\\projects\\graduationDesign\\20230215152410\\client\\src\\main\\java\\com\\zzk\\client\\clientServe\\bmhFlyData.txt";
        Path path = Paths.get (fileName);
        //byte[] bytes = Files.readAllBytes (path);
        //List<String> allLines = Files.readAllLines (path, StandardCharsets.UTF_8);
        List<String> allLines = Files.readAllLines (path);
        String droneId = allLines.get (0);
        String cardId = allLines.get (1);
        byte[] loginBytes = new byte[18];
        byte[] droneBytes = ByteUtils.hexString2Bytes (droneId);
        byte[] cardBytes = ByteUtils.string2HexBytes (cardId);
        System.out.println ("cardBylen"+cardBytes.length);
        loginBytes[0] = 0x01;
        ByteUtils.fillBytes (loginBytes,droneBytes,1);
        ByteUtils.fillBytes (loginBytes,cardBytes,9);
        loginBytes[14]=0x00;
        loginBytes[15]=0x01;
        loginBytes[16]= (byte) 0x8C;
        loginBytes[17]= (byte) 0xDD;
        ctx.writeAndFlush (loginBytes);

        for (int i = 2; i < allLines.size (); i++) {
            //byte[] s = hexStringToByteArray (allLine.replace (" ", ""));
            byte[] positioningBytes=new byte[40];
            //协议号
            positioningBytes[0]=0x02;
            //北斗卡id
            ByteUtils.fillBytes (positioningBytes,cardBytes,1);
            positioningBytes[6]=0x01;
            LocalDateTime now = LocalDateTime.now ();
            //年
            positioningBytes[7]=(byte)(now.getYear ()-2000);
            //月
            positioningBytes[8]=(byte)now.getMonthValue ();
            //日
            positioningBytes[9]=(byte)now.getDayOfMonth ();
            //时
            positioningBytes[10]=(byte)now.getHour ();
            //分
            positioningBytes[11]=(byte)now.getMinute ();
            //秒
            positioningBytes[12]=(byte)now.getSecond ();
            //经度
            String[]  position = allLines.get (i).split ("  ");
            double lngDouble = Double.parseDouble (position[1]);
            double latDouble = Double.parseDouble (position[2]);

            Gps gps = PositionUtil.gcj02_To_Gps84 (latDouble,lngDouble);

            byte[] lngBytes = ByteUtils.long2HexBytes (Math.round (gps.getWgLon ()* 60 * 30000));
            ByteUtils.fillBytes (positioningBytes,lngBytes,13);

            byte[] latBytes = ByteUtils.long2HexBytes (Math.round (gps.getWgLat () * 60 * 30000));
            ByteUtils.fillBytes (positioningBytes,latBytes,17);
            //生成60到80之间的随机数字
            Random rand = new Random ();
            positioningBytes[21]=0x00;
            positioningBytes[22]=(byte) (rand.nextInt (61) + 40);
            positioningBytes[23]=0x00;
            positioningBytes[24]=(byte) (rand.nextInt (71) + 40);
            positioningBytes[25]=0x00;
            positioningBytes[26]=(byte) (rand.nextInt (71) + 40);
            positioningBytes[27]=0x01;
            positioningBytes[28]= (byte) 0xCC;
            positioningBytes[29]=0x00;
            positioningBytes[30]=0x28;
            positioningBytes[31]=0x7D;
            positioningBytes[32]=0x00;
            positioningBytes[33]=0x00;
            positioningBytes[34]=0x1F;
            positioningBytes[35]= (byte) 0xB8;
            positioningBytes[36]=0x00;
            positioningBytes[37]=0x01;
            positioningBytes[38]= (byte) 0x8C;
            positioningBytes[39]= (byte) 0xDD;

            ctx.writeAndFlush (positioningBytes);
            Thread.sleep (2000);
        }



    }
    public static byte[] hexStringToByteArray(String s) {
        int len = s.length ();
        byte[] data = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            data[i / 2] = (byte) ((Character.digit (s.charAt (i), 16) << 4) + Character.digit (s.charAt (i + 1), 16));
        }
        return data;
    }

    public static void main(String[] args) throws IOException {
        String fileName = "D:\\Project\\java\\projects\\graduationDesign\\20230215152410\\client\\src\\main\\java\\com\\zzk\\client\\clientServe\\flyData.txt";
        Path path = Paths.get (fileName);
        //byte[] bytes = Files.readAllBytes (path);
        //List<String> allLines = Files.readAllLines (path, StandardCharsets.UTF_8);
        List<String> allLines = Files.readAllLines (path);
        for (int i = 2; i < allLines.size (); i++) {
            //byte[] s = hexStringToByteArray (allLine.replace (" ", ""));
            String[]  position = allLines.get (i).split ("  ");
            //System.out.println (position.length);
            String lng = position[1];
            String lat = position[2];
            double positionDouble = Double.parseDouble (position[1]);
            //System.out.println ((int)Math.round (positionDouble*60*30000));
            Random rand = new Random ();
            //System.out.println (rand.nextInt(61) + 40);
            //byte[] bytes = ByteUtils.long2HexBytes (rand.nextInt(61) + 40);
            double lngDouble = Double.parseDouble (position[1]);
            byte[] lngBytes = ByteUtils.long2HexBytes (Math.round (lngDouble * 60 * 30000));
            System.out.println (ByteUtils.bytes2LngOrLat (lngBytes));
            //System.out.print (Integer.toHexString (lngByte & 0xFF)+" ");


            System.out.println ();

            //生成60到80之间的随机数字

            //System.out.println (bytes.length);
            //for (int i1 = 0; i1 < bytes.length; i1++) {
            //    System.out.println (Integer.toHexString (bytes[i1] & 0xFF));
            //}
            //System.out.println ("lng:"+lng);
            //System.out.println ("lat:"+lat);
            //System.out.println ("lng"+lng);
            //buf.writeBytes (s);
            //ctx.writeAndFlush (buf);
            //Thread.sleep (3000);
        }
        //LocalDateTime now = LocalDateTime.now ();
        //
        //System.out.println (Integer.toHexString ((byte)(now.getYear ()-2000) & 0xFF));
        //System.out.println (now.getMonthValue ());

    }


}
