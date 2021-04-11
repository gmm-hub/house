package com.gmm.house.utils;

import org.apache.commons.lang3.StringUtils;
import java.lang.reflect.Field;
import java.util.*;

public class CommonUtils {
        //产生随机字符串
        public static String getUUID() {
            return UUID.randomUUID().toString();
        }

    public static boolean checkObjAllFieldsIsNull(Object object) {
        if (null == object) {
            return true;
        }
        try {
            for (Field f : object.getClass().getDeclaredFields()) {
                f.setAccessible(true);

                System.out.print(f.getName() + ":");
                System.out.println(f.get(object));

                if (f.get(object) != null && StringUtils.isNotBlank(f.get(object).toString())) {
                    return false;
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }


}
