<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="imgs/favicon.png">
  <title>MinnanoPOS</title>
  <!--     Fonts and icons     -->
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- Nucleo Icons -->
  <link href="assets/css/nucleo-icons.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
  <!--추가한 파일 jquery ui for chartjs  -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
  <meta charset="UTF-8">
  <title>보고서 테스트</title>
  <script src="resources/jquery-3.3.1.js"></script>
  <script>
    $(function() {
      reportdefaultList();
    });

    function reportdefaultList() {
      $.ajax({
        url: 'reportdefaultList',
        method: 'POST',
        success: function(resp) {
          output(resp);
        }
      })
    }

    function output(resp) {

      var list = '';
      list += '<tr><th>Payment_seq</th><th>Sales_state_seq</th><th>Payment_type</th><th>Payment_amount</th><th>Payment_time</th>'
      $.each(resp, function(index, item) {

        console.log(item)
        list += '<tr>';
        list += '<td>' + item.DAYTIME + '</td><td>' + item.PAYMENT_AMOUNT_SUM + '</td><td>' + item.SALES_ORDER_SUM + '</td>';
        list += '</tr>';
      });
      $('#list').html(list);
    }

  </script>

<body>
  <table id=list>
  </table>
</body>

</html>
