<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
            <c:import url="../temp/bootStrap.jsp"></c:import>
            <style>
                #page {
                    margin: auto;
                    width: 1000px;
                }
            </style>

        </head>

        <body>
            <c:import url="./tap.jsp"></c:import>
            <section class="mt-5">
                <div>
                    <table id="page">

                    </table>

                </div>
            </section>
            <script>

            </script>
        </body>

        </html>