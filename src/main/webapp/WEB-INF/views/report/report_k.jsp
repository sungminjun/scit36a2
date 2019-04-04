<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
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
