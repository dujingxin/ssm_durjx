package com.china.post.Util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

public class ResponseUtil {
    public static void Write(HttpServletResponse response, JSONObject object) {

        try {
            PrintWriter printWriter;
            response.setContentType("text/html;charset=utf-8");
            printWriter = response.getWriter();
            printWriter.println(object.toString());
            printWriter.flush();
            printWriter.close();

        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }
}
