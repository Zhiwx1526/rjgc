<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.student.dao.AbsenceDAO" %>
<%@ page import="com.student.po.Absence" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>旷课记录可视化</title>
    <script src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5dc;
            text-align: center;
        }
        h1 {
            color: orange;
        }
        #main {
            width: 80%;
            height: 500px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<div>
    <h1>学生旷课记录可视化</h1>
    <div id="main"></div>
</div>

<%
    // 获取所有旷课记录
    AbsenceDAO absenceDAO = new AbsenceDAO();
    List<Absence> absences = absenceDAO.getAllAbsences();

    // 统计每位学生的旷课总时数
    HashMap<String, Integer> absenceCountMap = new HashMap<>();

    for (Absence absence : absences) {
        String studentId = absence.getStudent_id();
        int hoursAbsent = absence.getHours_absent();
        absenceCountMap.put(studentId, absenceCountMap.getOrDefault(studentId, 0) + hoursAbsent);
    }

    // 准备在图表中显示的数据
    StringBuilder studentIds = new StringBuilder("[");
    StringBuilder totalHoursAbsent = new StringBuilder("[");

    int index = 0;
    for (Map.Entry<String, Integer> entry : absenceCountMap.entrySet()) {
        studentIds.append("\"").append(entry.getKey()).append("\"");
        totalHoursAbsent.append(entry.getValue());

        if (index < absenceCountMap.size() - 1) {
            studentIds.append(", ");
            totalHoursAbsent.append(", ");
        }
        index++;
    }

    studentIds.append("]");
    totalHoursAbsent.append("]");
%>

<script type="text/javascript">
    var studentIds = <%= studentIds.toString() %>;
    var totalHoursAbsent = <%= totalHoursAbsent.toString() %>;

    var myChart = echarts.init(document.getElementById('main'));

    var option = {
        title: {
            text: '每位学生的旷课总时数',
            subtext: '数据来源于数据库',
            left: 'center'
        },
        tooltip: {},
        xAxis: {
            type: 'category',
            name: '学生ID',
            data: studentIds
        },
        yAxis: {
            type: 'value',
            name: '旷课时数'
        },
        series: [{
            name: '旷课时数',
            type: 'bar',
            data: totalHoursAbsent,
            itemStyle: {
                color: 'rgba(135, 206, 235, 0.8)',
            },
        }]
    };

    myChart.setOption(option);
</script>
</body>
</html>