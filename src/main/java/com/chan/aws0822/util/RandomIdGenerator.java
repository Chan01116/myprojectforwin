package com.chan.aws0822.util;

import java.util.Random;

public class RandomIdGenerator {

    private static final Random RANDOM = new Random();
    private static final String LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final String DIGITS = "0123456789";

    public static String generateRandomId() {
        StringBuilder sb = new StringBuilder(13);

        // ù ��°, �� ��°, �ټ� ��° �ڸ��� �빮�� ���ĺ�
        sb.append(randomLetter());
        sb.append(randomDigit());
        sb.append(randomLetter());
        sb.append(randomDigit());
        sb.append(randomLetter());

        // ������ �ڸ��� ����
        for (int i = 5; i < 13; i++) {
            sb.append(randomDigit());
        }

        return sb.toString();
    }

    private static char randomLetter() {
        return LETTERS.charAt(RANDOM.nextInt(LETTERS.length()));
    }

    private static char randomDigit() {
        return DIGITS.charAt(RANDOM.nextInt(DIGITS.length()));
    }

    public static void main(String[] args) {
        String randomId = generateRandomId();
        System.out.println("Generated ID: " + randomId);
    }
}