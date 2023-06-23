package com.cg.case_m3.utils;

import java.util.Scanner;
import java.util.regex.Pattern;

public class ValidateUtils {
    static Scanner scanner;
    public static final String ID_PRODUCT_REGEX = "^[0-9]{1,10}$";
    public static final String EMAIL_REGEX = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
    public static final String USERNAME_REGEX = "^([A-ZÀ-Ỹ][a-zà-ỹ0-9]*[ ]?)+$";
    public static final String PASSWORD_REGEX = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$";
    public static final  String PHONE_REGEX = "^[0][1-9][0-9]{8}$"; //01-01-2023
    public static final  String BIRTHDAY_REGEX = "^(0?[1-9]|[12][0-9]|3[01])(-|/)(0?[1-9]|1[012])(-|/)((19|20)\\d\\d)$"; //01/01/2023
    public static final String MONTH_REGEX = "^(0?[1-9]|1[012])-((19|20)\\d\\d)$"; // 04-2023
    public static final String FULLNAME_REGEX = "^[\\p{L} \\.'-]+$";
    public static final String NAME_PRODUCT_REGEX = "^[\\p{L}0-9\\s\\.,\\-'()]{5,255}$";
    public static final String ADDRESS_REGEX = "^([A-ZÀ-Ỹ][a-zà-ỹ]*[ ]?)+$";
    public static final String COLOR_PRODUCT_REGEX = "^(?:[\\p{L}\\s]+(?:,\\s)?)+$";
    public static boolean isColor(String color) {
        return Pattern.compile(COLOR_PRODUCT_REGEX).matcher(color).matches();
    }
//    public static boolean isIdProduct(int id) {
//        return Pattern.matches(ID_PRODUCT_REGEX, id);
//    }
    public static boolean isNameProduct(String nameProduct) {
        return Pattern.matches(NAME_PRODUCT_REGEX, nameProduct);
    }
    public static boolean isAddress (String address) {
        return Pattern.matches(ADDRESS_REGEX, address);
    }
    public static boolean isEmail(String email){
        return Pattern.matches(EMAIL_REGEX,email);
    }
    public static boolean isUserName(String username){
        return Pattern.matches(USERNAME_REGEX,username);
    }
    public static boolean isPassWord(String password) {
        return Pattern.matches(PASSWORD_REGEX, password);
    }
    public static boolean isPhone(String phone) {
        return Pattern.matches(PHONE_REGEX, phone);
    }
    public static String isEmpty() {
        String result;
        while(((result = scanner.nextLine()).trim()).isEmpty()) {
            System.out.println("Cannot be empty! Please enter again!");
        }
        return result;
    }
}
