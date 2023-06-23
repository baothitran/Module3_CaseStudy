package com.cg.case_m3.utils;

import java.text.NumberFormat;
import java.util.Locale;

public class CurrencyFormat {
    public static String covertPriceToString(Long price) {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(localeVN);
        String formattedAmount = currencyFormatter.format(price);
        return formattedAmount;
    }
    public static Long parseLong(String price) {
        String priceNew = price.replaceAll("\\D+", "");
        return Long.parseLong(priceNew);
    }
}
