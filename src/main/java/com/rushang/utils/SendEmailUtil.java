package com.rushang.utils;

import javax.mail.Session;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmailUtil {
    private static final String sendAddress="954277933@qq.com";
    private static final String sendAddressPassword="xslsydgisxvpbdif";//密码为qq邮箱的stmp 服务授权码
    //private String

    /**
     * 使用qq邮箱发送邮件
     * @param toUserEmail
     * @param emailTitle
     * @param emailText
     * @throws AddressException
     * @throws MessagingException
     */
    public static void sendQQmail(String toUserEmail,String emailTitle,String emailText) throws AddressException,MessagingException{
        Properties properties=new Properties();
        properties.put("mail.transport.protocol","smtp");//连接协议
        properties.put("mail.smtp.host","smtp.qq.com");//主机号
        properties.put("mail.smtp.port",465);//端口号
        properties.put("mail.smtp.auth","true");
        properties.put("mail.smtp.ssl.enable","true");//设置是否使用ssl 安全连接--一般都会用
        properties.put("mail.debug","true");//这是是否显示debug信息， true 会在控制台显示相关信息

        System.out.println("收件人邮箱地址"+toUserEmail);
        //得到回话对象
        Session session=Session.getInstance(properties);
        //获取邮件对象
        Message message=new MimeMessage(session);
        //设置发件人邮箱地址
        message.setFrom(new InternetAddress(sendAddress));
        //设置收件人邮箱地址
        message.setRecipient(Message.RecipientType.TO,new InternetAddress(toUserEmail));//一个收件人
        //message.setRecipients(Message.RecipientType.TO,new InternetAddress[]{new InternetAddress(""),new InternetAddress("")});
        //设置邮件标题
        message.setSubject(emailTitle);
        //设置邮件内容
        message.setText(emailText);
        //得到邮差对象
        Transport transport=session.getTransport();
        //连接自己的邮箱账户
        transport.connect(sendAddress,sendAddressPassword);
        //发送邮件
        transport.sendMessage(message,message.getAllRecipients());
        transport.close();


    }
}
