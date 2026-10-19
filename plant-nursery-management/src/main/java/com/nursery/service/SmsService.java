package com.nursery.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

@Service
public class SmsService {

    @Value("${twilio.phone.number}")
    private String twilioNumber;

    public void sendOtp(String toPhoneNumber, String otp) {

        Message.creator(
                new PhoneNumber(toPhoneNumber),   // to
                new PhoneNumber(twilioNumber),    // from
                "Your Nursery OTP is: " + otp
        ).create();
    }
}
