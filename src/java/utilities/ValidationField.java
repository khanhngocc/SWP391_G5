/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import java.util.Arrays;

/**
 *
 * @author dell
 */
public class ValidationField {
    
    public static String [] standardExtension = {"jpg","jpeg","png","gif"};
    
    public static boolean isImageFileExtension(String inputStr, String[] items) {
    return Arrays.stream(items).anyMatch(inputStr::contains);
}
}
